function [true_module, dia, face_width, error_avg] = dynamiccheck(face_width, true_module, dia, speed, C, K, Q, strength, y, M_t)

F_end = strength*10^6*face_width*y*pi*true_module*10^-3;

F_t = M_t/(dia/2);

F_dynamic = F_t + ((21*speed*(face_width*C) + F_t)/(21*speed + sqrt(face_width*C + F_t)));

F_wear = dia*face_width*K*Q;
                
error1 = abs((F_dynamic - F_end)/F_dynamic);

error2 = abs((F_dynamic - F_wear)/F_dynamic);

error_avg = ((error1 + error2)/2)*100;

while F_dynamic > F_wear && F_dynamic > F_end && error1 >= 0.11 && error2 >= 0.11
    
    true_module = true_module + 1;    
    dia = N*true_module;
    F_wear = dia*face_width*K*Q;
    F_t = M_t/(dia/2);
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