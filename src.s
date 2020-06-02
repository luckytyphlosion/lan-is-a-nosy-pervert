
	.gba

	.include ver
	.include "constants.inc"
	.include "macros.inc"

	.open INPUT_FILE, OUTPUT_FILE, 0x8000000
	.org STARTING_MAP_ADDR
	.byte GROUP_ACDC_TOWN
	.byte MAP_ACDC_TOWN

	.close
