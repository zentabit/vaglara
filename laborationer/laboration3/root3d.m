function F = root3d(x)

l1 = 474.9e-9;
l2 = 523.1e-9;
l3 = 632.7e-9;
p = 6;
q = 16;
d = 3e-3;

F(1) = d.*(x(1)+x(2)./(l1.^2))-(2.*x(3)+1).*(l1./2);
F(2) = d.*(x(1)+x(2)./(l2.^2))-(2.*(x(3)-p)+1).*(l2./2);
F(3) = d.*(x(1)+x(2)./(l3.^2))-(2.*(x(3)-q)+1).*(l3./2);