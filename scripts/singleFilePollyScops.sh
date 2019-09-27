echo $1
FILE=`basename $1 .f95`
LLVM_BUILD=/home/cs15btech11029/OmpVerifier/build
FLANG_PATH=/mnt/OldExtra/Utpal/Flang/install/bin

$FLANG_PATH/flang -fopenmp  -S -emit-llvm  $FILE.f95 -o $FILE.ll
if [ $? -ne 0 ]; then
	echo "Flang failed for $FILE.f95"
	exit
fi
$LLVM_BUILD/bin/opt  -mem2reg -O1 $FILE.ll -S -o $FILE.ssa.ll
$LLVM_BUILD/bin/opt  -load $LLVM_BUILD/lib/OpenMPVerify.so  -openmp-resetbounds $FILE.ssa.ll -S -o $FILE.resetbounds.ll
$LLVM_BUILD/bin/opt  -load $LLVM_BUILD/lib/OpenMPVerify.so  -polly-process-unprofitable -polly-invariant-load-hoisting --analyze -polly-scops -polly-dependences -pass-remarks-missed=polly-detect $FILE.resetbounds.ll

