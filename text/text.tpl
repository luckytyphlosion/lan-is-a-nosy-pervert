@archive ChaudConfrontsLan
@size 1

script 0 mmbn6 {
  mugshotShow
    mugshot = Lan
	msgOpen
	"""
	This is a test textbox.
	"""
	keyWait
		any = false
	clearMsg
	"""
	Split onto two lines.
	"""
	keyWait
		any = false
	clearMsg
	end
}

@archive AfterLanWins
@size 1

script 0 mmbn6 {
  mugshotShow
    mugshot = Lan
  msgOpen
  """
  (Yes! Now I get to see
  something...)
  """
  keyWait
    any = false
  clearMsg
  end
}
