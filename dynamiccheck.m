function [true_module, dia, face_width, tot_error, F_end, F_dynamic, F_wear] = dynamiccheck(face_width, true_module, dia, K, Q, strength, y, M_t, rpm, material1, material2, profile)

speed = (pi*dia*10^-3*rpm)/60;

error_avg = tootherror(true_module, speed);

C = deformationfactor(error_avg, material1, material2, profile);

F_end = strength*10^6*face_width*10^-3*y*pi*true_module*10^-3;

F_t = M_t/((dia*10^-3)/2);

F_dynamic = F_t + ((21*speed*(face_width*C) + F_t)/(21*speed + sqrt(face_width*C + F_t)));

F_wear = dia*face_width*K*Q*10^-6;
                
error1 = abs((F_dynamic - F_end)/F_dynamic);

error2 = abs((F_dynamic - F_wear)/F_dynamic);

tot_error = ((error1 + error2)/2)*100;

while F_dynamic > F_wear && F_dynamic > F_end && error1 >= 0.11 && error2 >= 0.11
    
    true_module = true_module + 1;    
    dia = N*true_module;
    F_wear = dia*face_width*K*Q*10^-6;
    F_t = M_t/((dia*10^-3)/2);
    speed = (pi*dia*10^-3*rpm)/60;
    error_avg = tootherror(true_module, speed);
    C = deformationfactor(error_avg, material1, material2, profile);
    F_dynamic = F_t + ((21*speed*(face_width*C) + F_t)/(21*V + sqrt(face_width*C + F_t)));
    
    if F_dynamic < F_wear && F_dynamic < F_end && error1 < 0.11 && error2 < 0.11
        continue
    elseif F_dynamic > F_wear && F_dynamic > F_end && error1 < 0.11 && error2 < 0.11
        face_width = round(4*pi*true_module);
        continue
    end
end
    
function C = deformationfactor(error, material1, material2, profile)

filename = 'Deformationfactor.xlsx';
d = detectImportOptions(filename);
d.DataRange = 'A1';
table = readtable(filename, d);

numericHeaders = table(2,:);
numericHeaders = rmmissing(numericHeaders, 2);
numericHeaders = string(numericHeaders{1,:});

table.Properties.VariableNames(end - numel(numericHeaders) + 1 : end) = numericHeaders;
table.Properties.VariableNames(1:end - numel(numericHeaders)) = table2array(rmmissing(table(1,:),2));
table(1:2, :) = [ ];

idx = ismember(table.Material1, material1) & ismember(table.Material2, material2) & ismember(table.Toothform, profile);
tootherr = str2double(numericHeaders);
C = interp1(tootherr, table2array(table(idx, 4:end)), error);

end

function error = tootherror(true_module, speed)

filename = 'tootherrorvsmodule.xlsx';
error_max = maxtootherror(speed);
data = readtable(filename);
errors = interp1(data.Module,[data.Firstclass data.Carefullycut data.Precision], true_module);
errors = errors(errors < error_max);
error = max(errors);


function error_max = maxtootherror(speed)

filename1 = 'maxtootherror.xlsx';    
table = readtable(filename1);
error_max = interp1(table.Speed, table.Tootherror, speed);

end

end

end