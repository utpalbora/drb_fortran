
FILE=`basename $1 .f95`
LLVM_BUILD=/home/cs15btech11029/OmpVerifier/build
FLANG_PATH=/mnt/OldExtra/Utpal/Flang/install/bin
$FLANG_PATH/flang -fopenmp -S -emit-llvm  $FILE.f95 -o $FILE.ll
if [ $? -ne 0 ]; then
	echo "Falng failed for $FILE.f95"
	exit
fi
$LLVM_BUILD/bin/opt  -mem2reg $FILE.ll -S -o $FILE.ssa.ll
$LLVM_BUILD/bin/opt  -load $LLVM_BUILD/lib/OpenMPVerify.so  -openmp-resetbounds $FILE.ssa.ll -S -o $FILE.resetbounds.ll 
$LLVM_BUILD/bin/opt  -load $LLVM_BUILD/lib/OpenMPVerify.so  -polly-process-unprofitable -polly-invariant-load-hoisting -polly-ignore-parameter-bounds --analyze -openmp-analysis $FILE.resetbounds.ll 
$LLVM_BUILD/bin/opt  -load $LLVM_BUILD/lib/OpenMPVerify.so  -polly-process-unprofitable -polly-invariant-load-hoisting -polly-ignore-parameter-bounds --analyze -openmp-verify $FILE.resetbounds.ll




#$LLVM_BUILD/bin/opt  -load $LLVM_BUILD/lib/OpenMPVerify.so  -polly-process-unprofitable -polly-invariant-load-hoisting --analyze -debug-only=openmp-analysis -openmp-analysis $FILE.resetbounds.ll
#$LLVM_BUILD/bin/opt  -load $LLVM_BUILD/lib/OpenMPVerify.so  -polly-process-unprofitable -polly-invariant-load-hoisting  -polly-ignore-parameter-bounds ---analyze -debug-only=openmp-verify  -openmp-verify $FILE.resetbounds.ll


