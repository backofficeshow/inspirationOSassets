if ie.SDexists("manic.mp3") == false then
  ie.print("Downloading Manic Miner")
  a,b = ie.WIFIget("http://zx.zigg.net/zxsoftware/files/Manic_Miner.mp3","manic.mp3")
end
ie.print("Playing Manic Miner")
ie.playmp3("manic.mp3");
ie.print("Done")
