#!/bin/bash

# Script to run regression tests for the VM and the compiler
# Scipts are separated in 2 subfolders:
#  - run-pass/*.scm should run and terminate properly
#  - run-fail/*.scm should cause a runtime error and terminate

TESTDIR=tests/build/

if ! [ -f $TESTDIR ]; then
    mkdir $TESTDIR
fi

echo -e "Running run-pass tests...\n"

for f in `ls tests/run-pass/*.scm`; do
    OUT=`./compiler/scmc $f -o $TESTDIR/out.bin 2>&1`

    if [ $? -ne 0 ]; then
        echo "[FAILED] $f: Compiler failure."
        echo "Details:"
        echo $OUT
        exit 1
    fi

    OUT=`./vm/scmrun $TESTDIR/out.bin 2>&1`

    if [ $? -ne 0 ]; then
        echo "[FAILED] $f: Runtime failure."
        echo "Details:"
        echo $OUT
        exit 1
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
        echo $OUT
        exit 1
    fi

    OUT=`./vm/scmrun $TESTDIR/out.bin 2>&1`

    if [ $? -eq 0 ]; then
        echo "[FAILED] $f: Test failure: program exited normally."
        echo "Details:"
        echo $OUT
        exit 1
    fi

    echo "[PASSED] $f"
done

echo "All passed."
rm -rf $TESTDIR
exit 0
