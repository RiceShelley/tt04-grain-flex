import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles
import math


async def progBitStream(dut, bitStream):
    await RisingEdge(dut.clk)
    dut.progEn.value = 1
    dut.progClk.value = False
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)
    for bit in bitStream:
        dut.progDataIn.value = bit
        await RisingEdge(dut.clk)
        dut.progClk.value = True
        await RisingEdge(dut.clk)
        dut.progClk.value = False
        await RisingEdge(dut.clk)
    dut.progEn.value = 0
    await RisingEdge(dut.clk)


@cocotb.test()
async def test_fpga(dut):
    dut._log.info("start")

    dut.rst_n.value = 0
    dut.progEn.value = 0
    dut.progDataIn.value = 0

    dut.fpgaInputs.value = 0

    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())
    await ClockCycles(dut.clk, 100)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 100)

    bits = []
    with open("testBitStream.bit") as file:
        bits = [int(line.rstrip()) for line in file]

    # Test bit stream will configure the FPGA into a 4 bit shift register
    await progBitStream(dut, bits)

    await ClockCycles(dut.clk, 10)

    # Test 4 bit shift register
    dut.fpgaInputs.value = 1
    await ClockCycles(dut.clk, 1)
    dut.fpgaInputs.value = 0
    await ClockCycles(dut.clk, 1)
    await ClockCycles(dut.clk, 1)
    await ClockCycles(dut.clk, 1)
    assert(((dut.fpgaOutputs.value >> 3) & 1) == 0)

    await ClockCycles(dut.clk, 1000)
