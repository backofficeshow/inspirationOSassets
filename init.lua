--[[
Inspiration Engine Init Script
(c)2020 Andrew Armstrong @backofficeshow

The IE is best demonstrated with the SD card examples and GUI. This
script will retrieve from the internet the initial SD card contents,
download them to the SD card and reset the unit.
]]

repoLocation = "https://raw.githubusercontent.com/backofficeshow/inspirationOSassets/master/"

function printStatus(value)
  if value == true then
    return "Success"
  else
    return "Fail"
  end
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

files = {
	{repoLocation .. "startup.lua","startup.lua"},
	{repoLocation .. "win95.mp3","startsound.mp3"},
	{repoLocation .. "i2cscan.lua","i2cscan.lua"},
	{repoLocation .. "dir.lua","dir.lua"},
	{repoLocation .. "wifi.lua","wifi.lua"},
	{repoLocation .. "mp3.lua","mp3.lua"},
	{repoLocation .. "init.lua","init.lua"}}

ie.clear()
ie.print("First run script - connecting")
starttime = millis()
while connected ~= true do
	connected = ie.WIFIconnected()
	if millis() - starttime > 5000 then
		ie.print("Connection Timeout")
		return(false)
	end
end

ie.clear()
ie.drawstring(10,10,"Downloading " ..files[1][2],1)
ie.progressbar(10,25,108,5,0)
ie.flip()
count = 0
total = tablelength(files)
for l,k in pairs(files) do
	ie.clear(true)
	a,b = ie.WIFIget(k[1],k[2])
	ie.drawstring(10,10,"Downloading " ..k[2],1)
	ie.drawstring(10,18,"Status - " .. printStatus(a),1)
	count = count + 1
	ie.progressbar(10,25,108,5,(count/total) *100)
	ie.flip()
end
delay(500)
ie.clear(true)
ie.drawstring(10,10,"Downloading Complete",1)
ie.drawstring(10,25,"Press Any Key to Exit",1)
ie.flip()
ie.inkey(true)
ie.clear()
ie.reset()
