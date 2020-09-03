function strength = S_o(material)

filename = 'S_o.xlsx';

table = readtable(filename);

idx = strcmp(material, table.Material);   

strength = table.S_o(idx);

end