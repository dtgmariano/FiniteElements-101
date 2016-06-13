------------------------------------------------------------

--- PROJECT MAGNETIC CIRCUIT Programming by LUA-script ---

	--Author: Guilherme Costa Ayres Tolentino--

------------------------------------------------------------


function gui_drawpoly(...)
	local narg = 0
	while arg[narg+1] do
		narg = narg+1
	end
	-- narg é o número de elementos no vetor de argumentos (arg)
	if mod(narg,2) == 0 then -- checa se é par
		if narg >= 4 then -- checa se tem no mínimo 2 pontos
			local i = 1
		    while arg[i] do
		      mi_addnode(arg[i],arg[i+1])
		      if arg[i+2] then
		        mi_addnode(arg[i+2],arg[i+3])
			  	mi_addsegment(arg[i],arg[i+1],arg[i+2],arg[i+3])
		      elseif narg > 4 then -- só precisa "fechar" se tivar mais de 2 pontos
		      	mi_addsegment(arg[i],arg[i+1],arg[1],arg[2])
			  end
		      i = i + 2 -- vai para o próximo ponto (coordenada x)
		    end
		else
			messagebox('EI_DRAWPOLY::few number of arguments')
		end
	else
		messagebox('EI_DRAWPOLY::wrong number of arguments, must be even')
	end
end

-- MAIN FUNCTION --

	clearconsole()
	newdocument(0) -- 0 Magnetics/1 Eletrostatics/2 Heat Flow/3 Current Flow --
	messagebox('Study of Magnetic Circuit using FEMM modeled by LUA script')
	mi_probdef(0 ,'centimeters','planar','1E-8','4','30',0)
	--mi probdef(freq,units,type,precision,depth,minangle,(acsolver))

	gui_drawpoly(1,1,7,1,7,9,5,9,5,3,3,3,3,9,1,9) -- design of Magnetic circuit
	gui_drawpoly(1,9.01,7,9.01,7,11.01,1,11.01) -- -- design of Magnetic circuit
	gui_drawpoly(-10,-10,17,-10,17,21,-10,21) -- design of condition borders
	gui_drawpoly(1,3,1,8,-0.6,8,-0.6,3)-- Area of Coil
	gui_drawpoly(3,3,3,8,4.6,8,4.6,3)-- Area of Coil

--Condition Border
	mi_selectsegment(-10,-10)
	mi_selectsegment(17,-10)
	mi_selectsegment(17,21)
	mi_selectsegment(-10,21)
	mi_selectsegment(21,-10)
	mi_addboundprop("ZERO",  0,  0,  0,  0,  0,  0,  0,  0,  0)
	mi_setsegmentprop("ZERO",  1,  1,  0,  0)
	mi_clearselected()

--Define Materials
	mi_addmaterial("Iron", 10000, 10000, 0, 0, 0, 0, 0, 0, 1, 0)
	mi_addmaterial("Air",  1,  1,  0,  0,  0,  0,  0,  0,  1,  0)
	mi_addmaterial("Copper",  1,  1,  0,  0,  58,  0,  0,  0,  1,  0)

--Define coil current
	mi_addcircprop("Coil",  3.75,  0,  0,  0)
	mi_addcircprop("-Coil",  -3.75,  0,  0,  0)

--Define properties of material
	mi_addblocklabel(-4,8)
	mi_selectlabel(-4,8)
	mi_setblockprop("Air",  0,  0.3,  0,  0,  0,  0)
	mi_clearselected()

	mi_addblocklabel(4,5)
	mi_selectlabel(4,5)
	mi_setblockprop("Air",  0,  0.3,  0,  0,  0,  0)
	mi_clearselected()

	mi_addblocklabel(1.5,1.5)
	mi_selectlabel(1.5,1.5)
	mi_setblockprop("Iron",  0,  0.3,  0,  0,  4,  0)
	mi_clearselected()

	mi_addblocklabel(5,10.01)
	mi_selectlabel(5,10.01)
	mi_setblockprop("Iron",  0,  0.3,  0,  0,  4,  0)
	mi_clearselected()

	mi_addblocklabel(0.1,5)
	mi_selectlabel(0.1,5)
	mi_setblockprop("Copper",  0,  0.3, "Coil",  0,  0,  200)
	mi_clearselected()

	mi_addblocklabel(4,5)
	mi_selectlabel(4,5)
	mi_setblockprop("Copper",  0,  0.3, "-Coil",  0,  0,  200)
	mi_clearselected()

--Run Mesh
	mi_zoomnatural()
	mi_saveas("Gui_Magnetic Circuits.fem")
	messagebox("Gui_Magnetic Circuits.fem as save!!!")

	mi_createmesh()
	mi_analyze( 1)
	messagebox("The method of triangles finished")

	mi_loadsolution()

	mo_smooth("on")
	mo_showdensityplot( 1,  0,  1.5,  0, "bmag")
	--mo_savebitmap("densidade.bmp")
