#!/bin/bash

cd fabgen
sbt "runMain fabgen.BuildGrainFlexFabric"
cp hw/gen/GrainFlexFpga.v ../src/.