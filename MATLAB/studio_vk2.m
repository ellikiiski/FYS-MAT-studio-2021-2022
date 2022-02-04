clear all;
close all;

%% Tehtava A

% Tallennetaan asiakasdata muuttujaan
load('asiakasdata.mat');
a = asiakasdata;

% Valitaan ennen 1970 syntyneet naiset
a = a(a(:,1)==1 & a(:,2)<1970,:);
% Valitaan halutut riskitekijät
a = a(a(:,3)>5 & a(:,4)>3,:);
% Valitaan viimeksi ennen 2010 tarkastuksessa käyneet
a= a(a(:,6)<2010,:);
% Tarkasteaan kuinka monta ehdot tayttavaa asiakasta on jaljella
size(a,1)

% Vaihtoehtoinen yhden rivin koodi joka tekee saman
a = asiakasdata;
a = a(a(:,1)==1 & a(:,2)<1970 & a(:,3)>5 & a(:,4)>3 & a(:,6)<2010,:);
size(a,1)

%% Tehtava B

% Selvitetaan luodulla funktiolla mika on annettua
% parametria seuraava alkuluku
x = omafunktio(897970);
x

%% Tehtava C

% Alustetaan alkuarvot SIR-malliin
s = [999];
i = [1];
r = [0];
% Alustetaan alkuarvot SIRD-malliin
s2 = [999];
i2 = [1];
r2 = [0];
d2 = [0];
% Alustetaan parametrien alkuarvot
alpha = 0.0011;
beta = 0.03;
gamma = 0.0013;
% Ajetaan SIR-malli
for t=1:150
    sNew = s(t) + deltaS(s, i, alpha, t);
    iNew = i(t) + deltaI(s, i, alpha, beta, t);
    rNew = r(t) + deltaR(i, beta, t);
    s = [s sNew];
    i = [i iNew];
    r = [r rNew];
end
% Ajetaan SIRD-malli
for t=1:150
    sNew = s2(t) + deltaS(s2, i2, alpha, t);
    iNew = i2(t) + deltaI2(s2, i2, alpha, beta, gamma, t);
    rNew = r2(t) + deltaR(i2, beta, t);
    dNew = d2(t) + deltaD(i2, gamma, t);
    s2 = [s2 sNew];
    i2 = [i2 iNew];
    r2 = [r2 rNew];
    d2 = [d2 dNew];
end
% Alustetaan aikavali
days = [1:151];
% PLOTATAAN KUMPIKIN MALLI SAMAAN KUVAAN
% SIR
figure
subplot(2,1,1);
hold on
plot(days, s);
plot(days, i);
plot(days, r);
axis tight
title('SIR-malli');
xlabel('aika päivinä');
ylabel('ihmismäärä');
legend('alttiit', 'infektoituneet', 'parantuneet');
% SIRD
subplot(2,1,2);
hold on
plot(days, s2);
plot(days, i2);
plot(days, r2);
plot(days, d2);
axis tight
title('SIRD-malli');
xlabel('aika päivinä');
ylabel('ihmismäärä');
legend('alttiit', 'infektoituneet', 'parantuneet', 'kuolleet');
% Lasketaan kuolleiden maara
max(d2)

%% Kotitehtava

% Alustetaan aikavali
t = [0:50];
% Mallinnetaan kolme skenaariota
A = bktMalli(1, 1, 0.89, 0.89, 0.5, 50);
B = bktMalli(1, 1, 0.75, 1.4, 0.5, 50);
C = bktMalli(0.5, 0.5, 1.0, 1.1, 0.3, 50);

% PLOTATAAN KUKIN SKENAARIO OMAAN KUVAANSA
% Skenaario A (mukana analyyttinen ratkaisu pisteina)
figure
hold on
plot(t, A(1,:))
plot(t, A(2,:))
plot(t, A(3,:))
scatter(t, bkt(t))
axis tight
title('Skenaario A (Elli Kiiski)')
legend('kulutus', 'investoinnit', 'BKT', 'analyyttinen BKT')
xlabel('aika vuosina')
ylabel('M€')
% Skenaario B
figure
hold on
plot(t, B(1,:))
plot(t, B(2,:))
plot(t, B(3,:))
axis tight
title('Skenaario B (Elli Kiiski)')
legend('kulutus', 'investoinnit', 'BKT')
xlabel('aika vuosina')
ylabel('M€')
% Seknaario C
figure
hold on
plot(t, C(1,:))
plot(t, C(2,:))
plot(t, C(3,:))
axis tight
title('Skenaario C (Elli Kiiski)')
legend('kulutus', 'investoinnit', 'BKT')
xlabel('aika vuosina')
ylabel('M€')
