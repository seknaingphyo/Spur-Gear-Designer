function[N, true_module, allowed_s, ind_s] = ModuleCorrector3(dia, assum_module, y_assum, profile)

allowed_s = 1/(((assum_module*10^-3)^2)*y_assum);
N = dia/assum_module;
y = LewisFactor(N, profile);
ind_s = 1/(((assum_module*10^-3)^2)*y);
diff = ind_s - allowed_s;
percent = (diff/allowed_s)*100;

if allowed_s > ind_s && percent >= -25
        true_module = assum_module;
end

while ind_s > allowed_s && percent > 0    
    assum_module = assum_module + 1;
    N = dia/assum_module;
    
    while rem(N, 1) ~= 0
        assum_module = assum_module + 1;
        N = dia/assum_module;
        if rem(N, 1) == 0
            continue
        end
    end
    
    allowed_s = 1/(((assum_module*10^-3)^2)*y_assum);
    y = LewisFactor(N, profile);
    ind_s = 1/(((assum_module*10^-3)^2)*y);
    diff = ind_s - allowed_s;
    percent = (diff/allowed_s)*100;
           
    if allowed_s > ind_s && diff < 0 && percent >= -25
        true_module = assum_module;
        continue
    end
end
 
while allowed_s > ind_s && percent < -25
        assum_module = assum_module - 1;
        N = dia/assum_module;
    
        while rem(N, 1) ~= 0
            assum_module = assum_module - 1;
            N = dia/assum_module;
            if rem(N, 1) == 0
                continue
            end
        end
        
        allowed_s = 1/(((assum_module*10^-3)^2)*y_assum);        
        y = LewisFactor(N, profile);
        ind_s = 1/(((assum_module*10^-3)^2)*y);
        diff = ind_s - allowed_s;
        percent = (diff/allowed_s)*100;
        
    if allowed_s > ind_s && percent >= -25
        true_module = assum_module;
        continue
    end
end

end