--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--
--% Auhtor: Daniel Teodoro Gonçalves Mariano                  %--
--% Date: 01/07/2016                                          %--
--% Description:                                              %--
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--

dofile('Library/blocks.lua')
dofile('Library/circuit.lua')
dofile('Library/drawing.lua')
dofile('Library/materials.lua')
dofile('Library/mesh.lua')
dofile('Library/plots.lua')

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
  --do_mesh()
  --do_plots()
