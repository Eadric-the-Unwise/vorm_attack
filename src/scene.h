// #ifndef __SCENE_H__
// // prevents the includes from being called twice
// #define __SCENE_H__

#include <gb/gb.h>
#include <gbdk/metasprites.h>
#include <stdint.h>
#include <stdio.h>

#include "../res/tiles/tileset.h"
#include "hUGEDriver.h"

typedef struct GameCharacter {
    UBYTE spritids[4];  // all characters use 4 sprites
    UINT8 x;
    UINT8 y;
    UINT8 width;
    UINT8 height;
} GameCharacter;

// extern GameCharacter ship;

void movegamecharacter(GameCharacter *character, UINT8 x, UINT8 y);