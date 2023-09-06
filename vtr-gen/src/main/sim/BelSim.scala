package fabgen.sim

import spinal.core._
import spinal.core.sim._

import fabgen.primitives._

object BelConfig {
  def apply(inputCnt: Int, regOutput: Boolean) = {
    val lutConfig = BitStream(Seq.tabulate[Boolean](1 << inputCnt) { _ => scala.util.Random.nextBoolean() })
    val registerOutput = BitStream(Seq.tabulate[Boolean](1) { _ => regOutput })
    Seq(lutConfig, registerOutput)
  }
}

object BelSim extends App {
  Config.sim.compile(Bel(inputCnt = 4)).doSim { dut =>
    // Create programming interface driver
    val pDriver = ProgIfaceDriver(progIface = dut.progIface)

    // Start FPGA clk
    dut.clockDomain.forkStimulus(period = 10 ns)
    dut.clockDomain.waitRisingEdge(20)

    Seq(true, false).foreach { belRegEn =>
      // Create random bel config
      val config = BelConfig(inputCnt = dut.inputCnt, regOutput = belRegEn)

      // Program random config to lut
      pDriver.prog(config, 10 ns)

      // Verify bel
      config(0).bitStream.zipWithIndex.foreach { case (expected, inputIdx) =>
        dut.io.belIn #= inputIdx
        if (belRegEn) {
          dut.clockDomain.waitRisingEdge()
          dut.clockDomain.waitFallingEdge()
        } else {
          sleep(timeToLong(1 ns))
        }
        if (dut.io.belOut.toBoolean != expected) {
          println(f"bel output expected ${expected} got ${dut.io.belOut.toBoolean} at index ${inputIdx}")
        }
        assert(dut.io.belOut.toBoolean == expected)
      }
    }
  }
}
