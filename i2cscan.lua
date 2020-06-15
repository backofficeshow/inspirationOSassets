error = 0
address = 0
devices = 0
outstring=""

for address = 1, 127, 1 do
	a,b = ie.I2Cwrite(address,"")
	if(b==0) then
		print("I2C Device Found at ")
		print(address)
                outstring=outstring..address.." "
	end
end

ie.print(outstring) --maybe split the string into screen with chars wide. I want to find a smaller mono font or design one.

print("Scan Finished")
delay(5000) --why the delay?
