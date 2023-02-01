#include <gb/gb.h>
#include <gbdk/metasprites.h>
#include <stdio.h>

#include "scene.h"

UINT8 joy, last_joy;
// UINT8 playerx;

GameCharacter PLAYER;
GameCharacter BULLET1;
GameCharacter BULLET2;

UINT8 npc_tile_bee[5] = {0x03, 0x04, 0x05, 0x06, 0x07};
UINT8 npc_tile_wasp[5] = {0x08, 0x09, 0x0A, 0x0B, 0x0C};
UINT8 npc_tile_mothership[10] = {0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16};

void update_bullet1(UINT8 playerx, UINT8 playery) {
    BULLET1.x = playerx + 4;
    BULLET1.y = playery;
}
void update_bullet2(UINT8 playerx, UINT8 playery) {
    BULLET2.x = playerx + 4;
    BULLET2.y = playery;
}
// GOAL FOR NEXT STREAM, MOTHERSHIPS TURN GREEN //
UINT8 collide_bullet(UINT8 bullet_spawn_x, UINT8 bullet_spawn_y) {
    UINT8 *current_NPC = NULL;
    INT16 bulletx, bullety, index_X, index_Y;  // tileindex
    UINT8 tile_x, tile_y;

    bulletx = bullet_spawn_x + 4;
    bullety = bullet_spawn_y + 10;

    index_X = bulletx / 8;
    index_Y = bullety / 8;
    // tileindex = 20 * index_Y + index_X;

    tile_x = index_X * 8;
    tile_y = index_Y * 8;

    if ((get_bkg_tile_xy(index_X, index_Y) >= 0x03) && (get_bkg_tile_xy(index_X, index_Y) <= 0x0C)) {
        if (get_bkg_tile_xy(index_X, index_Y) >= npc_tile_bee[0] && get_bkg_tile_xy(index_X, index_Y) <= npc_tile_bee[4]) {  // CHECK FOR BEE COLLISION
            current_NPC = &npc_tile_bee[0];
        } else if (get_bkg_tile_xy(index_X, index_Y) >= npc_tile_wasp[0] && get_bkg_tile_xy(index_X, index_Y) <= npc_tile_wasp[4]) {  // CHECK FOR WASP COLLISION
            current_NPC = &npc_tile_wasp[0];
        }
        if ((get_bkg_tile_xy(index_X, index_Y) == current_NPC[0]) && (bulletx - tile_x >= 3)) {  //       current_NPC[0] NPC TILE LEFT SIDE     //
            if (get_bkg_tile_xy(index_X + 1, index_Y) == current_NPC[2]) {
                set_bkg_tile_xy(index_X + 1, index_Y, current_NPC[3]);
            } else if ((get_bkg_tile_xy(index_X + 1, index_Y) == current_NPC[3]) || (get_bkg_tile_xy(index_X + 1, index_Y) == current_NPC[4])) {
                set_bkg_tile_xy(index_X + 1, index_Y, 0x00);
            }
            set_bkg_tile_xy(index_X, index_Y, 0x00);
            return 0x01U;

        } else if ((get_bkg_tile_xy(index_X, index_Y) == current_NPC[2]) && (bulletx - tile_x <= 1)) {  //       current_NPC[0] NPC TILE RIGHT SIDE    //
            set_bkg_tile_xy(index_X - 1, index_Y, 0x00);
            set_bkg_tile_xy(index_X, index_Y, current_NPC[3]);
            return 0x01U;

        } else if ((get_bkg_tile_xy(index_X, index_Y) == current_NPC[4]) && (bulletx - tile_x <= 1)) {  //       current_NPC[0] NPC TILE RIGHT SIDE W/ NO ENEMY TO RIGHT    //
            set_bkg_tile_xy(index_X - 1, index_Y, 0x00);
            set_bkg_tile_xy(index_X, index_Y, 0x00);
            return 0x01U;

        }

        else if ((get_bkg_tile_xy(index_X, index_Y) == current_NPC[2]) && (bulletx - tile_x >= 7)) {  //       current_NPC[1] NPC TILE LEFT SIDE    //
            set_bkg_tile_xy(index_X + 1, index_Y, 0x00);
            set_bkg_tile_xy(index_X, index_Y, current_NPC[4]);
            return 0x01U;

        } else if ((get_bkg_tile_xy(index_X, index_Y) == current_NPC[3]) && (bulletx - tile_x >= 7)) {  //       current_NPC[1] NPC TILE LEFT SIDE    //
            set_bkg_tile_xy(index_X + 1, index_Y, 0x00);
            set_bkg_tile_xy(index_X, index_Y, 0x00);
            return 0x01U;

        }

        else if ((get_bkg_tile_xy(index_X, index_Y) == current_NPC[1]) && (bulletx - tile_x <= 5)) {
            if (get_bkg_tile_xy(index_X - 1, index_Y) == current_NPC[2]) {
                set_bkg_tile_xy(index_X - 1, index_Y, current_NPC[4]);
            } else if (get_bkg_tile_xy(index_X - 1, index_Y) == current_NPC[3]) {
                set_bkg_tile_xy(index_X - 1, index_Y, 0x00);
            }
            set_bkg_tile_xy(index_X, index_Y, 0x00);
            return 0x01U;
        }
    } else if (get_bkg_tile_xy(index_X, index_Y) >= 0x0D) {  // if ((get_bkg_tile_xy(index_X, index_Y) == current_NPC[0]) && (bulletx - tile_x >= 3)) {}
        current_NPC = &npc_tile_mothership[0];
        if (get_bkg_tile_xy(index_X, index_Y) == current_NPC[6]) {
            if (get_bkg_tile_xy(index_X + 1, index_Y) == current_NPC[7]) {
                set_bkg_tile_xy(index_X + 1, index_Y, current_NPC[8]);
                set_bkg_tile_xy(index_X + 1, index_Y - 1, current_NPC[3]);
            } else {
                set_bkg_tile_xy(index_X + 1, index_Y, 0x00);
                set_bkg_tile_xy(index_X + 1, index_Y - 1, 0x00);
            }
            set_bkg_tile_xy(index_X, index_Y, 0x00);
            set_bkg_tile_xy(index_X, index_Y - 1, 0x00);
            return 0x01U;
        } else if ((get_bkg_tile_xy(index_X, index_Y) == current_NPC[7]) && (bulletx - tile_x <= 3)) {
            set_bkg_tile_xy(index_X, index_Y, current_NPC[8]);
            set_bkg_tile_xy(index_X - 1, index_Y, 0x00);
            set_bkg_tile_xy(index_X, index_Y - 1, current_NPC[3]);
            set_bkg_tile_xy(index_X - 1, index_Y - 1, 0x00);
            return 0x01U;
        } else if (get_bkg_tile_xy(index_X, index_Y) == current_NPC[9]) {
            set_bkg_tile_xy(index_X, index_Y, 0X00);
            set_bkg_tile_xy(index_X - 1, index_Y, 0x00);
            set_bkg_tile_xy(index_X, index_Y - 1, 0x00);
            set_bkg_tile_xy(index_X - 1, index_Y - 1, 0x00);
            return 0x01U;
        }
        // LEFT MOTHERSHIP ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ //

        else if (get_bkg_tile_xy(index_X, index_Y) == current_NPC[5]) {
            if (get_bkg_tile_xy(index_X - 1, index_Y) == current_NPC[7]) {
                set_bkg_tile_xy(index_X - 1, index_Y, current_NPC[9]);
                set_bkg_tile_xy(index_X - 1, index_Y - 1, current_NPC[4]);
            } else {
                set_bkg_tile_xy(index_X - 1, index_Y, 0x00);
                set_bkg_tile_xy(index_X - 1, index_Y - 1, 0x00);
            }
            set_bkg_tile_xy(index_X, index_Y, 0x00);
            set_bkg_tile_xy(index_X, index_Y - 1, 0x00);
            return 0x01U;
        } else if ((get_bkg_tile_xy(index_X, index_Y) == current_NPC[7]) && (bulletx - tile_x >= 6)) {
            if (get_bkg_tile_xy(index_X, index_Y - 1) == current_NPC[2]) {
                set_bkg_tile_xy(index_X, index_Y - 1, current_NPC[4]);
            }
            set_bkg_tile_xy(index_X, index_Y, current_NPC[9]);
            set_bkg_tile_xy(index_X + 1, index_Y, 0x00);
            set_bkg_tile_xy(index_X + 1, index_Y - 1, 0x00);
            return 0x01U;

        }

        else if (get_bkg_tile_xy(index_X, index_Y) == current_NPC[8]) {
            set_bkg_tile_xy(index_X, index_Y, 0X00);
            set_bkg_tile_xy(index_X + 1, index_Y, 0x00);
            set_bkg_tile_xy(index_X, index_Y - 1, 0x00);
            set_bkg_tile_xy(index_X + 1, index_Y - 1, 0x00);
            return 0x01U;
        }
    }
    return 0x00U;  // the first return of the function will end the execution of the function
}

