close all
clear all

%% TEHTAVA A

% Maaritetaan ns. random seed, jotta saadut tulokset voidaan
% tarvittaessa toistaa
rng(666);
% Generoidaan 500 normaalijakautunutta lukua
% odotusarvolla 0 ja keskihajonnalla 1
r500 = randn(500, 1);
% Tehdaan eksponenttimuunnos
ex500 = exp(r500);
% Plotatataan molemmista jakaumista histogrammit
figure
subplot(2,1,1);
histogram(r500,20);
title('Standardinormaalijakauma otoskoolla 500')
subplot(2,1,2);
histogram(ex500,40);
title('Vastaava log-normaalijakauma')
axis tight
% Estimoidaan log-normaalijakauman parametrit
% ja lasketaan 95% luottamusvali
[param500, ci500] = lognfit(ex500)

% Generoidaan jakaumat myos sadalla ja kymmenellatuhannella luvulla
% 100
r100 = randn(100,1);
ex100 = exp(r100);
% 10000
r10000 = randn(10000,1);
ex10000 = exp(r10000);
% Estimoidaan parametrit ja luottamusvalit
% 100
[param100, ci100] = lognfit(ex100)
% 10000
[param10000, ci10000] = lognfit(ex10000)

%% TEHTAVA B

rng(666);

% Komento jolla saa 15 eksponenttijakautunutta lukua odotusarvolla 3
ex = exprnd(3,15,1);
% Mallinnetaan asiakkaiden kertymista kahdeksan tunnin ajan
t=0;
jono = 0;
ajat = [];
while t<8*60
    t=t+exprnd(3);
    jono=jono+1;
    ajat = [ajat,t];
end
kertyma = 1:jono;
% Plotataan asiakkaiden kertyminen
figure
stairs(ajat,kertyma)
title('Pankkiin saapuvat asiakkaat 8h ajalla')
xlabel('min')
ylabel('asiakkaita saapunut')
axis tight

close all
% Plotataan 10 simulointia jonon kertymisesta
figure
hold on
for i=1:10
    [ajat,jono] = jonotus(1,3,5,8);
    stairs(ajat,jono)
end
title('Pankin jono 8h ajalla, kun käytössä on yksi kassa')
xlabel('min')
ylabel('jonon pituus')
axis tight
% Simuloidaan jonon pituutta eri kassojen maaralla
figure
hold on
for k=1:6
    subplot(3,2,k)
    [ajat,jono] = jonotus(k,3,5,8);
    stairs(ajat,jono)
    axis tight
    if (k==1)
        s = 'kassa';
    else
        s = 'kassaa';
    end
    title(string(k) + ' ' + s);
end

%% KOTITEHTÄVÄ

% Lasketaan todennakoisyys jaada miinukselle tulausmaaralla 150
length(find(myyntivoitto(150,10000)<0))/10000

rng(666);
% Estimoidaan myyntivoiton odotusarvo tilausmaarilla 0-300
E = [];
n = 10000;
for q=0:300
    % Ajetaan simulaatio
    mv = myyntivoitto(q,n);
    % Lasketaan odotusarvot
    E(q+1) = sum(mv)/n;
end
% Maksimivoitto
max(E)
% Maksimivoiton tuottava tilauskoko
find(E==max(E))
% Plotataan myyntivoitto tilauskoon funktiona
q = 0:300;
figure
plot(q,E)
title('Myyntivoitto tilauskoon mukaan')
xlabel('tilauskoko')
ylabel('myyntivoitto')

% Estimoidaan myyntivoiton odotusarvo tilausmaarilla 0-500
% kun toimitus on epavarma
E = [];
n = 10000;
for q=0:500
    % Ajetaan simulaatio
    mv = myyntivoitto2(q,n);
    % Lasketaan odotusarvot
    E(q+1) = sum(mv)/n;
end
% Maksimivoitto
max(E)
% Maksimivoiton tuottava tilauskoko
find(E==max(E))
% Plotataan myyntivoitto tilauskoon funktiona
q = 0:500;
figure
plot(q,E)
title('Myyntivoitto tilauskoon mukaan')
xlabel('tilauskoko')
ylabel('myyntivoitto')
