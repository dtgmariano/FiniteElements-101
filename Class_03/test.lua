--Programa para testar arquivo lua pelo atom editor
--17/03/2016

clearconsole()
newdocument(0)
mi_probdef(0,'centimeters','planar',1e-8,3,3.28,30)
mi_saveas("Exemplo.fem")

--Fronteira
mi_addnode(-3.5,-3.5)
mi_addnode(-3.5,8.5)
mi_addnode(8.5,8.5)
mi_addnode(8.5,-3.5)

mi_addsegment(-3.5,-3.5,-3.5,8.5)
mi_addsegment(-3.5,8.5,8.5,8.5)
mi_addsegment(8.5,8.5,8.5,-3.5)
mi_addsegment(8.5,-3.5,-3.5,-3.5)

mi_addboundprop("Zero",0,0,0,0,0,0,0,0,0)
mi_setsegmentprop("Zero",0,0,0,0)

mi_clearselected()