void main() {
    DISABLE_VBL_TRANSFER;
    // BGP_REG = 0xE4;
    // OBP0_REG = 0xE4;
    OBP1_REG = 0b10011100;
    SPRITES_8x16;  // MUST be 8x16 or 8x8. Can change in different scenes only
    SHOW_BKG;
    SHOW_SPRITES;
    DISPLAY_ON;

    set_sprite_data(0, 4, galaga_tiles);
    set_sprite_data(4, 2, bullet_tiles);
    set_bkg_data(0, 23, bkg_tiles);
    set_bkg_tiles(0, 0, 20, 18, bkg_map);

    PLAYER.x = 72;
    PLAYER.y = 120;
    BULLET1.spawn = BULLET2.spawn = FALSE;
    move_metasprite(
        galaga_metasprites[0], 0, 0, PLAYER.x, PLAYER.y);  // offsets the crazy y-centered, x on the right pixel -> top left
    last_joy = joy = 0;

    while (1) {
        last_joy = joy;
        joy = joypad();
        // DEBUG
        if (joy & J_SELECT) {
            set_bkg_tiles(0, 0, 20, 18, bkg_map);
        }
        // DEBUG

        if ((joy & J_LEFT) && PLAYER.x > 0) {
            PLAYER.x -= 1;
        } else if ((joy & J_RIGHT) && PLAYER.x < 144) {
            PLAYER.x += 1;
        }
        if ((CHANGED_BUTTONS & J_A) && (joy & J_A) && !(BULLET1.spawn)) {
            BULLET1.spawn = TRUE;
            update_bullet1(PLAYER.x, PLAYER.y);
        } else if ((CHANGED_BUTTONS & J_A) && (joy & J_A) && (BULLET1.spawn) && !(BULLET2.spawn)) {
            BULLET2.spawn = TRUE;
            update_bullet2(PLAYER.x, PLAYER.y);
        }

        if (BULLET1.spawn) {
            BULLET1.y -= 3;
            if (collide_bullet(BULLET1.x, BULLET1.y) == 0x01U) {
                BULLET1.spawn = FALSE;
                hide_metasprite(bullet_metasprites[0], 2);
            } else
                move_metasprite(
                    bullet_metasprites[0], 4, 2, BULLET1.x, BULLET1.y);
        }
        if (BULLET2.spawn) {
            BULLET2.y -= 3;
            if (collide_bullet(BULLET2.x, BULLET2.y) == 0x01U) {
                BULLET2.spawn = FALSE;
                hide_metasprite(bullet_metasprites[0], 3);
            } else
                move_metasprite(
                    bullet_metasprites[0], 4, 3, BULLET2.x, BULLET2.y);
        }
        if (BULLET1.y < -16) {
            BULLET1.spawn = FALSE;
            hide_metasprite(bullet_metasprites[0], 2);
        }
        if (BULLET2.y < -16) {
            BULLET2.spawn = FALSE;
            hide_metasprite(bullet_metasprites[0], 3);
        }

        move_metasprite(
            galaga_metasprites[0], 0, 0, PLAYER.x, PLAYER.y);  // offsets the crazy y-centered, x on the right pixel -> top left

        wait_vbl_done();
        refresh_OAM();
    }
}
