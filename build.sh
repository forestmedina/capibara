#!/bin/bash
function copiar_estructura {
        echo "hola"
	mkdir -p `basename $1`
	basedir=`basename $1`
	echo "copiando $basedir";
        dirs=`find $1 -type d -print`
	for i in $dirs
	do
	echo creando $2/${i#$1}
	mkdir -p $2/${i#$1}
	done
}

function generar_make {
    SRCS=`find $CPP_DIR -name '*.cpp' -print`
    BLENDS=`find $RECURSOS_DIR -name '*.blend' -print`
    PROGS=""
    MODELOS_3D=""
    for f in $SRCS
    do
	ns=${f#$CPP_DIR}
       	PROGS="$PROGS ${BUILD_DIR}${ns%.cpp}.o"
    done
    for f in $BLENDS
    do
	ns=${f#$RECURSOS_DIR}
       	MODELOS_3D="$MODELOS_3D ${BUILD_DIR_RES}${ns%.blend}.mesh"
    done

    echo PROGS $PROGS
    echo modelos $MODELOS_3D;
    cd ${PROYECTO_DIR}
    make all BUILD_DIR=$BUILD_DIR SRC_DIR=$CPP_DIR PROGS="$PROGS" MODELOS_3D="$MODELOS_3D" BUILD_DIR_RES=$BUILD_DIR_RES RES_DIR=$RECURSOS_DIR
}


copiar_estructura $CPP_DIR $BUILD_DIR
copiar_estructura $RECURSOS_DIR $BUILD_DIR_RES
generar_make

