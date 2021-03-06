function sovite = kosinimalli(beta,t)
% Tallennetaan parametrien arvot kuvaaviin muuttujiin
A = beta(1); omega = beta(2); phi = beta(3);
% Lasketaan arvo ajanhetkella t
sovite = A*cos(omega*t+phi);