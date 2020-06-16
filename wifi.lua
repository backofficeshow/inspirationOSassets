a,b = ie.WIFIscan()
page = 0

for i,v in ipairs(a) do
  ie.print(i .. " " .. v.ssid .. " " .. v.rssi .. " " .. v.channel .. " " .. v.enc .. " " .. v.mac)
  if #a > 5 then
    if i % 4 == 0 then
      page = page + 1
      ie.print("Page " .. page .. " of " .. (#a / 4))
      ie.inkey(true)
      ie.clear()
    end 
  end
end
