package fabgen

import spinal.core._
import spinal.core.sim._

import fabgen.sim._

import java.io._

object GrainFlexConfig {

  def apply(fabric: GrainFlexFpga) = {

    // IO buffer configuration
    val ioBuffConfig = BitStream(
      Seq(false, false, false, false, true, true, true, true)
    )
    assert(ioBuffConfig.bitStream.length == fabric.ioBuf.configDepth())

    val combOutput = true
    // CLB configuration
    val clbConfig = ClbConfig(
      clb = fabric.clb0,
      lutFuncSeq = Seq[Tuple2[(Boolean*) => Boolean, Boolean]](
        (in => in(3) & in(2) & in(1) & in(0), combOutput),
        (in => in(3) & !in(2) & in(1) & !in(0), combOutput),
        (in => !in(3) & in(2) & in(1) & in(0), combOutput),
        (in => !in(3) & !in(2) & in(1) & in(0), combOutput)
      ),
      lutInputPinsSelSeq = Seq(
        Seq[Int](0, 1, 2, 3),
        Seq[Int](0, 1, 2, 3),
        Seq[Int](0, 1, 2, 3),
        Seq[Int](0, 1, 2, 3)
      ),
      lutInputCnt = fabric.clb0.belInputWidth
    )

    // CLB input pin mux-ing configuration
    val clb0InputMuxs = fabric.clb0InputMuxs.zipWithIndex.map { case (pMux, idx) =>
      BitStream(
        Seq.tabulate[Boolean](pMux.configDepth())(n => ((idx >> n) & 0x1) == 1)
      )
    }

    // FPGA output pin mux-ing
    val fabricOutputMuxs = fabric.fabricOutputPinMuxs.zipWithIndex.map { case (pMux, idx) =>
      BitStream(
        Seq.tabulate[Boolean](pMux.configDepth())(n => ((idx >> n) & 0x1) == 1)
      )
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

    val shiftRegTest = true
    if (shiftRegTest) {
      val shiftRegConfig = ShiftRegBitStream(fabric = dut)

      val bitStream = BitStreamFmt(shiftRegConfig)
      val fileWriter = new FileWriter(new File("grainFlexBitStream.bit"))
      bitStream.foreach { bit =>
        fileWriter.write(f"${bit.toInt}\n")
      }
      fileWriter.close()

      // Program FPGA
      pDriver.prog(shiftRegConfig, 10 ns)

      // stimulus
      dut.io.ioPins.read #= 0
      dut.clockDomain.waitRisingEdge()
      dut.io.ioPins.read #= 1
      dut.clockDomain.waitRisingEdge()
      dut.io.ioPins.read #= 0
      // Wait 4 clock cycles
      dut.clockDomain.waitRisingEdge()
      dut.clockDomain.waitRisingEdge()
      dut.clockDomain.waitRisingEdge()
      dut.clockDomain.waitRisingEdge()

      // Check that output bit is high
      assert(((dut.io.ioPins.write.toInt >> 3) & 1) == 1)

      dut.clockDomain.waitRisingEdge(20)
    } else {
      val config = GrainFlexConfig(fabric = dut)
      // Drive each possible input into FPGA
      for (i <- 0 to (1 << dut.clb0.io.clbIn.getWidth) - 1) {
        // Drive inputs to fpga
        dut.io.ioPins.read #= i
        // Wait for output to propagate
        sleep(timeToLong(10 ns))
      }
    }

    sleep(timeToLong(100 ns))

  }
}
