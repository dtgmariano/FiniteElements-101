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
  r_rotor = 250
  ang = math.pi / 3 -- PI/3 = 180/3 = 60
  d = math.sin(ang) * r_rotor
  l = math.cos(ang) * r_rotor

  points2 = {{center[1]-d,center[2]+l},{center[1],center[2]+r},{center[1]+d,center[2]+l},{center[1]-d,center[2]-l},{center[1],center[2]-r},{center[1]+d,center[2]-l}}
  for i=1, 6 do
    mi_addnode(points2[i][1], points2[i][2])
  end

end

function return_point(x_cent,y_cent,r,ang)

  return {}
end

function do_draw()
  draw_stator()
  draw_rotor()
end
