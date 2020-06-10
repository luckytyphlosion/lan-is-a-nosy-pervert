	.org 0x804d104
ACDCTown_OnInitMapScript:
	ms_jump_if_flag_set CS_VAR_IMM, EVENT_402, @@checkAfterProtomanSPFight
	ms_set_event_flag CS_VAR_IMM, EVENT_402
	ms_set_enter_map_screen_fade 0x1c, 0xff
	ms_start_cutscene ACDCTown_ChaudConfrontsLanCutsceneScript, 0x0
	ms_end

@@checkAfterProtomanSPFight:
	ms_jump_if_flag_clear CS_VAR_IMM, EVENT_403, @@noCutscene
	ms_clear_event_flag CS_VAR_IMM, EVENT_403
	ms_set_enter_map_screen_fade 0xc, 0xff
	ms_start_cutscene ACDCTown_AfterLanWinsCutsceneScript, 0x0
@@noCutscene:
	ms_end

	.org 0x804d2a0
ACDCTown_ContinuousMapScript_804d2a0:
	ms_end

	.org 0x804def0
ACDCTown_ChaudConfrontsLanCutsceneNPCs:
	.word ACDCTown_Lan_ChaudConfrontsLanCutsceneNPCScript
	.word ACDCTown_ScientistMan_ChaudConfrontsLanCutsceneNPCScript
	.word ACDCTown_Chaud_ChaudConfrontsLanCutsceneNPCScript
	.word 0xff

ACDCTown_Lan_ChaudConfrontsLanCutsceneNPCScript:
	npc_set_active_and_visible
	npc_disable_collision
	npc_disable_collision_alternate
	npc_set_sprite 0 // lan
	npc_set_coords 0xff67, 0x61, 0
	npc_set_animation 9 // SPR_ANIM_NPC_LAN_WALK_UP_RIGHT
	npc_wait_cutscene_var 0x8, 1
	npc_move_in_direction OW_UP_RIGHT, 16, 19
	npc_set_animation 15 // SPR_ANIM_NPC_LAN_WALK_UP_LEFT
	npc_move_in_direction OW_UP_LEFT, 16, 3
	npc_set_animation 7 // SPR_ANIM_NPC_LAN_FACE_UP_LEFT
	npc_write_cutscene_var 0x8, 2
	npc_wait_cutscene_var 0x8, 3
	npc_jump_with_link NPCScript_StationaryNPC

ACDCTown_ScientistMan_ChaudConfrontsLanCutsceneNPCScript:
	npc_set_active_and_visible
	npc_set_sprite 21 // scientist man
	npc_set_coords 65520, 162, 0
	npc_set_animation 7 // up left
	npc_jump_with_link NPCScript_StationaryNPC

ACDCTown_Chaud_ChaudConfrontsLanCutsceneNPCScript:
	npc_set_active_and_visible
	//npc_disable_collision
	//npc_disable_collision_alternate
	npc_set_sprite 4 // chaud
	npc_set_coords 0xffff, 0x38, 0
	npc_set_animation 3 // SPR_ANIM_NPC_CHAUD_FACE_DOWN_RIGHT

	// allows the initial script to be doubled
	// as the script after the battle
	npc_wait_cutscene_var 0x8, 4
	npc_set_animation 8 // SPR_ANIM_NPC_CHAUD_WALK_UP_RIGHT
	npc_move_in_direction OW_UP_RIGHT, 8, 2
	npc_set_animation 5 // SPR_ANIM_NPC_CHAUD_FACE_DOWN_LEFT
	npc_write_cutscene_var 0x8, 5
	npc_jump_with_link NPCScript_StationaryNPC

	.align 4, 0
ACDCTown_AfterLanWinsCutsceneNPCs:
	.word ACDCTown_Lan_AfterLanWinsCutsceneNPCScript
	.word ACDCTown_ScientistMan_ChaudConfrontsLanCutsceneNPCScript
	.word ACDCTown_Chaud_ChaudConfrontsLanCutsceneNPCScript
	.word 0xff

ACDCTown_Lan_AfterLanWinsCutsceneNPCScript:
	npc_set_active_and_visible
	npc_disable_collision
	npc_disable_collision_alternate
	npc_set_sprite 0 // lan
	npc_set_coords 0xffff, 0x49, 0
	npc_set_animation 7 // SPR_ANIM_NPC_LAN_FACE_UP_LEFT
	npc_wait_cutscene_var 0x8, 5
	npc_pause 10
	npc_set_animation 9 // SPR_ANIM_NPC_LAN_WALK_UP_RIGHT
	npc_move_in_direction OW_UP_RIGHT, 16, 1
	npc_run_secondary_script @@fadeOutAlphaCutsceneNPCScript
	npc_set_animation 23 // SPR_ANIM_NPC_LAN_RUN_UP_LEFT
	npc_move_in_direction OW_UP_LEFT, 16, 4
	npc_write_cutscene_var 0x8, 6
	npc_jump_with_link NPCScript_StationaryNPC

