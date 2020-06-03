
	.org 0x804d104
ACDCTown_OnInitMapScript:
	ms_jump_if_flag_set CS_VAR_IMM, EVENT_402, @@noCutscene
	ms_set_event_flag CS_VAR_IMM, EVENT_402
	ms_set_enter_map_screen_fade 0x1c, 0xff
	ms_start_cutscene ACDCTown_CutsceneScript, 0x0

@@noCutscene:
	ms_end
	
	.org 0x8081490
ACDCTown_CutsceneScript:
	cs_lock_player_for_non_npc_dialogue_809e0b0
	cs_decomp_text_archive 0x887a3b84
	cs_make_ow_player_invisible
	cs_set_screen_fade CS_VAR_IMM, 0x8, 0x8
	cs_wait_screen_fade
	cs_run_text_script CS_VAR_IMM, 0
	cs_wait_chatbox 0x80
	cs_end_for_map_reload_maybe_8037c64

	.org 0x87A3B84
	.import "temp/7A3B84.msg.lz"
