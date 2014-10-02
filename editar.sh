#!/bin/bash
. ~/desarrollo/capibara/configuracion.sh
if [ "$#" -gt 1 -o "$#" -le 0 ];then
    echo "USO: $0 proyecto "
    exit 0
else    
   proyecto=$1
   if [ "$#" -eq 2 ]; then
        plataforma=$2
   fi
fi
. ${CAPIBARA_PROYECTOS}/${proyecto}
. ${CAPIBARA_DIR}/funciones.sh
get_archivos_cpp cpp_archivos
export PROYECTO=$proyecto
echo ${CFLAGS} >${PROYECTO_DIR}/.clang_complete
nohup gvim -c "cd ${PROYECTO_DIR}" -u "${CAPIBARA_DIR}/vimrc" $cpp_archivos &
echo nohup gvim -c "cd ${PROYECTO_DIR}" -u "${CAPIBARA_DIR}/vimrc" $cpp_archivos &
