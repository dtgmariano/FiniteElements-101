--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--% Auhtor: Daniel Teodoro Gonçalves Mariano                  %--
--% Date: 04/05/2016                                          %--
--% Description: Program to develop functions for LUA script  %--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

--%%%%%%%%%%%%%--
--% Functions %--
--%%%%%%%%%%%%%--

--function name: draw_square
--input arguments: home, length
--output arguments: none
function draw_square(home, length)
  mi_addnode(home[1]          , home[2]         )
  mi_addnode(home[1]          , home[2] + length)
  mi_addnode(home[1] + length , home[2] + length)
  mi_addnode(home[1] + length , home[2]         )

  mi_addsegment(home[1]          , home[2]          , home[1]          , home[2] + length)
  mi_addsegment(home[1]          , home[2] + length , home[1] + length , home[2] + length)
  mi_addsegment(home[1] + length , home[2] + length , home[1] + length , home[2]         )
  mi_addsegment(home[1] + length , home[2]          , home[1]          , home[2]         )
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
