#/bin/bash -x

for FILE in $(seq 1 $1); do
  if [ -f "$FILE.f95" ]; then
    out=$(gfortran $FILE.f95 -o $FILE.out 2>&1)
    if [ $? -ne 0 ]; then
      printf "$FILE.f95 : Failed\n"
    else 
      runOutput=$(./$FILE.out)
      printf "$FILE.f95 : $runOutput\n"
    fi
  fi
done


