cube = {{{-1,-1,-1}, -- points
         {-1,-1,1},
         {1,-1,1},
         {1,-1,-1},
         {-1,1,-1},
         {-1,1,1},
         {1,1,1},
         {1,1,-1},
         {-0.5,-0.5,-0.5}, -- inside
         {-0.5,-0.5,0.5},
         {0.5,-0.5,0.5},
         {0.5,-0.5,-0.5},
         {-0.5,0.5,-0.5},
         {-0.5,0.5,0.5},
         {0.5,0.5,0.5},
         {0.5,0.5,-0.5}},
       {{1,2}, -- lines
        {2,3},
        {3,4},
        {4,1},
        {5,6},
        {6,7},
        {7,8},
        {8,5},
        {1,5},
        {2,6},
        {3,7},
        {4,8},
        {8+1,8+2}, -- inside
        {8+2,8+3},
        {8+3,8+4},
        {8+4,8+1},
        {8+5,8+6},
        {8+6,8+7},
        {8+7,8+8},
        {8+8,8+5},
        {8+1,8+5},
        {8+2,8+6},
        {8+3,8+7},
        {8+4,8+8},
        {1,9},--
        {2,10},
        {3,11},
        {4,12},
        {5,13},
        {6,14},
        {7,15},
        {8,16}}}


  cam = {0,-5.5,-8.5} -- Initilise the camera position
  rot = 0.01
  mult = 64 -- View multiplier

  a = math.floor(math.random(3))+1 -- Angle for random rotation
  t = math.floor(math.random(50))+25 -- Time until next angle change




function draw_shape(s,c)
--  for l in s[2] do -- For each line in the shape...
  for k,l in pairs(s[2]) do
    if(l ~= nil) then draw_line(s[1][l[1]], s[1][l[2]], c) end -- Draw the line
  end
end

function draw_line(p1,p2,c)
  x0, y0 = project(p1) -- Get the 2d location of the 3d points...
  x1, y1 = project(p2)
  ie.line(x0, y0, x1, y1, 1) -- And draw a line between them
end

function project(p)
  x = (p[1]-cam[1])*mult/(p[3]-cam[3]) + 127/2 -- Calculate x and center it
  y = -(p[2]-cam[2])*mult/(p[3]-cam[3]) + 127/2 -- Calculate y and center it
  return x, y -- Return the two points
end

function translate_shape(s,t)
  ns = {{},s[2]} -- Copy the shape, but zero out the points and keep the lines
  for k,p in pairs(s[1]) do -- For each point in the original shape...
    if(p~=nil) then table.insert(ns[1],{p[1]+t[1],p[2]+t[2],p[3]+t[3]}) end -- Add the displacement to the point and add it to our new shape
  end
  return ns -- Return the new shape
end

function rotate_shape(s,a,r)
  ns = {{},s[2]} -- Copy the shape, but zero out the points and keep the lines
  for k,p in pairs(s[1]) do -- For each point in the original shape...
    if(p~=nil) then table.insert(ns[1], rotate_point(p,a,r)) end -- Rotate the point and add it to the new shape
  end
  return ns -- Return the new shape
end

function rotate_point(p,a,r)
  -- Figure out which axis we're rotating on
  if a==1 then
    x,y,z = 3,2,1
  elseif a==2 then
    x,y,z = 1,3,2
  elseif a==3 then
    x,y,z = 1,2,3
  else 
	x,y,z = 3,1,2
  end
  _x = math.cos(r)*(p[x]) - math.sin(r) * (p[y]) -- Calculate the new x location
  _y = math.sin(r)*(p[x]) + math.cos(r) * (p[y]) -- Calculate the new y location
  np = {} -- Make new point and assign the new x and y to the correct axes
  np[x] = _x
  np[y] = _y
  np[z] = p[z]
  return np -- Return new point
end 


while(true) do
  -- Handle the inputs
  key = ie.inkey()
  if key == "h" then 
  cam[1] = cam[1] - 0.1 
  end
  if key == "f"  then 
	cam[1] = cam[1] + 0.1 
  end
  if key == "g" then 
	cam[2]  = cam[2] + 0.1 
  end
  if key == "t" then 
	cam[2] = cam[2] - 0.1 
  end
  if key == "d" then 
	cam[3] = cam[3] - 0.1 
  end
  if key == "e" then 
	cam[3] = cam[3] + 0.1 
  end
  if key == "u" then 
	rot = rot + 0.01
  end 
  if key == "j" then 
	rot = rot -0.01
  end
  if key =="x" then 
	goto END
  end
  t = t - 1 -- Decrease time until next angle change
  if t <= 0 then -- If t is 0 then change the random angle and restart the timer
    t = math.floor(math.random(50))+25 -- Restart timer
    a = math.floor(math.random(3))+1 -- Update angle
  end

  cube = rotate_shape(cube,a,rot) -- Rotate our cube

  ie.clear(true)
  draw_shape(cube) -- Draw the cube
  ie.flip()
end