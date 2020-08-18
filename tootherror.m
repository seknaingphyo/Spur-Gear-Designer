function error = tootherror(true_module, speed)

error_max = maxtootherror(speed);
data = readtable('tootherrorvsmodule.xlsx');
errors = data{data.Module == true_module, 2:end};
if isempty(errors)
    error =...
        [interp1(data.Module,data.Firstclass, true_module)...
        interp1(data.Module,data.Carefullycut, true_module)...
        interp1(data.Module,data.Precision, true_module)];
end
error = error(error < error_max);
error = max(error);
end
    

function error_max = maxtootherror(speed)

table = readtable('maxtootherror.xlsx');
idx = ismember(table.Speed, speed);

if isempty(find(idx > 0, 1)) ~= 1
    error_max = table2array(table(idx,2));
elseif isempty(find(idx > 0, 1)) == 1
    speed1 = min(table.Speed(table.Speed > speed));
    speed2 = max(table.Speed(table.Speed < speed));
    idx1 = ismember(table.Speed, speed1);
    idx2 = ismember(table.Speed, speed2);
    error_max = interp1([speed1 speed2],...
        [table2array(table(idx1, 2)) table2array(table(idx2, 2))],...
        speed, 'linear');
end

end

end