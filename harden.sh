#!/bin/bash

export OPENLANE_ROOT=~/tt/openlane
export PDK_ROOT=~/tt/pdk
export PDK=sky130A
export OPENLANE_TAG=2023.06.26
export OPENLANE_IMAGE_NAME=efabless/openlane:3bc9d02d0b34ad032921553e512fbe4bebf1d833

source ~/tt/venv/bin/activate

./tt/tt_tool.py --create-user-config
./tt/tt_tool.py --harden

./tt/tt_tool.py --create-png
