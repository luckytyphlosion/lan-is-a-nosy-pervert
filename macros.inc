
	.include "include/macros/enum.inc"
	.include "include/bytecode/map_script.inc"
	.include "include/bytecode/cutscene_script.inc"
	.include "include/bytecode/cutscene_camera_script.inc"
	.include "include/bytecode/npc_script.inc"

	.macro map_id map
	.byte GROUP_map, MAP_map
	.endm
