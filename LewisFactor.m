function y = LewisFactor(numofteeth)

table = readtable("Lewis_factor_table.xlsx");

idx = ismember(table.Numofteeth, numofteeth);

y = table2array(table(idx,2));

end