package fabgen.sim

import spinal.core._
import spinal.core.sim._

import fabgen.primitives._

object LutSim extends App {
  val lutTestSizes = Seq(3, 4, 5, 6)
  // Test multiple lut configs
  lutTestSizes.foreach { lutInputCnt =>
    Config.sim.workspaceName(f"lut_${lutInputCnt}_test").compile(Lut(inputCnt = lutInputCnt)).doSim { dut =>
      // Create programming interface driver
      val pDriver = ProgIfaceDriver(progIface = dut.progIface)
      // Test n trails
      val trials = 100
      for (trial <- 0 until trials) {
        // Create random lut configuration
        val lutProg = Seq.tabulate[Boolean](dut.configDepth()) { _ => scala.util.Random.nextBoolean() }
        // Program random config to lut
        pDriver.prog(Seq(lutProg), 10 ns)
        // Verify lut
        lutProg.zipWithIndex.foreach { case (expected, inputIdx) =>
          dut.io.lutIn #= inputIdx
          sleep(10)
          assert(dut.io.lutOut.toBoolean == expected)
        }
        sleep(100)
      }
    }
  }
}
