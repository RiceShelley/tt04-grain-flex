package fabgen.sim

import spinal.core._
import spinal.core.sim._

import fabgen.primitives._

case class BitStream(val bitStream: Seq[Boolean]) {
  def reverse(): Seq[Boolean] = {
    bitStream.reverse
  }
}

object BitStreamFmt {
  def apply(bitStream: Seq[_]): Seq[Boolean] = {
    bitStream
      .map { elem =>
        elem match {
          case bits: BitStream => {
            bits.reverse()
          }
          case seq: Seq[_] => {
            seq
              .map(s =>
                s match {
                  case l: Seq[_]       => BitStreamFmt(l)
                  case bits: BitStream => bits.reverse()
                }
              )
              .reverse
              .flatten
          }
        }
      }
      .reverse
      .flatten
  }
}

case class ProgIfaceDriver(progIface: ProgInterface) {

  progIface.reset #= true

  def prog(bitStream: Seq[_], clkPeriod: TimeNumber): Unit = {
    progIface.en #= true
    progIface.clk #= false

    // Hold async reset high for a while
    progIface.reset #= true
    sleep(timeToLong(100 ns))
    progIface.reset #= false

    BitStreamFmt(bitStream).foreach { bit =>
      progIface.dIn #= bit

      progIface.clk #= false
      sleep(timeToLong(clkPeriod) / 2)
      progIface.clk #= true
      sleep(timeToLong(clkPeriod) / 2)
    }

    progIface.clk #= false
    progIface.en #= false
  }

}

object FmtBitStreamTest extends App {

  val bitStream = Seq(
    Seq(
      Seq(BitStream(Seq(false)), BitStream(Seq(true))),
      Seq(BitStream(Seq(true)), BitStream(Seq(false)))
    ),
    BitStream(Seq(true, false))
  )
  println(bitStream)
  println(BitStreamFmt(bitStream))
}
