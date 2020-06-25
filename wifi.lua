a,b = ie.WIFIscan()
page = 0

function round(num) return math.floor(num+.5) end

function isNumeric(value)
  if value == tostring(tonumber(value)) then
      return true
  else
      return false
  end
end

ie.print("Starting wifi scan")

for i,v in ipairs(a) do
  ie.print(i .. " " .. v.ssid .. " " .. v.rssi .. " " .. v.channel .. " " .. v.enc .. " " .. v.mac)
  if #a > 5 then
    if i % 4 == 0 then
      page = page + 1
      ie.print("Page " .. page .. " of " .. round(#a / 4))
      ie.inkey(true)
      ie.clear()
    end 
  end
end

ie.print("Enter the index to connect to")
ie.print("or any other key to exit")

local value = nil
while value == nil do
  value = ie.inkey(true)
end

if isNumeric(value) then
  value = tonumber(value)
  if value > 0 and value < #a then
    ie.print("Config for:" .. a[value].ssid)
    ie.print("Enter password:")
    key = nil
    local passwordstring = ""
    while key ~= "\r" do
      key = ie.inkey(true)
      passwordstring = passwordstring .. key
    end
    ie.print("Connecting")
    ie.WIFIconnect(a[value].ssid, passwordstring)
  end
end
ie.print("Bye!")

