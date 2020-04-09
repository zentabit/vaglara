%% uppgift a
ks = linspace(-2, 2, 100);
ds = [];
%lines = [];
% olika brytningsindex
n1 = 1;
n2 = 10000;
% definiera start och slutpunkt
ax = -3;
ay = 2;
bx = 4;
by = -1;

hold on
grid on
axis([-10 10 -10 10]);

% f?r olika lutningar p? linjen
for k = ks
    % definiera en r?t linje fr?n utg?ngspunkten
    f = @(x) k.*(x-ax)+ay;
    % hitta sk?rning med y-axlen
    cx = 0;
    cy = f(0);
    plot(cx,cy, 'r+')
    % rita linjer
    line([ax cx], [ay cy]); 
    line([cx bx], [cy by]);
    % ber?kna avst?ndet
    ds(end+1) = n1.*norm([ax ay] - [cx cy]) + n2.*norm([cx cy] - [bx by]);
end


k = find(ds==min(ds))
h = ks(k);

% definiera en r?t linje fr?n utg?ngspunkten
f = @(x) h.*(x-ax)+ay;
% hitta sk?rning med y-axlen
cx = 0;
cy = f(0)
plot(cx,cy, 'r+')
% rita linjer
line([ax cx], [ay cy], 'Color', 'red'); 
line([cx bx], [cy by], 'Color', 'red');


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
% s?tt axlarna rimligt
axis([-(a+2) (a+2) -(r+2) (r+2)])
% l?t theta svepa fr?n centrum till kanten
theta  = linspace(0, atan(r/a), 1000);

b = (s.*cos(theta) - a) ./ (n.*cos(theta)-1);
h = (a-b).*tan(theta);

% rita ut str?lg?ngen f?r n?gra olika lutningar
for i = 1:199:1000
    %disp(i)
    line([-a -b(i)], [0 h(i)])
    line([-a -b(i)], [0 -h(i)])
    line([-b(i) b(i)], [h(i) h(i)])
    line([-b(i) b(i)], [-h(i) -h(i)])
    line([b(i) a], [h(i) 0])
    line([b(i) a], [-h(i) 0])
    
end
% anv?nd symmetrin f?r att plotta ut linsen
plot(-b, h, 'r.');
plot(b, h, 'r.');
plot(-b, -h, 'r.');
plot(b, -h, 'r.');

