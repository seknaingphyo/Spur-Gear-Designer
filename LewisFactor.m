function y = LewisFactor(numofteeth)

table = readtable("Lewis_factor_table.xlsx");

idx = ismember(table.Numofteeth, numofteeth);

if isempty(find(idx > 0, 1)) ~= 1
    y = table2array(table(idx,2));
elseif isempty(find(idx > 0, 1)) == 1
    y = table2array(interp1([table(idx - 1,1) table(idx - 1,2)], [table(idx + 1,1) table(idx - 1, 2)], numofteeth));
end

end