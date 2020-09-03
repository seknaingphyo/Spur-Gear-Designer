function K = StressFatigueFactor(material1, material2, BHN1, BHN2, profile)

BHN_avg = (BHN1+BHN2)/2;
Steel1 = strcmp(material1, 'Steel');
Steel2 = strcmp(material2, 'Steel');
Cast_Iron1 = strcmp(material1, 'Cast Iron');
Cast_Iron2 = strcmp(material2, 'Cast Iron');
profile14 = strcmp(profile, 'Involute 14.5');
profile20 = strcmp(profile, 'Full Depth 20') | strcmp(profile, 'Stub 20');

filename = 'Stress Fatigue Factor.xlsx';

if Steel1 == 1 && Steel2 == 1 && profile14 == 1
    table = readtable(filename, 'Sheet', 1);
    K = interp1(table.Average_BHN_steel, table.K_14, BHN_avg);
elseif Steel1 == 1 && Steel2 == 1 && profile20 == 1
    table = readtable(filename, 'Sheet', 1);
    K = interp1(table.Average_BHN_steel, table.K_20, BHN_avg);
elseif Cast_Iron1 == 1 && Cast_Iron2 == 1 && profile14 == 1
    table = readtable(filename, 'Sheet', 3);
    K = table.K_14;
elseif Cast_Iron1 == 1 && Cast_Iron2 == 1 && profile20 == 1
    table = readtable(filename, 'Sheet', 3);
    K = table.K_20;
elseif Steel1 == 1 && Cast_Iron2 == 1 && profile14 == 1
    table = readtable(filename, 'Sheet', 2);
    K = interp1(table.BHN_steel, table.K_14, BHN_avg);
elseif Steel1 == 1 && Cast_Iron2 == 1 && profile20 == 1
    table = readtable(filename, 'Sheet', 2);
    K = interp1(table.BHN_steel, table.K_20, BHN_avg);
end

end