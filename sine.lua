j = 0 
while(ie.inkey()=="") do 
	ie.clear(true) 
	j=j+10 
	if(j>512) then j=0 end
	for i=1, 512, 1 do 
		c=i+j 
		ie.point(i/4,(math.sin((c/128) * math.pi)*15)+20,1,0)
	end 
	ie.flip() 
	delay(10) 
end