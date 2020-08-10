function true_module = module_corrector(assum_module, M_t, k_assum, y, N, rpm, strength)

ind_s = (2*M_t)/(k_assum*y*pi^2*N*(assum_module*10^-3)^3);

dia = N*assum_module;            
speed = (pi*dia*10^-3*rpm)/60;
            
if speed < 10
   allow_s = (strength*10^6)*(3/(3+speed));
elseif speed >= 10 && speed <= 20
   allow_s = (strength*10^6)*(6/(6+speed));
elseif speed > 20
   allow_s = (strength*10^6)*(5.6/(5.6+speed));
end

while ind_s > allow_s || ind_s == allow_s
    
assum_module = assum_module + 1;
ind_s = (2*M_t)/(k_assum*y*pi^2*N*assum_module^3);

dia = N*assum_module;            
speed = (pi*dia*10^-3*rpm)/60;
            
if speed < 10
   allow_s = (strength*10^6)*(3/(3+speed));
elseif speed >= 10 && speed <= 20
   allow_s = (strength*10^6)*(6/(6+speed));
elseif speed > 20
   allow_s = (strength*10^6)*(5.6/(5.6+speed));
end

   if ind_s < allow_s
       true_module = assum_module;
       continue
   end

end