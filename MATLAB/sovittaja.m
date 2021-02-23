function [b, bci] = sovittaja(xdata, ydata, dy)
% LASKETAAN YKSITTAISET SUMMALAUSEKKEET
% 1 / dy^2
e = sum(1./(dy.^2));
% x / dy^2
x = sum(xdata./(dy.^2));
% y / dy^2
y = sum(ydata./(dy.^2));
% x * y / dy^2
xy = sum((xdata.*ydata)./(dy.^2));
% x^2 / dy^2
x2 = sum((xdata.^2)./(dy.^2));
% kerroin 1/D
d = 1./((e*x2)-(x^2));
% LASKETAAN TERMIT b1 JA b0
b1 = d*((e*xy)-(x*y));
b0 = d*((x2*y)-(x*xy));
% LASKETAAN VIRHEET TERMEILLE b1 JA b0
eb1 = sqrt(d*e);
eb0 = sqrt(d*x2);
% TALLENNETAAN ARVOT PALAUTETTAVIIN MUUTTUJIIN
b = [b0 b1];
bci = [(b0 - eb0) (b1 - eb1); (b0 + eb0) (b1 + eb1)];




