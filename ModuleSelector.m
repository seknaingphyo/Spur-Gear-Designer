function module = ModuleSelector(module)

module_series = [1 1.25 1.5 2 2.5 3 4 5 6 8 10 12 16 20 25 32 40 50];
[~,ix] = min(abs(module_series - module));
module = module_series(ix);

end