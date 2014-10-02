

BLENDER=blender
SCRIPT_EXPORTAR=~/exportar.py

all: $(BUILD_DIR)/${PROYECTO}
$(BUILD_DIR)/${PROYECTO}:$(PROGS)
	echo $(PROGS)
	echo buildir $(BUILD_DIR)
	echo srcdir $(SRC_DIR)
	$(CXX)   -o $@ $^ $(CLINK) 

include Makefile.dep
$(BUILD_DIR_SRC)%.o: 
	$(CXX) $(CFLAGS) -O2 -c -o $@ $<

$(BUILD_DIR_RES)%.mesh: $(RES_DIR)%.blend
	${BLENDER} -b $^ --python ~/exportar.py -- $@

#recursos: $(MODELOS_3D)
