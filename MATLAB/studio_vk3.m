clear all;
close all;

%% TEHTAVA A

% Alustetaan taulukon arvot vektoreihin
varallisuus = [20.0, 30.5, 40.0, 55.1, 60.3, 74.9, 88.4, 95.2]';
energia = [1.8, 3.0, 4.8, 5.0, 6.5, 7.0, 9.0, 9.1]';
% Luodaan lineaarinen malli
model = fitlm(varallisuus, energia, 'linear');
% Plotataan datapisteet
figure
plot(varallisuus, energia, 'x', 'color', 'red');
% Plotataan mallin antama lineaarinen ennuste
hold on;
axis tight;
grid on;
t = [10:120]';
plot(t, predict(model, t), 'color', 'blue');
xlabel('varallisuus');
ylabel('energiankulutus');
title('Lineaarinen regressiomalli');
% Tallennetaan 64% luottamusvälin yla- ja alarajat matriisiin eci
[epred, eci] = predict(model, t, 'alpha', 0.36 , 'Prediction', 'observation');
% Plotataan luottamusvälin yla- ja alarajat
plot(t, eci(:,1), '--', 'color', 'cyan');
plot(t, eci(:,2), '--', 'color', 'cyan');
legend('datapisteet', 'lineaarinen ennuste', '64% luottamusväli', 'location', 'southeast');
% Lasketaan mille valille varallisuusluokan 65 energiankulutus osuu 64%
% luottamusvalilla
index65 = find(t==65)
e65 = [eci(index65,1), eci(index65,2)]

%% TEHTAVA B

% Alustetaan taulukon mittausdata
days = [2, 10, 18, 26, 31, 35];
weight = [2, 8, 19, 32, 43, 45];
% Estimoidaan parhaat parametrien arvot ensimmaisena 50 paivana
t = [0:50];
est = lsqcurvefit(@(b, t) kasvumalli(b, t), [40, 40, 20], days, weight);
% Plotatataan datapisteet ja mallin antama ennuste
figure
hold on
grid on
ylim ([0 52])
plot(days, weight, 'x')
plot(t, kasvumalli(est, t))
title('Jyvän painon kehitys');
xlabel('päiviä 1. kukinnosta');
ylabel('jyvän paino');
legend('mittaukset', 'PNS-malli', 'location', 'southeast');
% Selvitetaan milloin maksimipaino saavuutetaan
m = max(kasvumalli(est, t))
find(kasvumalli(est, t)==m)

%% KOTITEHTAVA

% Alustetaan mittausdata vektoreihin
f = [519, 549, 688, 740, 821];
v = [1.0, 1.2, 1.9, 2.4, 2.3];
e = [0.15, 0.40, 0.20, 0.30, 0.10];
% Estimoidaan b0 ja b0 seka virhevalit sovittaja-funktiolla
[b, bci] = sovittaja(f, v, e);
b0 = b(1);
b1 = b(2);
eb0 = [bci(1,1) bci(2,1)]
eb1 = [bci(1,2) bci(2,2)]
% Maaritetaan regressiosuora valilla [400, 900]
x = [400:900]';
y = b0 + b1 .* x;
% Sovitetaan mittausdataan myos tavallinen lineaarinen malli
model = fitlm(f, v, 'linear');
% Plotataan datapisteet virherajoineen seka
% molemmat dataan sovitetut lineaariset regressiosuorat
figure
hold on
grid on
errorbar(f, v, e, 'x');
plot(x, y);
plot(x, predict(model, x));
title('Pysäytysjännite suhteessa valon taajuuteen');
xlabel('valon taajuus (10^{12} Hz)');
ylabel('pysäytysjännite (V)');
legend('mittausdata', 'painotettu PNS-malli', 'tavallinen PNS-malli', 'location', 'southeast');
