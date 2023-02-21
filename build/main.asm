;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _update_bullet2
	.globl _update_bullet1
	.globl _collide_bullet
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _refresh_OAM
	.globl _wait_vbl_done
	.globl _joypad
	.globl _BULLET2
	.globl _BULLET1
	.globl _PLAYER
	.globl _last_joy
	.globl _joy
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$joy$0_0$0==.
_joy::
	.ds 1
G$last_joy$0_0$0==.
_last_joy::
	.ds 1
G$PLAYER$0_0$0==.
_PLAYER::
	.ds 7
G$BULLET1$0_0$0==.
_BULLET1::
	.ds 7
G$BULLET2$0_0$0==.
_BULLET2::
	.ds 7
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	G$update_bullet1$0$0	= .
	.globl	G$update_bullet1$0$0
	C$main.c$20$0_0$117	= .
	.globl	C$main.c$20$0_0$117
;src/main.c:20: void update_bullet1(UINT8 playerx, UINT8 playery) {  // MOVE BULLET 1
;	---------------------------------
; Function update_bullet1
; ---------------------------------
_update_bullet1::
	C$main.c$21$1_0$117	= .
	.globl	C$main.c$21$1_0$117
;src/main.c:21: BULLET1.x = playerx + 4;
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	hl, #(_BULLET1 + 1)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$main.c$22$1_0$117	= .
	.globl	C$main.c$22$1_0$117
;src/main.c:22: BULLET1.y = playery;
	ldhl	sp,	#3
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #(_BULLET1 + 3)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$main.c$23$1_0$117	= .
	.globl	C$main.c$23$1_0$117
;src/main.c:23: }
	C$main.c$23$1_0$117	= .
	.globl	C$main.c$23$1_0$117
	XG$update_bullet1$0$0	= .
	.globl	XG$update_bullet1$0$0
	ret
	G$update_bullet2$0$0	= .
	.globl	G$update_bullet2$0$0
	C$main.c$24$1_0$119	= .
	.globl	C$main.c$24$1_0$119
;src/main.c:24: void update_bullet2(UINT8 playerx, UINT8 playery) {  // MOVE BULLET 2
;	---------------------------------
; Function update_bullet2
; ---------------------------------
_update_bullet2::
	C$main.c$25$1_0$119	= .
	.globl	C$main.c$25$1_0$119
;src/main.c:25: BULLET2.x = playerx + 4;
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	hl, #(_BULLET2 + 1)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$main.c$26$1_0$119	= .
	.globl	C$main.c$26$1_0$119
;src/main.c:26: BULLET2.y = playery;
	ldhl	sp,	#3
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #(_BULLET2 + 3)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$main.c$27$1_0$119	= .
	.globl	C$main.c$27$1_0$119
;src/main.c:27: }
	C$main.c$27$1_0$119	= .
	.globl	C$main.c$27$1_0$119
	XG$update_bullet2$0$0	= .
	.globl	XG$update_bullet2$0$0
	ret
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$29$1_0$120	= .
	.globl	C$main.c$29$1_0$120
;src/main.c:29: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$30$1_0$120	= .
	.globl	C$main.c$30$1_0$120
;src/main.c:30: DISABLE_VBL_TRANSFER;
	xor	a, a
	ldh	(__shadow_OAM_base + 0), a
	C$main.c$33$1_0$120	= .
	.globl	C$main.c$33$1_0$120
;src/main.c:33: OBP1_REG = 0b10011100;
	ld	a, #0x9c
	ldh	(_OBP1_REG + 0), a
	C$main.c$34$1_0$120	= .
	.globl	C$main.c$34$1_0$120
;src/main.c:34: SPRITES_8x16;  // MUST be 8x16 or 8x8. Can change in different scenes only
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
	C$main.c$35$1_0$120	= .
	.globl	C$main.c$35$1_0$120
;src/main.c:35: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	C$main.c$36$1_0$120	= .
	.globl	C$main.c$36$1_0$120
;src/main.c:36: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
	C$main.c$37$1_0$120	= .
	.globl	C$main.c$37$1_0$120
;src/main.c:37: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
	C$main.c$39$1_0$120	= .
	.globl	C$main.c$39$1_0$120
