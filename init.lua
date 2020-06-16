function printStatus(value)
  if value == true then
    return "Yes"
  else
    return "No"
  end
end

ie.print("First run script - connecting")
a,b = ie.WIFIget("https://raw.githubusercontent.com/backofficeshow/inspirationOSassets/master/startup.lua","startup.lua")
ie.print("Downloading Startup Script-" .. printStatus(a))

a,b = ie.WIFIget("https://raw.githubusercontent.com/backofficeshow/inspirationOSassets/master/win95.mp3","startsound.mp3")
ie.print("Downloading Startup Sound-" .. printStatus(a))

a,b = ie.WIFIget("https://raw.githubusercontent.com/backofficeshow/inspirationOSassets/master/i2cscan.lua","i2cscan.lua")
ie.print("Downloading i2C Scan app-" .. printStatus(a))

a,b = ie.WIFIget("https://raw.githubusercontent.com/backofficeshow/inspirationOSassets/master/dir.lua","dir.lua")
ie.print("Downloading dir command app-" .. printStatus(a))

a,b = ie.WIFIget("https://raw.githubusercontent.com/backofficeshow/inspirationOSassets/master/wifi.lua","wifi.lua")
ie.print("Downloading WIFI manager app-" .. printStatus(a))

a,b = ie.WIFIget("https://raw.githubusercontent.com/backofficeshow/inspirationOSassets/master/mp3.lua","mp3.lua")
ie.print("Downloading MP3 player app-" .. printStatus(a))

a,b = ie.WIFIget("https://raw.githubusercontent.com/backofficeshow/inspirationOSassets/master/init.lua","init.lua")
ie.print("Downloading Init Script-" .. printStatus(a))

delay(2000)

ie.reset()

  
