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
@size 2

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

script 1 mmbn6 {
  mugshotShow
    mugshot = Mayl
  msgOpen
  """
  Eek!
  """
  keyWait
    any = false
  clearMsg
  end
}
