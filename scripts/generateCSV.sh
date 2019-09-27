#!/bin/bash

echo "id, race, norace" > drb_fortran.csv
for l in $(seq -w 001 116); do
  LOG=results/log/DRBF${l}
  race=$(grep -ce "Data Race detected" ${LOG}*.log);
  free=$(grep -ce "Data Race Free" ${LOG}*.log);
  echo "$l, $race, $free" >> drb_fortran.csv;
done