;src/main.c:39: set_sprite_data(0, 4, galaga_tiles);
	ld	de, #_galaga_tiles
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$40$1_0$120	= .
	.globl	C$main.c$40$1_0$120
;src/main.c:40: set_sprite_data(4, 2, bullet_tiles);
	ld	de, #_bullet_tiles
	push	de
	ld	hl, #0x204
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$41$1_0$120	= .
	.globl	C$main.c$41$1_0$120
;src/main.c:41: set_bkg_data(0, 37, bkg_tiles);
	ld	de, #_bkg_tiles
	push	de
	ld	hl, #0x2500
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$main.c$42$1_0$120	= .
	.globl	C$main.c$42$1_0$120
;src/main.c:42: set_bkg_tiles(0, 0, 20, 18, bkg_map);
	ld	de, #_bkg_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
	C$main.c$44$1_0$120	= .
	.globl	C$main.c$44$1_0$120
;src/main.c:44: PLAYER.x = 72;  // making a small change to MAIN (void)
	ld	hl, #(_PLAYER + 1)
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x00
	C$main.c$45$1_0$120	= .
	.globl	C$main.c$45$1_0$120
;src/main.c:45: PLAYER.y = 120;
	ld	hl, #(_PLAYER + 3)
	ld	a, #0x78
	ld	(hl+), a
	ld	(hl), #0x00
	C$main.c$46$1_0$120	= .
	.globl	C$main.c$46$1_0$120
;src/main.c:46: BULLET1.spawn = BULLET2.spawn = FALSE;
	ld	hl, #_BULLET2
	ld	(hl), #0x00
	ld	hl, #_BULLET1
	ld	(hl), #0x00
;src/main.c:48: galaga_metasprites[0], 0, 0, PLAYER.x, PLAYER.y);  // offsets the crazy y-centered, x on the right pixel -> top left //
	ld	hl, #(_PLAYER + 3)
	ld	b, (hl)
	ld	hl, #(_PLAYER + 1)
	ld	c, (hl)
	ld	hl, #_galaga_metasprites + 1
	ld	a,	(hl-)
;	spillPairReg hl
;C:/c_code/gbdk/include/gb/metasprites.h:131: __current_metasprite = metasprite; 
	ld	e, (hl)
	ld	d, a
	ld	hl, #___current_metasprite
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:/c_code/gbdk/include/gb/metasprites.h:132: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;C:/c_code/gbdk/include/gb/metasprites.h:133: return __move_metasprite(base_sprite, x, y); 
	push	bc
	inc	sp
	ld	h, c
	ld	l, #0x00
	push	hl
	call	___move_metasprite
	add	sp, #3
	C$main.c$49$1_0$120	= .
	.globl	C$main.c$49$1_0$120
;src/main.c:49: last_joy = joy = 0;
	ld	hl, #_joy
	ld	(hl), #0x00
	ld	hl, #_last_joy
	ld	(hl), #0x00
	C$main.c$51$1_0$120	= .
	.globl	C$main.c$51$1_0$120
