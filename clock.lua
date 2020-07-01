--[[
Clock for Inspiration Engine
(c)2020 Andrew Armstrong @backofficeshow

Tells the time! q to quit
]]

function string:split(sep)
   local sep, fields = sep or ":", {}
   local pattern = string.format("([^%s]+)", sep)
   self:gsub(pattern, function(c) fields[#fields+1] = c end)
   return fields
end

function drawClock(x,tme)

	local y=4

	local cx = x + 15
	local cy = y + 15
	
	local r = 15
	
	
	ie.line(x, y, x+31,y, 1)
	ie.line(x, y+31,x+31,y+31,1)
	ie.line(x, y, x, y+31,1)
	ie.line(x+31, y, x+31, y+31, 1)
	
	ie.point(cx,cy,1)
	
	local hours = tonumber(tme[5])
	local mins = tonumber(tme[6])
	local secs = tonumber(tme[7])
	
	if hours > 12 then hours = hours - 12 end
	if hours == 0 then hours = 12 end
	
	hours = (hours * 30) - 90
	mins = (mins * 6) - 90
	secs = (secs * 6) - 90
	
	local hx = (math.cos(hours * (math.pi/180)) * r/2) + cx
	local hy = (math.sin(hours * (math.pi/180)) * r/2) + cy
	
	local mx = (math.cos(mins * (math.pi/180)) * r) + cx
	local my = (math.sin(mins * (math.pi/180)) * r) + cy
	
	local sx = (math.cos(secs * (math.pi/180)) * r) + cx
	local sy = (math.sin(secs * (math.pi/180)) * r) + cy

	ie.line(cx,cy,hx,hy,1)
	ie.line(cx,cy,mx,my,1)
	ie.line(cx,cy,sx,sy,1)
	
end

function drawTime(x,y,tme)

	y = y + 3

	ie.drawstring(x,y,tme[1], 1)
	ie.drawstring(x,y+8,tme[2] .. " " .. tme[3] .. " " .. tme[4], 1)
	ie.drawstring(x,y+16,tme[5] .. ":" .. tme[6] .. ":" ..tme[7], 1)
	
end

ie.clear()
ie.print("Clock - hold q to quit")
delay(1000)
local quit = false
while ( quit == false) do
  local tme = string.split(ie.getTime("%A,%B,%d,%Y,%H,%M,%S"),",")

  ie.clear(true)
  drawTime(20,4,tme)
  drawClock(90,tme)
  ie.flip()
  if ie.getkey("q") == true then
    quit = true
  else
    delay(1000)
  end
end
ie.print("Bye!")
