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
function draw_square(points)
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

--function name: draw_circle
--input arguments: points
--output arguments: none
function draw_circle(points)
  for i=1, 2 do
    mi_addnode(points[i][1], points[i][2])
  end
  mi_addarc(points[1][1], points[1][2], points[2][1], points[2][2], 180, 1)
  mi_addarc(points[2][1], points[2][2], points[1][1], points[1][2], 180, 1)
end

--%%%%%%%%%%%%%%%%--
--% Main Program %--
--%%%%%%%%%%%%%%%%--

  clearconsole()
  newdocument(0)
  mi_probdef(0 ,'millimeters','planar','1E-8','4','30',0)
  --mi_saveas("study102.fem")

  --Drawing Points and Segments
  outerpoints = {{0,0} , {203.2,0}, {203.2,254}, {0,254}}
  draw_square(outerpoints)
  innerpoints = {{50.8,50} , {152.4,50}, {152.4,204}, {50.8,204}}
  draw_square(innerpoints)
