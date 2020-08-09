function strength = S_o(material)

table = readtable("S_o.xlsx");

strength = table.S_o(material,:);


end