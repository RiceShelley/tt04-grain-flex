package fabgen.sim

import spinal.core._
import spinal.core.sim._

import fabgen.primitives._

object ClbConfig {

  def fourLutBuilder(input: Int, function: (Boolean*) => Boolean): Boolean = {
    val inputs = List.tabulate[Boolean](4)(n => ((input >> n) & 0x1) == 1)
    function(inputs: _*)
  }

  def apply(
      clb: Clb,
      lutFuncSeq: Seq[Tuple2[(Boolean*) => Boolean, Boolean]],
      lutInputPinsSelSeq: Seq[Seq[Int]],
      lutInputCnt: Int
  ) = {
    clb.belInputPinsMux.zip(lutFuncSeq).zip(lutInputPinsSelSeq).map { case ((belInputMuxs, lutFunc), lutInputPinsSel) =>
      // Bel lut config
      val lutConfig =
        BitStream(Seq.tabulate[Boolean](1 << clb.belInputWidth) { idx =>
          fourLutBuilder(idx, function = lutFunc._1)
        })

      // Bel FF config
      val registerOutput = BitStream(Seq(lutFunc._2))

      // Bel input pin muxing configuration
      val belMuxConfig =
        belInputMuxs.toSeq.zip(lutInputPinsSel).map { case (belPinInputMux, pinSelect) =>
          // Set mux sel line to pins index
          // BitStream(Seq.tabulate[Boolean](belPinInputMux.configDepth())(n => ((idx >> n) & 0x1) == 1))
          BitStream(
            Seq.tabulate[Boolean](belPinInputMux.configDepth())(n => ((pinSelect >> n) & 0x1) == 1)
          )
        }

      Seq(lutConfig, registerOutput, belMuxConfig)
    }
  }
}

object ClbSim extends App {
  Config.sim.compile(Clb(inputCnt = 4, belCnt = 4, belInputWidth = 4)).doSim { dut =>
    // Create programming interface driver
    val pDriver = ProgIfaceDriver(progIface = dut.progIface)

    dut.io.designEnable #= true

    dut.clockDomain.forkStimulus(period = 10 ns)
    dut.clockDomain.waitRisingEdge(100)

    val combOutput = true

    val lutTestFuncs = Seq(
      Seq[Tuple2[(Boolean*) => Boolean, Boolean]](
        (in => !in(3) ^ in(2) & in(1) | in(0), combOutput),
        (in => !in(3) & !in(2) & in(1) ^ !in(0), combOutput),
        (in => in(3) & in(2) | in(1) & in(0), combOutput),
        (in => in(3) & !in(2) | in(1) & in(0), combOutput)
      ),
      Seq[Tuple2[(Boolean*) => Boolean, Boolean]](
        (in => in(3) & in(2) & in(1) & in(0), combOutput),
        (in => in(3) & !in(2) & in(1) & !in(0), combOutput),
        (in => !in(3) & in(2) & in(1) & in(0), combOutput),
        (in => !in(3) & !in(2) & in(1) & in(0), combOutput)
      ),
      Seq[Tuple2[(Boolean*) => Boolean, Boolean]](
        (in => in(3) ^ in(2) & in(1) & in(0), combOutput),
        (in => in(3) & !in(2) & in(1) & !in(0), combOutput),
        (in => !in(3) & in(2) & in(1) ^ in(0), combOutput),
        (in => !in(3) | !in(2) & in(1) ^ in(0), combOutput)
      ),
      Seq[Tuple2[(Boolean*) => Boolean, Boolean]](
        (in => in(3) & in(2) & in(1) & in(0), combOutput),
        (in => !in(3) | !in(2) & in(1) & !in(0), combOutput),
        (in => !in(3) ^ in(2) & in(1) ^ in(0), combOutput),
        (in => !in(3) | !in(2) ^ in(1) ^ in(0), combOutput)
      )
    )

    for (lutFuncSeq <- lutTestFuncs) {
      val config = ClbConfig.apply(
        clb = dut,
        lutInputCnt = 4,
        lutFuncSeq = lutFuncSeq,
        lutInputPinsSelSeq = Seq(
          Seq[Int](0, 1, 2, 3),
          Seq[Int](0, 1, 2, 3),
          Seq[Int](0, 1, 2, 3),
          Seq[Int](0, 1, 2, 3)
        )
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
        val expected = lutFuncSeq.map(_._1(dut.io.clbIn.toBooleans))
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
