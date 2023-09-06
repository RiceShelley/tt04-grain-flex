package fabgen.primitives

import spinal.core._
import spinal.lib._
import spinal.idslplugin.Location

class ProgInterface() extends Bundle with IMasterSlave {
  val clk = Bool()
  val reset = Bool()
  val en = Bool()
  val dIn = Bool()
  val dOut = Bool()

  val clkDom = ClockDomain(clock = clk, reset = reset)

  def connectFromTop(that: ProgInterface): ProgInterface = {
    this.clk := that.clk
    this.reset := that.reset
    this.en := that.en
    this.dIn := that.dIn
    that
  }

  def chain(that: ProgInterface): ProgInterface = {
    this.clk := that.clk
    this.reset := that.reset
    this.en := that.en
    this.dIn := that.dOut
    that
  }

  def connectToTop(that: ProgInterface): ProgInterface = {
    this.dOut := that.dOut
    that
  }

  def asMaster(): Unit = {
    out(clk, reset, en, dIn)
    in(dOut)
  }

}

trait FabricPrimitive {
  val progIface = slave(new ProgInterface()) dontSimplifyIt () setName ("progIface")

  // Returns the amount of configuration bits the primitive uses
  def configDepth(): Int
}
