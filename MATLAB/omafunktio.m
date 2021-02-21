function alkuluku = omafunktio(n)
% Lisataan lukuun 1 kunnes tulos on alkuluku
while (~isprime(n))
    n = n+1;
end
% Palautetaan saatu luku
alkuluku = n;