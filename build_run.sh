#!/bin/bash
./build.sh
if [ $? == 0 ];then
cd build
 ./nature  
else
echo "Error COmpilacion no se ejecuta"
fi


