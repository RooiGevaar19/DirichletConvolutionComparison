#!/bin/bash

function testR() {
	Rscript $1 $2 
}

function testPS() {
	./ProcClock.run "echo $2 | rpn $1"
}

function testBC() {
	./ProcClock.run "cat $1 | sed 's/VALUE/$2/' | bc -lq >> dump.txt"
}

fpc ProcClock.pas -v0 -l- -oProcClock.run

echo -ne "n\tPS\tR\tBC\n"

for item in 1 2 3 4 10 19 36 100 250 500 1000 2137 10000 100000 1000000 10000000 100000000 1000000000 2000000000 2147483646 2147483647 ; 
do
	echo -ne "$item\t"  
	testPS Convolve.ppsc $item   
	echo -ne "\t"  
	testR Convolve.r $item
	echo -ne "\t"
	testBC Convolve.bc $item
	echo -ne "\n"
done

