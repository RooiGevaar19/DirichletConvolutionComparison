#!/bin/bash

g++ Convolve.cpp -o CPPStd.run
a=$?
g++ ConvolveOpt.cpp -o CPPOpt.run
a=$[ $a && $? ]
rpc StopWatch.pas
a=$[ $a && $? ]
fpc Convolve.pas -oPASStd.run
a=$[ $a && $? ]
fpc ConvolveOpt.pas -oPASOpt.run
a=$[ $a && $? ]
javac Convolve.java

if [[ $a -eq 0 ]] ; 
then
    echo -ne "n\tCPPStd\tCPPOpt\tPASStd\tPASOpt\tJAVStd\tJAVOpt\tPYTStd\tPYTOpt\tPYTSug\tJSStd\tJSOpt\tJSSug\n"

    for item in 1 2 3 4 10 19 36 100 250 500 1000 2137 10000 100000 1000000 10000000 100000000 1000000000 2000000000 2147483646 2147483647 ; 
    do
        echo -ne "$item\t"
        ./CPPStd.run $item
        echo -ne "\t"
        ./CPPOpt.run $item
	echo -ne "\t"
        ./PASStd.run $item
	echo -ne "\t"
        ./PASOpt.run $item
	echo -ne "\t"
        java Convolve $item
	echo -ne "\t"
	python3 Convolve.py $item
	echo -ne "\t"
	node Convolve.js $item
	echo -ne "\n"
    done
    rm *.run
else
    echo "error"
fi
