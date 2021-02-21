function M = bktMalli(c0, i0, alpha, beta, gamma, years)
% Alustetaan vektorit alkuarvoilla
c = [c0];
i = [i0];
y = [c0+i0];
% Ajetaan simulaatiota haluttu määrä iteraatioita
for t=2:years+1
    c = [c consumption(y, alpha, t)];
    i = [i investments(c, beta, gamma, t)];
    y = [y (c(t)+i(t))];
end
% Palautetaan kulutuksen, investeintien ja
% BKT:n kehitys matriisina
M = [c; i; y];