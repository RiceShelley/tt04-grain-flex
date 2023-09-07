#!/bin/bash

cd vtr-gen
sbt "runMain fabgen.BuildGrainFlexFabric"
cp hw/gen/GrainFlexFpga.v ../src/.