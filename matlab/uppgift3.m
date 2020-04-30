%% del 1
t = linspace(0, 4*pi, 1000);
x = zeros(1, length(t));
y = zeros(1, length(t));
z = zeros(1, length(t));
maxn = 1003;

for i = 1:2:maxn
    x = x + 1/i*sin(i.*t);
end

for i = 1:2:maxn
    y = y + ((-1)^((i-1)/2))/(i^2)*sin(i.*t);
end

for i = 1:maxn
    z = z + 1/i*sin(i.*t);
end

hold on
plot(t,x)
plot(t,y)
plot(t,z)
plot(t, sin(t))

%% del 2
n = 100;
S = zeros(1, n);

spalts = 2;
% fler spalter = fler v?gor som interfererar
width = 4;
% bredare spalt = v?gen interfererar med sig sj?lv?
space = 10;
% mer avst?nd = mer interferens?
for i = 1:spalts
    S(space*i: space*i+width) = 1;
end

X = fft(S);

% Ber?kna utan att skifta frekvenserna
%f = (0:n-1);
%pow = abs(X.^2);
%plot(f, pow)

Y = fftshift(X);
fsh = (-n/2:n/2-1);
pows = abs(Y.^2);

hold on
no = pows/norm(pows);
plot(fsh,no)
plot(fsh, S)

%% extra
d = space;
b = width;
N = 3;
lambda = 500;
i0 = 1;
theta = linspace(-pi/6, pi/6);
beta = pi./lambda.*b.*sin(theta);
gamma = pi./lambda.*d.*sin(theta);

intensity = i0.*(sin(beta)./beta).^2.*(sin(N.*gamma)/(sin(gamma))).^2;

no2 = intensity/norm(intensity)
plot(theta, no2)