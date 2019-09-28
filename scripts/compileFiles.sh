#/bin/bash -x

for FILE in $(ls micro-benchmarks/*.f95); do
  if [ -f "$FILE" ]; then
    out=$(gfortran $FILE -o ${FILE%%.*}.out 2>&1)
    if [ $? -ne 0 ]; then
      printf "$FILE : Failed\n"
    else
      runOutput=$(./${FILE%%.*}.out)
      printf "$FILE : $runOutput\n"
      rm -f ${FILE%%.*}.out
    fi
  fi
done
