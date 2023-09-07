package fabgen.primitives

import spinal.core._
import spinal.lib._

case class Clb(inputCnt: Int, belCnt: Int, belInputWidth: Int) extends Component with FabricPrimitive {

  val io = new Bundle {
    val clbIn = in Bits (inputCnt bits)
    val clbOut = out Bits (belCnt bits)
  }

  val bels = Seq.tabulate[Bel](belCnt)(_ => Bel(inputCnt = belInputWidth))

  val belsOut = bels.map(_.io.belOut).asBits() addTag (spinalTag = noCombinatorialLoopCheck)

  val belInputPinsMux: Seq[Seq[ProgMux[Bool]]] = bels.map(bel =>
    bel.io.belIn.asBools.map { belInputPin =>
      // Each pin can select between all CLB inputs and all BEL outputs
      val belInputPinMux = ProgMux((belsOut ## io.clbIn).asBools)
      // assign output of mux to BEL input pin
      belInputPin := belInputPinMux.io.muxOut && (progIface.en === False)
      belInputPinMux
    }
  )

  val progChainInput = new ProgInterface()
  progChainInput.connectFromTop(progIface)
  progChainInput.dOut := progChainInput.dIn

  // Connect up the programming interfaces
  progIface.connectToTop(
    bels
      .zip(belInputPinsMux)
      .foldLeft(progChainInput) { case (pIface, (bel, inputMuxs)) =>
        // Connect programming interface to bel
        bel.progIface.chain(pIface)

        // Create a mux for each input pin
        inputMuxs.foldLeft(bel.progIface) { case (muxProgIface, progMux) =>
          // Wire up programming interface to prog mux
          progMux.progIface.chain(muxProgIface)
          progMux.progIface
        }
      }
  )

  io.clbOut := belsOut

  def configDepth(): Int = {
    bels.map(_.configDepth()).sum + belInputPinsMux.flatten.map(_.configDepth()).sum
  }

}
