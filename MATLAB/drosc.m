function dx = drosc(t,x,T0,omega,M,F,omega0)
% Otetaan talteen eri funktioita kuvaavat rivit
x1 = x(1);
x2 = x(2);
% Muodostetaan differentiaaliyhtalot
dx1 = F/M*cos(omega*t)-x1/T0-omega0^2*x2;
dx2 = x1;
% Kootaan palautettava vektori
dx = [dx1; dx2];