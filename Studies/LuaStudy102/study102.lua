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
function draw_points(points)
  --Nodes
  for i=1, 4 do
    mi_addnode(points[i][1], points[i][2])
    --mi_addnode(points[i*2 - 1], points[i*2])
  end
  --mi_addnode(0,1)
  --mi_addnode(1,1)
  --mi_addnode(1,0)

  --Segments
  mi_addsegment(points[1][1], points[1][2], points[2][1], points[2][2])
  mi_addsegment(points[2][1], points[2][2], points[3][1], points[3][2])
  mi_addsegment(points[3][1], points[3][2], points[4][1], points[4][2])
  mi_addsegment(points[4][1], points[4][2], points[1][1], points[1][2])

  --inserindo as fronteiras
  mi_addboundprop("Zero",0,0,0,0,0,0,0,0,0)
  mi_setsegmentprop("Zero",0,0,0,0)
end

--function name: draw_square
--input arguments: home, length
--output arguments: none
function draw_square(home, length)
  mi_addnode(home[1]          , home[2]         )
  mi_addnode(home[1]          , home[2] + length)
  mi_addnode(home[1] + length , home[2] + length)
  mi_addnode(home[1] + length , home[2]         )

  mi_addsegment(home[1]        , home[2]         , home[1]        , home[2] + length)
  mi_addsegment(home[1]        , home[2] + length, home[1]+ length, home[2] + length)
  mi_addsegment(home[1]+ length, home[2] + length, home[1]+ length, home[2]         )
  mi_addsegment(home[1]+ length, home[2]         , home[1]        , home[2]         )
end

--%%%%%%%%%%%%%%%%--
--% Main Program %--
--%%%%%%%%%%%%%%%%--

clearconsole()
newdocument(0)
mi_probdef(0,'centimeters','planar',1e-8,3,3.28,30)
mi_saveas("study102.fem")

points = {{0, 0}, {0, 1}, {1, 1}, {1, 0}}
draw_points(points)

position = {3, 3}
size = 1
draw_square(position,size)

mi_clearselected()
