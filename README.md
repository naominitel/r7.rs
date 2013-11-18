r7.rs
=====

An implementation of R7RS Scheme. Consists of a bytecode compiler and a virtual machine.

### Testing

This repository contains the submodules of the VM and the compiler, and the test suites.
The submodules are updated each time the VM and the compiler are synchronized, and test
suites are added to cover new functionnalities.

##### Building the compiler

```
cd compiler
cabal configure
cabal build
cp ../dist/build/scmc/scmc .
cd ..
```

##### Building the VM

```
cd vm
rustc main.rs
cd ..
```

##### Running the test suites

The script ```run-tests.sh``` runs all the tests:

```
./tests/run-tests.sh
```
