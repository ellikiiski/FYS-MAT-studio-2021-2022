% Alustetaan ekat mittaustulokset
x = xlsread('solenoidi.xlsx', 'A2:A43');
Bm1 = xlsread('solenoidi.xlsx', 'B2:B43');
% Lasketaan etaisyydet
z = 73-(x+26.5);
% Plotataan kuvaaja B(z)
figure
plot(z,Bm1)
title('Magneettivuon tiheys solenoidin keskiakselilla')
xlabel('etäisyys (cm)')
ylabel('magneettivuon tiheys (mT)')
axis tight

% Alustetaan tokat mittaustulokset
I = xlsread('solenoidi.xlsx', 'D2:D7');
Bm2 = xlsread('solenoidi.xlsx', 'E2:E7');
% Plotataan kuvaaja B(I)
figure
plot(I,Bm2)
title('Magneettivuon tiheys solinoidin keskipisteessä')
xlabel('sähkövirta (A)')
ylabel('magneettivuon tiheys (mT)')
axis tight
grid on
% Sovitetaan lineaarinen malli, jotta saadaan kulmakerroin
model = fitlm(I,(Bm2/1000), 'linear')



