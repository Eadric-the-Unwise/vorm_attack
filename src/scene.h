// #ifndef __SCENE_H__
// // prevents the includes from being called twice
// #define __SCENE_H__

#include <gb/gb.h>
#include <gbdk/metasprites.h>
#include <stdint.h>
#include <stdio.h>

#include "../res/tiles/bullet.h"
#include "../res/tiles/galaga.h"
#include "../res/tiles/tileset.h"
#include "hUGEDriver.h"

#define CHANGED_BUTTONS (last_joy ^ joy)

typedef struct GameCharacter {
    UBYTE spawn;
    UINT8 x;
    UINT8 y;
    UINT8 width;
    UINT8 height;

} GameCharacter;

// extern GameCharacter ship;
