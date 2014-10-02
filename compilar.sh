#!/bin/bash
. ~/desarrollo/capibara/configuracion.sh
echo $#
if [ "$#" -gt 3 -o "$#" -le 0 ];then
    echo "USO: $0 proyecto --ejecutar plataforma"
    exit 0
else
   proyecto=$1
   ejecutar=1;
   if [ "$#" -eq 2 ]; then
        plataforma=$2
        test $2 == "--ejecutar"
        ejecutar=$?;
        if [ $ejecutar -ne 0 ]; then
            plataforma=$2
        else
            if [ "$#" -eq 3 ]; then
                plataforma=$3
            else
                plataforma="nativa"
            fi
        fi
        echo Ejecutar: $ejecutar
   fi
fi
. ${CAPIBARA_PROYECTOS}/${proyecto}
. ${CAPIBARA_DIR}/funciones.sh


mkdir $BUILD_DIR
copiar_estructura $CPP_DIR $BUILD_DIR
copiar_estructura $RECURSOS_DIR $BUILD_DIR
cp ${CAPIBARA_DIR}/Makefile $BUILD_DIR/Makefile
cd $BUILD_DIR
generar_make
if [ $? -eq 0 -a $ejecutar -eq 0 ]; then
    ${BUILD_DIR}/${proyecto}
fi
