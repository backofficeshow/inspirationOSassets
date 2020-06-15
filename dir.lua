a,b=ie.SDdir()
for i,v in pairs(a) do
  ie.print(v.name .. " " .. v.size)
  if i % 5 == 0 then
    ie.inkey(true)
  end 
end
