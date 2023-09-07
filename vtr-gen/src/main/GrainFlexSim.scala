package fabgen

import spinal.core._
import spinal.core.sim._

import fabgen.sim._

object GrainFlexConfig {

  def apply(fabric: GrainFlexFpga) = {

    // IO buffer configuration
    val ioBuffConfig = BitStream(Seq(false, false, false, false, true, true, true, true))
    assert(ioBuffConfig.bitStream.length == fabric.ioBuf.configDepth())

    // CLB configuration
    val clbConfig = ClbConfig(
      clb = fabric.clb0,
      lutFuncSeq = Seq[(Boolean*) => Boolean](
        in => in(3) & in(2) & in(1) & in(0),
        in => in(3) & !in(2) & in(1) & !in(0),
        in => !in(3) & in(2) & in(1) & in(0),
        in => !in(3) & !in(2) & in(1) & in(0)
      ),
      lutInputCnt = fabric.clb0.belInputWidth
    )

    // CLB input pin mux-ing configuration
    val clb0InputMuxs = fabric.clb0InputMuxs.zipWithIndex.map { case (pMux, idx) =>
      BitStream(Seq.tabulate[Boolean](pMux.configDepth())(n => ((idx >> n) & 0x1) == 1))
    }

    // FPGA output pin mux-ing
    val fabricOutputMuxs = fabric.fabricOutputPinMuxs.zipWithIndex.map { case (pMux, idx) =>
      BitStream(Seq.tabulate[Boolean](pMux.configDepth())(n => ((idx >> n) & 0x1) == 1))
    }

    Seq(ioBuffConfig, clbConfig, clb0InputMuxs, fabricOutputMuxs)
  }
}

object GrainFlexSim extends App {
  Config.sim.compile(GrainFlexFpga()).doSim { dut =>
    // Create programming interface driver
    val pDriver = ProgIfaceDriver(progIface = dut.io.progIface)

    dut.clockDomain.forkStimulus(period = 10 ns)
    dut.clockDomain.waitRisingEdge(100)

    val config = GrainFlexConfig(fabric = dut)

    // Program FPGA
    pDriver.prog(config, 10 ns)

    // Drive each possible input into FPGA
    for (i <- 0 to (1 << dut.clb0.io.clbIn.getWidth) - 1) {
      // Drive inputs to fpga
      dut.io.ioPins.read #= i
      // Wait for output to propagate
      sleep(timeToLong(10 ns))
    }
    sleep(timeToLong(100 ns))

  }
}
