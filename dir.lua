a,b=ie.SDdir()
for i,v in pairs(a) do
  row = string.format("%-20s %7sb",v.name,v.size)
  ie.print(row)
  if i % 5 == 0 then
    ie.inkey(true)
  end 
end
ie.print("done")
