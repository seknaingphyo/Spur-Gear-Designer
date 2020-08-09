function strength = S_o(material)

table = readtable("S_o.xlsx");

if material == 1
    strength = table.S_o(1,:);
elseif material == 2
    strength = table.S_o(2,:);
elseif material == 3
    strength = table.S_o(3,:);
end


end