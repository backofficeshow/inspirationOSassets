a,b=ie.SDdir()
for i,v in pairs(a) do
  print(i,v.name, v.size, v.dir)
  if i % 5 == 0 then
    ie.inkey()
  end 
end