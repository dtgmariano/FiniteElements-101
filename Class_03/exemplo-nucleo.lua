--Adição dos circuitos
mi_addcircprop("Bobina +",1.776,1)
mi_addcircprop("Bobina -",-1.776,1)

--definição das camadas
--Núcleo
mi_addblocklabel(4.5,2)
mi_selectlabel(4.5,2)

dAlfa = 0.7
mi_zoomnatural()/
mi_savebitmap("layout.bmp")
open("Exemplo.fem")

for n=0,2.8,0.7 do
  mi_analyze()
  mi_loadsolution()
  mo_zoom(-3,-3,13,16)
  mo_clearblock()
  mo_showvectorplot(1,1.5)
  mo_showdensityplot(1,0,1.15,0,"bmag")
  mo_hidepoints()
  alfa = dAlfa*(n+1)
  mo_savebitmap(format("pos_%1$d.bmp"),alfa)
  mi_selectgroup(1)
  mi_movetranslate(dAlfa,0,(4))
end
