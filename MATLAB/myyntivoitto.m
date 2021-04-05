function voitot = myyntivoitto(q,n)
% Generoidaan n kappaletta tasajakautuneita satunnaislukuja valilla 0-300
D = 300*rand(n,1);
% Lasketaan myyntivoitto kullakin kysynnan arvolla
voitot = [];
for i=1:n
    voitot(i) = min(D(i),q)*120-q*30;
end