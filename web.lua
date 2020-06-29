startTime = millis()
countdown = 5000
while millis() < startTime + countdown do
	delay(100)
	ie.clear(true)
	if connected ~= true then 
		connected = ie.WIFIconnected()
		ie.drawstring(10, 20,"Connecting to Wifi",1)
		ie.progressbar(10,5,108,5,math.floor(((millis()-startTime)/countdown) * 100))
	else 
		ie.drawstring(10, 20,"Connected to Wifi",1)
		ie.progressbar(10,5,108,5,100)
	end 
	ie.progressbar(10,5,108,5,math.floor(((millis()-startTime)/countdown) * 100))
	ie.flip()
end
delay(100)

a,b = ie.WEBstart("") 
print(a,b)
if a then 
	ie.clear()
	ie.drawstring(10,5,"Connected",1)
	ie.drawstring(10,20,"Press any key to Quit",1)
	ie.flip()
	key = ""
	while key=="" do
		key = ie.inkey(false)
		d,e,f = ie.WEBpoll() 
		if d then 
			print(d,e,f)
		end 

	end
else 
	ie.clear()
	ie.drawstring(10,5,"Connection Fail",1)
	ie.drawstring(10,20,"Press any key to Quit",1)
	ie.flip()
	key=ie.inkey(true)
end

ie.clear()
ie.flip()