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

function do_draw()
  --Drawing Points and Segments
  outerpoints = {{0,0} , {203.2,0}, {203.2,254}, {0,254}}
  innerpoints = {{50.8,50} , {152.4,50}, {152.4,204}, {50.8,204}}
  coil1 = {{-2,124.5}, {0, 124.5}, {0, 129.5}, {-2, 129.5}}
  coil2 = {{50.8,124.5} , {52.8,124.5}, {52.8,129.5}, {50.8,129.5}}
  circ = {{-200,127}, {403.2,127}}
  draw_square(outerpoints)
  draw_square(innerpoints)
  draw_square(coil1)
  draw_square(coil2)
  draw_circle(circ)

  --Condition Border
  mi_selectsegment(circ[1][1],circ[1][2])
  mi_selectsegment(circ[2][1],circ[2][2])
  mi_addboundprop("Zero",  0,  0,  0,  0,  0,  0,  0,  0,  0)
  mi_setsegmentprop("Zero",  1,  1,  0,  0)
  mi_clearselected()
end
