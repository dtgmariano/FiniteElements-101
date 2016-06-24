function do_blocks()
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
end
