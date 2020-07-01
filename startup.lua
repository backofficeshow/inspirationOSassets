--[[
Inspiration Engine Startup Script
(c)2020 Andrew Armstrong @backofficeshow

Consider this the IE version of autoexec.bat - basically if this
file exists in the root of the SD card, the system will run it.

If you do not want to run it for whatever reason, hold the ESC button
down on your IE on powerup.
]]

local startupSong = true      --Play a startup song (mp3)
local songName = "startup.mp3"--The startup song file name
local WIFIcheck = true        --Check for WIFI connection at boot
local WIFItries = 5           --How long to keep checking
local GMDtimeoffset = 0       --Enter your timezone offset in seconds (3600=1hour)
local daylightsavings = 3600  --If you have daylight savings you can add it here (in seconds)

-- Clear the screen and display what we are!
ie.clear()
ie.print("Inspiration Engine")

-- Play our the song if required
if startupSong == true and ie.SDexists(songName) then
  ie.playmp3(songName)
end

-- Check for WIFI
local WIFI, IP = ie.WIFIconnected()

ie.print("Checking WIFI")
while WIFI == false and WIFItries > 0 do
  WIFI, IP = ie.WIFIconnected()
  WIFItries = WIFItries - 1
  delay(1000)  
end 

if WIFI == true then
  ie.print("Wifi connected: " .. IP)
else
  ie.print("Wifi not connected")  
end

-- If we have WIFI lets set our clock

if WIFI then
  if ie.configTime(GMDtimeoffset, daylightsavings) then
    local a = ie.getTime("%A, %B %d %Y %H:%M:%S")
    ie.print(a)
  else
    ie.print("Could not get the time")
  end
end

ie.print("Ready to go!")


