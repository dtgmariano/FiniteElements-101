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
  coil1 = {{-2,124.5}, {0, 124.5}, {0, 129.5}, {-2, 129.5}}
  draw_square(coil1)
  coil2 = {{50.8,124.5} , {52.8,124.5}, {52.8,129.5}, {50.8,129.5}}
  draw_square(coil2)
  circ = {{-200,127}, {403.2,127}}
  draw_circle(circ)

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
  mo_makeplot(1,40000) -- 1: Plot |B|
  mo_makeplot(0,40000) -- 0: Plot Potential
  mo_makeplot(4,40000) -- 4: Plot |H|
