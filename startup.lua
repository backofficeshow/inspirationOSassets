if ie.SDexists("startsound.mp3") == false then
  ie.print("Downloading Startup Sound")
  a,b = ie.WIFIget("https://github.com/backofficeshow/inspirationOSassets/raw/master/win95.mp3","startsound.mp3")
end
ie.playmp3("startsound.mp3");
  
