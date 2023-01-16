#include <gb/gb.h>
#include <gbdk/metasprites.h>
#include <stdio.h>

#include "scene.h"

UINT8 joy, last_joy;
// UINT8 playerx;

GameCharacter PLAYER;
GameCharacter BULLET1;
GameCharacter BULLET2;

void update_bullet1(UINT8 PLAYERX) {
    BULLET1.x = PLAYERX + 4;
    BULLET1.y = 144;
}
void update_bullet2(UINT8 PLAYERX) {
    BULLET2.x = PLAYERX + 4;
    BULLET2.y = 144;
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
    BULLET1.spawn = BULLET2.spawn = FALSE;
    move_metasprite(
        tileset_metasprites[0], 0, 0, PLAYER.x, 144);
    last_joy = joy = 0;

    while (1) {
        last_joy = joy;
        joy = joypad();

        if ((joy & J_LEFT) && PLAYER.x > 16) {
            PLAYER.x -= 1;
        } else if ((joy & J_RIGHT) && PLAYER.x < 160) {
            PLAYER.x += 1;
        }
        if ((CHANGED_BUTTONS & J_A) && (joy & J_A) && !(BULLET1.spawn)) {
            BULLET1.spawn = TRUE;
            update_bullet1(PLAYER.x);
        } else if ((CHANGED_BUTTONS & J_A) && (joy & J_A) && (BULLET1.spawn) && !(BULLET2.spawn)) {
            BULLET2.spawn = TRUE;
            update_bullet2(PLAYER.x);
        }

        if (BULLET1.y < 16) {
            BULLET1.spawn = FALSE;
        }
        if (BULLET2.y < 16) {
            BULLET2.spawn = FALSE;
        }
        if (BULLET1.spawn) {
            BULLET1.y -= 3;
            move_metasprite(
                bullet_metasprites[0], 4, 2, BULLET1.x, BULLET1.y);
        }
        if (BULLET2.spawn) {
            BULLET2.y -= 3;
            move_metasprite(
                bullet_metasprites[0], 4, 3, BULLET2.x, BULLET2.y);
        }

        move_metasprite(
            tileset_metasprites[0], 0, 0, PLAYER.x, 144);

        wait_vbl_done();
        refresh_OAM();
    }
}
