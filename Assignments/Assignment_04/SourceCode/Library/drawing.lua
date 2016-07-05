--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--% Auhtor: Daniel Teodoro Gonçalves Mariano                  %--
--% Date: 04/05/2016                                          %--
--% Description: Program to develop functions for LUA script  %--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

--%%%%%%%%%%%%%--
--% Functions %--
--%%%%%%%%%%%%%--

function draw_stator()
  center = {0, 0}
  ds_out = 800
  ds_ins = 500
  --fw_lef =
  --fw_rig =
  -- rotor =

  stator_outside_points = {{center[1] - (ds_out / 2), center[2]}, {center[1] + (ds_out / 2), center[2]}}
  mi_addnode(stator_outside_points[1][1],stator_outside_points[1][2])
  mi_addnode(stator_outside_points[2][1],stator_outside_points[2][2])
  mi_addarc(stator_outside_points[1][1], stator_outside_points[1][2], stator_outside_points[2][1], stator_outside_points[2][2], 180, 1)
  mi_addarc(stator_outside_points[2][1], stator_outside_points[2][2], stator_outside_points[1][1], stator_outside_points[1][2], 180, 1)

  stator_inside_points = {{center[1] - (ds_ins / 2), center[2]}, {center[1] + (ds_ins / 2), center[2]}}
  mi_addnode(stator_inside_points[1][1],stator_inside_points[1][2])
  mi_addnode(stator_inside_points[2][1],stator_inside_points[2][2])
  mi_addarc(stator_inside_points[1][1], stator_inside_points[1][2], stator_inside_points[2][1], stator_inside_points[2][2], 180, 1)
  mi_addarc(stator_inside_points[2][1], stator_inside_points[2][2], stator_inside_points[1][1], stator_inside_points[1][2], 180, 1)
end

function draw_rotor()
  center = {0,0}
  --part 1
  points = {{-200,100},{-100,100},{100,100},{200,100},{-200,-100},{-100,-100},{100,-100},{200,-100}}
  for i=1, 8 do
    mi_addnode(points[i][1], points[i][2])
  end
  mi_addsegment(points[1][1], points[1][2],points[2][1], points[2][2])
  mi_addsegment(points[3][1], points[3][2],points[4][1], points[4][2])
  mi_addsegment(points[5][1], points[5][2],points[6][1], points[6][2])
  mi_addsegment(points[7][1], points[7][2],points[8][1], points[8][2])
  mi_addsegment(points[2][1], points[2][2],points[6][1], points[6][2])
  mi_addsegment(points[3][1], points[3][2],points[7][1], points[7][2])

  --part 2
  points2 = {{-200, 103.923},{0, 240},{200, 103.923},{200, 100},{100, 100},{100, -100},{200, -100},{200, -103.923},{0,-240},{-200,-103,923},{-200,-100},{-100,-100},{-100,100},{-200,100}}
  for i=1, 14 do
    mi_addnode(points2[i][1], points2[i][2])
  end
  mi_addarc(points2[2][1], points2[2][2], points2[1][1], points2[1][2], 60, 1)
  mi_addarc(points2[3][1], points2[3][2], points2[2][1], points2[2][2], 60, 1)
  mi_addsegment(points2[3][1],points2[3][2],points2[4][1],points2[4][2])
  mi_addsegment(points2[4][1],points2[4][2],points2[5][1],points2[5][2])
  mi_addsegment(points2[5][1],points2[5][2],points2[6][1],points2[6][2])
  mi_addsegment(points2[6][1],points2[6][2],points2[7][1],points2[7][2])
  mi_addsegment(points2[7][1],points2[7][2],points2[8][1],points2[8][2])
  mi_addarc(points2[9][1], points2[9][2], points2[8][1], points2[8][2], 60, 1)
  mi_addarc(points2[10][1], points2[10][2], points2[9][1], points2[9][2], 60, 1)
  mi_addsegment(points2[10][1],points2[10][2],points2[11][1],points2[11][2])
  mi_addsegment(points2[11][1],points2[11][2],points2[12][1],points2[12][2])
  mi_addsegment(points2[12][1],points2[12][2],points2[13][1],points2[13][2])
  mi_addsegment(points2[13][1],points2[13][2],points2[14][1],points2[14][2])
  mi_addsegment(points2[14][1],points2[14][2],points2[1][1],points2[1][2])
end

function draw_field_winding()
  --parte 3
  points3={{-200,90},{-110,90},{-110,-90},{-200,-90}}
  for i=1, 4 do
    mi_addnode(points3[i][1], points3[i][2])
  end
  for i=1, 3 do
    mi_addsegment(points3[i][1], points3[i][2], points3[i+1][1], points3[i+1][2])
  end
  mi_addsegment(points3[4][1], points3[4][2], points3[1][1], points3[1][2])

  points4={{200,90},{200,-90},{110,-90},{110,90}}
  for i=1, 4 do
    mi_addnode(points4[i][1], points4[i][2])
  end
  for i=1, 3 do
    mi_addsegment(points4[i][1], points4[i][2], points4[i+1][1], points4[i+1][2])
  end
  mi_addsegment(points4[4][1], points4[4][2], points4[1][1], points4[1][2])
end

function draw_boundaries()
  mi_addnode(-600, 0)
  mi_addnode(600,0)
  mi_addarc(-600, 0, 600, 0, 180, 1)
  mi_addarc(600, 0, -600, 0, 180, 1)
end

function do_draw()
  draw_stator()
  draw_rotor()
  draw_field_winding()
  draw_boundaries()
end
