function K = StressFatigueFactor(material, BHN1, BHN2, profile)

if strncmp(material, 'Steel', 5) == 1 && strncmp(profile, 'Involute 14.5', 13) == 1
    table = readtable('Stress Fatigue Factor.xlsx', 'Sheet', 1);
    avg_BHN = (BHN1 + BHN2)/2;
    idx = table.Average_BHN_steel(avg_BHN);
    K = table.K_14(idx);
elseif (strncmp(material, 'Steel', 5) == 1 && strncmp(profile, 'Involute 20', 13) == 1) || (strncmp(material, 'Steel', 5) == 1 && strncmp(profile, 'Stub 20', 7) == 1)
    table = readtable('Stress Fatigue Factor.xlsx', 'Sheet', 1);
    avg_BHN = (BHN1 + BHN2)/2;
    idx = table.Average_BHN_steel(avg_BHN);
    K = table.K_20(idx);
elseif strncmp(material, 'Cast Iron', 9) == 1 && strncmp(profile, 'Involute 14.5', 13) == 1
    table = readtable('Stress Fatigue Factor.xlsx', 'Sheet', 3);
    idx = table.Material(material);
    K = table.K_14(idx);
elseif (strncmp(material, 'Cast Iron', 9) == 1 && strncmp(profile, 'Involute 20', 13) == 1) || (strncmp(material, 'Cast Iron', 9) == 1 && strncmp(profile, 'Stub 20', 7) == 1)
    table = readtable('Stress Fatigue Factor.xlsx', 'Sheet', 3);
    idx = table.Material(material);
    K = table.K20(idx);
elseif strncmp(material, 'Bronze', 6) == 1 && strncmp(profile, 'Involute 14.5', 13) == 1
    table = readtable('Stress Fatigue Factor.xlsx', 'sheet', 3);
    idx = table.Material(material);
    K = table.K_14(idx);
elseif (strncmp(material, 'Bronze', 6) == 1 && strncmp(profile, 'Involute 20', 13) == 1) || (strncmp(material, 'Bronze', 9) == 1 && strncmp(profile, 'Stub 20', 7) == 1)
    table = readtable('Stress Fatigue Factor.xlsx', 'sheet', 3);
    idx = table.Material(material);
    K = table.K_20(idx);
end
end