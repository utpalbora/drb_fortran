#!/bin/bash

echo "id, haverace, race, norace" > drb_fortran.csv
#for l in $(seq -w 001 116); do
for l in $(ls micro-benchmarks/*.f95); do
  filename="${l%%.*}"
  filename="${filename##*/}"
  haverace="${filename##*_}"
  id=${filename#DRBF}
  id=${id%%_*}
  LOG=results/log/${filename}.log
  race=$(grep -ce "Data Race detected." ${LOG});
  free=$(grep -ce "Data Race Free" ${LOG});
  echo "$id, ${haverace}, ${race:-"NA"}, ${free:-"NA"}" >> drb_fortran.csv;
done
