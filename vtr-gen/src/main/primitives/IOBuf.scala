package fabgen.primitives

import spinal.core._
import spinal.lib._
import spinal.lib.io.TriStateArray

case class IOBuf(bufCnt: Int) extends Component with FabricPrimitive {
  val io = new Bundle {
    val buffs = master(TriStateArray(bufCnt bits))
    val fabricIn = out Vec (gen = Bool(), size = bufCnt)
    val fabricOut = in Vec (gen = Bool(), size = bufCnt)
  }

  // Assign fabricInputs to read port of tristate buffer
  io.buffs.read.asBools.zip(io.fabricIn).foreach { case (read, fabInPin) =>
    fabInPin := read
  }

  // Assign write port of tristate buffer to fabricOutputs
  io.buffs.write := io.fabricOut.asBits

  // Make writeEnable programmable via scan chain
  val pinDir = Bits()
  io.buffs.writeEnable := pinDir

  val progClkArea = new ClockingArea(progIface.clkDom) {
    val pinDirMem = Vec(gen = Reg(Bool()).init(False), size = bufCnt)
    // Turn vec of registers into shift registers with enable
    progIface.dOut := pinDirMem.foldLeft(progIface.dIn) { case (last, cur) =>
      when(progIface.en) {
        cur := last
      }
      cur
    }
    // Assign shift register outputs to lut
    pinDir := pinDirMem.asBits
  }

  def configDepth(): Int = { bufCnt }

}
