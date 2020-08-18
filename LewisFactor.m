function y = LewisFactor(numofteeth, profile)

table = readtable("Lewis_factor_table.xlsx");

if strncmp('Involute 14.5', profile, 13) == 1
    table = removevars(table, {'Full_Depth_20', 'Stub_20'});
    y = interp1(table.Numofteeth, table.Full_Depth_14, numofteeth);
elseif strncmp('Full Depth 20', profile, 13) == 1
    table = removevars(table, {'Full_Depth_14', 'Stub_20'});
    y = interp1(table.Numofteeth, table.Full_Depth_20, numofteeth);
elseif strncmp('Stub 20', profile, 7) == 1
    table = removevars(table, {'Full_Depth_14', 'Full_Depth_20'});
    y = interp1(table.Numofteeth, table.Stub_20, numofteeth);
end

end