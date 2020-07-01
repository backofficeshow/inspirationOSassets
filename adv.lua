textWidth = 32
textHeight = 5
titleAnimeCounter = 0
titleFlipState = false
font_height = 6
title = true

c = 261.3
d = 293.3
e = 329.5
f = 349
g = 391.8
gS = 415.1
a = 440
aS = 466
b = 493.8
cH = 523.3
cSH = 554.2
dH = 587.2
dSH = 622.2
eH = 659.3
fH = 698.3
fSH = 740
gH = 784
gSH = 830.5
aH = 880

nd=8
nn=4

titleMusic = {
  [1]={b,100,nd},
  [2]={b,50,nn},
  [3]={a,50,nd},
  [4]={a,50,nd},
  [5]={b,50,nn},
  [6]={b,50,nn},
  [7]={b,50,nn},
  [8]={a,50,nd},
  [9]={a,50,nd},
  [10]={a,50,nd},
  [11]={b,100,nn},
  [12]={b,50,nn},
  [13]={a,50,nd},
  [14]={a,50,nd},
  [15]={b,50,nn},
  [16]={e,100,nd},
  [17]={e,50,nn},
  [18]={d,50,nd},
  [19]={d,50,nd},
  [20]={e,50,nn},
  [21]={e,50,nn},
  [22]={e,50,nn},
  [23]={d,50,nd},
  [24]={d,50,nd},
  [25]={d,50,nd},
  [26]={e,100,nd},
  [27]={e,50,nn},
  [28]={d,50,nd},
  [29]={d,50,nd},
  [30]={e,50,nn},
  [31]={g,100,nn},
  [32]={g,50,nd},
  [33]={e,50,nn},
  [34]={e,50,nn},
  [35]={g,50,nd},
  [36]={g,50,nd},
  [37]={g,50,nd},
  [38]={e,50,nn},
  [39]={e,50,nn},
  [40]={e,50,nn},
  [41]={g,100,nd},
  [42]={g,50,nd},
  [43]={e,50,nn},
  [44]={e,50,nn},
  [45]={g,50,nd},
  [46]={b,100,nn},
  [47]={b,50,nd},
  [48]={a,50,nn},
  [49]={g,50,nd},
  [50]={g,50,nd},
  [51]={g,50,nd},
  [52]={e,50,nn},
  [53]={e,50,nn},
  [54]={e,50,nn},
  [55]={b,100,nd},
  [56]={b,50,nd},
  [57]={a,50,nn},
  [58]={a,50,nn},
  [59]={b,50,nd},
  [60]={0,0,100},
}
musiccount = 0
musicdelay = 0
playmusic = true

room = "BED_ROOM_0"
rooms = {}

rooms["BED_ROOM_0"] = {
  ["text"] = {
    [0]="You are laying in bed. Looking  ",
    [1]="down, you have a huge stiffy."
  },
  ["commands"] = {
    ["wank"] = {
      ["nextState"] = "BED_ROOM_1"
    },
    ["get up"] = {
      ["nextState"] = "BED_ROOM_2"
    }
  }
}

rooms["BED_ROOM_1"] = {
  ["text"] = {
    [0] = "You start wanking thinking of",
    [1] = "Gal Gadot riding your huge cock"
  },
  ["nextState"] = "BED_ROOM_0"
}

rooms["BED_ROOM_2"] = {
  ["text"] = {
    [0] = "You get up, and knock the lamp",
    [1] = "over with your cock"
  },
  ["commands"] = {
    ["pick up lamp"] = {
      ["text"] = {
        [0] = "You pick the lamp up and put it",
        [1] = "back in place."
      },
      ["nextState"] = "BED_ROOM_3"
    },
  }
}

rooms["BED_ROOM_3"] = {
  ["text"] = {
    [0] = "You pick the lamp up and put it",
    [1] = "back in place."
  },
  ["commands"] = {
    ["look"] = {
      ["nextState"] = "BED_ROOM_3"
    },
  }
}

notePlayed = false

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function domusic(sound)
	if playmusic == true then
    local t = sound[musiccount+1]
    if (notePlayed == false) then
		    ie.beep(255,t[1],t[2])
        notePlayed = true
        musicDelay = 0
    elseif musicDelay > t[3] then
  		musiccount = musiccount + 1
      notePlayed = false
      musicDelay = 0
  		if musiccount > tablelength(sound)-1 then
  			musiccount = 0
  		end
    else
      musicDelay = musicDelay + 1
    end
	end
end

function drawString(x, y, text, col)
  local offset = font_height - 1;
  ie.drawstring(x, offset + (font_height * y), text, col)
end

function textCentre(text)
  local t = ""
  local m = (textWidth - string.len(text)) / 2
  for i=1, m, 1 do
    t = t .. " "
  end
  return t .. text
end

function printJumpText(x, y, text, fs)
  local l1 = ""
  local l2 = ""
  local m = string.len(text)
  local l = false
  for i = 1, m, 1 do
    local c = text:sub(i,i)
    if (l) then
      l1 = l1 .. c
      l2 = l2 .. " "
      l = false
    else
      l1 = l1 .. " "
      l2 = l2 .. c
      l = true
    end
  end

  if (fs) then
    drawString(0,y, l1, 1)
    drawString(0,y+0.3,l2, 1)
  else
    drawString(0,y, l2, 1)
    drawString(0,y+0.3,l1, 1)
  end
end

function titleScreen()
  domusic(titleMusic)
  drawString(0,0, textCentre("Gary's Magical"), 1)
  drawString(0,1, textCentre("Willy Text Adventure"), 1)
  drawString(0,2, "", 1)
  printJumpText(0,3, textCentre("Press Any Key to Start"), titleFlipState)
  titleAnimeCounter = titleAnimeCounter + 1
  if (titleAnimeCounter > 50) then
    titleAnimeCounter = 0
    titleFlipState = not titleFlipState
  end

  local key = nil
  key = ie.inkey()
  if key == "x" then
    ie.reset()
  elseif key ~= "" then
    title = false
  end
end

function waitFor(v)
  delay(1000 * v)
end

function drawRoomText(t, l3, l4)
  ie.clear(true)
  if (t) then
    drawString(0,0, t[0], 1)
    drawString(0,1, t[1], 1)
  end
  if (l3) then
    drawString(0,3, l3, 1)
  end
  if (l4) then
    drawString(0,4, l4, 1)
  end
  ie.flip()
end

function waitCommand(t, l1)
  key = nil
  local s = ""
  local readKey = true
  while (readKey) do
    drawRoomText(t, l1, s)
    key = ie.inkey(true)
    if key ~= "\r" then
      s = s .. key
    else
      readKey = false
    end
  end
  return s
end

function mainGame()
  print("CURRENT ROOM[" .. room .. "]")
  local d = rooms[room]
  local c = d["commands"]
  if (c ~= nil) then
    s = waitCommand(d["text"], "What to do?") --Wait for command
    print("[" .. s .. "]")
    local sc = c[s]
    if (sc) then
      print("HERE 1")
      drawRoomText(sc["text"])
      room = sc["nextState"]
      print("NEXT ROOM [" .. room .. "]")
      print("HERE 4")
    else
      print("HERE 2")
      drawRoomText(d["text"], s .. ", i can't do that ?????")
      waitFor(2)
      print("HERE 3")
    end
  else
    print("HERE 5")
    drawRoomText(d["text"])
    waitFor(5)
    if (d["nextState"]) then
      room = d["nextState"]
    end
  end
end


while(true) do
  ie.clear(true)
  if (title == true) then
      titleScreen()
  else
      mainGame()
  end
  ie.flip()
end
