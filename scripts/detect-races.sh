#!/bin/bash

TESTS=($(ls micro-benchmarks/*.f95))
OUTPUT_DIR="results"
LOG_DIR="$OUTPUT_DIR/log"
EXEC_DIR="$OUTPUT_DIR/exec"
LOGFILE="$LOG_DIR/drb_fortran.log"
BACKUP_DIR=$LOG_DIR/$(date +%Y-%m-%d-%H-%M)

#export KMP_AFFINITY="scatter" #scatter, compact, none, verbose
#export OMP_PLACES="sockets" #scokets, cores, threads
#export OMP_PROC_BIND="true" #true, false, master, close, spread
#export OMP_DISPLAY_ENV="VERBOSE" #TRUE, FALSE, & VERBOSE

TIMEOUTCMD=${TIMEOUTCMD:-"timeout"}
RUNCMD=${RUNCMD:-"./runsolver/runsolver"}
VALGRIND=${VALGRIND:-"valgrind"}
VALGRIND_COMPILE_FLAGS="-g -fopenmp"

TSAN_COMPILE_FLAGS="-fopenmp -fopenmp-version=45 -fsanitize=thread -g"

FLANG_PATH=/home/utpal/installs/flang-2020-05-11
FLANG_FLAGS+=" -disable-O0-optnone"
FLANG_FLAGS+=" -fopenmp -fopenmp-version=45"
FLANG_FLAGS+=" -g"
LLOV_COMPILER="/home/utpal/Work/LLVMOmpVerify/build"
LLOV_COMPILE_FLAGS=" $LLOV_COMPILER/lib/OpenMPVerify.so"
LLOV_COMPILE_FLAGS+=" -polly-process-unprofitable"
LLOV_COMPILE_FLAGS+=" -polly-invariant-load-hoisting"
LLOV_COMPILE_FLAGS+=" -polly-ignore-parameter-bounds"
LLOV_COMPILE_FLAGS+=" -polly-dependences-on-demand"
LLOV_COMPILE_FLAGS+=" -polly-precise-fold-accesses"
#LLOV_COMPILE_FLAGS+=" -openmp-verify-disable-aa"


ARCHER=${ARCHER:-"clang-archer"}
ARCHER_COMPILE_FLAGS="-larcher -fopenmp-version=45"
export ARCHER_ROOT="/home/utpal/Work/ARCHER"
export PATH="$ARCHER_ROOT/install/bin:$PATH"
export LD_LIBRARY_PATH="$ARCHER_ROOT/install/lib:$LD_LIBRARY_PATH"

SWORD=${SWORD:-"clang-sword"}
SWORD_ANALYSIS=${SWORD_ANALYSIS:-"sword-offline-analysis"}
SWORD_RACE_ANALYSIS=${SWORD_RACE_ANALYSIS:-"sword-race-analysis"}
SWORD_REPORT=${SWORD_REPORT:-"sword-print-report"}
SWORD_COMPILE_FLAGS="-fopenmp-version=45"
export SWORD_ROOT="/home/utpal/Work/SWORD"
export SWORD_OPTIONS="traces_path=$LOG_DIR/sword_data"
export PATH="$SWORD_ROOT/install/bin:$PATH"
export LD_LIBRARY_PATH="$SWORD_ROOT/install/lib:$LD_LIBRARY_PATH"

export ROMP_ROOT="/home/utpal/Work/ROMP/romp"
export CPATH="$ROMP_ROOT/pkgs-src/llvm-openmp/openmp/llvm-openmp-install/include:$CPATH"
export LD_LIBRARY_PATH="$ROMP_ROOT/pkgs-src/llvm-openmp/openmp/llvm-openmp-install/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$ROMP_ROOT/pkgs-src/gperftools/gperftools-install/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$ROMP_ROOT/pkgs-src/dyninst/dyninst-install/lib:$LD_LIBRARY_PATH"
export DYNINST_ROOT="$ROMP_ROOT/pkgs-src/dyninst/dyninst-install"
ROMP_LIB="$ROMP_ROOT/pkgs-src/romp-lib/romp-install/lib"
OMP_LIB="$ROMP_ROOT/pkgs-src/llvm-openmp/openmp/llvm-openmp-install/lib"
GPERFTOOLS_LIB="$ROMP_ROOT/pkgs-src/gperftools/gperftools-install/lib"
export ROMP_PATH="$ROMP_LIB/libomptrace.so"
export DYNINST_CLIENT="$ROMP_ROOT/pkgs-src/dyninst-client/omp_race_client"
export DYNINSTAPI_RT_LIB="$DYNINST_ROOT/lib/libdyninstAPI_RT.so"
ROMP_COMPILE_FLAGS="-g -O0 -L${ROMP_LIB} -L${GPERFTOOLS_LIB} -L${OMP_LIB} -fopenmp -fopenmp-version=45 -fpermissive -ltcmalloc"

POLYFLAG="micro-benchmarks/utilities/polybench.c -I micro-benchmarks -I micro-benchmarks/utilities -DPOLYBENCH_NO_FLUSH_CACHE -DPOLYBENCH_TIME -D_POSIX_C_SOURCE=200112L"

validate_tool_path () {
  case "$1" in
    gcc) if [[ `which gcc` ]]; then return 0; else return 1; fi;;
    clang) if [[ `which clang` ]]; then return 0; else return 1; fi;;
    helgrind) if [[ `which $VALGRIND` ]]; then return 0; else return 1; fi;;
    drd) if [[ `which $VALGRIND` ]]; then return 0; else return 1; fi;;
    archer) if [[ `which $ARCHER` ]]; then return 0; else return 1; fi;;
    sword) if [[ `which $SWORD` ]] && [[ `which $SWORD_ANALYSIS` ]] && [[ `which $SWORD_REPORT` ]] && [[ `which $SWORD_RACE_ANALYSIS` ]]; then return 0; else return 1; fi;;
    llov) if [[ -f $LLOV_COMPILER/lib/OpenMPVerify.so ]]; then return 0; else return 1; fi;;
    tsan-llvm) if [[ `which clang` ]]; then return 0; else return 1; fi;;
    tsan-gcc) if [[ `which clang` ]]; then return 0; else return 1; fi;;
    romp) if [[ -f $ROMP_PATH ]] && [[ -f $DYNINST_CLIENT ]] && [[ -f $DYNINSTAPI_RT_LIB ]]; then return 0; else return 1; fi;;
    *) return 1 ;;
  esac
}

generateCSV () {
  echo "$tool,$id,\"$testname\",$haverace,${thread:-"N/A"},${races:-0},${compiletime:-"N/A"},${mem:-"N/A"},${compilereturn:-1},${testreturn:-"N/A"}" >> "$runfile"
}

mkdir -p "$OUTPUT_DIR"
mkdir -p "$LOG_DIR"
mkdir -p "$EXEC_DIR"
mkdir -p "$BACKUP_DIR"

TOOLS=()
THREADLIST=()
ITERATIONS=5
TIMEOUTMIN=10

while getopts "n:t:x:s:" opt; do
  case $opt in
    x)  if validate_tool_path "${OPTARG}"; then TOOLS+=(${OPTARG});
    else echo "Invalid tool name ${OPTARG}" && exit 1; fi ;;
    n)  if [[ ${OPTARG} -gt 0 ]]; then ITERATIONS=${OPTARG};
    else echo "Number of iterations must be greater than 0"; fi ;;
    t)  if [[ ${OPTARG} -gt 1 ]]; then THREADLIST+=(${OPTARG})
    else echo "Number of threads must be greater than 1" && exit 1; fi ;;
    s)  if [[ ${OPTARG} -gt 0 ]]; then TIMEOUTMIN=(${OPTARG})
    else echo "timeout must be greater than 0" && exit 1; fi ;;
  esac
done

if [[ ! ${#TOOLS[@]} -gt 0 ]]; then
  TOOLS=( 'helgrind' 'drd' 'tsan-llvm' 'tsan-gcc' 'archer' 'sword' 'llov' )
else
  echo "Tools: ${TOOLS[*]}";
fi

if [[ ! ${#THREADLIST[@]} -gt 0 ]]; then
  THREADLIST=('3' '36' '45' '72' '90' '180' '256')
else
  echo "Thread counts: ${THREADLIST[*]}";
fi

if [[ -e "$LOGFILE" ]]; then rm "$LOGFILE"; fi

#RUNFLAGS=" --timestamp -C 12000 -W 180 -V 3000 -w watch.log -v time.log -o tool_output.log"
TIMEOUTSEC=$((TIMEOUTMIN*60))
RUNFLAGS=" --timestamp -C ${TIMEOUTSEC}00 -W ${TIMEOUTSEC} --phys-cores 0-71 "

for ITER in $(seq 1 "$ITERATIONS"); do
  for tool in "${TOOLS[@]}"; do

    runfile="$OUTPUT_DIR/$tool.csv"
    compfile="$OUTPUT_DIR/${tool}_compile.csv"
    SAVELOGS=$BACKUP_DIR/$tool

    if [ $ITER -eq 1 ]; then
      echo "tool,id,filename,haverace,threads,races,elapsed-time(seconds),used-mem(KBs),compile-return,runtime-return" > "$runfile"
      echo "tool,id,filename,elapsed-time(seconds),compile-return" > "$compfile"
      mkdir -p $SAVELOGS
    fi

    for test in "${TESTS[@]}"; do

      if [[ "$test" =~ "_yes.f95" ]]; then haverace=true; else haverace=false; fi
      testname=$(basename $test)
      id=${testname#DRBF}
      id=${id%%_*}
      echo "$test has $testname and ID=$id"

      # Compile
      exname="$EXEC_DIR/$(basename "$test").$tool.out"
      rompcompile="$EXEC_DIR/$(basename "$test").$tool.compile"
      compilelog="$LOG_DIR/$(basename "$test").$tool.${ITER}_comp"
      logname="${compilelog}.log"
      if [[ -e "$logname" ]]; then rm "$logname"; fi
      OUTFLAGS=" -w ${compilelog}.watch.log -v ${compilelog}.var.log -o $logname "

      case "$tool" in
        gcc)        $RUNCMD -W $TIMEOUTSEC $OUTFLAGS gfortran -g -fopenmp $test -o $exname -lm ;;
        clang)      $RUNCMD -W $TIMEOUTSEC $OUTFLAGS flang -fopenmp -fopenmp-version=45 -g $test -o $exname -lm ;;
        helgrind)   $RUNCMD -W $TIMEOUTSEC $OUTFLAGS gfortran $VALGRIND_COMPILE_FLAGS $test -o $exname -lm ;;
        drd)        $RUNCMD -W $TIMEOUTSEC $OUTFLAGS gfortran $VALGRIND_COMPILE_FLAGS $test -o $exname -lm ;;
        archer)     $RUNCMD -W $TIMEOUTSEC $OUTFLAGS clang-archer $ARCHER_COMPILE_FLAGS $test -o $exname -lm ;;
        sword)      $RUNCMD -W $TIMEOUTSEC $OUTFLAGS clang-sword $SWORD_COMPILE_FLAGS $test -o $exname -lm ;;
        tsan-llvm)  $RUNCMD -W $TIMEOUTSEC $OUTFLAGS flang $TSAN_COMPILE_FLAGS $test -o $exname -lm ;;
        tsan-gcc)   $RUNCMD -W $TIMEOUTSEC $OUTFLAGS gfortran $TSAN_COMPILE_FLAGS $test -o $exname -lm ;;
        llov)       $FLANG_PATH/bin/flang -fopenmp -S -emit-llvm "$test" -o "$exname.ll";
                    $LLOV_COMPILER/bin/opt -mem2reg -O1 "$exname.ll" -S -o "$exname.ssa.ll";
                    $LLOV_COMPILER/bin/opt -load $LLOV_COMPILER/lib/OpenMPVerify.so \
                        -openmp-forceinline -inline -openmp-resetbounds "$exname.ssa.ll" -S -o "$exname.resetbounds.ll";
                    $RUNCMD -W $TIMEOUTSEC $OUTFLAGS $LLOV_COMPILER/bin/opt -load $LLOV_COMPILER/lib/OpenMPVerify.so \
                        -polly-detect-fortran-arrays -polly-process-unprofitable \
                        -polly-invariant-load-hoisting -polly-ignore-parameter-bounds \
                        -polly-dependences-on-demand -polly-precise-fold-accesses \
                        -disable-output \
                        -openmp-verify \
                        "$exname.resetbounds.ll";
                    rm -f $exname.ll $exname.ssa.ll $exname.resetbounds.ll;;
        romp)       $RUNCMD -W $TIMEOUTSEC $OUTFLAGS clang-8 $ROMP_COMPILE_FLAGS $test -o $rompcompile -lm;
          $RUNCMD -W $TIMEOUTSEC $OUTFLAGS $DYNINST_CLIENT $rompcompile;
          mv instrumented_app $exname;;
      esac
      compiletime=$(grep "Real time" ${compilelog}.watch.log | awk -F: '{ print $2 }')
      if [ $(grep -ce "^TIMEOUT=true" ${compilelog}.var.log) -eq 0 ]; then
        compilereturn=$(grep "Child status" ${compilelog}.watch.log | awk -F: '{ print $2 }')
      else
        compilereturn=124
      fi
      echo "Time taken : ${compiletime}s."
      echo "Compile return code: $compilereturn";
      echo "$tool,$id,\"$testname\",$compiletime,$compilereturn" >> "$compfile";
      cp "$compfile" "$BACKUP_DIR"

      if [[ $tool == llov ]] ; then
        races=$(grep -ce 'Data Race detected.' $logname);
        racefree=$(grep -ce 'Region is Data Race Free.' $logname);
        if [ $races -eq 0 ] && [ $racefree -eq 0 ]; then
            races="NA"
        fi
        rm -f $exname
        generateCSV
        mv "$logname" "${compilelog}.var.log" "${compilelog}.watch.log" -t "$SAVELOGS" 2> /dev/null
        # Static Tool
        continue
      fi
      mv "$logname" "${compilelog}.var.log" "${compilelog}.watch.log" -t "$SAVELOGS" 2> /dev/null

      # Execution
      for thread in "${THREADLIST[@]}"; do
        echo "Testing $test: with $thread threads"
        export OMP_NUM_THREADS=$thread
        runlog="$LOG_DIR/$(basename "$test").$tool.$thread.$ITER"
        logname="${runlog}.log"
        OUTFLAGS=" -w ${runlog}.watch.log -v ${runlog}.var.log -o $logname "
        gentime=""
        analysistime=""
        # Sanity check
        if [[ ! -e "$exname" ]]; then
          echo "$tool,$id,\"$testname\",$haverace,$thread,,,,,$compilereturn," >> "$runfile";
          echo "Executable for $testname with $thread threads is not available" >> "$LOGFILE";
        else
          case "$tool" in
            gcc)
              ;&
            clang)
              $RUNCMD $RUNFLAGS $OUTFLAGS "./$exname";
              races="";;
            helgrind)
              $RUNCMD $RUNFLAGS $OUTFLAGS $VALGRIND --tool=helgrind "./$exname";
              races=$(grep -ce 'Possible data race' $logname);;
            drd)
              $RUNCMD $RUNFLAGS $OUTFLAGS $VALGRIND --tool=drd --check-stack-var=yes "./$exname";
              races=$(grep -ce 'Conflicting .* by thread' $logname);;
            sword)
              if [[ -e "$LOG_DIR/sword_data" ]]; then
                rm -rf "$LOG_DIR/sword_data";
              fi;
              if [[ -e "$LOG_DIR/sword_report" ]]; then
                rm -rf "$LOG_DIR/sword_report";
              fi;
              $RUNCMD $RUNFLAGS $OUTFLAGS "./$exname"
              gentime=$(grep "Real time" ${runlog}.watch.log | awk -F: '{ print $2 }')
              $RUNCMD $RUNFLAGS $OUTFLAGS $SWORD_ANALYSIS --analysis-tool $SWORD_RACE_ANALYSIS --executable $exname --traces-path "$LOG_DIR/sword_data" --report-path "$LOG_DIR/sword_report"
              analysistime=$(grep "Real time" ${runlog}.watch.log | awk -F: '{ print $2 }')
              $RUNCMD $RUNFLAGS $OUTFLAGS $SWORD_REPORT --executable $exname --report-path "$LOG_DIR/sword_report"
              races=$(grep -ce 'WARNING: SWORD: data race' $logname);;
            archer)
              ;&
            tsan-gcc)
              ;&
            tsan-llvm)
              $RUNCMD $RUNFLAGS $OUTFLAGS "./$exname";
              races=$(grep -ce 'WARNING: ThreadSanitizer: data race' $logname);;
            romp)
              $RUNCMD $RUNFLAGS $OUTFLAGS "./$exname";
              races=$(grep -ce 'race found!' $logname);;
          esac
          mem=$(grep "maximum resident set size" ${runlog}.watch.log | sed -E 's/.*[[:space:]]([[:digit:]]+)/\1/')
          runtime=$(grep "Real time" ${runlog}.watch.log | awk -F: '{ print $2 }')
          runtime=$(echo "scale=3; ($runtime+${gentime:-0}+${analysistime:-0})"|bc)
          if [ $(grep -ce "^TIMEOUT=true" ${runlog}.var.log) -eq 0 ]; then
            returncode=$(grep "Child status" ${runlog}.watch.log | awk -F: '{ print $2 }')
          else
            returncode=124
          fi
          echo "$testname return $returncode";
          echo "$tool,$id,\"$testname\",$haverace,$thread,${races:-0},$runtime,$mem,$compilereturn,$returncode" >> "$runfile"
        fi
        echo "$tool,$testname,$threads,${races:-0},${runtime:-0},${mem:-0},${returncode:-0}" >> "$LOGFILE"
        mv "$logname" "${runlog}.var.log" "${runlog}.watch.log" -t "$SAVELOGS" 2> /dev/null

      done #End threads loop
    done #End Kernels loop
    if [[ -e "$LOGFILE" ]]; then cp "$LOGFILE" "$BACKUP_DIR"; fi
    cp $runfile "$BACKUP_DIR"
  done #End Tools loop
done #End of Iterations loop

mv "$REPORT" -t "$BACKUP_DIR" 2> /dev/null
