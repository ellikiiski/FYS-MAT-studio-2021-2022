function y = bkt(years)
% Alkuarvot
k1 = -1.27 + 0.98i;
k2 = -1.27 - 0.98i;
r1 = 0.84 - 0.29i;
r2 = 0.84 + 0.29i;
c = 4.55;
% Itse ratkaisu
y = k1 * r1.^years + k2 * r2.^years + c;