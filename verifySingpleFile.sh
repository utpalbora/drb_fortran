#/bin/bash -x

FILE=`basename $1 .f95`

#LLVM_BUILD=/home/utpal/LLVMOmpVerify/build
#FLANG_PATH=/home/utpal/installs/flang-2019-05-18/bin

LLVM_BUILD=/home/cs15btech11029/OmpVerifier/build
FLANG_PATH=/mnt/OldExtra/Utpal/Flang/install/bin

$FLANG_PATH/flang -fopenmp -S -emit-llvm  $FILE.f95 -o $FILE.ll

if [ $? -ne 0 ]; then
	echo "Falng failed for $FILE.f95"
	exit
fi

$LLVM_BUILD/bin/opt  -mem2reg $FILE.ll -S -o $FILE.ssa.ll
$LLVM_BUILD/bin/opt  -load $LLVM_BUILD/lib/OpenMPVerify.so  -openmp-resetbounds $FILE.ssa.ll -S -o $FILE.resetbounds.ll
$FLANG_PATH/flang -fopenmp -S -emit-llvm  $FILE.f95 -o $FILE.ll
#$LLVM_BUILD/bin/opt  -load $LLVM_BUILD/lib/OpenMPVerify.so -polly-detect-fortran-arrays -polly-process-unprofitable -polly-invariant-load-hoisting -polly-ignore-parameter-bounds --analyze -openmp-analysis -polly-dependences-on-demand $FILE.resetbounds.ll
$LLVM_BUILD/bin/opt  -load $LLVM_BUILD/lib/OpenMPVerify.so -polly-detect-fortran-arrays -polly-process-unprofitable -polly-invariant-load-hoisting -polly-ignore-parameter-bounds -openmp-verify --disable-output -polly-dependences-on-demand $FILE.resetbounds.ll
