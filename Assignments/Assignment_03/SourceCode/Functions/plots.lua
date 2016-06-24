function do_plots()
  --Make plots
  mo_seteditmode("contour")
  mo_addcontour(circ[1][1],circ[1][2])
  mo_addcontour(circ[2][1],circ[2][2])
  mo_makeplot(1,40000) -- 1: Plot |B|
  mo_makeplot(0,40000) -- 0: Plot Potential
  mo_makeplot(4,40000) -- 4: Plot |H|
end
