--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--% Auhtor: Daniel Teodoro Gonçalves Mariano                  %--
--% Date: 04/05/2016                                          %--
--% Description: Program to develop functions for LUA script  %--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

dofile('Functions/blocks.lua')
dofile('Functions/circuit.lua')
dofile('Functions/drawing.lua')
dofile('Functions/materials.lua')
dofile('Functions/mesh.lua')
dofile('Functions/plots.lua')

--%%%%%%%%%%%%%%%%--
--% Main Program %--
--%%%%%%%%%%%%%%%%--

  clearconsole()
  newdocument(0)
  mi_probdef(0 ,'millimeters','planar','1E-8','4','30',0)
  --mi_saveas("study102.fem")
  do_draw()
  do_materials()
  do_circuit()
  do_blocks()
  do_mesh()
  do_plots()
