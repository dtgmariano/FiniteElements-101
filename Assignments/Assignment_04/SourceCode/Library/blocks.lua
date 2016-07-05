function do_blocks()
  --Defining Blocks
  mi_addblocklabel(325,0)
  mi_selectlabel(325,0)
  mi_setblockprop(mat_ussteel,  0,  0,  0,  0,  0,  0)
  mi_clearselected()

  mi_addblocklabel(0,0)
  mi_selectlabel(0,0)
  mi_setblockprop(mat_ussteel,  0,  0,  0,  0,  0,  0)
  mi_clearselected()

  mi_addblocklabel(247,0)
  mi_selectlabel(247,0)
  mi_setblockprop(mat_air,  0,  0,  0,  0,  0,  0)
  mi_clearselected()

  mi_addblocklabel(500,0)
  mi_selectlabel(500,0)
  mi_setblockprop(mat_air,  0,  0,  0,  0,  0,  0)
  mi_clearselected()

  mi_addblocklabel(-150,0)
  mi_selectlabel(-150,0)
  mi_setblockprop(mat_30awg,  0,  -1, "Icoil+",  0,  1,  200)
  mi_clearselected()

  mi_addblocklabel(150,0)
  mi_selectlabel(150,0)
  mi_setblockprop(mat_30awg,  0,  -1, "Icoil-",  0,  2,  200)
  mi_clearselected()
end
