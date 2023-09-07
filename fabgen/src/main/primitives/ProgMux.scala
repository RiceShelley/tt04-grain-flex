package fabgen.primitives

import spinal.core._
import spinal.lib._

object ProgMux {
  def apply[T <: Data](inputs: Vec[T]): ProgMux[T] = {
    val pMux = ProgMux(gen = inputs.head, inputs.size)
    pMux.io.muxIn := inputs
    pMux
  }
}

case class ProgMux[T <: Data](gen: HardType[T], inputCnt: Int) extends Component with FabricPrimitive {

  val io = new Bundle {
    val muxIn = in(Vec(gen = gen, size = inputCnt))
    val muxOut = out(gen())
  }

  val selWidth = log2Up(inputCnt)

  def configDepth(): Int = { selWidth }

  val sel = UInt(selWidth bits)
  val progClkArea = new ClockingArea(progIface.clkDom) {
    val selMem = Vec(gen = Reg(Bool()).init(False), size = selWidth)
    // Turn vec of registers into shift registers with enable
    progIface.dOut := selMem.foldLeft(progIface.dIn) { case (last, cur) =>
      when(progIface.en) {
        cur := last
      }
      cur
    }
    sel := U(selMem.asBits)
  }

  io.muxOut := Mux(sel = progIface.en, whenTrue = gen().clearAll(), whenFalse = io.muxIn(sel))

  //////////////////////////////////////////////////////////
  // LUT VTR Description
  //////////////////////////////////////////////////////////
  def vtrDesc(inputs: String, output: String) = {
    f"""<mux name="mux_${this.name}" input="${inputs}" output="${output}"/>"""
  }
}
