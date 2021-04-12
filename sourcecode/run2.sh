#!/bin/bash


function testR() {
	TIMEFORMAT=%R
	if [[ $2 -le 100000000 ]] ; 
	then
		Rscript $1 $2 
	else
		echo -ne "OffTheScale"
	fi
}

function testPS() {
	TIMEFORMAT=%R
	echo -ne `time $(echo $2 | rpn $1)` 
}

function testBC() {
	time `cat $1 | sed -e '$a convolve('"$2"')' | bc -lq` 2>> dump.txt
}

echo -ne "n\tPS\tR\tBC\n"

for item in 1 2 3 4 10 19 36 100 250 500 1000 2137 10000 100000 1000000 10000000 100000000 1000000000 2000000000 2147483646 2147483647 ; 
do
	echo -ne "$item\t"  
	testPS Convolve.ppsc $item   
	echo -ne "\b\t"  
	testR Convolve.r $item
	echo -ne "\t"
	testBC Convolve.bc $item
	echo -ne "\n"
done

