;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module collisions
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_bkg_tile_xy
	.globl _set_bkg_tile_xy
	.globl _npc_tile_mothership_dead
	.globl _npc_tile_mothership_green
	.globl _npc_tile_mothership
	.globl _npc_tile_wasp
	.globl _npc_tile_bee
	.globl _collide_bullet
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
G$npc_tile_bee$0_0$0==.
_npc_tile_bee::
	.ds 5
G$npc_tile_wasp$0_0$0==.
_npc_tile_wasp::
	.ds 5
G$npc_tile_mothership$0_0$0==.
_npc_tile_mothership::
	.ds 10
G$npc_tile_mothership_green$0_0$0==.
_npc_tile_mothership_green::
	.ds 14
G$npc_tile_mothership_dead$0_0$0==.
_npc_tile_mothership_dead::
	.ds 14
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
	G$collide_bullet$0$0	= .
	.globl	G$collide_bullet$0$0
	C$collisions.c$12$0_0$107	= .
	.globl	C$collisions.c$12$0_0$107
;src/collisions.c:12: UINT8 collide_bullet(UINT8 bullet_spawn_x, UINT8 bullet_spawn_y) {  // CHECK WHICH BACKGROUND TILE THE BULLET COLLIDES WITH //
;	---------------------------------
; Function collide_bullet
; ---------------------------------
_collide_bullet::
	add	sp, #-21
	C$collisions.c$14$2_0$107	= .
	.globl	C$collisions.c$14$2_0$107
;src/collisions.c:14: UINT8 *current_NPC = NULL;                 // POINTER TO BACKGROUND TILE
	xor	a, a
	ldhl	sp,	#19
	ld	(hl+), a
	ld	(hl), a
	C$collisions.c$15$2_0$107	= .
	.globl	C$collisions.c$15$2_0$107
;src/collisions.c:15: UINT8 *current_tile_change = NULL;         // POINTER TO WHICH TILE TO UPDATE TO
	xor	a, a
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), a
	C$collisions.c$19$1_0$107	= .
	.globl	C$collisions.c$19$1_0$107
;src/collisions.c:19: bulletx = bullet_spawn_x + 4;
	ldhl	sp,	#23
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x0004
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl), a
	C$collisions.c$20$1_0$107	= .
	.globl	C$collisions.c$20$1_0$107
;src/collisions.c:20: bullety = bullet_spawn_y + 10;
	ldhl	sp,	#24
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x000a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	C$collisions.c$22$1_0$107	= .
	.globl	C$collisions.c$22$1_0$107
;src/collisions.c:22: index_X = bulletx / 8;  // CALCULATE
	ld	(hl+), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00202$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
00202$:
	ldhl	sp,	#17
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	C$collisions.c$23$1_0$107	= .
	.globl	C$collisions.c$23$1_0$107
;src/collisions.c:23: index_Y = bullety / 8;
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00203$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
00203$:
	ldhl	sp,	#11
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	C$collisions.c$26$1_0$107	= .
	.globl	C$collisions.c$26$1_0$107
;src/collisions.c:26: tile_x = index_X * 8;  // CALCULATE X OF TILE
	ldhl	sp,	#17
	ld	b, (hl)
	ld	a, b
	add	a, a
	add	a, a
	add	a, a
	ld	c, a
	C$collisions.c$29$1_1$108	= .
	.globl	C$collisions.c$29$1_1$108
;src/collisions.c:29: UINT8 current_tile = get_bkg_tile_xy(index_X, index_Y);       // COLLIDING TILE
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_get_bkg_tile_xy
	pop	hl
	ldhl	sp,	#4
	C$collisions.c$30$1_1$108	= .
	.globl	C$collisions.c$30$1_1$108
;src/collisions.c:30: UINT8 left_of_tile = get_bkg_tile_xy(index_X - 1, index_Y);   // LEFT OF COLLIDING TILE
	ld	a, e
	ld	(hl+), a
	ld	a, b
	dec	a
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_get_bkg_tile_xy
	pop	hl
	ldhl	sp,	#13
	ld	(hl), e
	C$collisions.c$31$1_1$108	= .
	.globl	C$collisions.c$31$1_1$108
;src/collisions.c:31: UINT8 right_of_tile = get_bkg_tile_xy(index_X + 1, index_Y);  // RIGHT OF COLLIDING TILE
	ld	a, b
	inc	a
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_get_bkg_tile_xy
	pop	hl
	ldhl	sp,	#7
	ld	(hl), e
	C$collisions.c$39$1_1$107	= .
	.globl	C$collisions.c$39$1_1$107
