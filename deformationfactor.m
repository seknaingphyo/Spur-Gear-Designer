function C = deformationfactor(error, material1, material2, profile)

filename = 'D:\Matlab R202a\bin\Matlab Projects\Gear Designer\Spur Gear Designer\Data Files\Deformationfactor.xlsx';
table = readtable(filename);

numericHeaders = table(2,:);
numericHeaders = rmmissing(numericHeaders, 2);
numericHeaders = string(numericHeaders{1,:});

table.Properties.VariableNames(end - numel(numericHeaders) + 1 : end) = numericHeaders;
table.Properties.VariableNames(1:end - numel(numericHeaders)) = table2array(rmmissing(table(1,:),2));
table(1:2, :) = [ ];

idx = table(table.Material1 == material1 & table.Material2 == material2 & table.Toothform == profile);
C = interp1(idx(:, 4:end), error);

end