
%% a uppgift
a = pi/6;
n = 1.5;

% h??rledd f??r hand + s211 i boken
d = @(x) x + asin(n.*sin(a - asin(sin(x)./n))) - a;

x = linspace(-pi/2, pi/2);
y = d(x);

plot(x,y)

%% b uppgift
% zinkdopat kronglas
a1 = 1.517;
a2 = 200;

% tungt flintglas
b1 = 1.653;
b2 = 10.27;

% ber??kna brytningsindex
n = @(l) a1 + a2./l;
m = @(l) a1 + a2./l;
% dess v??gl??ngder kikar vi p??
ls = [450 540 600 700];
% ber??kna n f??r dessa
ns = n(ls)
ms = m(ls)
% ny funktion d??r man kan ??ndra n
d1 = @(x, n) x + asin(n.*sin(a - asin(sin(x)./n))) - a;

y1 = d1(x, ns(1));
y2 = d1(x, ns(2));
y3 = d1(x, ns(3));
y4 = d1(x, ns(4));

z1 = d1(x, ms(1));
z2 = d1(x, ms(2));
z3 = d1(x, ms(3));
z4 = d1(x, ms(4));

tiledlayout(2,1);
ax1 = nexttile;
ax1.Title.String = "Zinkdopat kronglas";
ax1.XLabel.String = "Infallsvinkel \theta rad";
ax1.YLabel.String = "Avl?nkningsvinkel \delta rad";
hold on
plot(x, y1, 'b-')
plot(x, y2, 'g-')
plot(x, y3, 'y-')
plot(x, y4, 'r-')
hold off

ax2 = nexttile;
ax2.Title.String = "Tungt flintglas";
ax2.XLabel.String = "Infallsvinkel \theta rad";
ax2.YLabel.String = "Avl?nkningsvinkel \delta rad";
hold on
plot(x, z1, 'b-')
plot(x, z2, 'g-')
plot(x, z3, 'y-')
plot(x, z4, 'r-')
hold off
