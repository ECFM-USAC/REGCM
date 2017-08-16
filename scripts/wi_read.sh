#!/bin/bash

NPoints=47
tcol=1
xcol=4
ycol=3
datacol=5
level=4

ncks -H -C -v ua -d kz,$level single1998_15-OCT_15-NOV_ATM.1998101500.nc > /tmp/outUa
ncks -H -C -v va -d kz,$level single1998_15-OCT_15-NOV_ATM.1998101500.nc > /tmp/outVa

cut -d' ' -f $tcol /tmp/outUa > /tmp/out0
cut -d' ' -f $ycol /tmp/outUa > /tmp/out1
cut -d' ' -f $xcol /tmp/outUa > /tmp/out2
cut -d' ' -f $datacol /tmp/outUa > /tmp/out3
cut -d' ' -f $datacol /tmp/outVa > /tmp/out4

cut -d'=' -f 2 /tmp/out0 > /tmp/outt
cut -d'=' -f 2 /tmp/out1 > /tmp/outy
cut -d'=' -f 2 /tmp/out2 > /tmp/outx
cut -d'=' -f 2 /tmp/out3 > /tmp/outU
cut -d'=' -f 2 /tmp/out4 > /tmp/outV

paste /tmp/outt /tmp/outx /tmp/outy /tmp/outU /tmp/outV > /tmp/outUV

((c=0))
((s=0))
while read line;
do
    echo $line
    ((c=c+1))
    ((s=s+1))

    if (( c == $NPoints ))
    then
	echo 
	(( c=0 ))
    fi

    ss=$((NPoints*NPoints))
    if (( s == $ss ))
    then
	echo
	(( s=0 ))
    fi
   
done < /tmp/outUV
