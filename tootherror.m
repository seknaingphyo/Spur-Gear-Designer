function e_p = tootherror(speed)

table = readtable('Tootherror.xlsx');

idx = ismember(table.Speed, speed);

if isempty(find(idx > 0, 1)) ~= 1
    e = table2array(table(idx,2));
elseif isempty(find(idx > 0, 1)) == 1
    speed1 = min(table.Speed(table.Speed > speed));
    speed2 = max(table.Speed(table.Speed < speed));
    idx1 = ismember(table.Speed, speed1);
    idx2 = ismember(table.Speed, speed2);
    e = interp1([speed1 speed2],...
        [table2array(table(idx1, 2)) table2array(table(idx2, 2))],...
        speed, 'linear', 'extrap');
end



end