GBDK	= ../../../gbdk
CC	= $(GBDK)/bin/lcc -autobank -Wf--debug -Wl-y -Wb-v -Wl-yt0x1B -Wl-yoA -Wl-ya4
BIN = vorm-attack.gb
OBJS = build/collisions.o build/galaga.o build/main.o build/scene.o build/bkg_map.o build/bkg_tiles.o build/bullet.o
# SRC = src/*.c
# RES = res/tiles/*.c
define compile-source
	$(CC) -c -o $@ $<
endef

all: $(BIN)

$(BIN): $(OBJS)
	$(CC) -o $(BIN) $(OBJS)
#	$(MAKE) clean

build/collisions.o: src/collisions.c src/collisions.h
	${compile-source}	

build/main.o: src/main.c src/scene.h
	${compile-source}	

build/scene.o: src/scene.c src/scene.h src/collisions.h src/scene.h res/tiles/bkg_map.h res/tiles/bkg_tiles.h res/tiles/bullet.h res/tiles/galaga.h
	${compile-source}

build/bkg_map.o: res/tiles/bkg_map.c res/tiles/bkg_map.h
	${compile-source}

build/bkg_tiles.o: res/tiles/bkg_tiles.c res/tiles/bkg_tiles.h
	${compile-source}

build/bullet.o: res/tiles/bullet.c res/tiles/bullet.h
	${compile-source}

build/galaga.o: res/tiles/galaga.c res/tiles/galaga.h
	${compile-source}	

.PHONY:clean
clean:
	del *.cdb *.map build\*.lst build\*.sym build\*.adb build\*.asm *.lst *.sym *.adb *.asm 
#*.o build\*.o


# compile.bat: Makefile
# 	@echo "REM Automatically generated from Makefile" > compile.bat
# 	@make -sn | sed y/\\//\\\\/ | grep -v make >> compile.bat