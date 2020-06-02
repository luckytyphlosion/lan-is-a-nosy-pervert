
	.org 0x804d104
ACDCTown_OnInitMapScript:
	ms_jump_if_flag_set EVENT_402, @@noCutscene
	ms_set_event_flag EVENT_402
	ms_set_enter_map_screen_fade 0x1c, 0xff
	ms_write_eStruct2001c04_byte 0x4, 0x63
	ms_start_cutscene ACDCTown_CutsceneScript, 0x0

@@noCutscene:
	ms_end
	
	.org 0x8081490
ACDCTown_CutsceneScript:
	cs_end
