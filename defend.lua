
--Constants
MAXspeed = 10 
MAXspeedleft = -10

--Ship Variables
shipx = 64
shipy = 16
shipdir = 1
shipspeed = 0
shipacc = 0

--Laser Variables
laserfire = false
firerate = 100
lastfiretime = 0
lasersound = {6,1000,900,800,700,600,500}


--Sound Variables
soundcount = 1
playsound = false
currentsound = {}

--Enemy Variables
status_idle = 0
status_alive = 1
status_carry = 2
status_bombing = 3
status_dead = 4
enemies = {}
for i=1,50,1 do
	enemies[i] = {math.floor(math.random(1024)),math.floor(math.random(25)) + 5,status_idle}
end

print("ENEMIES")
landscape = {}
for i=1,129,1 do
	landscape[i] = math.floor(math.random(10))
end

function moveenemies()

end

function drawenemies(x) 
	lowerx = x
	upperx = x + 128
	for i=1, 50,1 do
		enemyx = enemies[i][1]
		enemyy = enemies[i][2]
		enemystatus = enemies[i][3]
		if enemyx > x and enemyx < x+128 then
			ie.drawstring(enemyx-x,enemyy,"^",1)
		end
	end
end

function dosound(sound)

	if playsound == true then 
		ie.beep(255,sound[soundcount+1],5)
		soundcount = soundcount + 1
		if soundcount > sound[1]+1 then 
			playsound = false
			soundcount = 1
		end
	end
	
end

function drawlaser(x,y,d)
	
	for i=1000,500,-100 do
		ie.beep(255,i,5)
	end
	
	if d == 1 then 
		ie.line(x+6, y,x+50,y,1)
	elseif d == -1 then 
		ie.line(x-6, y,x-50,y,1)
	end 

end

function drawship(x,y,d)

	if d == 1 then 
		ie.line(x-5, y,x+5,y,1)
		ie.line(x-5, y,x-5,y-3,1)
		ie.line(x-5, y-3, x+5, y,1)
	elseif d == -1 then 
		ie.line(x-5, y,x+5,y,1)
		ie.line(x+5, y,x+5,y-3,1)
		ie.line(x+5, y-3, x-5, y,1)
	end 

end

function drawlandscape(x)
	
	offset = 8-(x % 8)
	
	pos = math.floor((x - 64)/8)
	if pos >= 1 then 
		lasty = landscape[pos]
	else 
		lasty = landscape[pos+128]
	end
	for i=1, 15, 1 do
		t = pos + i
		if t > 129 then t = t - 128 end
		if t < 1 then t = t + 128 end
		x = (i * 8) + offset
		if x >=0 and x <= 128 then 
			ie.line(x,landscape[t]+23,x-8,lasty+23,1)
		end
		lasty = landscape[t]
	end
	
end

while(true) do

  --Decaying shipspeed
  if math.abs(shipspeed) >= 0.1 then
    if shipspeed > 0 then
      shipacc =  -0.1
    else
      shipacc = 0.1
    end
  else 
	shipacc = 0
  end
  
  if ie.getkey("z") then
      shipdir = -1    
	  shipacc = -1
  end
  
  if ie.getkey("x") then
      shipdir = 1    
	  shipacc = 1
  end  
	
    shipspeed = shipspeed + shipacc
	
	if (shipspeed > MAXspeed) then shipspeed = MAXspeed end
	if (shipspeed < MAXspeedleft) then shipspeed = MAXspeedleft end
	
	shipx = shipx + shipspeed 
	
	if ie.getkey("k") then shipy = shipy - 1 end
	if ie.getkey("m") then shipy = shipy + 1 end

	if ie.getkey("c") and (millis() - lastfiretime) > firerate then 
		laserfire = true 
		lastfiretime = millis()
		currentsound = lasersound 
		playsound = true
	end

	if ie.getkey("q") then goto END end

	if shipx > 1023 then shipx = 0 end
	if shipx < 0 then shipx = 1023 end
	if shipy > 32 then shipy = 32 end
	if shipy < 7 then shipy = 7 end
	
	dosound(currentsound)
	
	ie.clear(true)

	drawlandscape(shipx)
	drawship(64, shipy, shipdir)
	drawenemies(shipx)
	if laserfire == true then 
		drawlaser(64,shipy,shipdir) 
		laserfire = false
	end
	
	ie.flip()

end
