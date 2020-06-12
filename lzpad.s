
	.macro create_lz, filename
		.create filename + ".lz", 0
			.dw (filesize(filename) + 4) << 8
			.import filename
		.close
	.endmacro

	.gba

	create_lz "temp/ChaudConfrontsLan.msg"
	create_lz "temp/AfterLanWins.msg"
	create_lz "temp/LButtonScript.msg"
