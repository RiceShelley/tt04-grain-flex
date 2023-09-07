package fabgen.primitives

import spinal.core._
import spinal.lib._

case class Bel(inputCnt: Int) extends Component with FabricPrimitive {

  val io = new Bundle {
    val belIn = in Bits (inputCnt bits)
    val belOut = out Bool ()
  }

  // Create lookup table for bel
  val lut = Lut(inputCnt = inputCnt)
  lut.io.lutIn := io.belIn
  lut.progIface.connectFromTop(progIface)

  // Optional register at output of LUT
  val dFF = Reg(Bool()) init (False)
  dFF := lut.io.lutOut

  // Mux between comb LUT output or registered LUT output
  val pMux = ProgMux(Vec(dFF, lut.io.lutOut))
  pMux.progIface.chain(lut.progIface)

  io.belOut := pMux.io.muxOut

  progIface.connectToTop(pMux.progIface)

  def configDepth(): Int = { lut.configDepth() + pMux.configDepth() }

  //////////////////////////////////////////////////////////
  // LUT VTR Description
  //////////////////////////////////////////////////////////
  def vtrDesc(belAmt: Int) = {
    f"""
      <!-- BASIC ELEMENT VTR DESCRIPTION -->
      <pb_type name="bel" num_pb="${belAmt}">
        <input name="in" num_pins="${inputCnt}"/>
        <output name="out" num_pins="1"/>
        <clock name="clk" num_pins="1"/>

        <!-- LUT VTR DESCRIPTION -->
        ${lut.vtrDesc()}

        <pb_type name="ff" blif_model=".latch" num_pb="1" class="flipflop">
          <input name="D" num_pins="1" port_class="D"/>
          <output name="Q" num_pins="1" port_class="Q"/>
          <clock name="clk" num_pins="1" port_class="clock"/>

          <T_setup value="2.448e-10" port="ff.D" clock="clk"/>
          <T_clock_to_Q max="7.732e-11" port="ff.Q" clock="clk"/>

        </pb_type>

        <interconnect>
          <!-- Two ff, make ff available to only corresponding luts -->
          <direct name="direct1" input="bel.in" output="${lut.pbName}.in"/>
          <direct name="direct2" input="${lut.pbName}.out" output="ff.D"/>
          <direct name="direct4" input="bel.clk" output="ff.clk"/>

          <!-- PROG MUX VTR DESCRIPTION -->
          ${pMux.vtrDesc(
        inputs = f"ff.Q ${lut.pbName}.out",
        output = "bel.out"
      )}      
        </interconnect>
      </pb_type> 
    """
  }

  println(vtrDesc(belAmt = 1))

}
