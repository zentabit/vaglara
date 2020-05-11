%% del 1
t = linspace(0, 4*pi, 1000);
x = zeros(1, length(t));
y = zeros(1, length(t));
z = zeros(1, length(t));
maxn = 10001;

for i = 1:2:maxn
    x = x + 1/i*sin(i.*t);
end

for i = 1:2:maxn
    y = y + ((-1)^((i-1)/2))/(i^2)*sin(i.*t);
end

for i = 1:maxn
    z = z + 1/i*sin(i.*t);
end

subplot(2,2,1);
plot(t,x)
title("Fyrkant");
subplot(2,2,2);
plot(t,y)
title("Triangel");
subplot(2,2,3);
plot(t,z)
title("S?gtand");
subplot(2,2,4);
plot(t, sin(t))
title("Sinus");

%% del 2
% antalet datapunkter
n = 1024;
S = zeros(1, n);

spalts = 3;
% fler spalter = fler v?gor som interfererar
width = 4;
% bredare spalt = v?gen interfererar med sig sj?lv?
space = 20;
% mer avst?nd = mer interferens?
% fyll ut S med spalterna
for i = 1:spalts
    S(space*i: space*i+width) = 1;
end

X = fft(S);

% Rita utan att skifta frekvenserna
%f = (0:n-1);
%pow = abs(X.^2);
%plot(f, pow)

% skifta frekvenserna och skapa en vektor med "frekvenserna"
Y = fftshift(X);
fsh = (-n/2:n/2-1);

pows = abs(Y.^2);
% normera fj?rrf?ltet och plotta
no = pows/norm(pows);
subplot(2,1,1);
plot(fsh,no)
title("Normaliserat fj?rrf?lt");
subplot(2,1,2);
plot(fsh, S)
title("Spalterna");
