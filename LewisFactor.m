function y = LewisFactor(numofteeth)

table = readtable("Lewis_factor_table.xlsx");

idx = ismember(table.Numofteeth, numofteeth);

if isempty(find(idx > 0, 1)) ~= 1
    y = table2array(table(idx,2));
elseif isempty(find(idx > 0, 1)) == 1
    numofteeth1 = min(table.Numofteeth(table.Numofteeth > numofteeth));
    numofteeth2 = max(table.Numofteeth(table.Numofteeth < numofteeth));
    idx1 = ismember(table.Numofteeth, numofteeth1);
    idx2 = ismember(table.Numofteeth, numofteeth2);
    y = interp1([numofteeth1 numofteeth2], [table2array(table(idx1, 2)) table2array(table(idx2, 2))], numofteeth, 'linear', 'extrap');
end

end