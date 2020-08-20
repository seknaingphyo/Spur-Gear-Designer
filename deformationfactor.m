function C = deformationfactor(error, material1, material2, profile)

filename = 'D:\Matlab R202a\bin\Matlab Projects\Gear Designer\Spur Gear Designer\Data Files\Deformationfactor.xlsx';
table = readtable(filename, 'PreserveVariableNames', true);

idx = table(table.Material1 == material1 & table.Material2 == material2 & table.Toothform == profile);
C = interp1(idx(:, 4:end), error);

end