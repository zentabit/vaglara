clear all
x = [50.04 57.21 60.29 63.33 65.99 70.71 80.81 90];
y = [ 75.49 65.26 64.55 64.48 64.59 66.46 71.95 77.63 ];
x2 = [45.98 50.25 60.04 60.42 65.44 70.36 80.74 89.65 ];
y2 = [90 62.88 59.69 59.27 60.27 61.89 67.7 75.45];

xs = linspace(40, 95);
p = polyfit(x, y, 3);
p2 = polyfit(x2, y2, 3);

hold on
plot(x,y, 'g+')
plot(x2, y2, 'r+')
plot(xs, polyval(p, xs), 'g-')
plot(xs, polyval(p2, xs), 'r-')
min(polyval(p, xs))
min(polyval(p2, xs))

xlabel('Incident angle (degrees)')
ylabel('Deviation angle (degrees)')
title('Deviation angle as function of incident angle')