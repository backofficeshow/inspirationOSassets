a,b = ie.WIFIscan()

for i,v in ipairs(a) do
  ie.print(i .. " " .. v.ssid .. " " .. v.rssi .. " " .. v.channel .. " " .. v.enc .. " " .. v.mac)
  if i % 5 == 0 then
    ie.inkey(true)
  end 
end;