;src/main.c:51: while (1) {
00135$:
	C$main.c$52$2_0$121	= .
	.globl	C$main.c$52$2_0$121
;src/main.c:52: last_joy = joy;
	ld	a, (#_joy)
	ld	(#_last_joy),a
	C$main.c$53$2_0$121	= .
	.globl	C$main.c$53$2_0$121
;src/main.c:53: joy = joypad();
	call	_joypad
	ld	hl, #_joy
	ld	(hl), e
	C$main.c$55$2_0$121	= .
	.globl	C$main.c$55$2_0$121
;src/main.c:55: if (joy & J_SELECT) {
	bit	6, (hl)
	jr	Z, 00102$
	C$main.c$56$3_0$122	= .
	.globl	C$main.c$56$3_0$122
;src/main.c:56: set_bkg_tiles(0, 0, 20, 18, bkg_map);
	ld	de, #_bkg_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
00102$:
	C$main.c$52$1_0$120	= .
	.globl	C$main.c$52$1_0$120
;src/main.c:52: last_joy = joy;
	ld	hl, #_joy
	ld	b, (hl)
	C$main.c$60$2_0$121	= .
	.globl	C$main.c$60$2_0$121
;src/main.c:60: if ((joy & J_LEFT) && PLAYER.x > 0) {  // MOVE PLAYER LEFT
	bit	1, b
	jr	Z, 00107$
	C$main.c$48$1_0$120	= .
	.globl	C$main.c$48$1_0$120
;src/main.c:48: galaga_metasprites[0], 0, 0, PLAYER.x, PLAYER.y);  // offsets the crazy y-centered, x on the right pixel -> top left //
	ld	hl, #(_PLAYER + 1)
	ld	a, (hl+)
	ld	c, a
	ld	l, (hl)
;	spillPairReg hl
	C$main.c$60$2_0$121	= .
	.globl	C$main.c$60$2_0$121
;src/main.c:60: if ((joy & J_LEFT) && PLAYER.x > 0) {  // MOVE PLAYER LEFT
	ld	e, l
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, l
	bit	7, e
	jr	Z, 00244$
	bit	7, d
	jr	NZ, 00245$
	cp	a, a
	jr	00245$
00244$:
	bit	7, d
	jr	Z, 00245$
	scf
00245$:
	jr	NC, 00107$
	C$main.c$61$3_0$123	= .
	.globl	C$main.c$61$3_0$123
;src/main.c:61: PLAYER.x -= 1;
	ld	b, l
	dec	bc
	ld	hl, #(_PLAYER + 1)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00108$
00107$:
	C$main.c$62$2_0$121	= .
	.globl	C$main.c$62$2_0$121
;src/main.c:62: } else if ((joy & J_RIGHT) && PLAYER.x < 144) {  // MOVE PLAYER RIGHT
	bit	0, b
	jr	Z, 00108$
	C$main.c$48$1_0$120	= .
	.globl	C$main.c$48$1_0$120
;src/main.c:48: galaga_metasprites[0], 0, 0, PLAYER.x, PLAYER.y);  // offsets the crazy y-centered, x on the right pixel -> top left //
	ld	hl, #(_PLAYER + 1)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	C$main.c$62$2_0$121	= .
	.globl	C$main.c$62$2_0$121
;src/main.c:62: } else if ((joy & J_RIGHT) && PLAYER.x < 144) {  // MOVE PLAYER RIGHT
	ld	a, c
	sub	a, #0x90
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00108$
	C$main.c$63$3_0$124	= .
	.globl	C$main.c$63$3_0$124
;src/main.c:63: PLAYER.x += 1;
	inc	bc
	ld	hl, #(_PLAYER + 1)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00108$:
	C$main.c$65$1_0$120	= .
	.globl	C$main.c$65$1_0$120
;src/main.c:65: if ((CHANGED_BUTTONS & J_A) && (joy & J_A) && !(BULLET1.spawn)) {  // IF NO BULLET ON SCREEN, SPAWN BULLET1
	ld	a, (#_last_joy)
	ld	hl, #_joy
	xor	a, (hl)
	C$main.c$52$1_0$120	= .
	.globl	C$main.c$52$1_0$120
;src/main.c:52: last_joy = joy;
	ld	b, (hl)
	C$main.c$65$1_0$120	= .
	.globl	C$main.c$65$1_0$120
;src/main.c:65: if ((CHANGED_BUTTONS & J_A) && (joy & J_A) && !(BULLET1.spawn)) {  // IF NO BULLET ON SCREEN, SPAWN BULLET1
	ld	hl, #_BULLET1
	ld	c, (hl)
	and	a, #0x10
	ld	e, a
	ld	d, #0x00
	ld	a, b
	and	a, #0x10
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	b, #0x00
	ld	a, d
	or	a, e
	jr	Z, 00116$
	ld	a, b
	or	a, l
	jr	Z, 00116$
	ld	a, c
	or	a, a
	jr	NZ, 00116$
	C$main.c$66$3_0$125	= .
	.globl	C$main.c$66$3_0$125
;src/main.c:66: BULLET1.spawn = TRUE;
	ld	hl, #_BULLET1
	ld	(hl), #0x01
	C$main.c$67$3_0$125	= .
	.globl	C$main.c$67$3_0$125
;src/main.c:67: update_bullet1(PLAYER.x, PLAYER.y);
	ld	a, (#(_PLAYER + 3) + 0)
	ld	hl, #(_PLAYER + 1)
	ld	b, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_update_bullet1
	pop	hl
	jr	00117$
00116$:
	C$main.c$68$2_0$121	= .
	.globl	C$main.c$68$2_0$121
;src/main.c:68: } else if ((CHANGED_BUTTONS & J_A) && (joy & J_A) && (BULLET1.spawn) && !(BULLET2.spawn)) {  // IF BULLET1 IS ON SCREEN, SPAWN BULLET2
	ld	a, d
	or	a, e
	jr	Z, 00117$
	ld	a, b
	or	a, l
	jr	Z, 00117$
	ld	a, c
	or	a, a
	jr	Z, 00117$
	ld	a, (#_BULLET2 + 0)
	or	a, a
	jr	NZ, 00117$
	C$main.c$69$3_0$126	= .
	.globl	C$main.c$69$3_0$126
;src/main.c:69: BULLET2.spawn = TRUE;
	ld	hl, #_BULLET2
	ld	(hl), #0x01
	C$main.c$70$3_0$126	= .
	.globl	C$main.c$70$3_0$126
;src/main.c:70: update_bullet2(PLAYER.x, PLAYER.y);
	ld	a, (#(_PLAYER + 3) + 0)
	ld	hl, #(_PLAYER + 1)
	ld	b, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_update_bullet2
	pop	hl
00117$:
	C$main.c$73$2_0$121	= .
	.globl	C$main.c$73$2_0$121
;src/main.c:73: if (BULLET1.spawn) {  // IF BULLET1 IS ON SCREEN
	ld	a, (#_BULLET1 + 0)
	or	a, a
	jr	Z, 00124$
	C$main.c$74$3_0$127	= .
	.globl	C$main.c$74$3_0$127
;src/main.c:74: BULLET1.y -= 3;
	ld	hl, #(_BULLET1 + 3)
	ld	a, (hl+)
	ld	c, a
	ld	l, (hl)
;	spillPairReg hl
	ld	a, c
	add	a, #0xfd
	ld	b, a
	ld	a, l
	adc	a, #0xff
	ld	c, a
	ld	hl, #(_BULLET1 + 3)
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$main.c$75$3_0$127	= .
	.globl	C$main.c$75$3_0$127
;src/main.c:75: if (collide_bullet(BULLET1.x, BULLET1.y) == 0x01U) {  // CHECK FOR BACKGROUND COLLISION
	ld	a, (#(_BULLET1 + 1) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_collide_bullet
	pop	hl
	dec	e
	jr	NZ, 00121$
	C$main.c$76$4_0$128	= .
	.globl	C$main.c$76$4_0$128
;src/main.c:76: BULLET1.spawn = FALSE;
	ld	hl, #_BULLET1
	ld	(hl), #0x00
;src/main.c:77: hide_metasprite(bullet_metasprites[0], 2);  // HIDE BULLET1
	ld	hl, #_bullet_metasprites
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
;C:/c_code/gbdk/include/gb/metasprites.h:228: __current_metasprite = metasprite; 
	ld	hl, #___current_metasprite
	ld	(hl), c
	inc	hl
	ld	(hl), a
;C:/c_code/gbdk/include/gb/metasprites.h:229: __hide_metasprite(base_sprite);
	ld	a, #0x02
	push	af
	inc	sp
	call	___hide_metasprite
	inc	sp
	C$main.c$77$3_0$127	= .
	.globl	C$main.c$77$3_0$127
;src/main.c:77: hide_metasprite(bullet_metasprites[0], 2);  // HIDE BULLET1
	jr	00124$
00121$:
;src/main.c:80: bullet_metasprites[0], 4, 2, BULLET1.x, BULLET1.y);
	ld	hl, #(_BULLET1 + 3)
	ld	b, (hl)
	ld	hl, #(_BULLET1 + 1)
	ld	c, (hl)
	ld	hl, #_bullet_metasprites + 1
	ld	a,	(hl-)
;	spillPairReg hl
;C:/c_code/gbdk/include/gb/metasprites.h:131: __current_metasprite = metasprite; 
	ld	e, (hl)
	ld	d, a
	ld	hl, #___current_metasprite
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:/c_code/gbdk/include/gb/metasprites.h:132: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x04
;C:/c_code/gbdk/include/gb/metasprites.h:133: return __move_metasprite(base_sprite, x, y); 
	push	bc
	inc	sp
	ld	h, c
	ld	l, #0x02
	push	hl
	call	___move_metasprite
	add	sp, #3
	C$main.c$80$2_0$121	= .
	.globl	C$main.c$80$2_0$121
;src/main.c:80: bullet_metasprites[0], 4, 2, BULLET1.x, BULLET1.y);
00124$:
	C$main.c$82$2_0$121	= .
	.globl	C$main.c$82$2_0$121
;src/main.c:82: if (BULLET2.spawn) {  // IF BULLET2 IS ON SCREEN
	ld	a, (#_BULLET2 + 0)
	or	a, a
	jr	Z, 00129$
	C$main.c$83$3_0$129	= .
	.globl	C$main.c$83$3_0$129
;src/main.c:83: BULLET2.y -= 3;
	ld	hl, #(_BULLET2 + 3)
	ld	a, (hl+)
	ld	c, a
	ld	l, (hl)
;	spillPairReg hl
	ld	a, c
	add	a, #0xfd
	ld	b, a
	ld	a, l
	adc	a, #0xff
	ld	c, a
	ld	hl, #(_BULLET2 + 3)
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$main.c$84$3_0$129	= .
	.globl	C$main.c$84$3_0$129
;src/main.c:84: if (collide_bullet(BULLET2.x, BULLET2.y) == 0x01U) {  // CHECK FOR BACKGROUND COLLISION
	ld	a, (#(_BULLET2 + 1) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_collide_bullet
	pop	hl
	dec	e
	jr	NZ, 00126$
	C$main.c$85$4_0$130	= .
	.globl	C$main.c$85$4_0$130
;src/main.c:85: BULLET2.spawn = FALSE;
	ld	hl, #_BULLET2
	ld	(hl), #0x00
;src/main.c:86: hide_metasprite(bullet_metasprites[0], 3);  // HIDE BULLET2
	ld	hl, #_bullet_metasprites
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
;C:/c_code/gbdk/include/gb/metasprites.h:228: __current_metasprite = metasprite; 
	ld	hl, #___current_metasprite
	ld	(hl), c
	inc	hl
	ld	(hl), a
;C:/c_code/gbdk/include/gb/metasprites.h:229: __hide_metasprite(base_sprite);
	ld	a, #0x03
	push	af
	inc	sp
	call	___hide_metasprite
	inc	sp
	C$main.c$86$3_0$129	= .
	.globl	C$main.c$86$3_0$129
;src/main.c:86: hide_metasprite(bullet_metasprites[0], 3);  // HIDE BULLET2
	jr	00129$
00126$:
;src/main.c:89: bullet_metasprites[0], 4, 3, BULLET2.x, BULLET2.y);
	ld	hl, #(_BULLET2 + 3)
	ld	b, (hl)
	ld	hl, #(_BULLET2 + 1)
	ld	c, (hl)
	ld	hl, #_bullet_metasprites + 1
	ld	a,	(hl-)
;	spillPairReg hl
;C:/c_code/gbdk/include/gb/metasprites.h:131: __current_metasprite = metasprite; 
	ld	e, (hl)
	ld	d, a
	ld	hl, #___current_metasprite
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:/c_code/gbdk/include/gb/metasprites.h:132: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x04
;C:/c_code/gbdk/include/gb/metasprites.h:133: return __move_metasprite(base_sprite, x, y); 
	push	bc
	inc	sp
	ld	h, c
	ld	l, #0x03
	push	hl
	call	___move_metasprite
	add	sp, #3
	C$main.c$89$2_0$121	= .
	.globl	C$main.c$89$2_0$121
;src/main.c:89: bullet_metasprites[0], 4, 3, BULLET2.x, BULLET2.y);
00129$:
	C$main.c$91$2_0$121	= .
	.globl	C$main.c$91$2_0$121
;src/main.c:91: if (BULLET1.y < -16) {  // IF BULLET1 REACHES TOP OF SCREEN
	ld	hl, #(_BULLET1 + 3)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0xf0
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00131$
	C$main.c$92$3_0$131	= .
	.globl	C$main.c$92$3_0$131
;src/main.c:92: BULLET1.spawn = FALSE;
	ld	hl, #_BULLET1
	ld	(hl), #0x00
;src/main.c:93: hide_metasprite(bullet_metasprites[0], 2);  // HIDE BULLET1
	ld	hl, #_bullet_metasprites
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
;C:/c_code/gbdk/include/gb/metasprites.h:228: __current_metasprite = metasprite; 
	ld	hl, #___current_metasprite
	ld	(hl), c
	inc	hl
	ld	(hl), a
;C:/c_code/gbdk/include/gb/metasprites.h:229: __hide_metasprite(base_sprite);
	ld	a, #0x02
	push	af
	inc	sp
	call	___hide_metasprite
	inc	sp
	C$main.c$93$2_0$121	= .
	.globl	C$main.c$93$2_0$121
;src/main.c:93: hide_metasprite(bullet_metasprites[0], 2);  // HIDE BULLET1
00131$:
	C$main.c$95$2_0$121	= .
	.globl	C$main.c$95$2_0$121
;src/main.c:95: if (BULLET2.y < -16) {  // IF BULLET2 REACHES TOP OF SCREEN
	ld	hl, #(_BULLET2 + 3)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0xf0
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00133$
	C$main.c$96$3_0$132	= .
	.globl	C$main.c$96$3_0$132
;src/main.c:96: BULLET2.spawn = FALSE;
	ld	hl, #_BULLET2
	ld	(hl), #0x00
;src/main.c:97: hide_metasprite(bullet_metasprites[0], 3);  // HIDE BULLET2
	ld	hl, #_bullet_metasprites
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
;C:/c_code/gbdk/include/gb/metasprites.h:228: __current_metasprite = metasprite; 
	ld	hl, #___current_metasprite
	ld	(hl), c
	inc	hl
	ld	(hl), a
;C:/c_code/gbdk/include/gb/metasprites.h:229: __hide_metasprite(base_sprite);
	ld	a, #0x03
	push	af
	inc	sp
	call	___hide_metasprite
	inc	sp
	C$main.c$97$2_0$121	= .
	.globl	C$main.c$97$2_0$121
;src/main.c:97: hide_metasprite(bullet_metasprites[0], 3);  // HIDE BULLET2
00133$:
;src/main.c:101: galaga_metasprites[0], 0, 0, PLAYER.x, PLAYER.y);  // DRAW SHIP POSITION
	ld	hl, #(_PLAYER + 3)
	ld	c, (hl)
	ld	hl, #(_PLAYER + 1)
	ld	b, (hl)
	ld	hl, #_galaga_metasprites
	inc	hl
	ld	a,	(hl-)
;	spillPairReg hl
;C:/c_code/gbdk/include/gb/metasprites.h:131: __current_metasprite = metasprite; 
	ld	e, (hl)
	ld	d, a
	ld	hl, #___current_metasprite
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:/c_code/gbdk/include/gb/metasprites.h:132: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;C:/c_code/gbdk/include/gb/metasprites.h:133: return __move_metasprite(base_sprite, x, y); 
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	___move_metasprite
	add	sp, #3
	C$main.c$103$2_0$121	= .
	.globl	C$main.c$103$2_0$121
;src/main.c:103: wait_vbl_done();
	call	_wait_vbl_done
	C$main.c$104$2_0$121	= .
	.globl	C$main.c$104$2_0$121
;src/main.c:104: refresh_OAM();
	call	_refresh_OAM
	C$main.c$106$1_0$120	= .
	.globl	C$main.c$106$1_0$120
;src/main.c:106: }
	C$main.c$106$1_0$120	= .
	.globl	C$main.c$106$1_0$120
	XG$main$0$0	= .
	.globl	XG$main$0$0
	jp	00135$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
