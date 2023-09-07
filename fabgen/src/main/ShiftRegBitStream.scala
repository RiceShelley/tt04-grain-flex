package fabgen

import fabgen.sim._

object ShiftRegBitStream {

  def apply(fabric: GrainFlexFpga) = {

    // IO buffer configuration (false is input, true is output)
    val ioBuffConfig = BitStream(
      Seq(false, false, false, true, false, false, false, false)
    )
    assert(ioBuffConfig.bitStream.length == fabric.ioBuf.configDepth())

    val combOutput = false
    // CLB configuration
    val clbConfig = ClbConfig(
      clb = fabric.clb0,
      lutFuncSeq = Seq[Tuple2[(Boolean*) => Boolean, Boolean]](
        (in => in(0), combOutput),
        (in => in(0), combOutput),
        (in => in(0), combOutput),
        (in => in(0), combOutput)
      ),
      lutInputPinsSelSeq = Seq(
        Seq[Int](0, 0, 0, 0),
        Seq[Int](4, 0, 0, 0),
        Seq[Int](5, 0, 0, 0),
        Seq[Int](6, 0, 0, 0)
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
