#include <gb/gb.h>
#include <gbdk/metasprites.h>
#include <stdio.h>

#include "scene.h"

UINT8 joy, last_joy;
UINT8 playerx;
UINT8 bulletx, bullety;

void update_bulletx(UINT8 playerx) {
    bulletx = playerx;
}

void main() {
    DISABLE_VBL_TRANSFER;
    // BGP_REG = 0xE4;
    // OBP0_REG = 0xE4;
    // OBP1_REG = 0xE1;
    SPRITES_8x16;  // MUST be 8x16 or 8x8. Can change in different scenes only
    SHOW_BKG;
    SHOW_SPRITES;
    DISPLAY_ON;

    set_sprite_data(0, 4, tileset_tiles);
    set_sprite_data(4, 2, bullet_tiles);
    playerx = bulletx = 88;
    move_metasprite(
        tileset_metasprites[0], 0, 0, playerx, 140);
    move_metasprite(
        bullet_metasprites[0], 4, 3, 80, 120);
    last_joy = joy = 0;

    while (1) {
        last_joy = joy;
        joy = joypad();
        bullety -= 2;
        if ((joy & J_LEFT) && playerx > 16) {
            playerx -= 1;
        } else if ((joy & J_RIGHT) && playerx < 160) {
            playerx += 1;
        }
        if ((CHANGED_BUTTONS & J_A) && (joy & J_A)) {
            update_bulletx(playerx);
        }
        move_metasprite(
            tileset_metasprites[0], 0, 0, playerx, 140);
        move_metasprite(
            bullet_metasprites[0], 4, 3, bulletx, bullety);
        wait_vbl_done();
        refresh_OAM();
    }
}
