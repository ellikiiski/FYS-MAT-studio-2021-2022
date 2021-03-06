function dsir = infektio(t, sir, alpha, beta)
% Tallennetaan eri funktioita kuvaavat rivit omiin muuttujiin
s = sir(1);
i = sir(2);
r = sir(3);
% Muodostetaan differentiaaliyhtalot
ds = -alpha*i*s;
di = alpha*i*s-beta*i;
dr = beta*i;
% Kootaan palautettava vektori
dsir = [ds; di; dr];