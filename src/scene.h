// #ifndef __SCENE_H__
// // prevents the includes from being called twice
// #define __SCENE_H__

#include <gb/gb.h>
#include <gbdk/metasprites.h>
#include <stdint.h>
#include <stdio.h>

#include "../res/tiles/bkg_map.h"
#include "../res/tiles/bkg_tiles.h"
#include "../res/tiles/bullet.h"
#include "../res/tiles/galaga.h"
#include "hUGEDriver.h"

#define CHANGED_BUTTONS (last_joy ^ joy)

#define MOTHERSHIP_BOTTOM_LEFT npc_tile_mothership[6]
#define MOTHERSHIPS_BOTTOMS npc_tile_mothership[7]
#define MOTHERSHIPS_TOP_RIGHT_TOP_LEFT_GREEN npc_tile_mothership_green[10]
#define MOTHERSHIPS_TOP_RIGHT_GREEN_TOP_LEFT npc_tile_mothership_green[11]
#define MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN npc_tile_mothership_green[12]
#define MOTHERSHIPS_BOTTOM_RIGHT_GREEN_BOTTOM_LEFT npc_tile_mothership_green[13]

#define MOTHERSHIP_BOTTOM_RIGHT_GREEN npc_tile_mothership_green[5]
#define MOTHERSHIP_BOTTOM_LEFT_GREEN npc_tile_mothership_green[6]

#define MOTHERSHIP_TOP_LEFT_GREEN npc_tile_mothership_green[0]
#define MOTHERSHIP_TOP_RIGHT_GREEN npc_tile_mothership_green[1]

typedef struct GameCharacter {
    UBYTE spawn;
    INT16 x;
    INT16 y;
    UINT8 width;
    UINT8 height;

} GameCharacter;

// extern GameCharacter ship;
