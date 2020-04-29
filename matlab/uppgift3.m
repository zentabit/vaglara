n = 100;
S = zeros(1, n)
spalts = 2;
% fler spalter = fler v?gor som interfererar
width = 2;
% bredare spalt = v?gen interfererar med sig sj?lv?
space = 10;
% mer avst?nd = mer interferens?
for i = 1:spalts
    S(space*i: space*i+width) = 1;
end

X = fft(S);

f = (0:n-1);
pow = abs(X.^2);
%plot(f, pow)

Y = fftshift(X);
fsh = (-n/2:n/2-1);
pows = abs(Y.^2);
hold on
plot(fsh, pows)
plot(fsh, S.*10)
%axis([ -10 10 0 20]);