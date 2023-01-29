#include <gb/gb.h>
#include <gbdk/metasprites.h>
#include <stdio.h>

#include "scene.h"

UINT8 joy, last_joy;
// UINT8 playerx;

GameCharacter PLAYER;
GameCharacter BULLET1;
GameCharacter BULLET2;

void update_bullet1(UINT8 playerx, UINT8 playery) {
    BULLET1.x = playerx;
    BULLET1.y = playery;
}
void update_bullet2(UINT8 playerx, UINT8 playery) {
    BULLET2.x = playerx;
    BULLET2.y = playery;
}

UINT8 collide_bullet(UINT8 bulletx, UINT8 bullety) {
    UINT16 index_X, index_Y, tileindex;
    UINT8 tile_x, tile_y;
    index_X = (bulletx) / 8;
    index_Y = (bullety) / 8;
    tileindex = 20 * index_Y + index_X;

    tile_x = index_X * 8;
    tile_y = index_Y * 8;

    if ((bkg_map[tileindex] == 0x03) && (bulletx > tile_x + 5)) {
        set_bkg_tiles(index_X, index_Y, 1, 1, 0x00);
        return 0x01U;
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
    set_bkg_data(0, 6, bkg_tiles);
    set_bkg_tiles(0, 0, 20, 18, bkg_map);

    PLAYER.x = 0;
    PLAYER.y = 120;
    BULLET1.spawn = BULLET2.spawn = FALSE;
    move_metasprite(
        galaga_metasprites[0], 0, 0, PLAYER.x, PLAYER.y);  // offsets the crazy y-centered, x on the right pixel -> top left
    last_joy = joy = 0;

    while (1) {
        last_joy = joy;
        joy = joypad();

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

        if (BULLET1.y < 16) {
            BULLET1.spawn = FALSE;
            hide_metasprite(bullet_metasprites[0], 2);
        }
        if (BULLET2.y < 16) {
            BULLET2.spawn = FALSE;
            hide_metasprite(bullet_metasprites[0], 3);
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
            move_metasprite(
                bullet_metasprites[0], 4, 3, BULLET2.x, BULLET2.y);
        }

        move_metasprite(
            galaga_metasprites[0], 0, 0, PLAYER.x, PLAYER.y);  // offsets the crazy y-centered, x on the right pixel -> top left

        wait_vbl_done();
        refresh_OAM();
    }
}
