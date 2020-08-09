function strength = S_o(material)

table = readtable("S_o.xlsx");

idx = strncmp(material, table.Material, 8);   

strength = table.S_o(idx);

end