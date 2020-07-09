
-- Hopefully not a crap I2Swrite test

local done = false
local data
local filePos = 0
local bytes = 0
local loop = 0

data,bytes = ie.SDread("sound.raw",false)
while done == false do
	if ie.getkey("p") then 
		-- ie.I2Swrite(buffer, number of bytes, sample rate) 
		-- Data needs to be 8bit Unsigned PCM data 
		ie.I2Swrite(data, bytes, 8000)	
		ie.housekeep()
	end
	if ie.getkey("q") then 
		done = true
	end
end