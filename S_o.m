function strength = S_o(material)

filename = 'D:\Matlab R202a\bin\Matlab Projects\Gear Designer\Spur Gear Designer\Data Files\S_o.xlsx';

table = readtable(filename);

idx = strncmp(material, table.Material, 9);   

strength = table.S_o(idx);

end