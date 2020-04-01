%% uppgift a
ks = [-2 -1.5 -1 -0.5 0 1 2];
ds = [];
lines = [];
n1 = 1.7;
n2 = 1.5;
ax = -3;
ay = 2;
bx = 4;
by = -1;

hold on
grid on
axis([-10 10 -10 10]);

for k = ks
    f = @(x) k.*(x-ax)+ay;
    cx = 0;
    cy = f(0);
    plot(cx,cy, 'r+')
    
    line([ax cx], [ay cy]); 
    line([cx bx], [cy by]);
    
    ds(end+1) = n1.*norm([ax ay] - [cx cy]) + n2.*norm([cx cy] - [bx by]);
end

k = find(ds==min(ds))

plot(ax,ay, 'r+')
plot(bx,by, 'r+')

%% uppgift b
close all
clear all
hold on
grid on


a = 2;
r = 1;
n = 1.8;
s = hypot(a, r);

axis([-(a+2) (a+2) -(r+2) (r+2)])

theta  = linspace(0, atan(r/a), 1000);
b = (s.*cos(theta) - a) ./ (n.*cos(theta)-1);
h = (a-b).*tan(theta);

for i = 1:199:1000
    disp(i)
    line([-a -b(i)], [0 h(i)])
    line([-a -b(i)], [0 -h(i)])
    line([-b(i) b(i)], [h(i) h(i)])
    line([-b(i) b(i)], [-h(i) -h(i)])
    line([b(i) a], [h(i) 0])
    line([b(i) a], [-h(i) 0])
    
end

plot(-b, h, 'r.');
plot(b, h, 'r.');
plot(-b, -h, 'r.');
plot(b, -h, 'r.');

