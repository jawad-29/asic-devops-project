#!/bin/bash

set -e

echo "================================="
echo "Running RTL Simulation"
echo "================================="

mkdir -p build

iverilog -o build/counter_sim \
    src/counter.v \
    TestBench/counter_tb.v

vvp build/counter_sim

echo "================================="
echo "RTL Simulation Completed"
echo "================================="
