function C = deformationfactor(error, material1, material2, profile)

filename = 'Deformationfactor.xlsx';
d = detectImportOptions(filename);
d.DataRange = 'A1';
table = readtable(filename, d);

numericHeaders = table(2,:);
numericHeaders = rmmissing(numericHeaders, 2);
numericHeaders = string(numericHeaders{1,:});

table.Properties.VariableNames(end - numel(numericHeaders) + 1 : end) = numericHeaders;
table.Properties.VariableNames(1:end - numel(numericHeaders)) = table2array(rmmissing(table(1,:),2));
table(1:2, :) = [ ];

idx = ismember(table.Material1, material1) & ismember(table.Material2, material2) & ismember(table.Toothform, profile);
tootherror = str2double(numericHeaders);
C = interp1(tootherror, table2array(table(idx, 4:end)), error);

end