n = 100;
S = zeros(1, n)

spalts = 5;
% fler spalter = fler v?gor som interfererar
width = 2;
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