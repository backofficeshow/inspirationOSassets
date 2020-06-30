--[[
Web File Server
(c)2020 Andrew Armstrong @backofficeshow

Allows the user to access the Insipration Engine via a browser
A virtual page (dir.html by default) generates a file Listing the
user can select from
]]

local appPage = "dir.html" --The name of the virtual 'URL file location'

local function hex_to_char(x)
  return string.char(tonumber(x, 16))
end

local function unescape(url)
  return url:gsub("%%(%x%x)", hex_to_char)
end

rootPath = ""

function genListing()
  dirdata = ie.SDdir(rootPath)
  listing = [[<html>
  <script>
  window.onload = function() {
		if( !window.location.hash ) {
			window.location = window.location + '#ok';
			window.location.reload();
		}
	}
  </script>]]

  listing = listing .. [[Top: <a href="]] .. appPage .. [[?path=/">SD Root</a><br><br>]]
  for i,v in pairs(dirdata) do
  	if (v.dir) then
      listing = listing .. i .. [[ <a href="]] .. appPage .. [[?path=]] .. v.name .. [[">"]] .. v.name .. "</a> (Directory)"
    else
      listing = listing .. i .. [[ <a href="]] .. v.name .. [[">"]] .. v.name .. "</a> " .. v.size
    end

  	listing = listing .. "<br>\r\n"
  end
  listing = listing .. "</html>"
end

a,b = ie.WEBstart()

if a then
  ie.print("Starting web fileserver")
  ie.print("Press q to quit")
  genListing()

  ie.print("http://" .. b .. "/" .. appPage)

  local quit = false;

  while (a and quit == false) do
  	d,e,f = ie.WEBpoll(0, appPage, listing)
  	if d then
  		print(d,e,f)
  	end
    if f == nil then
  	 delay(100)
    else
     local URI = unescape(f)
     b,e = string.find(URI, "?path=")
     if b then
        rootPath = string.sub(URI, e+2)
        genListing()
     end
    end

    if ie.getkey("q") then quit = true end
  end
else
    ie.print("Cannot start fileserver as")
    ie.print("Wifi is not connected")
end
ie.print("Bye!")
