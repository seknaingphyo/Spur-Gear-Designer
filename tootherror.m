function error = tootherror(true_module, speed)

filename = 'D:\Matlab R202a\bin\Matlab Projects\Gear Designer\Spur Gear Designer\Data Files\tootherrorvsmodule.xlsx';
error_max = maxtootherror(speed);
data = readtable(filename);
errors = interp1(data.Module,[data.Firstclass data.Carefullycut data.Precision], true_module);
errors = errors(errors < error_max);
error = max(errors);


function error_max = maxtootherror(speed)

filename1 = 'D:\Matlab R202a\bin\Matlab Projects\Gear Designer\Spur Gear Designer\Data Files\maxtootherror.xlsx';    
table = readtable(filename1);
error_max = interp1(table.Speed, table.Tootherror, speed);

end

end