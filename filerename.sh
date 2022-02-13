#!/bin/bash

for file in ./*
do
  
  infile=`echo "${file:2}"|sed  \
         -e 's|"\"||g' \
         -e 's| ||g' -e 's|!||g' \
         -e 's|@||g' -e 's|*||g' \
         -e 's|&||g' -e 's|]||g' \
         -e 's|}||g' -e 's|"||g' \
         -e 's|,||g' -e 's|?||g' \
	 -e 's|#||g' -e 's|%||g' \
	 -e 's|{||g' -e 's|<||g' \
	 -e 's|>||g' -e 's|?||g' \
	 -e 's|:||g' \
	 -e 's|+||g' -e 's|=||g' \
         -e 's|-||g'  `
  
  outfile=`echo "${file:2}"|sed -e 's|[^A-Za-z0-9._-]||g'`
  if [ "${file:2}" != "${outfile}" ]
  then
        echo "filename changed from " ${file:2} " to " $outfile
        mv "${file:2}" "${outfile}"
  fi
done
