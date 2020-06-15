a,b=ie.SDdir()
for i,v in pairs(a) do
  ie.print(i,v.name, v.size, v.dir)
  if i % 5 == 0 then
    ie.inkey(true)
  end 
end
