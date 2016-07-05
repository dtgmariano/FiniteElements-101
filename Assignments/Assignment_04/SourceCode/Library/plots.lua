function do_plots()
  --Make plots
  mo_seteditmode("contour")
  mo_addcontour(-600,0)
  mo_addcontour(600,0)
  mo_makeplot(1,40000) -- 1: Plot |B|
  mo_savebitmap("plot_b.bmp")
  mo_makeplot(0,40000) -- 0: Plot Potential
  mo_savebitmap("plot_p.bmp")
  mo_makeplot(4,40000) -- 4: Plot |H|
  mo_savebitmap("plot_h.bmp")
end
