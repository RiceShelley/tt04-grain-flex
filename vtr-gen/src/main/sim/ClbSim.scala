package fabgen.sim

import spinal.core._
import spinal.core.sim._

import fabgen.primitives._

object ClbConfig {

  def fourLutBuilder(input: Int, function: (Boolean*) => Boolean): Boolean = {
    val inputs = List.tabulate[Boolean](4)(n => ((input >> n) & 0x1) == 1)
    function(inputs: _*)
  }

  def apply(clb: Clb, lutFuncSeq: Seq[(Boolean*) => Boolean], lutInputCnt: Int) = {
    clb.belInputPinsMux.zip(lutFuncSeq).map { case (belInputMuxs, lutFunc) =>
      // Bel lut config
      val lutConfig = BitStream(Seq.tabulate[Boolean](1 << clb.belInputWidth) { idx =>
        fourLutBuilder(idx, function = lutFunc)
      })

      // Bel FF config
      val registerOutput = BitStream(Seq.tabulate[Boolean](1) { _ => true })

      // Bel input pin muxing configuration
      val belMuxConfig = belInputMuxs.toSeq.zipWithIndex.map { case (belPinInputMux, idx) =>
        // Set mux sel line to pins index
        // BitStream(Seq.tabulate[Boolean](belPinInputMux.configDepth())(n => ((idx >> n) & 0x1) == 1))
        BitStream(Seq.tabulate[Boolean](belPinInputMux.configDepth())(n => ((idx >> n) & 0x1) == 1))
      }

      Seq(lutConfig, registerOutput, belMuxConfig)
    }
  }
}

object ClbSim extends App {
  Config.sim.compile(Clb(inputCnt = 4, belCnt = 4, belInputWidth = 4)).doSim { dut =>
    // Create programming interface driver
    val pDriver = ProgIfaceDriver(progIface = dut.progIface)

    dut.clockDomain.forkStimulus(period = 10 ns)
    dut.clockDomain.waitRisingEdge(100)

    val lutTestFuncs = Seq(
      Seq[(Boolean*) => Boolean](
        in => !in(3) ^ in(2) & in(1) | in(0),
        in => !in(3) & !in(2) & in(1) ^ !in(0),
        in => in(3) & in(2) | in(1) & in(0),
        in => in(3) & !in(2) | in(1) & in(0)
      ),
      Seq[(Boolean*) => Boolean](
        in => in(3) & in(2) & in(1) & in(0),
        in => in(3) & !in(2) & in(1) & !in(0),
        in => !in(3) & in(2) & in(1) & in(0),
        in => !in(3) & !in(2) & in(1) & in(0)
      ),
      Seq[(Boolean*) => Boolean](
        in => in(3) ^ in(2) & in(1) & in(0),
        in => in(3) & !in(2) & in(1) & !in(0),
        in => !in(3) & in(2) & in(1) ^ in(0),
        in => !in(3) | !in(2) & in(1) ^ in(0)
      ),
      Seq[(Boolean*) => Boolean](
        in => in(3) & in(2) & in(1) & in(0),
        in => !in(3) | !in(2) & in(1) & !in(0),
        in => !in(3) ^ in(2) & in(1) ^ in(0),
        in => !in(3) | !in(2) ^ in(1) ^ in(0)
      )
    )

    for (lutFuncSeq <- lutTestFuncs) {
      val config = ClbConfig.apply(
        clb = dut,
        lutInputCnt = 4,
        lutFuncSeq = lutFuncSeq
      )

      // Program random config to lut
      pDriver.prog(config, 10 ns)

      // drive each possible input into CLB
      for (i <- 0 to (1 << dut.io.clbIn.getWidth) - 1) {
        // Assign input to CLB
        dut.io.clbIn #= i
        // Wait for output to propagate
        sleep(timeToLong(10 ns))
        // Get outputs from dut
        val actual = dut.io.clbOut.toBooleans.toList
        // Calculate the expected outputs
        val expected = lutFuncSeq.map(_(dut.io.clbIn.toBooleans))
        // Verify outputs
        if (actual != expected) {
          println(f"expected ${expected} actual ${actual}")
        }
        assert(actual == expected)
      }
      dut.clockDomain.waitRisingEdge(100)
    }
  }
}
