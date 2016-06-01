--Programa para testar arquivo lua pelo atom editor
--22/03/2016

clearconsole()
newdocument(0)
mi_probdef(0,'centimeters','planar',1e-8,3,3.28,30)
mi_saveas("study101.fem")

--Inserindo os pontos
mi_addnode(0,0)
mi_addnode(1,1)
mi_addnode(2,0)
mi_addnode(1,-1)

--Inserido os segmentos
mi_addsegment(0,0,1,1)
mi_addsegment(1,1,2,0)
mi_addsegment(2,0,1,-1)
mi_addsegment(1,-1,0,0)

--inserindo as fronteiras
mi_addboundprop("Zero",0,0,0,0,0,0,0,0,0)
mi_setsegmentprop("Zero",0,0,0,0)

mi_clearselected()
