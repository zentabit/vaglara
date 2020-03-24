
%% a uppgift
a = pi/6;
n = 1.5;

% härledd för hand + s211 i boken
d = @(x) x + asin(n.*sin(a - asin(sin(x)./n))) - a;

x = linspace(0, pi/2);
y = d(x);

plot(x,y)

%% b uppgift
% zinkdopat kronglas
a1 = 1.517;
a2 = 10.72;

% tungt flintglas
b1 = 1.653;
b2 = 10.27;

% beräkna brytningsindex
n = @(l) a1 + a2./l;
% dess våglängder kikar vi på
ls = [450 540 600 700];
% beräkna n för dessa
ns = n(ls)

% ny funktion där man kan ändra n
d1 = @(x, n) x + asin(n.*sin(a - asin(sin(x)./n))) - a;

y1 = d1(x, ns(1));
y2 = d1(x, ns(2));
y3 = d1(x, ns(3));
y4 = d1(x, ns(4));

hold on
plot(x, y1, 'b-')
plot(x, y2, 'g-')
plot(x, y3, 'y-')
plot(x, y4, 'r-')