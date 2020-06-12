@archive ChaudConfrontsLan
@size 1

script 0 mmbn6 {
  mugshotShow
    mugshot = Chaud
  msgOpen
  """
  Oh,no Lan. I know
  what you're trying to
  do. I'm not letting you
  """
  keyWait
    any = false
  clearMsg

  """
  in here.
  """
  keyWait
    any = false
  clearMsg

  mugshotShow
    mugshot = Lan
  """
  What do you think
  I'm trying to do then?
  Catch Maylu changing?
  """
   keyWait
    any = false
  clearMsg
  
  mugshotShow
    mugshot = Chaud
  """
  Uh yeah...
  """
  keyWait
    any = false
  clearMsg
  
  mugshotShow
    mugshot = Lan
  """
  That is SO untrue.
  Quit thinking like that.
  I'm not trying to.
  """
  keyWait
    any = false
  clearMsg
  
  mugshotShow
    mugshot = Chaud
  """
  Then why are you
  standing here?
  """
  keyWait
    any = false
  clearMsg

  mugshotShow
    mugshot = Lan
  """
  ...Why are you?
  """
  keyWait
    any = false
  clearMsg

  mugshotShow
    mugshot = Chaud
  """
  ...Guarding you.
  """
  keyWait
    any = false
  clearMsg

  mugshotShow
    mugshot = Lan
  """
  (Crap he got me!
  Now what I can do?
  I know! Battle him!)
  """
  keyWait
    any = false
  clearMsg

  mugshotShow
    mugshot = Lan
  """
  Hey Chaud! If I
  beat you in a battle,
  will you let me in---
  """
  keyWait
    any = false
  clearMsg
  """
  I mean through?
  """
  keyWait
    any = false
  clearMsg

  mugshotShow
    mugshot = Chaud
  """
  Sure. I also want to
  see you get owned
  by Maylu. *laughs*
  """
  keyWait
    any = false
  clearMsg

  mugshotShow
    mugshot = Lan
  """
  Quit it! Grr.
  Battle Routine, Set!
  """
  keyWait
    any = false
  clearMsg

  mugshotShow
    mugshot = MegaMan
  """
  Execute!
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
    mugshot = Chaud
  msgOpen
  """
  (YES! I lost! Now I
  can watch Lan get
  pwned by Maylu!)
  """
  keyWait
    any = false
  clearMsg
  
  mugshotShow
    mugshot = Lan
  """
  YEAH! I won!
  Now lemme in.
  """
  wait
    frames = 18
  "."
  wait
    frames = 18
  "."
  wait
    frames = 18
  keyWait
    any = false
  clearMsg

  mugshotShow
    mugshot = Chaud
  msgOpen
  """
  Eh.
  """
  wait
    frames = 18
  "."
  wait
    frames = 18
  "."
  wait
    frames = 18
  """
   okay.
  """
  keyWait
    any = false
  clearMsg

  mugshotShow
    mugshot = Lan
  """
  At last.
  """
  wait
    frames = 18
  "."
  wait
    frames = 18
  "."
  wait
    frames = 18
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
   Eek! Lan,you pervert!
  What the **** are you
  doing?
  """
  keyWait
    any = false
  clearMsg

  mugshotShow
    mugshot = Lan
  """
  Uhh.
  """
  wait
    frames = 18
  "."
  wait
    frames = 18
  "."
  wait
    frames = 18
  "\nUhh."
  wait
    frames = 18
  "."
  wait
    frames = 18
  "."
  wait
    frames = 18
  keyWait
    any = false
  clearMsg

  mugshotShow
    mugshot = Mayl
  """
  At a loss for words?
  How dare you try to
  sneak a peek!
  """
  keyWait
    any = false
  clearMsg

  msgClose
  wait
    frames = 10
  soundPlay
    track = 376
  wait
    frames = 30
  mugshotShow
    mugshot = Mayl
  msgOpen
  """
  NEVER EVER SNEAK
  A PEAK WHEN I'M
  CHANGING,YOU HEAR?!
  """
  keyWait
    any = false
  clearMsg

  mugshotShow
    mugshot = Lan
  """
  Is that a...
  MOLOTOV COCKTAIL?!?! OH
  ****!!!!!!!
  """
  keyWait
    any = false
  clearMsg
  end
}

@archive LButtonScript
@size 1
script 0 mmbn6 {
  mugshotShow
    mugshot = MegaMan
  msgOpen
  """
  Adapted from
  youtu.be/5LxZ9MKxZ88
  by timaeus22222.
  """
  keyWait
    any = false
  clearMsg
  end
}
