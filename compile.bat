mkdir "temp" 2> nul

tools\TextPet ^
	Load-Plugins "tools\plugins" ^
	Game MMBN6 ^
	Read-Text-Archives "text" --recursive --format tpl ^
	Set-Compression true ^
	Write-Text-Archives "temp\\" --format msg ^
	Write-Text-Archives "temp\\" --format tpl

tools\armips lzpad.s
tools\lzss -ewn "temp\\ChaudConfrontsLan.msg.lz"
tools\lzss -ewn "temp\\AfterLanWins.msg.lz"
tools\lzss -ewn "temp\\LButtonScript.msg.lz"

tools\armips src.s -strequ ver "bn6f.s"
if errorlevel 1 pause
