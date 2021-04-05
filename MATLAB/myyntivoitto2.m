function voitot = myyntivoitto2(q,n)
% Generoidaan n kappaletta tasajakautuneita satunnaislukuja valilla 0-300
D = 300*rand(n,1);
% Generoidaan n kappaletta tasajakautuneita satunnaislukuja valilla 0-1
Z = rand(n,1);
% Lasketaan myyntivoitto kullakin kysynnan arvolla
voitot = [];
for i=1:n
    qq = q*Z(i); % Toimituksen toteutuma
    voitot(i) = min(D(i),qq)*120-qq*30;
end