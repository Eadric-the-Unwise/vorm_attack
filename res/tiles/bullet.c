

// AUTOGENERATED FILE FROM png2asset

#include <gbdk/metasprites.h>
#include <gbdk/platform.h>
#include <stdint.h>

BANKREF(bullet)

const uint16_t bullet_palettes[5] = {
    RGB(31, 31, 31), RGB(28, 31, 26), RGB(17, 24, 14), RGB(1, 3, 4)};

const uint8_t bullet_tiles[32] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x08, 0x00, 0x08, 0x08, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

const metasprite_t bullet_metasprite0[] = {
    METASPR_ITEM(16, 8, 0, 0), METASPR_TERM};

const metasprite_t* const bullet_metasprites[1] = {
    bullet_metasprite0};
