function do_mesh()
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
end
