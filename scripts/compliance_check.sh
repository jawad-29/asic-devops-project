#!/bin/bash

set -e

echo "============================================="
echo "RUNNING DESIGN QUALITY & SAFETY CHECKS"
echo "============================================="

# Check that the RTL source exists
if [ ! -f "src/counter.v" ]; then
    echo "[FAIL] RTL source file not found."
    exit 1
fi

echo "[PASS] RTL source file exists."

# Check that the counter has an explicit reset path
if grep -q "posedge rst" src/counter.v; then
    echo "[PASS] Reset path detected in RTL."
else
    echo "[FAIL] Reset path not detected."
    exit 1
fi

# Check that the counter is 4 bits wide
if grep -q "output reg \[3:0\] count" src/counter.v; then
    echo "[PASS] Counter output width is 4 bits."
else
    echo "[FAIL] Unexpected counter output width."
    exit 1
fi

echo "============================================="
echo "DESIGN QUALITY CHECKS PASSED"
echo "============================================="
