#/bin/bash -x
LOGFILE=`date +%Y-%m-%d-%H-%M`_verify.log

rm -f $LOGFILE
touch $LOGFILE

for FILE in $(seq 1 $1); do
  if [ -f "$FILE.f95" ]; then
    echo "$FILE.f95" >> $LOGFILE
    bash verifySingpleFile.sh $FILE.f95 2>&1 | tee -a $LOGFILE
    echo "*******************" >> $LOGFILE
  fi
done
