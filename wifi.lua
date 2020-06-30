--[[
Wifi Scanner for Inspiration Engine
(c)2020 Andrew Armstrong @backofficeshow

Scans for wifi APs in the area
Allows the user to select the AP by entering
its corresponding tonumber and typing in its
WPA password
]]

function round(num) return math.floor(num+.5) end

function isNumeric(value)
  if value == tostring(tonumber(value)) then
      return true
  else
      return false
  end
end

ie.clear()
ie.print("Starting wifi scan")

a,b = ie.WIFIscan()
page = 0

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

if #a < 1 then
  ie.print("Did not detect any WIFI APs")
  return(false)
end

ie.print("Enter the index to connect or q")


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
      if key~= "\r" then passwordstring = passwordstring .. key end
    end
    ie.print("Connecting to " .. a[value].ssid)
    ie.print("Using password: " .. passwordstring)
    local result = false
    local reason = ""
    local quit = false
    local tries = 0
    while result == false and quit == false do
      tries = tries + 1
	  print(a[value].ssid, passwordstring)
      result, reason = ie.WIFIconnect(a[value].ssid, passwordstring)
      if result == false then
        ie.print(reason)
        ie.print("Retrying ".. tries .. " - hold q to quit")
      end
      if ie.getkey("q") == true then
        quit = true
      else
        delay(1000)
      end
    end
  end
end
ie.print("Bye!")
