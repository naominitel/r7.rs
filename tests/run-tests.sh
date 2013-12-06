#!/bin/bash

# Script to run regression tests for the VM and the compiler
# Scipts are separated in 2 subfolders:
#  - run-pass/*.scm should run and terminate properly
#  - run-fail/*.scm should cause a runtime error and terminate

TESTDIR=tests/build/

if ! [ -d $TESTDIR ]; then
    mkdir -p $TESTDIR
fi

stop() {
    rm -rf $TESTDIR
    exit $1
}

echo -e "Running run-pass tests...\n"

for f in `ls tests/run-pass/*.scm`; do
    OUT=`./compiler/scmc $f -o $TESTDIR/out.bin 2>&1`

    if [ $? -ne 0 ]; then
        echo "[FAILED] $f: Compiler failure."
        echo "Details:"
        echo "$OUT"
        stop 1
    fi

    OUT=`./vm/scmrun $TESTDIR/out.bin 2>&1`

    if [ $? -ne 0 ]; then
        echo "[FAILED] $f: Runtime failure."
        echo "Details:"
        echo "$OUT"
        stop 1
    fi

    echo "[PASSED] $f"
done

echo "All passed."
echo -e "\nRunning run-fail tests...\n"

for f in `ls tests/run-fail/*.scm`; do
    OUT=`./compiler/scmc $f -o $TESTDIR/out.bin 2>&1`

    if [ $? -ne 0 ]; then
        echo "[FAILED] $f: Compiler failure."
        echo "Details:"
        echo "$OUT"
        stop 1
    fi

    OUT=`./vm/scmrun $TESTDIR/out.bin 2>&1`

    if [ $? -eq 0 ]; then
        echo "[FAILED] $f: Test failure: program exited normally."
        echo "Details:"
        echo "$OUT"
        stop 1
    fi

    echo "[PASSED] $f"
done

echo "All passed."
stop 0
