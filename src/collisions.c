#include "collisions.h"

#include <gb/gb.h>
#include <string.h>
// comment
UINT8 npc_tile_bee[5] = {0x03, 0x04, 0x05, 0x06, 0x07};
UINT8 npc_tile_wasp[5] = {0x08, 0x09, 0x0A, 0x0B, 0x0C};
UINT8 npc_tile_mothership[10] = {0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16};                                // DARK GREEN MOTHERSHIP
UINT8 npc_tile_mothership_green[14] = {0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20, 0x21, 0x22, 0x23, 0x24};  // LIGHT GREEN MOTHERSHIP
UINT8 npc_tile_change[14] = {0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x10, 0x22, 0x15, 0x24};            // FOR TILE CHANGE POINTERS WHEN 0X00 ARE NECESSARY

UINT8 collide_bullet(UINT8 bullet_spawn_x, UINT8 bullet_spawn_y) {  // CHECK WHICH BACKGROUND TILE THE BULLET COLLIDES WITH //
    // ANY REPEAT get_bkg_tile_xy CACHE TO A LOCAL VARIABLE ONCE AT TOP THEN USE THE VARIABLE IN FUNC //
    UINT8 *current_NPC = NULL;                 // POINTER TO BACKGROUND TILE
    UINT8 *current_tile_change = NULL;         // POINTER TO WHICH TILE TO UPDATE TO
    INT16 bulletx, bullety, index_X, index_Y;  // BACKGROUND TILE INDEX, IN BACKGROUND GRID
    UINT8 tile_x, tile_y;                      // THE X AND Y COORDS OF THE TILE BEING COLLIDED WITH

    bulletx = bullet_spawn_x + 4;
    bullety = bullet_spawn_y + 10;

    index_X = bulletx / 8;  // CALCULATE
    index_Y = bullety / 8;
    // WE ARE NOT USING COLLISION MAPS, SO NO NEED TO REFERENCE A STRUCT I.E. (tileindex = 20 * index_Y + index_X;). SIMPLY CALCULATE FOR VRAM BACKGROUND TILES

    tile_x = index_X * 8;  // CALCULATE X OF TILE
    tile_y = index_Y * 8;  // CALCULATE Y OF TILE

    UINT8 current_tile = get_bkg_tile_xy(index_X, index_Y);       // COLLIDING TILE
    UINT8 left_of_tile = get_bkg_tile_xy(index_X - 1, index_Y);   // LEFT OF COLLIDING TILE
    UINT8 right_of_tile = get_bkg_tile_xy(index_X + 1, index_Y);  // RIGHT OF COLLIDING TILE

    if ((current_tile >= 0x03) && (current_tile <= 0x0C)) {                        // IF COLLIDING TILE IS ANY OF THE ENEMY TILES
        if (current_tile >= npc_tile_bee[0] && current_tile <= npc_tile_bee[4]) {  // CHECK FOR BEE COLLISION
            current_NPC = &npc_tile_bee[0];
        } else if (current_tile >= npc_tile_wasp[0] && current_tile <= npc_tile_wasp[4]) {  // CHECK FOR WASP COLLISION
            current_NPC = &npc_tile_wasp[0];
        }
        if ((current_tile == current_NPC[0]) && (bulletx - tile_x >= 3)) {  //       current_NPC[0] NPC TILE LEFT SIDE     //
            if (right_of_tile == current_NPC[2]) {
                set_bkg_tile_xy(index_X + 1, index_Y, current_NPC[3]);
            } else if ((right_of_tile == current_NPC[3]) || (right_of_tile == current_NPC[4])) {
                set_bkg_tile_xy(index_X + 1, index_Y, 0x00);
            }
            set_bkg_tile_xy(index_X, index_Y, 0x00);
            return 0x01U;

        } else if ((current_tile == current_NPC[2]) && (bulletx - tile_x <= 1)) {  //       current_NPC[0] NPC TILE RIGHT SIDE    //
            set_bkg_tile_xy(index_X - 1, index_Y, 0x00);
            set_bkg_tile_xy(index_X, index_Y, current_NPC[3]);
            return 0x01U;

        } else if ((current_tile == current_NPC[4]) && (bulletx - tile_x <= 1)) {  //       current_NPC[0] NPC TILE RIGHT SIDE W/ NO ENEMY TO RIGHT    //
            set_bkg_tile_xy(index_X - 1, index_Y, 0x00);
            set_bkg_tile_xy(index_X, index_Y, 0x00);
            return 0x01U;

        }

        else if ((current_tile == current_NPC[2]) && (bulletx - tile_x >= 7)) {  //       current_NPC[1] NPC TILE LEFT SIDE    //
            set_bkg_tile_xy(index_X + 1, index_Y, 0x00);
            set_bkg_tile_xy(index_X, index_Y, current_NPC[4]);
            return 0x01U;

        } else if ((current_tile == current_NPC[3]) && (bulletx - tile_x >= 7)) {  //       current_NPC[1] NPC TILE LEFT SIDE    //
            set_bkg_tile_xy(index_X + 1, index_Y, 0x00);
            set_bkg_tile_xy(index_X, index_Y, 0x00);
            return 0x01U;

        }

        else if ((current_tile == current_NPC[1]) && (bulletx - tile_x <= 5)) {
            if (left_of_tile == current_NPC[2]) {
                set_bkg_tile_xy(index_X - 1, index_Y, current_NPC[4]);
            } else if (left_of_tile == current_NPC[3]) {
                set_bkg_tile_xy(index_X - 1, index_Y, 0x00);
            }
            set_bkg_tile_xy(index_X, index_Y, 0x00);
            return 0x01U;
        }
        // RIGHT MOTHERSHIP ________________________________ //

    } else if (current_tile >= 0x0D) {                           // IF THE COLLIDING TILE IS EITHER OF THE TWO TYPES OF MOTHERSHIPS
        if ((current_tile >= 0x0D) && (current_tile <= 0x16)) {  // POINT TO DARK GREEN MOTHERSHIP
            current_NPC = &npc_tile_mothership[0];
            current_tile_change = &npc_tile_mothership_green[0];
        } else if ((current_tile >= 0x17) && (current_tile <= 0x24)) {  // POINT TO LIGHT GREEN MOTHERSHIP
            current_NPC = &npc_tile_mothership_green[0];
            current_tile_change = &npc_tile_change[0];
        }

        if ((current_tile == MOTHERSHIPS_BOTTOMS) && (bulletx - tile_x >= 6)) {  // IF PLAYER HITS BOTTOM OF BOTH DARK GREEN MOTHERSHIPS
            set_bkg_tile_xy(index_X, index_Y, current_tile_change[13]);          // MOTHERSHIPS_BOTTOM_RIGHT_GREEN_BOTTOM_LEFT
            set_bkg_tile_xy(index_X + 1, index_Y, current_tile_change[5]);       // MOTHERSHIP_BOTTOM_RIGHT_GREEN
            set_bkg_tile_xy(index_X, index_Y - 1, current_tile_change[11]);      // MOTHERSHIPS_TOP_RIGHT_GREEN_TOP_LEFT
            set_bkg_tile_xy(index_X + 1, index_Y - 1, current_tile_change[1]);   // MOTHERSHIP_TOP_RIGHT_GREEN
            return 0x01U;
        } else if ((current_tile == MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN) && (bulletx - tile_x >= 6)) {  //// IF PLAYER HITS RIGHT SIDE OF BOTH DARK GREEN MOTHERSHIPS BOTTOMS, WHILE LEFT IS GREEN
            set_bkg_tile_xy(index_X, index_Y, MOTHERSHIPS_BOTTOMS_GREEN);                                      // MOTHERSHIPS_BOTTOMS_GREEN
            set_bkg_tile_xy(index_X + 1, index_Y, MOTHERSHIP_BOTTOM_RIGHT_GREEN);                              // MOTHERSHIP_BOTTOM_RIGHT_GREEN
            set_bkg_tile_xy(index_X, index_Y - 1, MOTHERSHIP_TOPS_GREEN);                                      // MOTHERSHIP_TOPS_GREEN
            set_bkg_tile_xy(index_X + 1, index_Y - 1, MOTHERSHIP_TOP_RIGHT_GREEN);                             // MOTHERSHIP_TOP_RIGHT_GREEN
            return 0x01U;
        } else if (current_tile == MOTHERSHIP_BOTTOM_RIGHT && (bulletx - tile_x <= 6)) {  // IF PLAYER HITS BOTTOM RIGHT OF DARK GREEN MOTHERSHIP
            if (left_of_tile == MOTHERSHIPS_BOTTOMS) {
                set_bkg_tile_xy(index_X - 1, index_Y, MOTHERSHIPS_BOTTOM_RIGHT_GREEN_BOTTOM_LEFT);  // MOTHERSHIPS_BOTTOM_RIGHT_GREEN_BOTTOM_LEFT
                set_bkg_tile_xy(index_X - 1, index_Y - 1, MOTHERSHIPS_TOP_RIGHT_GREEN_TOP_LEFT);    // MOTHERSHIPS_TOP_RIGHT_GREEN_TOP_LEFT
            } else if (left_of_tile == MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN) {
                set_bkg_tile_xy(index_X - 1, index_Y, MOTHERSHIPS_BOTTOMS_GREEN);  // MOTHERSHIPS_BOTTOMS_GREEN
                set_bkg_tile_xy(index_X - 1, index_Y - 1, MOTHERSHIP_TOPS_GREEN);  // MOTHERSHIP_TOPS_GREEN
            }
            set_bkg_tile_xy(index_X, index_Y, MOTHERSHIP_BOTTOM_RIGHT_GREEN);   // MOTHERSHIP_BOTTOM_RIGHT_GREEN
            set_bkg_tile_xy(index_X, index_Y - 1, MOTHERSHIP_TOP_RIGHT_GREEN);  // MOTHERSHIP_TOP_RIGHT_GREEN
            return 0x01U;
        }
        // else if ((current_tile == MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN) && (bulletx - tile_x <= 3)) {  //
        //     set_bkg_tile_xy(index_X, index_Y - 1, 0X00);                                                       //
        //     set_bkg_tile_xy(index_X, index_Y, npc_tile_mothership[8]);                                         //
        //     set_bkg_tile_xy(index_X - 1, index_Y, 0X00);                                                       //
        //     set_bkg_tile_xy(index_X - 1, index_Y - 1, 0X00);                                                   //
        //     return 0x01U;
        // }
        // LEFT MOTHERSHIP ________________________________ //
        if ((current_tile == MOTHERSHIP_BOTTOM_LEFT) && (bulletx - tile_x >= 2)) {
            if (right_of_tile == MOTHERSHIPS_BOTTOMS) {
                set_bkg_tile_xy(index_X + 1, index_Y, MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN);  // MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN
                set_bkg_tile_xy(index_X + 1, index_Y - 1, MOTHERSHIPS_TOP_RIGHT_TOP_LEFT_GREEN);    // MOTHERSHIPS_TOP_RIGHT_TOP_LEFT_GREEN
            } else if (right_of_tile == MOTHERSHIPS_BOTTOM_RIGHT_GREEN_BOTTOM_LEFT) {
                set_bkg_tile_xy(index_X + 1, index_Y, MOTHERSHIPS_BOTTOMS_GREEN);  // MOTHERSHIPS_BOTTOMS_GREEN
                set_bkg_tile_xy(index_X + 1, index_Y - 1, MOTHERSHIP_TOPS_GREEN);  // MOTHERSHIP_TOPS_GREEN
            }
            set_bkg_tile_xy(index_X, index_Y, MOTHERSHIP_BOTTOM_LEFT_GREEN);   // MOTHERSHIP_BOTTOM_LEFT_GREEN
            set_bkg_tile_xy(index_X, index_Y - 1, MOTHERSHIP_TOP_LEFT_GREEN);  // MOTHERSHIP_TOP_LEFT_GREEN

            return 0x01U;
        } else if ((current_tile == MOTHERSHIPS_BOTTOMS) && (bulletx - tile_x <= 3) || (current_tile == MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN) && (bulletx - tile_x <= 3)) {  // IF PLAYER HITS LEFT SIDE OF BOTH DARK GREEN MOTHERSHIPS BOTTOMS
            set_bkg_tile_xy(index_X, index_Y - 1, current_tile_change[10]);                                                                                                        // MOTHERSHIPS_TOP_RIGHT_TOP_LEFT_GREEN
            set_bkg_tile_xy(index_X, index_Y, current_tile_change[12]);                                                                                                            // MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN
            set_bkg_tile_xy(index_X - 1, index_Y, current_tile_change[6]);                                                                                                         // MOTHERSHIP_BOTTOM_LEFT_GREEN
            set_bkg_tile_xy(index_X - 1, index_Y - 1, current_tile_change[0]);                                                                                                     // MOTHERSHIP_TOP_LEFT_GREEN
            return 0x01U;
        }
        // LEFT MOTHERSHIP LIGHT GREEN
        else if ((current_tile == MOTHERSHIPS_BOTTOMS_GREEN) && (bulletx - tile_x <= 3)) {
            set_bkg_tile_xy(index_X, index_Y - 1, current_tile_change[3]);      //
            set_bkg_tile_xy(index_X, index_Y, current_tile_change[8]);          //
            set_bkg_tile_xy(index_X - 1, index_Y, current_tile_change[6]);      //
            set_bkg_tile_xy(index_X - 1, index_Y - 1, current_tile_change[0]);  //
            return 0x01U;
        } else if ((current_tile == MOTHERSHIP_BOTTOM_LEFT_GREEN) && (bulletx - tile_x >= 2)) {
            if (right_of_tile == MOTHERSHIPS_BOTTOMS_GREEN) {
                set_bkg_tile_xy(index_X + 1, index_Y, current_tile_change[8]);      //
                set_bkg_tile_xy(index_X + 1, index_Y - 1, current_tile_change[3]);  //
            } else {
                set_bkg_tile_xy(index_X + 1, index_Y, current_tile_change[12]);      //
                set_bkg_tile_xy(index_X + 1, index_Y - 1, current_tile_change[10]);  //
            }
            set_bkg_tile_xy(index_X, index_Y - 1, current_tile_change[0]);  //
            set_bkg_tile_xy(index_X, index_Y, current_tile_change[6]);      //

            return 0x01U;
        }
    }
    return 0x00U;  // NOTE: the first return of the function will end the execution of the function
}