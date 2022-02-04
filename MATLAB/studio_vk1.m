clear all;

%% Kotitehtava

% tallennetaan excel-taulukkojen data ja maaritetaan aikavali
ibm = flipud(xlsread('ibm.xlsx', 'F2:F162'));
msoft = flipud(xlsread('msft.xlsx', 'F2:F162'));
djia = flipud(xlsread('djia.xlsx', 'E2:E162'));
days = [1:161];

% PLOTATAAN OSAKKEIDEN JA INDEKSIN ARVOT AIKAVALILLA
% IBM
figure
subplot(3,1,1);
plot(days, ibm);
axis tight;
title('IBM:n osakkeen arvo sulkemishetkellä');
xlabel('pörssipäivät alkaen 2.1.2013')
ylabel('USD')
% Microsoft
subplot(3,1,2);
plot(days, msoft);
axis tight;
title('Microsoftin osakkeen arvo sulkemishetkellä');
xlabel('pörssipäivät alkaen 2.1.2013')
ylabel('USD')
% DJIA-indeksi
subplot(3,1,3);
plot(days, djia);
axis tight;
title('Djia-indeksin arvo sulkemishetkellä');
xlabel('pörssipäivät alkaen 2.1.2013');

% LUODAAN HAJONTAKUVIOT KORRELAATIOILLE
% IBM ja DJIA-indeksi
figure
subplot(3,1,1);
scatter(ibm, djia, 10);
axis tight;
title('IBM:n osakken ja DJIA-indeksin hajontakuvio');
xlabel('IBM');
ylabel('DJIA');
% Microsoft ja DJIA-indeksi
subplot(3,1,2);
scatter(msoft, djia, 10);
axis tight;
title('Microsoftin osakken ja DJIA-indeksin hajontakuvio');
xlabel('Microsoft');
ylabel('DJIA');
% IBM ja Microsoft
subplot(3,1,3);
scatter(ibm, msoft, 10);
axis tight;
title('IBM:n ja Microsoftin osakkeiden hajontakuvio');
xlabel('IBM');
ylabel('Microsoft');

% Lasketaan Pearsonin korrelaatiokertoimet
corr(ibm, djia)
corr(msoft, djia)
corr(ibm, msoft)