function strength = S_o(material)

table = readtable("S_o.xlsx");

idx = strncmp(material, table.Material, 9);   

strength = table.S_o(idx);

end