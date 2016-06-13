--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--% Auhtor: Daniel Teodoro Gonçalves Mariano                  %--
--% Date: 04/05/2016                                          %--
--% Description: Program to develop functions for LUA script  %--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

--%%%%%%%%%%%%%--
--% Functions %--
--%%%%%%%%%%%%%--

--function name: draw_square
--input arguments: points
--output arguments: none
local function draw_square(points)
  --Nodes
  for i=1, 4 do
    mi_addnode(points[i][1], points[i][2])
  end

  --Segments
  mi_addsegment(points[1][1], points[1][2], points[2][1], points[2][2])
  mi_addsegment(points[2][1], points[2][2], points[3][1], points[3][2])
  mi_addsegment(points[3][1], points[3][2], points[4][1], points[4][2])
  mi_addsegment(points[4][1], points[4][2], points[1][1], points[1][2])
end


local function draw_circle(points)
  for i=1, 2 do
    mi_addnode(points[i][1], points[i][2])
  end
  mi_addarc(points[1][1], points[1][2], points[2][1], points[2][2], 180, 1)
  mi_addarc(points[2][1], points[2][2], points[1][1], points[1][2], 180, 1)
end
