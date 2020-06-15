print=ie.print
beep=ie.beep

print("The Empire is here")
print("To stifle your inspiration")
print("@backofficeshow")

AMP = 255

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

rest = 0

function firstSection()
  beep(AMP,a, 450)
  beep(AMP,rest,50)
  beep(AMP,a, 450)
  beep(AMP,rest,50)    
  beep(AMP,a, 450)
  beep(AMP,rest,50)
  beep(AMP,f, 350)
  beep(AMP,cH, 150)  
  beep(AMP,a, 500)
  beep(AMP,f, 350)
  beep(AMP,cH, 150)
  beep(AMP,a, 650)
  
  beep(AMP,rest,500)
 
  beep(AMP,eH, 450)
  beep(AMP,rest,50)
  beep(AMP,eH, 450)
  beep(AMP,rest,50)
  beep(AMP,eH, 450)
  beep(AMP,rest,50)
  beep(AMP,fH, 350)
  beep(AMP,cH, 150)
  beep(AMP,gS, 500)
  beep(AMP,f, 350)
  beep(AMP,cH, 150)
  beep(AMP,a, 650)
 
  beep(AMP,rest,500)
end
 
function secondSection()
  beep(AMP,aH, 500)
  beep(AMP,a, 300)
  beep(AMP,a, 150)
  beep(AMP,aH, 500)
  beep(AMP,gSH, 325)
  beep(AMP,gH, 175)
  beep(AMP,fSH, 125)
  beep(AMP,fH, 125)    
  beep(AMP,fSH, 250)
 
  beep(AMP,rest,325)
 
  beep(AMP,aS, 250)
  beep(AMP,dSH, 500)
  beep(AMP,dH, 325)  
  beep(AMP,cSH, 175)  
  beep(AMP,cH, 125)  
  beep(AMP,b, 125)  
  beep(AMP,cH, 250)  
 
  beep(AMP,rest,325)
end

--Play first section
firstSection()

print("Oh no here they are!")

--Play second section
secondSection()

print("They are looking scary!")

beep(AMP,f, 250)  
beep(AMP,gS, 500)  
beep(AMP,f, 350)  
beep(AMP,a, 125)
beep(AMP,cH, 500)
beep(AMP,a, 375)  
beep(AMP,cH, 125)
beep(AMP,eH, 650)

print("Practically at my back door!")

beep(AMP,rest,500)

--Repeat second section
secondSection()

print("Arghhhhhhh")

beep(AMP,f, 250)  
beep(AMP,gS, 500)  
beep(AMP,f, 375)  
beep(AMP,cH, 125)
beep(AMP,a, 500)  
beep(AMP,f, 375)  
beep(AMP,cH, 125)
beep(AMP,a, 650)  

print("Thank you!")