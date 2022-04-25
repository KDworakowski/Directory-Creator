#!/usr/bin/env bash

if [ $# -ne 2 ]
then
    echo "The script should have 2 arguments!"
    echo "Use './main.sh nameOfTheDict ./pathToTheNamesFile' "
    exit 1
fi


mkdir -p $1
input=$2
while read -r line
do

FILE="${1}/${line}"
  if test -f "$FILE"; then
  let t=2
  while test -f "${FILE}.${t}"
  do
  t=$((t+1))
  done
  touch "${FILE}.${t}"
  chmod 444 "${FILE}.${t}"

  else
  touch "${FILE}"
  chmod 444 "${FILE}"

  fi

done < "$input"
