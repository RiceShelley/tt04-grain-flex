package fabgen.primitives

import spinal.core._
import spinal.lib._

case class Lut(inputCnt: Int) extends Component with FabricPrimitive {

  //////////////////////////////////////////////////////////
  // LUT Hardware Description
  //////////////////////////////////////////////////////////
  val io = new Bundle {
    val lutIn = in Bits (inputCnt bits)
    val lutOut = out Bool ()
  }

  val lutSize: Int = 1 << inputCnt

  def configDepth(): Int = { lutSize }

  val lut = Vec(gen = Bool(), size = lutSize)

  val progClkArea = new ClockingArea(progIface.clkDom) {
    val lutMem = Vec(gen = Reg(Bool()).init(False), size = lutSize)
    // Turn vec of registers into shift registers with enable
    progIface.dOut := lutMem.foldLeft(progIface.dIn) { case (last, cur) =>
      when(progIface.en) {
        cur := last
      }
      cur
    }
    // Assign shift register outputs to lut
    lut := lutMem
  }

  // Mux memory to make a lut (Ignore CC domain crossing and treat lookup table as comb logic)
  io.lutOut := lut(io.lutIn.asUInt).addTag(crossClockDomain)

  //////////////////////////////////////////////////////////
  // LUT VTR Description
  //////////////////////////////////////////////////////////
  val pbName = f"lut_${inputCnt}"
  val delayMatrix = "2.690e-10 " * inputCnt

  def vtrDesc() = {
    f"""<pb_type name="${pbName}" blif_model=".names" num_pb="1" class="lut">
          <input name="in" num_pins="${inputCnt}" port_class="lut_in"/>
          <output name="out" num_pins="1" port_class="lut_out"/>

          <!-- LUT timing using delay matrix -->
          <delay_matrix type="max" in_port="${pbName}.in" out_port="${pbName}.out">
            ${delayMatrix}
          </delay_matrix>
        </pb_type>"""
  }

}
