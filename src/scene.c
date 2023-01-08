
#include "scene.h"

#include <gb/gb.h>
#include <string.h>

GameCharacter ship;
UINT8 spritesize = 8;

void movegamecharacter(GameCharacter *character, UINT8 x, UINT8 y) {
    move_sprite(character->spritids[0], x, y);
    move_sprite(character->spritids[1], x + spritesize, y);
    move_sprite(character->spritids[2], x, y + spritesize);
    move_sprite(character->spritids[3], x + spritesize, y + spritesize);
}

// void render_world_actors()
//     NONBANKED {
//     UINT8 __save = _current_bank;

//     actor_t *current_actor = &active_actors[*render_ptr];

//     actor_t *current_detective = active_actors;
//     actor_t *current_bullet = active_bullets;
//     // current_actor

//     last_dir = dir;
//     dir = PLAYER.direction;

//     if (dir != last_dir) {
//         if (last_dir != DIR_IDLE_DOWN) {
//             if (dir == DIR_DOWN_L || dir == DIR_DOWN_R) {
//                 PLAYER.animation_phase = 5;
//                 // PLAYER.timer = 3;
//             } else {
//                 PLAYER.animation_phase = 0;
//                 // PLAYER.timer = 7;
//             }
//         } else {
//             PLAYER.animation_phase = 0;
//             // PLAYER.timer = 0;
//         }
//     }

//     if (animation_timer == 0)
//         animation_timer = 8;

//     animation_timer -= 1;

//     // draw each metasprite
//     direction_e current_direction;
//     UINT8 OAM_hiwater = 0;  // OAM Sprite hiwater

//     for (UINT8 i = render_actors_count; i != ACTOR_DETECTIVE; i--) {
//         // UINT16 camera_x = TO_PIXELS(bkg.camera_x);
//         INT16 actor_x = TO_PIXELS(current_actor->x);
//         INT16 NPC_xOffset = actor_x - (current_actor->x_pivot + 8);
//         current_direction = current_actor->direction;
//         const metasprite_t **current_animation = current_actor->animations[current_direction];

//         if (!ANIMATIONLOCK && RENDERSTATE != RENDER_DIALOGUE && current_actor->KILL == FALSE) {  // TURNS ON ALL CURRENT RENDER ACTORS AFTER CAMERA SCROLLS
//             current_actor->RENDER = TRUE;
//             current_actor->ON = TRUE;
//         } else if (current_actor->KILL == TRUE) {
//             current_actor->RENDER = FALSE;
//             current_actor->ON = FALSE;
//         }
//         //  else { //CONSIDER TURNING THIS BACK ON FOR CUTSCENES
//         //     current_actor->RENDER = FALSE;
//         //     current_actor->ON = FALSE;
//         // }

//         if (current_actor->RENDER == TRUE) {
//             SWITCH_ROM(current_actor->bank);
//             if ((current_direction == DIR_RIGHT) || (current_direction == DIR_UP_R) || (current_direction == DIR_IDLE_R) || (current_direction == DIR_CRAWL_R) || (current_direction == DIR_JUMP_R) || (current_direction == DIR_LAND_R) || (current_direction == DIR_DROP_R) || (current_direction == DIR_LADDER_R) || (current_direction == DIR_ONTOLADDER_R) || (current_direction == DIR_OFFLADDER_R)) {
//                 OAM_hiwater += move_metasprite_vflip(
//                     current_animation[current_actor->animation_phase],
//                     current_actor->tile_index,
//                     OAM_hiwater,
//                     TO_PIXELS(current_actor->x), TO_PIXELS(current_actor->y));

//                 if (current_direction == DIR_UP_R || current_direction == DIR_IDLE_UP) {
//                     current_actor->facing = FACEUP;
//                 } else if (current_direction == DIR_DOWN_R || current_direction == DIR_IDLE_DOWN) {
//                     current_actor->facing = FACEDOWN;
//                 } else
//                     current_actor->facing = FACERIGHT;
//             } else {
//                 OAM_hiwater += move_metasprite(
//                     current_animation[current_actor->animation_phase],
//                     current_actor->tile_index,
//                     OAM_hiwater,
//                     TO_PIXELS(current_actor->x), TO_PIXELS(current_actor->y));

//                 if (current_direction == DIR_UP_L || current_direction == DIR_IDLE_UP) {
//                     current_actor->facing = FACEUP;
//                 } else if (current_direction == DIR_DOWN_L || current_direction == DIR_DOWN_R || current_direction == DIR_IDLE_DOWN) {
//                     current_actor->facing = FACEDOWN;
//                 } else
//                     current_actor->facing = FACELEFT;
//             }

//             if ((animation_timer == 1) && !(ANIMATIONLOCK)) {
//                 // if (current_actor->timer == 0)
//                 current_actor->animation_phase++;

//                 // check for the last animation frame
//                 if (current_animation[current_actor->animation_phase] == NULL) {
//                     // check for loop of animation
//                     if (current_actor->animations_props[current_actor->direction] == ANIM_LOOP) {
//                         current_actor->animation_phase = 0;  // loop animation back from frame[0]
//                     } else {
//                         current_actor->animation_phase--;  // stick to last animation frame
//                     }
//                 }
//             }
//         } else {
//             current_actor->ON = FALSE;
//             hide_metasprite(
//                 current_animation[current_actor->animation_phase],
//                 OAM_hiwater);
//         }
//         render_ptr++;
//         current_actor = &active_actors[*render_ptr];
//     }
//     // WE DON'T NEED TWO ENTIRELY DIFFERENT REDNER FUNCTIONS. INSTEAD, MOVE THE BULLET FOR LOOP INTO ITS OWN FUNC CALL. THEN CHECK IF STAGE NEEDS TO CHECK FOR BULLETS, OR NOT
//     for (UINT8 i = MAX_BULLETS; i != 0; i--) {
//         // set_sprite_tile(OAM_hiwater, current_bullet->tile_index);
//         if (current_bullet->RENDER == TRUE) {
//             SWITCH_ROM(current_bullet->bank);
//             OAM_hiwater += move_metasprite(
//                 bullet_metasprites[0],
//                 current_bullet->tile_index,
//                 OAM_hiwater,
//                 TO_PIXELS(current_bullet->x), TO_PIXELS(current_bullet->y));
//         }
//         current_bullet++;
//     }

//     SWITCH_ROM(__save);
//     // hide rest of the hardware sprites
//     for (UINT8 i = OAM_hiwater; i < 40u; i++)
//         shadow_OAM[i].y = 0;
// }