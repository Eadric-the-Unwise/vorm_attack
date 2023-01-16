#include <gb/gb.h>
#include <gbdk/metasprites.h>
#include <stdio.h>

#include "scene.h"

UINT8 joy, last_joy;
// UINT8 playerx;

GameCharacter PLAYER;
GameCharacter BULLET;

void update_bullet(UINT8 PLAYERX) {
    BULLET.x = PLAYERX;
    BULLET.y = 140;
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
    PLAYER.x = 88;
    BULLET.spawn = FALSE;
    move_metasprite(
        tileset_metasprites[0], 0, 0, PLAYER.x, 140);
    last_joy = joy = 0;

    while (1) {
        last_joy = joy;
        joy = joypad();

        if ((joy & J_LEFT) && PLAYER.x > 16) {
            PLAYER.x -= 1;
        } else if ((joy & J_RIGHT) && PLAYER.x < 160) {
            PLAYER.x += 1;
        }
        if ((CHANGED_BUTTONS & J_A) && (joy & J_A) && !(BULLET.spawn)) {
            BULLET.spawn = TRUE;
            update_bullet(PLAYER.x);
        }
        if (BULLET.spawn) {
            BULLET.y -= 2;
            move_metasprite(
                bullet_metasprites[0], 4, 3, BULLET.x, BULLET.y);
        }
        if (BULLET.y == 24)
            BULLET.spawn = FALSE;
        move_metasprite(
            tileset_metasprites[0], 0, 0, PLAYER.x, 140);

        wait_vbl_done();
        refresh_OAM();
    }
}
