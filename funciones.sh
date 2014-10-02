#!/bin/bash

MAKEFILE=Makefile
function copiar_estructura {
    echo $1
	#mkdir -p `basename $1`
	basedir=`basename $1`
	echo "copiando $basedir";
    mkdir $2/$basedir
        dirs=`find $1 -type d -print`
	for i in $dirs
	do
	echo creando $2/$basedir/${i#$1}
	mkdir -p $2/$basedir/${i#$1}
	done
}

function get_archivos_cpp {
    local  result=$1
    local localSrcs=`find $CPP_DIR -name '*.cpp' -print`
    eval $result="'$localSrcs'"
}
function generar_make {
    
    get_archivos_cpp SRCS
	local basecppdir=`basename $CPP_DIR`
    local BLENDS=`find $RECURSOS_DIR -name '*.blend' -print`
    local PROGS=""
    local MODELOS_3D=""
    >$BUILD_DIR/Makefile.dep
    for f in $SRCS
    do
     	ns=${f#$CPP_DIR}
       	PROGS="$PROGS ${BUILD_DIR}/$basecppdir/${ns%.cpp}.o"
        $CXX $f $CFLAGS -MM -MT ${BUILD_DIR}/${basecppdir}/${ns%.cpp}.o >>${BUILD_DIR}/Makefile.dep
    done
    for f in $BLENDS
    do
	ns=${f#$RECURSOS_DIR}
       	MODELOS_3D="$MODELOS_3D ${BUILD_DIR_RES}${ns%.blend}.mesh"
    done
    make all CFLAGS="$CFLAGS" CLINK="$CLINK" CXX="$CXX"  PROYECTO="$proyecto" BUILD_DIR="$BUILD_DIR" BUILD_DIR_SRC="$BUILD_DIR/$basecppdir" SRC_DIR="$CPP_DIR" PROGS="$PROGS"  RES_DIR="$RECURSOS_DIR"
}





