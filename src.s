
	.gba

	.include ver
	.include "macros.inc"
	.include "constants.inc"

	.open INPUT_FILE, OUTPUT_FILE, 0x8000000
	.org STARTING_MAP_ADDR
	.byte GROUP_ACDC_TOWN
	.byte MAP_ACDC_TOWN

	//// set max HP to 1000
	//.org 0x801348e
	//mov r0, #(1000 >> 2)
	//lsl r0, r0, #2
	//mov r1, #oNaviStats_CurHP 
	//strh r0, [r4,r1]
	//mov r1, #oNaviStats_MaxHP
	//strh r0, [r4,r1]
	//strh r0, [r4,#oNaviStats_MaxBaseHP]

	// set max HP to 1000
	.org 0x8013b80
	mov r0, 1000 >> 2
	lsl r0, r0, 2

	// set undershirt
	.org 0x80210dd + 4
	.byte 0x1

	// set b+left ability to shield
	.org 0x80210dd + 10
	.byte 0x3b

	// set regup to 50
	.org 0x801345e
	mov r0, 50

	// set chip shuffle
	.org 0x8013482
	mov r0, 1
	mov r1, oNaviStats_ChipShuffle
	strb r0, [r4,r1]

	// set buster stats to 3/5/5
	.org 0x801346e
	mov r0, 2
	strb r0, [r4,oNaviStats_Attack]
	mov r0, 4
	strb r0, [r4,oNaviStats_Speed]
	strb r0, [r4,oNaviStats_Charge]

	// set reg to slot 5 (antidmg *)
	.org 0x80134a8
	mov r0, 4

	// set tag 1 to slot 1
	.org 0x80134b4
	mov r0, 0

	// set tag 2 to slot 2
	.org 0x80134ba
	mov r0, 1
	mov r1, oNaviStats_Folder1Tag2
	strb r0, [r4,r1]

	// StartingFolder
	// don't have chip constants typed up so this is
	// just from a no$gba memory dump
	.org 0x80213ac
	.byte 0x7E, 0x22, 0x34, 0x22, 0x7E, 0x22, 0x7E, 0x22, 0xBB, 0x34, 0xBB, 0x34
	.byte 0xBB, 0x34, 0xBA, 0x34, 0xBC, 0x34, 0xC3, 0x34, 0x1D, 0x22, 0x1D, 0x22, 0xC4, 0x34, 0xC5, 0x34
	.byte 0xEC, 0x34, 0x3A, 0x22, 0x3A, 0x22, 0xAD, 0x34, 0xAE, 0x34, 0xB1, 0x34, 0xB1, 0x34, 0xB1, 0x34
	.byte 0x8B, 0x22, 0x26, 0x22, 0x26, 0x22, 0x34, 0x22, 0x34, 0x22, 0xB9, 0x22, 0xB8, 0x34, 0xB8, 0x34

	// fix sprite alpha
	.org 0x8002cac
	mov r0, 0x40

	// prevent jacking in at all
	.org 0x8034d34
	b loc_8034d44

	.org 0x8034d44
loc_8034d44:

	// prevent warps
	.org 0x80058d0
	mov pc, lr

	.include "cutscene.s"

	.close
