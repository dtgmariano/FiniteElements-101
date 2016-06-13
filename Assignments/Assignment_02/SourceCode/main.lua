--%%%%%%%%%%%%%%%%--
--% Main Program %--
--%%%%%%%%%%%%%%%%--

  clearconsole()
  newdocument(0)
  mi_probdef(0 ,'millimeters','planar','1E-8','4','30',0)
  --mi_saveas("study102.fem")

  local funcs = require "functions.lua"

  --Drawing Points and Segments
  outerpoints = {{0,0} , {203.2,0}, {203.2,254}, {0,254}}
  funcs.draw_square(outerpoints)
  innerpoints = {{50.8,50} , {152.4,50}, {152.4,204}, {50.8,204}}
  funcs.draw_square(innerpoints)
  coil1 = {{-2,124.5}, {0, 124.5}, {0, 129.5}, {-2, 129.5}}
  funcs.draw_square(coil1)
  --mi_setgroup(1)
  --mi_clearselected()
  coil2 = {{50.8,124.5} , {52.8,124.5}, {52.8,129.5}, {50.8,129.5}}
  funcs.draw_square(coil2)
  --mi_setgroup(2)
  --mi_clearselected()
  circ = {{-200,127}, {403.2,127}}
  funcs.draw_circle(circ)

  --Condition Border
	mi_selectsegment(circ[1][1],circ[1][2])
	mi_selectsegment(circ[2][1],circ[2][2])
	mi_addboundprop("Zero",  0,  0,  0,  0,  0,  0,  0,  0,  0)
	mi_setsegmentprop("Zero",  1,  1,  0,  0)
	mi_clearselected()

  --Defining Materials
  mat_air = "Air"
  mat_ussteel = "US Steel Type 2-S 0.018 inch thickness"
  mat_30awg = "30 AWG"
  mi_getmaterial(mat_air)
  mi_getmaterial(mat_ussteel)
  mi_getmaterial(mat_30awg)

  --Defining Icoil
  --arg 1: circuit
  --arg 2: current
  --arg 3: 0 (parallel); 1 (series)
  mi_addcircprop("Icoil+",  0.1,  1,  0,  0)
  mi_addcircprop("Icoil-", -0.1,  1,  0,  0)

  --Defining Blocks
  coord_a = {((innerpoints[1][1] + innerpoints[2][1])/2), ((innerpoints[2][2]+innerpoints[3][2])/2)}
  mi_addblocklabel(coord_a[1],coord_a[2])
  mi_selectlabel(coord_a[1],coord_a[2])
  mi_setblockprop(mat_air,  0,  0,  0,  0,  0,  0)
  mi_clearselected()

  offset_b = (innerpoints[2][2] - innerpoints[3][2])
  coord_b = {((outerpoints[1][1] + outerpoints[2][1])/2), ((outerpoints[2][2]+outerpoints[3][2])/2) + offset_b}
  mi_addblocklabel(coord_b[1],coord_b[2])
  mi_selectlabel(coord_b[1],coord_b[2])
  mi_setblockprop(mat_air,  0,  0,  0,  0,  0,  0)
	mi_clearselected()

  coord_c = {((outerpoints[1][1] + outerpoints[2][1])/2), ((innerpoints[1][2]+outerpoints[1][2])/2)}
  mi_addblocklabel(coord_c[1],coord_c[2])
  mi_selectlabel(coord_c[1],coord_c[2])
	mi_setblockprop(mat_ussteel,  0,  0,  0,  0,  0,  0)
	mi_clearselected()

  coord_d = {((coil1[1][1] + coil1[2][1])/2), ((coil1[2][2]+coil1[3][2])/2)}
  mi_addblocklabel(coord_d[1],coord_d[2])
	mi_selectlabel(coord_d[1],coord_d[2])
	mi_setblockprop(mat_30awg,  0,  -1, "Icoil+",  0,  1,  200)
	mi_clearselected()

  coord_e = {((coil2[1][1] + coil2[2][1])/2), ((coil2[2][2]+coil2[3][2])/2)}
  mi_addblocklabel(coord_e[1],coord_e[2])
	mi_selectlabel(coord_e[1],coord_e[2])
	mi_setblockprop(mat_30awg,  0,  -1, "Icoil-",  0,  2,  200)
	mi_clearselected()

  --Run Mesh
	mi_zoomnatural()
	mi_saveas("magcirc.fem")
	messagebox("magcirc.fem as save!!!")

	mi_createmesh()
	mi_analyze( 1)
	messagebox("The method of triangles finished")

	mi_loadsolution()

  mo_smooth("on")
	mo_showdensityplot( 1,  0,  1.5,  0, "bmag")
	--mo_savebitmap("densidade.bmp")

  --Make plots
  mo_seteditmode("contour")
  mo_addcontour(circ[1][1],circ[1][2])
  mo_addcontour(circ[2][1],circ[2][2])
  mo_makeplot(1,40000)
  mo_makeplot(0,40000)
  mo_makeplot(4,40000)
