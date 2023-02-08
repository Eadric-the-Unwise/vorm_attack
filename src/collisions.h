#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h>

#define MOTHERSHIP_BOTTOM_RIGHT npc_tile_mothership[5]
#define MOTHERSHIP_BOTTOM_LEFT npc_tile_mothership[6]
#define MOTHERSHIPS_BOTTOMS npc_tile_mothership[7]

#define MOTHERSHIPS_BOTTOMS_GREEN npc_tile_mothership_green[7]
#define MOTHERSHIPS_TOP_RIGHT_TOP_LEFT_GREEN npc_tile_mothership_green[10]
#define MOTHERSHIPS_TOP_RIGHT_GREEN_TOP_LEFT npc_tile_mothership_green[11]
#define MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN npc_tile_mothership_green[12]
#define MOTHERSHIPS_BOTTOM_RIGHT_GREEN_BOTTOM_LEFT npc_tile_mothership_green[13]

#define MOTHERSHIP_BOTTOM_RIGHT_GREEN npc_tile_mothership_green[5]
#define MOTHERSHIP_BOTTOM_LEFT_GREEN npc_tile_mothership_green[6]

#define MOTHERSHIP_TOP_LEFT_GREEN npc_tile_mothership_green[0]
#define MOTHERSHIP_TOP_RIGHT_GREEN npc_tile_mothership_green[1]
#define MOTHERSHIP_TOPS_GREEN npc_tile_mothership_green[2]

UINT8 collide_bullet(UINT8 bullet_spawn_x, UINT8 bullet_spawn_y);