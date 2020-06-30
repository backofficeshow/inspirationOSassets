--[[
Manic Miner Audio Example
(c)2020 Andrew Armstrong @backofficeshow

A trivial example that downloads the Manic Miner audio tape file
from the internet and plays it on the audio DAC out to a conencted
microcomputer! (ZX Spectrum)
]]

if ie.SDexists("manic.mp3") == false then
  ie.print("Downloading Manic Miner")
  a,b = ie.WIFIget("http://zx.zigg.net/zxsoftware/files/Manic_Miner.mp3","manic.mp3")
end
ie.print("Playing Manic Miner")
ie.playmp3("manic.mp3");
ie.print("Done")
