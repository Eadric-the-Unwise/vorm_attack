#include <gb/gb.h>
#include <gbdk/metasprites.h>
#include <stdio.h>

#include "scene.h"

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

    while (1) {
        move_metasprite(
            tileset_metasprites[0], 0, 0, 100, 100);
        wait_vbl_done();
        refresh_OAM();
    }
}
