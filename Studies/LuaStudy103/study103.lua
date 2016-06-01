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
function draw_outer_square()
  mi_addnode(0   ,   0)
  mi_addnode(0   , 254)
  mi_addnode(203 , 254)
  mi_addnode(203 ,   0)

  mi_addsegment(0  ,   0,   0, 254)
  mi_addsegment(0  , 254, 203, 254)
  mi_addsegment(203, 254, 203,   0)
  mi_addsegment(203,   0,   0,   0)
end

function draw_inner_square()
  mi_addnode(51  ,  50)
  mi_addnode(152 ,  50)
  mi_addnode(152 , 204)
  mi_addnode(51  , 204)

  mi_addsegment( 51,  50, 152,  50)
  mi_addsegment(152,  50, 152, 204)
  mi_addsegment(152, 204,  51, 204)
  mi_addsegment( 51, 204,  51,  50)
end

--%%%%%%%%%%%%%%%%--
--% Main Program %--
--%%%%%%%%%%%%%%%%--

clearconsole()
newdocument(0)
mi_probdef(0,'centimeters','planar',1e-8,3,3.28,30)
mi_saveas("study103.fem")

draw_inner_square()
draw_outer_square()

mi_clearselected()
