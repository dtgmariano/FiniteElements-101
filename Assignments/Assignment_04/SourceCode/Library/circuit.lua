function do_circuit()
  --Defining Icoil
  --arg 1: circuit
  --arg 2: current
  --arg 3: 0 (parallel); 1 (series)
  mi_addcircprop("Icoil+",  75,  1,  0,  0)
  mi_addcircprop("Icoil-", -75,  1,  0,  0)
end
