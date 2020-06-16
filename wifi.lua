a,b = ie.WIFIscan()

n = table.getn(a)
page = 0

for i,v in ipairs(a) do
  page = page + 1
  ie.print(i .. " " .. v.ssid .. " " .. v.rssi .. " " .. v.channel .. " " .. v.enc .. " " .. v.mac)
  if n > 5 then
    ie.print("Page " .. page .. " of " .. (n / 4))
    if i % 4 == 0 then
      ie.inkey(true)
    end 
  end
end
