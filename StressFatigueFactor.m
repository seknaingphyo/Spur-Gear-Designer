function K = StressFatigueFactor(material1, material2, BHN, profile)

Steel1 = strncmp(material1, 'Steel', 5);
Steel2 = strncmp(material2, 'Steel', 5);
Bronze1 = strncmp(material1, 'Bronze', 6);
Bronze2 = strncmp(material2, 'Bronze', 6);
Cast_Iron1 = strncmp(material1, 'Cast Iron', 9);
Cast_Iron2 = strncmp(material2, 'Cast Iron', 9);
profile14 = strncmp(profile, 'Involute 14.5', 13);
profile20 = strncmp(profile, 'Full Depth 20', 13) | strncmp(profile, 'Stub 20', 7);

if Steel1 == 1 && Steel2 == 1 && profile14 == 1
    table = readtable('Stress Fatigue Factor.xlsx', 'Sheet', 1);
    idx = table.Average_BHN_steel(BHN);
    K = table.K_14(idx);
elseif Steel1 == 1 && Steel2 == 1 && profile20 == 1
    table = readtable('Stress Fatigue Factor.xlsx', 'Sheet', 1);
    idx = table.Average_BHN_steel(BHN);
    K = table.K_20(idx);
elseif (Cast_Iron1 == 1 && Cast_Iron2 == 1 && profile14 == 1) || (Bronze1 == 1 && Bronze2 == 1 && profile14 == 1)
    table = readtable('Stress Fatigue Factor.xlsx', 'Sheet', 3);
    idx = table.Material(material1) | table.Material(material2);
    K = table.K_14(idx);
elseif (Cast_Iron1 == 1 && Cast_Iron2 == 1 && profile20 == 1) || (Bronze1 == 1 && Bronze2 == 1 && profile20 == 1)
    table = readtable('Stress Fatigue Factor.xlsx', 'Sheet', 3);
    idx = table.Material(material1) | table.Material(material2);
    K = table.K_20(idx);
elseif Steel1 == 1 && Cast_Iron2 == 1 && profile14 == 1
    table = readtable('Stress Fatigue Factor.xlsx', 'Sheet', 2);
    K = table.K_14((table.BHN_steel == 150 & string(table.other_material) == "Cast Iron"), :);
elseif Steel1 == 1 && Cast_Iron2 == 1 && profile20 == 1
    table = readtable('Stress Fatigue Factor.xlsx', 'Sheet', 2);
    K = table.K_20((table.BHN_steel == 150 & string(table.other_material) == "Cast Iron"), :);
elseif Steel1 == 1 && Bronze2 == 1 && profile14 == 1
    table = readtable('Stress Fatigue Factor.xlsx', 'Sheet', 2);
    K = table.K_14((table.BHN_steel == 150 & string(table.other_material) == "Bronze"), :);
elseif Steel1 == 1 && Bronze2 == 1 && profile20 == 1
    table = readtable('Stress Fatigue Factor.xlsx', 'Sheet', 2);
    K = table.K_20((table.BHN_steel == 150 & string(table.other_material) == "Bronze"), :);
end

end