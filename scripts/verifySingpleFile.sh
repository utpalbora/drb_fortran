#!/bin/bash
LLOV_BUILD=/home/utpal/Work/LLVMOMPVerify/build
FLANG_PATH=/home/utpal/installs/flang-2019-09-04/bin

TEST=$1
CLEAR=$2
FILENAME=$(basename $TEST)
FILENAME=${FILENAME%.*}
OUT_DIR="results"
FILE=$OUT_DIR/$FILENAME

LOG_DIR=$OUT_DIR/log
LOGFILE=$LOG_DIR/$FILENAME.log

#mkdir -p $OUT_DIR
#mkdir -p $LOG_DIR

function exitTest {
  if [ $1 -ne 0 ]; then
    echo "Flang failed for $TEST"
    exit 1
  fi
}

timerStart=$(date +%s%6N)
$FLANG_PATH/flang -fopenmp -S -emit-llvm "$TEST" -o "$FILE.ll"
exitTest $?

$LLOV_BUILD/bin/opt -mem2reg -O1 "$FILE.ll" -S -o "$FILE.ssa.ll" 2>&1
exitTest $?
$LLOV_BUILD/bin/opt -load $LLOV_BUILD/lib/OpenMPVerify.so \
  -openmp-resetbounds "$FILE.ssa.ll" -S -o "$FILE.resetbounds.ll" 2>&1
exitTest $?
$LLOV_BUILD/bin/opt -load $LLOV_BUILD/lib/OpenMPVerify.so \
  -polly-detect-fortran-arrays -polly-process-unprofitable \
  -polly-invariant-load-hoisting -polly-ignore-parameter-bounds \
  -polly-dependences-on-demand -disable-output \
  -openmp-verify \
  "$FILE.resetbounds.ll" 2>&1 | tee "$LOGFILE"
timerEnd=$(date +%s%6N)
totalTime=$(echo "scale=3; ($timerEnd-$timerStart)/1000000"|bc)
echo "Total Time Taken : $totalTime" | tee -a "$LOGFILE"

if [ ! -z $CLEAR ]; then
  rm -rf "$FILE.resetbounds.ll" "$FILE.ssa.ll" "$FILE.ll"
fi
