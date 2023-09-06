package fabGen

import spinal.core._

import fabgen.sim._

// Hardware definition
case class FabGen() extends Component {
  val io = new Bundle {

  }

}

object MyTopLevelVerilog extends App {
  Config.spinal.generateVerilog(FabGen())
}
