#!/bin/bash

echo "id, race, norace" > drb_fortran.csv
for l in $(seq 1 116); do
  race=$(grep -ce "Data Race detected" $l.log);
  free=$(grep -ce "Data Race Free" $l.log);
  echo "$l, $race, $free" >> drb_fortran.csv;
done