@@fadeOutAlphaCutsceneNPCScript:
	npc_pause_secondary_script 20
	// jump to an internal script, after the internal script's pause
	npc_jump ACDCTown_CutsceneNPCScript_804dbd1 + 2

	.org 0x8081454
ACDCTown_FixCameraCutsceneCameraScript:
	ccs_set_camera_pos 0xfff6 * 0x10, 0x5a * 0x10, 0
	ccs_end

ACDCTown_EventuallyScrollWithLanCameraScript:
	ccs_wait 145
	ccs_simple_scroll 9, 256, 0, 0
	ccs_wait 6
	ccs_write_camera_field_03_14 eOverworldNPCObject0_X
	ccs_end

ACDCTown_CameraAtMaylsHouseCameraScript:
	ccs_set_camera_pos 0xffff * 0x10, 0x49 * 0x10, 0
	ccs_end

	.org 0x8081490
ACDCTown_ChaudConfrontsLanCutsceneScript:
	cs_lock_player_for_non_npc_dialogue_809e0b0
	cs_decomp_text_archive 0x887a3b84
	cs_run_cutscene_camera_script ACDCTown_FixCameraCutsceneCameraScript
	cs_spawn_ow_npc_objects_from_list ACDCTown_ChaudConfrontsLanCutsceneNPCs
	// this pause must be here so that the ow player code
	// will run the initialization step
	// omitting this pause, or putting the pause after
	// cs_make_ow_player_invisible will cause the ow player
	// to stay visible, as part of the initialization step
	// for the ow player is making the ow player visible
	cs_pause CS_VAR_IMM, 1
	cs_make_ow_player_invisible
	cs_set_screen_fade CS_VAR_IMM, 0x8, 0x8
	cs_wait_screen_fade
	cs_set_cutscene_skip_script @@skipToBattleHook
	cs_pause CS_VAR_IMM, 50
	cs_run_cutscene_camera_script ACDCTown_EventuallyScrollWithLanCameraScript
	cs_set_var 0x8, 1
	cs_wait_var_equal 0x8, 2
	cs_run_text_script CS_VAR_IMM, 0
	cs_wait_chatbox 0x80

@@skipToBattle:
	cs_disable_cutscene_skip_script
	cs_set_event_flag CS_VAR_IMM, EVENT_403
	cs_pause CS_VAR_IMM, 20
	cs_start_fixed_battle 24

	cs_enable_ow_player_wall_collision_809e248
	cs_unlock_player_after_non_npc_dialogue_809e122
	cs_pause CS_VAR_IMM, 1
	cs_end_for_map_reload_maybe_8037c64

@@skipToBattleHook:
	cs_set_chatbox_flags 0x40
	cs_jump @@skipToBattle

ACDCTown_AfterLanWinsCutsceneScript:
	cs_lock_player_for_non_npc_dialogue_809e0b0
	cs_decomp_text_archive 0x887A41C8
	cs_spawn_ow_npc_objects_from_list ACDCTown_AfterLanWinsCutsceneNPCs
	cs_pause CS_VAR_IMM, 1
	cs_run_cutscene_camera_script ACDCTown_CameraAtMaylsHouseCameraScript
	cs_make_ow_player_invisible
	cs_set_screen_fade CS_VAR_IMM, 0x8, 0x8
	cs_wait_screen_fade
	cs_pause CS_VAR_IMM, 90
	cs_run_text_script CS_VAR_IMM, 0
	cs_wait_chatbox 0x80
	cs_pause CS_VAR_IMM, 30
	cs_set_var 0x8, 4
	cs_wait_var_equal 0x8, 6
	cs_sound_cmd_803810e 0x4, 0x1f
	cs_set_screen_fade CS_VAR_IMM, 0x1c, 0x10
	cs_wait_screen_fade
	cs_pause CS_VAR_IMM, 20
	cs_play_music SONG_PANIC
	cs_run_text_script CS_VAR_IMM, 1
	cs_wait_chatbox 0x80
	cs_play_sound SOUND_EXPLOSION_C3
	cs_pause CS_VAR_IMM, 30
	cs_set_enter_map_screen_fade 0x8, 0x10
	cs_warp_cmd_8038040_2 0x0, MAP_GROUP_TRANSITION_TYPE_SAME_MAP_GROUP_TYPE, ACDCTown_AfterLanWinsCutsceneWarpData
	cs_make_ow_player_visible
	cs_enable_ow_player_wall_collision_809e248
	cs_unlock_player_after_non_npc_dialogue_809e122
	cs_end_for_map_reload_maybe_8037c64

ACDCTown_AfterLanWinsCutsceneWarpData:
	.byte GROUP_ACDC_TOWN
	.byte MAP_ACDC_TOWN
	.byte 0 // fade to black
	.byte OW_DOWN_RIGHT
	.word 0xffff0000
	.word 0x380000
	.word 0

	.org 0x87A3B84
	.import "temp/ChaudConfrontsLan.msg.lz"

	.org 0x87A41C8
	.import "temp/AfterLanWins.msg.lz"

	.org 0x80aeff8 // address for protoman SP flags
	// start with max HP | recover to max HP after battle | folder is randomized | allow game over
	.word 0x4 | 0x10 | 0x80 | 0x100
