package fabgen

import spinal.core._
import spinal.lib._
import spinal.lib.io.TriStateArray
import fabgen.primitives._
import fabgen.sim.Config

case class GrainFlexFpga(ioPinCnt: Int = 8) extends Component {

  val io = new Bundle {
    val ioPins = master(TriStateArray(ioPinCnt bits))
    val progIface = slave(new ProgInterface())
  }

  //////////////////////////////////////////////////////////
  // IO Buffers
  //////////////////////////////////////////////////////////
  val ioBuf = IOBuf(bufCnt = ioPinCnt)
  io.ioPins <> ioBuf.io.buffs
  ioBuf.progIface.connectFromTop(io.progIface)

  val fabricInputs: Vec[Bool] = ioBuf.io.fabricIn
  val fabricOutputs: Vec[Bool] = ioBuf.io.fabricOut

  //////////////////////////////////////////////////////////
  // CLB
  //////////////////////////////////////////////////////////
  val clb0 = Clb(inputCnt = 4, belCnt = 4, belInputWidth = 4)
  clb0.progIface.chain(ioBuf.progIface)

  //////////////////////////////////////////////////////////
  // Fabric input / output mux-ing to CLB
  //////////////////////////////////////////////////////////
  // Allow every fabric input pin to connect to every clb0 input pin
  val clb0InputMuxs = clb0.io.clbIn.asBools.map { clbInputPin =>
    val pMux = ProgMux(fabricInputs)
    clbInputPin := pMux.io.muxOut
    pMux
  }

  val clb0InputProgIfaceOut = clb0InputMuxs.foldLeft(clb0.progIface) { case (pIface, pMux) =>
    pMux.progIface.chain(pIface)
    pMux.progIface
  }

  // Allow every fabric output pin to select any clb0 output pin
  val fabricOutputPinMuxs = fabricOutputs.map { fabricOutputPin =>
    val pMux = ProgMux(clb0.io.clbOut.asBools)
    fabricOutputPin := pMux.io.muxOut
    pMux
  }

  val progIfaceEnd = fabricOutputPinMuxs.foldLeft(clb0InputProgIfaceOut) { case (pIface, pMux) =>
    pMux.progIface.chain(pIface)
    pMux.progIface
  }

  io.progIface.dOut := progIfaceEnd.dOut

  def configDepth(): Int = {
    ioBuf.configDepth() +
      clb0.configDepth() +
      clb0InputMuxs.map(_.configDepth()).sum +
      fabricOutputPinMuxs.map(_.configDepth()).sum
  }

}

object BuildGrainFlexFabric extends App {
  Config.spinal.generateVerilog(GrainFlexFpga())
}
