function error = tootherror(true_module, speed)

error_max = maxtootherror(speed);
data = readtable('tootherrorvsmodule.xlsx');
errors = interp1(data.Module,[data.Firstclass data.Carefullycut data.Precision], true_module);
errors = errors(errors < error_max);
error = max(errors);


function error_max = maxtootherror(speed)

table = readtable('maxtootherror.xlsx');
error_max = interp1(table.Speed, table.Tootherror, speed);

end

end