;src/collisions.c:39: if ((current_tile == current_NPC[0]) && (bulletx - tile_x >= 3)) {  //       current_NPC[0] NPC TILE LEFT SIDE     //
	ld	b, #0x00
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	(hl-), a
	ld	(hl), e
	C$collisions.c$33$1_1$108	= .
	.globl	C$collisions.c$33$1_1$108
;src/collisions.c:33: if ((current_tile >= 0x03) && (current_tile <= 0x0C)) {                        // IF COLLIDING TILE IS ANY OF THE ENEMY TILES
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x03
	jp	C, 00197$
	ld	a, #0x0c
	sub	a, (hl)
	jp	C, 00197$
	C$collisions.c$34$2_1$109	= .
	.globl	C$collisions.c$34$2_1$109
;src/collisions.c:34: if (current_tile >= npc_tile_bee[0] && current_tile <= npc_tile_bee[4]) {  // CHECK FOR BEE COLLISION
	ld	hl, #_npc_tile_bee
	ld	c, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	jr	C, 00105$
	ld	hl, #_npc_tile_bee + 4
	ld	c, (hl)
	ld	a, c
	ldhl	sp,	#4
	sub	a, (hl)
	jr	C, 00105$
	C$collisions.c$35$3_1$110	= .
	.globl	C$collisions.c$35$3_1$110
;src/collisions.c:35: current_NPC = &npc_tile_bee[0];
	ldhl	sp,	#19
	ld	a, #<(_npc_tile_bee)
	ld	(hl+), a
	ld	(hl), #>(_npc_tile_bee)
	jr	00106$
00105$:
	C$collisions.c$36$2_1$109	= .
	.globl	C$collisions.c$36$2_1$109
;src/collisions.c:36: } else if (current_tile >= npc_tile_wasp[0] && current_tile <= npc_tile_wasp[4]) {  // CHECK FOR WASP COLLISION
	ld	hl, #_npc_tile_wasp
	ld	c, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	jr	C, 00106$
	ld	hl, #_npc_tile_wasp + 4
	ld	c, (hl)
	ld	a, c
	ldhl	sp,	#4
	sub	a, (hl)
	jr	C, 00106$
	C$collisions.c$37$3_1$111	= .
	.globl	C$collisions.c$37$3_1$111
;src/collisions.c:37: current_NPC = &npc_tile_wasp[0];
	ldhl	sp,	#19
	ld	(hl), #<(_npc_tile_wasp)
	inc	hl
	ld	(hl), #>(_npc_tile_wasp)
00106$:
	C$collisions.c$39$2_1$109	= .
	.globl	C$collisions.c$39$2_1$109
;src/collisions.c:39: if ((current_tile == current_NPC[0]) && (bulletx - tile_x >= 3)) {  //       current_NPC[0] NPC TILE LEFT SIDE     //
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl), a
	C$collisions.c$40$1_1$107	= .
	.globl	C$collisions.c$40$1_1$107
;src/collisions.c:40: if (right_of_tile == current_NPC[2]) {
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	C$collisions.c$41$1_1$107	= .
	.globl	C$collisions.c$41$1_1$107
;src/collisions.c:41: set_bkg_tile_xy(index_X + 1, index_Y, current_NPC[3]);
	ld	a, (hl-)
	ld	b, a
	inc	bc
	inc	bc
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl), a
	C$collisions.c$42$1_1$107	= .
	.globl	C$collisions.c$42$1_1$107
;src/collisions.c:42: } else if ((right_of_tile == current_NPC[3]) || (right_of_tile == current_NPC[4])) {
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	C$collisions.c$40$1_1$107	= .
	.globl	C$collisions.c$40$1_1$107
;src/collisions.c:40: if (right_of_tile == current_NPC[2]) {
	ld	(hl+), a
	ld	a, (bc)
	ld	(hl), a
	C$collisions.c$39$2_1$109	= .
	.globl	C$collisions.c$39$2_1$109
;src/collisions.c:39: if ((current_tile == current_NPC[0]) && (bulletx - tile_x >= 3)) {  //       current_NPC[0] NPC TILE LEFT SIDE     //
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#10
	sub	a, (hl)
	jp	NZ,00139$
	ldhl	sp,	#17
	ld	a, (hl+)
	sub	a, #0x03
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00456$
	bit	7, d
	jr	NZ, 00457$
	cp	a, a
	jr	00457$
00456$:
	bit	7, d
	jr	Z, 00457$
	scf
00457$:
	jr	C, 00139$
	C$collisions.c$41$1_1$107	= .
	.globl	C$collisions.c$41$1_1$107
;src/collisions.c:41: set_bkg_tile_xy(index_X + 1, index_Y, current_NPC[3]);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#20
	ld	(hl), a
	C$collisions.c$40$3_1$112	= .
	.globl	C$collisions.c$40$3_1$112
;src/collisions.c:40: if (right_of_tile == current_NPC[2]) {
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#16
	sub	a, (hl)
	jr	NZ, 00112$
	C$collisions.c$41$4_1$113	= .
	.globl	C$collisions.c$41$4_1$113
;src/collisions.c:41: set_bkg_tile_xy(index_X + 1, index_Y, current_NPC[3]);
	ldhl	sp,	#20
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jr	00113$
00112$:
	C$collisions.c$42$3_1$112	= .
	.globl	C$collisions.c$42$3_1$112
;src/collisions.c:42: } else if ((right_of_tile == current_NPC[3]) || (right_of_tile == current_NPC[4])) {
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#20
	sub	a, (hl)
	jr	Z, 00108$
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00113$
00108$:
	C$collisions.c$43$4_1$114	= .
	.globl	C$collisions.c$43$4_1$114
;src/collisions.c:43: set_bkg_tile_xy(index_X + 1, index_Y, 0x00);
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00113$:
	C$collisions.c$45$3_1$112	= .
	.globl	C$collisions.c$45$3_1$112
;src/collisions.c:45: set_bkg_tile_xy(index_X, index_Y, 0x00);
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$46$3_1$112	= .
	.globl	C$collisions.c$46$3_1$112
;src/collisions.c:46: return 0x01U;
	ld	e, #0x01
	jp	00200$
00139$:
	C$collisions.c$48$2_1$109	= .
	.globl	C$collisions.c$48$2_1$109
;src/collisions.c:48: } else if ((current_tile == current_NPC[2]) && (bulletx - tile_x <= 1)) {  //       current_NPC[0] NPC TILE RIGHT SIDE    //
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#16
	sub	a, (hl)
	ld	a, #0x01
	jr	Z, 00464$
	xor	a, a
00464$:
	ld	c, a
	ldhl	sp,	#17
	ld	a, #0x01
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00465$
	bit	7, d
	jr	NZ, 00466$
	cp	a, a
	jr	00466$
00465$:
	bit	7, d
	jr	Z, 00466$
	scf
00466$:
	ld	a, #0x00
	rla
	ld	b, a
	ld	a, c
	or	a, a
	jr	Z, 00135$
	bit	0, b
	jr	NZ, 00135$
	C$collisions.c$49$3_1$115	= .
	.globl	C$collisions.c$49$3_1$115
;src/collisions.c:49: set_bkg_tile_xy(index_X - 1, index_Y, 0x00);
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$50$3_1$115	= .
	.globl	C$collisions.c$50$3_1$115
;src/collisions.c:50: set_bkg_tile_xy(index_X, index_Y, current_NPC[3]);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$51$3_1$115	= .
	.globl	C$collisions.c$51$3_1$115
;src/collisions.c:51: return 0x01U;
	ld	e, #0x01
	jp	00200$
00135$:
	C$collisions.c$53$2_1$109	= .
	.globl	C$collisions.c$53$2_1$109
;src/collisions.c:53: } else if ((current_tile == current_NPC[4]) && (bulletx - tile_x <= 1)) {  //       current_NPC[0] NPC TILE RIGHT SIDE W/ NO ENEMY TO RIGHT    //
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#10
	sub	a, (hl)
	jr	NZ, 00131$
	bit	0, b
	jr	NZ, 00131$
	C$collisions.c$54$3_1$116	= .
	.globl	C$collisions.c$54$3_1$116
;src/collisions.c:54: set_bkg_tile_xy(index_X - 1, index_Y, 0x00);
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$55$3_1$116	= .
	.globl	C$collisions.c$55$3_1$116
;src/collisions.c:55: set_bkg_tile_xy(index_X, index_Y, 0x00);
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$56$3_1$116	= .
	.globl	C$collisions.c$56$3_1$116
;src/collisions.c:56: return 0x01U;
	ld	e, #0x01
	jp	00200$
00131$:
	C$collisions.c$60$1_1$107	= .
	.globl	C$collisions.c$60$1_1$107
;src/collisions.c:60: else if ((current_tile == current_NPC[2]) && (bulletx - tile_x >= 7)) {  //       current_NPC[1] NPC TILE LEFT SIDE    //
	ldhl	sp,	#17
	ld	a, (hl+)
	sub	a, #0x07
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00469$
	bit	7, d
	jr	NZ, 00470$
	cp	a, a
	jr	00470$
00469$:
	bit	7, d
	jr	Z, 00470$
	scf
00470$:
	ld	a, #0x00
	rla
	ld	b, a
	ld	a, c
	or	a, a
	jr	Z, 00127$
	bit	0, b
	jr	NZ, 00127$
	C$collisions.c$61$3_1$117	= .
	.globl	C$collisions.c$61$3_1$117
;src/collisions.c:61: set_bkg_tile_xy(index_X + 1, index_Y, 0x00);
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$62$3_1$117	= .
	.globl	C$collisions.c$62$3_1$117
;src/collisions.c:62: set_bkg_tile_xy(index_X, index_Y, current_NPC[4]);
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$63$3_1$117	= .
	.globl	C$collisions.c$63$3_1$117
;src/collisions.c:63: return 0x01U;
	ld	e, #0x01
	jp	00200$
00127$:
	C$collisions.c$65$2_1$109	= .
	.globl	C$collisions.c$65$2_1$109
;src/collisions.c:65: } else if ((current_tile == current_NPC[3]) && (bulletx - tile_x >= 7)) {  //       current_NPC[1] NPC TILE LEFT SIDE    //
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00123$
	bit	0, b
	jr	NZ, 00123$
	C$collisions.c$66$3_1$118	= .
	.globl	C$collisions.c$66$3_1$118
;src/collisions.c:66: set_bkg_tile_xy(index_X + 1, index_Y, 0x00);
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$67$3_1$118	= .
	.globl	C$collisions.c$67$3_1$118
;src/collisions.c:67: set_bkg_tile_xy(index_X, index_Y, 0x00);
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$68$3_1$118	= .
	.globl	C$collisions.c$68$3_1$118
;src/collisions.c:68: return 0x01U;
	ld	e, #0x01
	jp	00200$
00123$:
	C$collisions.c$72$2_1$109	= .
	.globl	C$collisions.c$72$2_1$109
;src/collisions.c:72: else if ((current_tile == current_NPC[1]) && (bulletx - tile_x <= 5)) {
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, b
	jp	NZ,00198$
	ldhl	sp,	#17
	ld	a, #0x05
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00475$
	bit	7, d
	jr	NZ, 00476$
	cp	a, a
	jr	00476$
00475$:
	bit	7, d
	jr	Z, 00476$
	scf
00476$:
	jp	C, 00198$
	C$collisions.c$73$3_1$119	= .
	.globl	C$collisions.c$73$3_1$119
;src/collisions.c:73: if (left_of_tile == current_NPC[2]) {
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#16
	sub	a, (hl)
	jr	NZ, 00117$
	C$collisions.c$74$4_1$120	= .
	.globl	C$collisions.c$74$4_1$120
;src/collisions.c:74: set_bkg_tile_xy(index_X - 1, index_Y, current_NPC[4]);
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jr	00118$
00117$:
	C$collisions.c$75$3_1$119	= .
	.globl	C$collisions.c$75$3_1$119
;src/collisions.c:75: } else if (left_of_tile == current_NPC[3]) {
	ldhl	sp,	#13
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00118$
	C$collisions.c$76$4_1$121	= .
	.globl	C$collisions.c$76$4_1$121
;src/collisions.c:76: set_bkg_tile_xy(index_X - 1, index_Y, 0x00);
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00118$:
	C$collisions.c$78$3_1$119	= .
	.globl	C$collisions.c$78$3_1$119
;src/collisions.c:78: set_bkg_tile_xy(index_X, index_Y, 0x00);
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$79$3_1$119	= .
	.globl	C$collisions.c$79$3_1$119
;src/collisions.c:79: return 0x01U;
	ld	e, #0x01
	jp	00200$
00197$:
	C$collisions.c$83$1_1$108	= .
	.globl	C$collisions.c$83$1_1$108
;src/collisions.c:83: } else if (current_tile >= 0x0D) {                           // IF THE COLLIDING TILE IS EITHER OF THE TWO TYPES OF MOTHERSHIPS
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x0d
	ld	a, #0x00
	rla
	ld	c, a
	bit	0, c
	jp	NZ, 00198$
	C$collisions.c$84$2_1$122	= .
	.globl	C$collisions.c$84$2_1$122
;src/collisions.c:84: if ((current_tile >= 0x0D) && (current_tile <= 0x16)) {  // POINT TO DARK GREEN MOTHERSHIP
	bit	0, c
	jr	NZ, 00146$
	ld	a, #0x16
	sub	a, (hl)
	jr	C, 00146$
	C$collisions.c$86$3_1$123	= .
	.globl	C$collisions.c$86$3_1$123
;src/collisions.c:86: current_tile_change = &npc_tile_mothership_green[0];
	ldhl	sp,	#0
	ld	a, #<(_npc_tile_mothership_green)
	ld	(hl+), a
	ld	(hl), #>(_npc_tile_mothership_green)
	jr	00147$
00146$:
	C$collisions.c$87$2_1$122	= .
	.globl	C$collisions.c$87$2_1$122
;src/collisions.c:87: } else if ((current_tile >= 0x17) && (current_tile <= 0x24)) {  // POINT TO LIGHT GREEN MOTHERSHIP
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x17
	jr	C, 00147$
	ld	a, #0x24
	sub	a, (hl)
	jr	C, 00147$
	C$collisions.c$89$3_1$124	= .
	.globl	C$collisions.c$89$3_1$124
;src/collisions.c:89: current_tile_change = &npc_tile_mothership_dead[0];
	ldhl	sp,	#0
	ld	(hl), #<(_npc_tile_mothership_dead)
	inc	hl
	ld	(hl), #>(_npc_tile_mothership_dead)
00147$:
	C$collisions.c$92$2_1$122	= .
	.globl	C$collisions.c$92$2_1$122
;src/collisions.c:92: if ((current_tile == MOTHERSHIPS_BOTTOMS) && (bulletx - tile_x >= 6)) {  // IF PLAYER HITS BOTTOM OF BOTH DARK GREEN MOTHERSHIPS
	ld	a, (#(_npc_tile_mothership + 7) + 0)
	ldhl	sp,	#15
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#15
	sub	a, (hl)
	ld	a, #0x01
	jr	Z, 00482$
	xor	a, a
00482$:
	ldhl	sp,	#19
	ld	(hl), a
	C$collisions.c$95$1_1$107	= .
	.globl	C$collisions.c$95$1_1$107
;src/collisions.c:95: set_bkg_tile_xy(index_X, index_Y - 1, current_tile_change[11]);      // MOTHERSHIPS_TOP_RIGHT_GREEN_TOP_LEFT
	ldhl	sp,	#11
	ld	a, (hl)
	dec	a
	ldhl	sp,	#8
	ld	(hl), a
	C$collisions.c$92$1_1$107	= .
	.globl	C$collisions.c$92$1_1$107
;src/collisions.c:92: if ((current_tile == MOTHERSHIPS_BOTTOMS) && (bulletx - tile_x >= 6)) {  // IF PLAYER HITS BOTTOM OF BOTH DARK GREEN MOTHERSHIPS
	ldhl	sp,	#17
	ld	a, (hl+)
	sub	a, #0x06
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00483$
	bit	7, d
	jr	NZ, 00484$
	cp	a, a
	jr	00484$
00483$:
	bit	7, d
	jr	Z, 00484$
	scf
00484$:
	ld	a, #0x00
	rla
	ld	c, a
	ldhl	sp,	#19
	ld	a, (hl)
	or	a, a
	jr	Z, 00162$
	bit	0, c
	jr	NZ, 00162$
	C$collisions.c$93$3_1$125	= .
	.globl	C$collisions.c$93$3_1$125
;src/collisions.c:93: set_bkg_tile_xy(index_X, index_Y, current_tile_change[13]);          // MOTHERSHIPS_BOTTOM_RIGHT_GREEN_BOTTOM_LEFT
	pop	de
	push	de
	ld	hl, #0x000d
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$94$3_1$125	= .
	.globl	C$collisions.c$94$3_1$125
;src/collisions.c:94: set_bkg_tile_xy(index_X + 1, index_Y, current_tile_change[5]);       // MOTHERSHIP_BOTTOM_RIGHT_GREEN
	pop	de
	push	de
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$95$3_1$125	= .
	.globl	C$collisions.c$95$3_1$125
;src/collisions.c:95: set_bkg_tile_xy(index_X, index_Y - 1, current_tile_change[11]);      // MOTHERSHIPS_TOP_RIGHT_GREEN_TOP_LEFT
	pop	de
	push	de
	ld	hl, #0x000b
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$96$3_1$125	= .
	.globl	C$collisions.c$96$3_1$125
;src/collisions.c:96: set_bkg_tile_xy(index_X + 1, index_Y - 1, current_tile_change[1]);   // MOTHERSHIP_TOP_RIGHT_GREEN
	pop	bc
	push	bc
	inc	bc
	ld	a, (bc)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$97$3_1$125	= .
	.globl	C$collisions.c$97$3_1$125
;src/collisions.c:97: return 0x01U;
	ld	e, #0x01
	jp	00200$
00162$:
	C$collisions.c$98$2_1$122	= .
	.globl	C$collisions.c$98$2_1$122
;src/collisions.c:98: } else if ((current_tile == MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN) && (bulletx - tile_x >= 6)) {  //// IF PLAYER HITS RIGHT SIDE OF BOTH DARK GREEN MOTHERSHIPS BOTTOMS, WHILE LEFT IS GREEN
	ld	a, (#(_npc_tile_mothership_green + 12) + 0)
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#16
	sub	a, (hl)
	ld	a, #0x01
	jr	Z, 00486$
	xor	a, a
00486$:
	ldhl	sp,	#20
	C$collisions.c$99$1_1$107	= .
	.globl	C$collisions.c$99$1_1$107
;src/collisions.c:99: set_bkg_tile_xy(index_X, index_Y, MOTHERSHIPS_BOTTOMS_GREEN);                                      // MOTHERSHIPS_BOTTOMS_GREEN
	C$collisions.c$100$1_1$107	= .
	.globl	C$collisions.c$100$1_1$107
;src/collisions.c:100: set_bkg_tile_xy(index_X + 1, index_Y, MOTHERSHIP_BOTTOM_RIGHT_GREEN);                              // MOTHERSHIP_BOTTOM_RIGHT_GREEN
	C$collisions.c$101$1_1$107	= .
	.globl	C$collisions.c$101$1_1$107
;src/collisions.c:101: set_bkg_tile_xy(index_X, index_Y - 1, MOTHERSHIP_TOPS_GREEN);                                      // MOTHERSHIP_TOPS_GREEN
	C$collisions.c$102$1_1$107	= .
	.globl	C$collisions.c$102$1_1$107
;src/collisions.c:102: set_bkg_tile_xy(index_X + 1, index_Y - 1, MOTHERSHIP_TOP_RIGHT_GREEN);                             // MOTHERSHIP_TOP_RIGHT_GREEN
	C$collisions.c$98$2_1$122	= .
	.globl	C$collisions.c$98$2_1$122
;src/collisions.c:98: } else if ((current_tile == MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN) && (bulletx - tile_x >= 6)) {  //// IF PLAYER HITS RIGHT SIDE OF BOTH DARK GREEN MOTHERSHIPS BOTTOMS, WHILE LEFT IS GREEN
	ld	(hl), a
	or	a, a
	jr	Z, 00158$
	bit	0, c
	jr	NZ, 00158$
	C$collisions.c$99$3_1$126	= .
	.globl	C$collisions.c$99$3_1$126
;src/collisions.c:99: set_bkg_tile_xy(index_X, index_Y, MOTHERSHIPS_BOTTOMS_GREEN);                                      // MOTHERSHIPS_BOTTOMS_GREEN
	ld	a, (#(_npc_tile_mothership_green + 7) + 0)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$100$3_1$126	= .
	.globl	C$collisions.c$100$3_1$126
;src/collisions.c:100: set_bkg_tile_xy(index_X + 1, index_Y, MOTHERSHIP_BOTTOM_RIGHT_GREEN);                              // MOTHERSHIP_BOTTOM_RIGHT_GREEN
	ld	a, (#(_npc_tile_mothership_green + 5) + 0)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$101$3_1$126	= .
	.globl	C$collisions.c$101$3_1$126
;src/collisions.c:101: set_bkg_tile_xy(index_X, index_Y - 1, MOTHERSHIP_TOPS_GREEN);                                      // MOTHERSHIP_TOPS_GREEN
	ld	a, (#(_npc_tile_mothership_green + 2) + 0)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$102$3_1$126	= .
	.globl	C$collisions.c$102$3_1$126
;src/collisions.c:102: set_bkg_tile_xy(index_X + 1, index_Y - 1, MOTHERSHIP_TOP_RIGHT_GREEN);                             // MOTHERSHIP_TOP_RIGHT_GREEN
	ld	a, (#(_npc_tile_mothership_green + 1) + 0)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$103$3_1$126	= .
	.globl	C$collisions.c$103$3_1$126
;src/collisions.c:103: return 0x01U;
	ld	e, #0x01
	jp	00200$
00158$:
	C$collisions.c$104$2_1$122	= .
	.globl	C$collisions.c$104$2_1$122
;src/collisions.c:104: } else if (current_tile == MOTHERSHIP_BOTTOM_RIGHT && (bulletx - tile_x <= 6)) {  // IF PLAYER HITS BOTTOM RIGHT OF DARK GREEN MOTHERSHIP
	ld	a, (#(_npc_tile_mothership + 5) + 0)
	ldhl	sp,	#14
	ld	(hl), a
	C$collisions.c$106$1_1$107	= .
	.globl	C$collisions.c$106$1_1$107
;src/collisions.c:106: set_bkg_tile_xy(index_X - 1, index_Y, MOTHERSHIPS_BOTTOM_RIGHT_GREEN_BOTTOM_LEFT);  // MOTHERSHIPS_BOTTOM_RIGHT_GREEN_BOTTOM_LEFT
	C$collisions.c$104$2_1$122	= .
	.globl	C$collisions.c$104$2_1$122
;src/collisions.c:104: } else if (current_tile == MOTHERSHIP_BOTTOM_RIGHT && (bulletx - tile_x <= 6)) {  // IF PLAYER HITS BOTTOM RIGHT OF DARK GREEN MOTHERSHIP
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#14
	sub	a, (hl)
	jp	NZ,00163$
	ldhl	sp,	#17
	ld	a, #0x06
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00489$
	bit	7, d
	jr	NZ, 00490$
	cp	a, a
	jr	00490$
00489$:
	bit	7, d
	jr	Z, 00490$
	scf
00490$:
	jp	C, 00163$
	C$collisions.c$105$3_1$127	= .
	.globl	C$collisions.c$105$3_1$127
;src/collisions.c:105: if (left_of_tile == MOTHERSHIPS_BOTTOMS) {
	ldhl	sp,	#13
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	NZ, 00152$
	C$collisions.c$106$4_1$128	= .
	.globl	C$collisions.c$106$4_1$128
;src/collisions.c:106: set_bkg_tile_xy(index_X - 1, index_Y, MOTHERSHIPS_BOTTOM_RIGHT_GREEN_BOTTOM_LEFT);  // MOTHERSHIPS_BOTTOM_RIGHT_GREEN_BOTTOM_LEFT
	ld	a, (#(_npc_tile_mothership_green + 13) + 0)
	ldhl	sp,#20
	ld	(hl), a
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$107$4_1$128	= .
	.globl	C$collisions.c$107$4_1$128
;src/collisions.c:107: set_bkg_tile_xy(index_X - 1, index_Y - 1, MOTHERSHIPS_TOP_RIGHT_GREEN_TOP_LEFT);    // MOTHERSHIPS_TOP_RIGHT_GREEN_TOP_LEFT
	ld	a, (#(_npc_tile_mothership_green + 11) + 0)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jr	00153$
00152$:
	C$collisions.c$108$3_1$127	= .
	.globl	C$collisions.c$108$3_1$127
;src/collisions.c:108: } else if (left_of_tile == MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN) {
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#16
	sub	a, (hl)
	jr	NZ, 00153$
	C$collisions.c$109$4_1$129	= .
	.globl	C$collisions.c$109$4_1$129
;src/collisions.c:109: set_bkg_tile_xy(index_X - 1, index_Y, MOTHERSHIPS_BOTTOMS_GREEN);  // MOTHERSHIPS_BOTTOMS_GREEN
	ld	a, (#(_npc_tile_mothership_green + 7) + 0)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$110$4_1$129	= .
	.globl	C$collisions.c$110$4_1$129
;src/collisions.c:110: set_bkg_tile_xy(index_X - 1, index_Y - 1, MOTHERSHIP_TOPS_GREEN);  // MOTHERSHIP_TOPS_GREEN
	ld	a, (#(_npc_tile_mothership_green + 2) + 0)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00153$:
	C$collisions.c$112$3_1$127	= .
	.globl	C$collisions.c$112$3_1$127
;src/collisions.c:112: set_bkg_tile_xy(index_X, index_Y, MOTHERSHIP_BOTTOM_RIGHT_GREEN);   // MOTHERSHIP_BOTTOM_RIGHT_GREEN
	ld	a, (#(_npc_tile_mothership_green + 5) + 0)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$113$3_1$127	= .
	.globl	C$collisions.c$113$3_1$127
;src/collisions.c:113: set_bkg_tile_xy(index_X, index_Y - 1, MOTHERSHIP_TOP_RIGHT_GREEN);  // MOTHERSHIP_TOP_RIGHT_GREEN
	ld	a, (#(_npc_tile_mothership_green + 1) + 0)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$114$3_1$127	= .
	.globl	C$collisions.c$114$3_1$127
;src/collisions.c:114: return 0x01U;
	ld	e, #0x01
	jp	00200$
00163$:
	C$collisions.c$124$2_1$122	= .
	.globl	C$collisions.c$124$2_1$122
;src/collisions.c:124: if ((current_tile == MOTHERSHIP_BOTTOM_LEFT) && (bulletx - tile_x >= 2)) {
	ld	hl, #_npc_tile_mothership + 6
	ld	c, (hl)
	C$collisions.c$132$1_1$107	= .
	.globl	C$collisions.c$132$1_1$107
;src/collisions.c:132: set_bkg_tile_xy(index_X, index_Y, MOTHERSHIP_BOTTOM_LEFT_GREEN);   // MOTHERSHIP_BOTTOM_LEFT_GREEN
	C$collisions.c$124$1_1$107	= .
	.globl	C$collisions.c$124$1_1$107
;src/collisions.c:124: if ((current_tile == MOTHERSHIP_BOTTOM_LEFT) && (bulletx - tile_x >= 2)) {
	ldhl	sp,	#17
	ld	a, (hl+)
	sub	a, #0x02
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00495$
	bit	7, d
	jr	NZ, 00496$
	cp	a, a
	jr	00496$
00495$:
	bit	7, d
	jr	Z, 00496$
	scf
00496$:
	ld	a, #0x00
	rla
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	jp	NZ,00191$
	ldhl	sp,	#9
	bit	0, (hl)
	jp	NZ, 00191$
	C$collisions.c$125$3_1$130	= .
	.globl	C$collisions.c$125$3_1$130
;src/collisions.c:125: if (right_of_tile == MOTHERSHIPS_BOTTOMS) {
	dec	hl
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#15
	sub	a, (hl)
	jr	NZ, 00168$
	C$collisions.c$126$4_1$131	= .
	.globl	C$collisions.c$126$4_1$131
;src/collisions.c:126: set_bkg_tile_xy(index_X + 1, index_Y, MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN);  // MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN
	ldhl	sp,	#16
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$127$4_1$131	= .
	.globl	C$collisions.c$127$4_1$131
;src/collisions.c:127: set_bkg_tile_xy(index_X + 1, index_Y - 1, MOTHERSHIPS_TOP_RIGHT_TOP_LEFT_GREEN);    // MOTHERSHIPS_TOP_RIGHT_TOP_LEFT_GREEN
	ld	a, (#(_npc_tile_mothership_green + 10) + 0)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jr	00169$
00168$:
	C$collisions.c$128$3_1$130	= .
	.globl	C$collisions.c$128$3_1$130
;src/collisions.c:128: } else if (right_of_tile == MOTHERSHIPS_BOTTOM_RIGHT_GREEN_BOTTOM_LEFT) {
	ld	hl, #(_npc_tile_mothership_green + 13)
	ld	c, (hl)
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00169$
	C$collisions.c$129$4_1$132	= .
	.globl	C$collisions.c$129$4_1$132
;src/collisions.c:129: set_bkg_tile_xy(index_X + 1, index_Y, MOTHERSHIPS_BOTTOMS_GREEN);  // MOTHERSHIPS_BOTTOMS_GREEN
	ld	a, (#(_npc_tile_mothership_green + 7) + 0)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$130$4_1$132	= .
	.globl	C$collisions.c$130$4_1$132
;src/collisions.c:130: set_bkg_tile_xy(index_X + 1, index_Y - 1, MOTHERSHIP_TOPS_GREEN);  // MOTHERSHIP_TOPS_GREEN
	ld	a, (#(_npc_tile_mothership_green + 2) + 0)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00169$:
	C$collisions.c$132$3_1$130	= .
	.globl	C$collisions.c$132$3_1$130
;src/collisions.c:132: set_bkg_tile_xy(index_X, index_Y, MOTHERSHIP_BOTTOM_LEFT_GREEN);   // MOTHERSHIP_BOTTOM_LEFT_GREEN
	ld	a, (#(_npc_tile_mothership_green + 6) + 0)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$133$3_1$130	= .
	.globl	C$collisions.c$133$3_1$130
;src/collisions.c:133: set_bkg_tile_xy(index_X, index_Y - 1, MOTHERSHIP_TOP_LEFT_GREEN);  // MOTHERSHIP_TOP_LEFT_GREEN
	ld	a, (#_npc_tile_mothership_green + 0)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$135$3_1$130	= .
	.globl	C$collisions.c$135$3_1$130
;src/collisions.c:135: return 0x01U;
	ld	e, #0x01
	jp	00200$
00191$:
	C$collisions.c$137$1_1$107	= .
	.globl	C$collisions.c$137$1_1$107
;src/collisions.c:137: set_bkg_tile_xy(index_X, index_Y - 1, current_tile_change[10]);                                                                                                        // MOTHERSHIPS_TOP_RIGHT_TOP_LEFT_GREEN
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
	C$collisions.c$138$1_1$107	= .
	.globl	C$collisions.c$138$1_1$107
;src/collisions.c:138: set_bkg_tile_xy(index_X, index_Y, current_tile_change[12]);                                                                                                            // MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN
	pop	de
	push	de
	ld	hl, #0x000c
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl), a
	C$collisions.c$139$1_1$107	= .
	.globl	C$collisions.c$139$1_1$107
;src/collisions.c:139: set_bkg_tile_xy(index_X - 1, index_Y, current_tile_change[6]);                                                                                                         // MOTHERSHIP_BOTTOM_LEFT_GREEN
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	C$collisions.c$136$1_1$107	= .
	.globl	C$collisions.c$136$1_1$107
;src/collisions.c:136: } else if ((current_tile == MOTHERSHIPS_BOTTOMS) && (bulletx - tile_x <= 3) || (current_tile == MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN) && (bulletx - tile_x <= 3)) {  // IF PLAYER HITS LEFT SIDE OF BOTH DARK GREEN MOTHERSHIPS BOTTOMS
	ld	(hl+), a
	inc	hl
	ld	a, #0x03
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00503$
	bit	7, d
	jr	NZ, 00504$
	cp	a, a
	jr	00504$
00503$:
	bit	7, d
	jr	Z, 00504$
	scf
00504$:
	ld	a, #0x00
	rla
	ld	c, a
	ldhl	sp,	#19
	ld	a, (hl)
	or	a, a
	jr	Z, 00189$
	bit	0, c
	jr	Z, 00184$
00189$:
	ldhl	sp,	#20
	ld	a, (hl)
	or	a, a
	jr	Z, 00185$
	bit	0, c
	jr	NZ, 00185$
00184$:
	C$collisions.c$137$3_1$133	= .
	.globl	C$collisions.c$137$3_1$133
;src/collisions.c:137: set_bkg_tile_xy(index_X, index_Y - 1, current_tile_change[10]);                                                                                                        // MOTHERSHIPS_TOP_RIGHT_TOP_LEFT_GREEN
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$138$3_1$133	= .
	.globl	C$collisions.c$138$3_1$133
;src/collisions.c:138: set_bkg_tile_xy(index_X, index_Y, current_tile_change[12]);                                                                                                            // MOTHERSHIPS_BOTTOM_RIGHT_BOTTOM_LEFT_GREEN
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$139$3_1$133	= .
	.globl	C$collisions.c$139$3_1$133
;src/collisions.c:139: set_bkg_tile_xy(index_X - 1, index_Y, current_tile_change[6]);                                                                                                         // MOTHERSHIP_BOTTOM_LEFT_GREEN
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$140$3_1$133	= .
	.globl	C$collisions.c$140$3_1$133
;src/collisions.c:140: set_bkg_tile_xy(index_X - 1, index_Y - 1, current_tile_change[0]);                                                                                                     // MOTHERSHIP_TOP_LEFT_GREEN
	pop	de
	push	de
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$141$3_1$133	= .
	.globl	C$collisions.c$141$3_1$133
;src/collisions.c:141: return 0x01U;
	ld	e, #0x01
	jp	00200$
00185$:
	C$collisions.c$144$2_1$122	= .
	.globl	C$collisions.c$144$2_1$122
;src/collisions.c:144: else if ((current_tile == MOTHERSHIPS_BOTTOMS_GREEN) && (bulletx - tile_x <= 3)) {
	ld	hl, #(_npc_tile_mothership_green + 7)
	ld	b, (hl)
	C$collisions.c$145$1_1$107	= .
	.globl	C$collisions.c$145$1_1$107
;src/collisions.c:145: set_bkg_tile_xy(index_X, index_Y - 1, current_tile_change[3]);      //
	pop	de
	push	de
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#18
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#17
	ld	(hl), a
	C$collisions.c$146$1_1$107	= .
	.globl	C$collisions.c$146$1_1$107
;src/collisions.c:146: set_bkg_tile_xy(index_X, index_Y, current_tile_change[8]);          //
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#20
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#19
	ld	(hl), a
	C$collisions.c$144$2_1$122	= .
	.globl	C$collisions.c$144$2_1$122
;src/collisions.c:144: else if ((current_tile == MOTHERSHIPS_BOTTOMS_GREEN) && (bulletx - tile_x <= 3)) {
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00181$
	bit	0, c
	jr	NZ, 00181$
	C$collisions.c$145$3_1$134	= .
	.globl	C$collisions.c$145$3_1$134
;src/collisions.c:145: set_bkg_tile_xy(index_X, index_Y - 1, current_tile_change[3]);      //
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$146$3_1$134	= .
	.globl	C$collisions.c$146$3_1$134
;src/collisions.c:146: set_bkg_tile_xy(index_X, index_Y, current_tile_change[8]);          //
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$147$3_1$134	= .
	.globl	C$collisions.c$147$3_1$134
;src/collisions.c:147: set_bkg_tile_xy(index_X - 1, index_Y, current_tile_change[6]);      //
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$148$3_1$134	= .
	.globl	C$collisions.c$148$3_1$134
;src/collisions.c:148: set_bkg_tile_xy(index_X - 1, index_Y - 1, current_tile_change[0]);  //
	pop	de
	push	de
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$149$3_1$134	= .
	.globl	C$collisions.c$149$3_1$134
;src/collisions.c:149: return 0x01U;
	ld	e, #0x01
	jp	00200$
00181$:
	C$collisions.c$150$2_1$122	= .
	.globl	C$collisions.c$150$2_1$122
;src/collisions.c:150: } else if ((current_tile == MOTHERSHIPS_BOTTOM_RIGHT_GREEN_BOTTOM_LEFT) && (bulletx - tile_x <= 3)) {
	ld	a, (#(_npc_tile_mothership_green + 13) + 0)
	ldhl	sp,	#20
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#20
	sub	a, (hl)
	jr	NZ, 00177$
	bit	0, c
	jr	NZ, 00177$
	C$collisions.c$151$3_1$135	= .
	.globl	C$collisions.c$151$3_1$135
;src/collisions.c:151: set_bkg_tile_xy(index_X, index_Y - 1, current_tile_change[3]);      //
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$152$3_1$135	= .
	.globl	C$collisions.c$152$3_1$135
;src/collisions.c:152: set_bkg_tile_xy(index_X, index_Y, current_tile_change[7]);          //
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$153$3_1$135	= .
	.globl	C$collisions.c$153$3_1$135
;src/collisions.c:153: set_bkg_tile_xy(index_X - 1, index_Y, current_tile_change[6]);      //
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$154$3_1$135	= .
	.globl	C$collisions.c$154$3_1$135
;src/collisions.c:154: set_bkg_tile_xy(index_X - 1, index_Y - 1, current_tile_change[0]);  //
	pop	de
	push	de
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$155$3_1$135	= .
	.globl	C$collisions.c$155$3_1$135
;src/collisions.c:155: return 0x01U;
	ld	e, #0x01
	jp	00200$
00177$:
	C$collisions.c$156$2_1$122	= .
	.globl	C$collisions.c$156$2_1$122
;src/collisions.c:156: } else if ((current_tile == MOTHERSHIP_BOTTOM_LEFT_GREEN) && (bulletx - tile_x >= 2)) {
	ld	hl, #(_npc_tile_mothership_green + 6)
	ld	c, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	jp	NZ,00198$
	ldhl	sp,	#9
	bit	0, (hl)
	jp	NZ, 00198$
	C$collisions.c$157$3_1$136	= .
	.globl	C$collisions.c$157$3_1$136
;src/collisions.c:157: if (right_of_tile == MOTHERSHIPS_BOTTOMS_GREEN) {
	dec	hl
	dec	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00171$
	C$collisions.c$158$4_1$137	= .
	.globl	C$collisions.c$158$4_1$137
;src/collisions.c:158: set_bkg_tile_xy(index_X + 1, index_Y, current_tile_change[8]);      //
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$159$4_1$137	= .
	.globl	C$collisions.c$159$4_1$137
;src/collisions.c:159: set_bkg_tile_xy(index_X + 1, index_Y - 1, current_tile_change[3]);  //
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jr	00172$
00171$:
	C$collisions.c$161$4_1$138	= .
	.globl	C$collisions.c$161$4_1$138
;src/collisions.c:161: set_bkg_tile_xy(index_X + 1, index_Y, current_tile_change[12]);      //
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#20
	ld	(hl), a
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$162$4_1$138	= .
	.globl	C$collisions.c$162$4_1$138
;src/collisions.c:162: set_bkg_tile_xy(index_X + 1, index_Y - 1, current_tile_change[10]);  //
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00172$:
	C$collisions.c$164$3_1$136	= .
	.globl	C$collisions.c$164$3_1$136
;src/collisions.c:164: set_bkg_tile_xy(index_X, index_Y - 1, current_tile_change[0]);  //
	pop	de
	push	de
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$165$3_1$136	= .
	.globl	C$collisions.c$165$3_1$136
;src/collisions.c:165: set_bkg_tile_xy(index_X, index_Y, current_tile_change[6]);      //
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
	C$collisions.c$167$3_1$136	= .
	.globl	C$collisions.c$167$3_1$136
;src/collisions.c:167: return 0x01U;
	ld	e, #0x01
	jr	00200$
00198$:
	C$collisions.c$170$1_1$108	= .
	.globl	C$collisions.c$170$1_1$108
;src/collisions.c:170: return 0x00U;  // NOTE: the first return of the function will end the execution of the function
	ld	e, #0x00
00200$:
	C$collisions.c$171$1_1$107	= .
	.globl	C$collisions.c$171$1_1$107
;src/collisions.c:171: }
	add	sp, #21
	C$collisions.c$171$1_1$107	= .
	.globl	C$collisions.c$171$1_1$107
	XG$collide_bullet$0$0	= .
	.globl	XG$collide_bullet$0$0
	ret
	.area _CODE
	.area _INITIALIZER
Fcollisions$__xinit_npc_tile_bee$0_0$0 == .
__xinit__npc_tile_bee:
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
Fcollisions$__xinit_npc_tile_wasp$0_0$0 == .
__xinit__npc_tile_wasp:
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
Fcollisions$__xinit_npc_tile_mothership$0_0$0 == .
__xinit__npc_tile_mothership:
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
Fcollisions$__xinit_npc_tile_mothership_green$0_0$0 == .
__xinit__npc_tile_mothership_green:
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
Fcollisions$__xinit_npc_tile_mothership_dead$0_0$0 == .
__xinit__npc_tile_mothership_dead:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x22	; 34
	.db #0x15	; 21
	.db #0x24	; 36
	.area _CABS (ABS)
