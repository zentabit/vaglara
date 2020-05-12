fun = @root3d;
x0 = [1,1,10];
x = fsolve(fun, x0);
A = x(1);
B = x(2);

n = @(l) A + B./(l.^2);
ls = linspace(400e-9, 700e-9);

plot(ls, n(ls), 'r');
title("\Deltan as a function of wavelength");
xlabel("Wavelength \lambda (m)");
ylabel("\Deltan");