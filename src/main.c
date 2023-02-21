#include <gb/gb.h>
#include <gbdk/metasprites.h>
#include <stdio.h>

#include "scene.h"

// GOALS//
// ANIMATE ENEMIES 1-2 //
// SPRITE EXPLOSION NPCS//
// NPC BULLET//
// SPRITE EXPLOSION SHIP//
// ? SPAWN 1UP LIVES REMOVAL //
// STAGE 1, STAGE 2 //// ////
UINT8 joy, last_joy;

GameCharacter PLAYER;   // SHIP
GameCharacter BULLET1;  // FIRST BULLET
GameCharacter BULLET2;  // SECOND BULLET

void update_bullet1(UINT8 playerx, UINT8 playery) {  // MOVE BULLET 1
    BULLET1.x = playerx + 4;
    BULLET1.y = playery;
}
void update_bullet2(UINT8 playerx, UINT8 playery) {  // MOVE BULLET 2
    BULLET2.x = playerx + 4;
    BULLET2.y = playery;
}
//
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
    set_bkg_data(0, 37, bkg_tiles);
    set_bkg_tiles(0, 0, 20, 18, bkg_map);

    PLAYER.x = 72;  // making a small change to MAIN (void)
    PLAYER.y = 120;
    BULLET1.spawn = BULLET2.spawn = FALSE;
    move_metasprite(
        galaga_metasprites[0], 0, 0, PLAYER.x, PLAYER.y);  // offsets the crazy y-centered, x on the right pixel -> top left //
    last_joy = joy = 0;

    while (1) {
        last_joy = joy;
        joy = joypad();
        // DEBUG
        if (joy & J_SELECT) {
            set_bkg_tiles(0, 0, 20, 18, bkg_map);
        }
        // DEBUG

        if ((joy & J_LEFT) && PLAYER.x > 0) {  // MOVE PLAYER LEFT
            PLAYER.x -= 1;
        } else if ((joy & J_RIGHT) && PLAYER.x < 144) {  // MOVE PLAYER RIGHT
            PLAYER.x += 1;
        }
        if ((CHANGED_BUTTONS & J_A) && (joy & J_A) && !(BULLET1.spawn)) {  // IF NO BULLET ON SCREEN, SPAWN BULLET1
            BULLET1.spawn = TRUE;
            update_bullet1(PLAYER.x, PLAYER.y);
        } else if ((CHANGED_BUTTONS & J_A) && (joy & J_A) && (BULLET1.spawn) && !(BULLET2.spawn)) {  // IF BULLET1 IS ON SCREEN, SPAWN BULLET2
            BULLET2.spawn = TRUE;
            update_bullet2(PLAYER.x, PLAYER.y);
        }

        if (BULLET1.spawn) {  // IF BULLET1 IS ON SCREEN
            BULLET1.y -= 3;
            if (collide_bullet(BULLET1.x, BULLET1.y) == 0x01U) {  // CHECK FOR BACKGROUND COLLISION
                BULLET1.spawn = FALSE;
                hide_metasprite(bullet_metasprites[0], 2);  // HIDE BULLET1
            } else
                move_metasprite(
                    bullet_metasprites[0], 4, 2, BULLET1.x, BULLET1.y);
        }
        if (BULLET2.spawn) {  // IF BULLET2 IS ON SCREEN
            BULLET2.y -= 3;
            if (collide_bullet(BULLET2.x, BULLET2.y) == 0x01U) {  // CHECK FOR BACKGROUND COLLISION
                BULLET2.spawn = FALSE;
                hide_metasprite(bullet_metasprites[0], 3);  // HIDE BULLET2
            } else
                move_metasprite(
                    bullet_metasprites[0], 4, 3, BULLET2.x, BULLET2.y);
        }
        if (BULLET1.y < -16) {  // IF BULLET1 REACHES TOP OF SCREEN
            BULLET1.spawn = FALSE;
            hide_metasprite(bullet_metasprites[0], 2);  // HIDE BULLET1
        }
        if (BULLET2.y < -16) {  // IF BULLET2 REACHES TOP OF SCREEN
            BULLET2.spawn = FALSE;
            hide_metasprite(bullet_metasprites[0], 3);  // HIDE BULLET2
        }

        move_metasprite(
            galaga_metasprites[0], 0, 0, PLAYER.x, PLAYER.y);  // DRAW SHIP POSITION

        wait_vbl_done();
        refresh_OAM();
    }
}
