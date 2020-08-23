function y = LewisFactor(numofteeth, profile)

filename = 'D:\Matlab R202a\bin\Matlab Projects\Gear Designer\Spur Gear Designer\Data Files\Lewis_factor_table.xlsx';
table = readtable(filename);

if strcmp('Involute 14.5', profile) == 1
    table = removevars(table, {'Full_Depth_20', 'Stub_20'});
    y = interp1(table.Numofteeth, table.Full_Depth_14, numofteeth);
elseif strcmp('Full Depth 20', profile) == 1
    table = removevars(table, {'Full_Depth_14', 'Stub_20'});
    y = interp1(table.Numofteeth, table.Full_Depth_20, numofteeth);
elseif strcmp('Stub 20', profile) == 1
    table = removevars(table, {'Full_Depth_14', 'Full_Depth_20'});
    y = interp1(table.Numofteeth, table.Stub_20, numofteeth);
end

end