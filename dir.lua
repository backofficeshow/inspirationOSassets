--[[
Directory Listing
(c)2020 Andrew Armstrong @backofficeshow

Lists folders on the SD card and displays file size
TODO: use the EXEC parameter system to allow for
sub folders to be passed e.g. EXEC dir apps/libs
]]

a,b=ie.SDdir()
for i,v in pairs(a) do
  row = string.format("%-20s %7sb",v.name,v.size)
  ie.print(row)
  if i % 5 == 0 then
    ie.inkey(true)
  end
end
ie.print("done")
