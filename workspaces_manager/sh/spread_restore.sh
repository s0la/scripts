#!/bin/bash

while read line;do

	eval $line
done < Documents/.hidden_files/positions.txt

rm Documents/.hidden_files/positions.txt