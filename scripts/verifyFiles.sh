#/bin/bash -x
ROOT_DIR=$(pwd)
OUT_DIR=$ROOT_DIR/results
LOG_DIR=$OUT_DIR/log
LOGFILE=$LOG_DIR/`date +%Y-%m-%d-%H-%M`_verify.log

mkdir -p $OUT_DIR
mkdir -p $LOG_DIR

rm -f $LOGFILE
touch $LOGFILE

for FILE in $(ls $ROOT_DIR/micro-benchmarks/*.f95); do
#for FILE in $(ls $ROOT_DIR/FlangError/*.f95); do
  if [ -f $FILE ]; then
    echo $FILE | tee -a $LOGFILE
    $ROOT_DIR/scripts/verifySingpleFile.sh $FILE 1 2>&1 | tee -a $LOGFILE
    echo "*******************" >> $LOGFILE
  fi
done
echo "logs written in ${LOGFILE}"
