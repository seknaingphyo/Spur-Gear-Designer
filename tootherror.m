function e = tootherror(true_module)

e_max = maxtootherror(speed);
data = readtable('tootherrorvsmodule.xlsx');
equal = ismember(data.Module, true_module);

if isempty(find(equal > 0, 1)) ~= 1
    e = table2array(data(equal, max(data(e_max > equal(:, 2:4)))));
elseif isempty(find(equal > 0, 1)) == 1
    m1 = min(data.Module(data.Module > true_module));
    m2 = max(data.Module(data.Module < true_module));
    e1 = 
end
    

function e_max = maxtootherror(speed)

table = readtable('maxtootherror.xlsx');
idx = ismember(table.Speed, speed);

if isempty(find(idx > 0, 1)) ~= 1
    e_max = table2array(table(idx,2));
elseif isempty(find(idx > 0, 1)) == 1
    speed1 = min(table.Speed(table.Speed > speed));
    speed2 = max(table.Speed(table.Speed < speed));
    idx1 = ismember(table.Speed, speed1);
    idx2 = ismember(table.Speed, speed2);
    e_max = interp1([speed1 speed2],...
        [table2array(table(idx1, 2)) table2array(table(idx2, 2))],...
        speed, 'linear', 'extrap');
end

end

end