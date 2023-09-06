#!/bin/bash

source ~/tt/venv/bin/activate

./tt/tt_tool.py --create-user-config
./tt/tt_tool.py --harden

./tt/tt_tool.py --create-png
