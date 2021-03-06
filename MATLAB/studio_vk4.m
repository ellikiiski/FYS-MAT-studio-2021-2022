close all;
clear all;

% Alustetaan aikavali ja alkuarvot
t = [1:0.1:100];
alpha = 0.003;
beta = 0.03;
sir0 = [999; 1; 0];
% Maaritetaan asetuksilla maksimivirheet
options=[];
options=odeset(options,'RelTol',1e-7,'AbsTol',1e-7);
% Ratkaistaan differentiaaliyhtaloryhma
[tout,SIRout]=ode45(@infektio,t,sir0,options,alpha,beta);
% Plotataan saadut kayrat
figure
plot(tout, SIRout);
title('SIR-malli (numeerinen ratkaisu)');
xlabel('aika päivinä');
ylabel('ihmismäärä');
legend('alttiit', 'infektoituneet', 'parantuneet');
axis tight;

% Kolmosviikolta tuttu differenssiyhtaloratkaisu
s = [999];
i = [1];
r = [0];
for t=1:99
    sNew = s(t) + deltaS(s, i, alpha, t);
    iNew = i(t) + deltaI(s, i, alpha, beta, t);
    rNew = r(t) + deltaR(i, beta, t);
    s = [s sNew];
    i = [i iNew];
    r = [r rNew];
end
% PLOTATAAN ALLEKKAIN NUMEERINEN JA DIFFERENSSIYHTALORATKAISU
days = [1:100];
figure
% Numeerinen ratkaisu
subplot(2,1,1);
plot(tout, SIRout);
title('SIR-malli (numeerinen ratkaisu)');
xlabel('aika päivinä');
ylabel('ihmismäärä');
legend('alttiit', 'infektoituneet', 'parantuneet');
axis tight;
% Differenssiyhtaloratkaisu
subplot(2,1,2);
hold on
plot(days, s);
plot(days, i);
plot(days, r);
axis tight
title('SIR-malli (differenssiyhtälöratkaisu)');
xlabel('aika päivinä');
ylabel('ihmismäärä');
legend('alttiit', 'infektoituneet', 'parantuneet');

%% TEHTÄVÄ B

% Alustetaan parametrit ja alkuarvot
Z0 = 1;
y0 = 1;
tz = 15;
T0 = 10;
T1 = linspace(1, 100, 10);
% Alustetaan differentiaaliyhtalon numeerista ratkaisua varten
% aikavali ja virheasetukset
t = linspace(0,50,150);
options=[];
options=odeset(options,'RelTol',1e-7,'AbsTol',1e-7);
% Ratkaistaan dy kymmenella eri T1 arvolla valilla [1,100]
% (ja kerataan samalla T1 arvot taulukkoon legendia varten)
y = [];
leg = [];
for i=1:length(T1)
    [tout,xout]=ode45(@dy,t,y0,options,T0,T1(i),Z0,tz);
    y(i,:) = xout;
    leg{i} = ('T1 = ' + string(T1(i)));
end

% Plotataan kymmenen eri ratkaisukayraa
figure
hold on
for i=1:length(T1)
    plot(t, y(i,:))
end
title('Ratkaisuja parametrin T1 eri arvoilla')
xlabel('aika')
ylabel('isotoopin y määrä systeemissä')
legend(leg)

% Ratkaistaan dy nyt tarkemmin T1 arvoilla valilla [1,50]
T1 = linspace(1, 50, 200);
y = [];
for i=1:length(T1)
    [tout,xout]=ode45(@dy,t,y0,options,T0,T1(i),Z0,tz);
    y(i,:) = xout;
end
% Etsitaan jaljella olevan isotoopin maaran maksimoiva T1
maxT1 = T1(find(y(:,150)==max(y(:,150))))

% Plotataan (surface plot) ratkaisuja parametrien t ja T1 funktiona
figure
surf(t, T1, y)
colorbar
title('Isotoopin y määrä systeemissä ajan ja aikavakion T_1 funktiona')
xlabel('aika')
ylabel('aikavakio T_1')
zlabel('isotoopin y määrä')

% Plotataan tasa-arvokayrat
figure
[c,h] = contour(t, T1, y);
title('Tasa-arvokuvaaja y(t)')
xlabel('aika')
ylabel('aikavakio T_1')
clabel(c, h);

%% KOTITEHTÄVÄ
 
% Alustetaan alkuarvot, parametrit ja aikavali
x0 = [0,0];
T0 = 10;
omega = 1;
M = 1;
F = 1;
omega0 = 1;
t = linspace(1,T0*10,1000);
% Maaritetaan asetuksilla maksimivirheet
options=[];
options=odeset(options,'RelTol',1e-7,'AbsTol',1e-7);
% Ratkaistaan differentiaaliyhtaloryhma
[tout,xout]=ode45(@drosc,t,x0,options,T0,omega,M,F,omega0);
% Plotataan haluttu kayra x2(t)=y(t)
figure
plot(tout, xout(:,2));
title('Ajettu värähtelijä');
xlabel('aika');
ylabel('värähdykset');
axis tight;

% Muutetaan muuttuja omega vektoriksi
omega = [0.1,1.0,1.1];
% Plotataan kuvaajat allekain
figure
for i=1:length(omega)
    % Ratkaistaan differentiaaliyhtalo
    [tout,xout]=ode45(@drosc,t,x0,options,T0,omega(i),M,F,omega0);
    % Maaritellaan voiman funktio kyseisella omegan arvolla
    f = F*cos(omega(i)*t);
    % Plotataan ratkaisu kyseisella omegan arvolla
    subplot(3,1,i)
    hold on
    plot(tout, xout(:,2))
    plot(t, f) 
    title('\omega = ' + string(omega(i)))
    legend('värähtelijä', 'ajava voima')
    axis tight
end

% Tutkitaan T0 arvojen vaikutusta (muutetaan omega takaisin vakioksi ja T0
% puolestaan vektorisi) ja plotataan varahtelijan kayria eri T0 arvoilla
omega = 1;
T0 = [5:10:50];
t = linspace(1,250,1000);
leg = [];
figure
hold on
for i=1:length(T0)
    % Ratkaistaan differentiaaliyhtalo
    [tout,xout]=ode45(@drosc,t,x0,options,T0(i),omega,M,F,omega0);
    % Plotataan ratkaisu kyseisella T0 arvolla
    plot(tout, xout(:,2))
    leg{i} = ('T0 = ' + string(T0(i)));
end
title('Asymptoottinen värähtely eri T0 arvoilla')
xlabel('aika')
ylabel('värähdykset')
legend(leg,'location','northwest')
xlim([200 250])

% Muutetaan muuttuja omega taasen vektoriksi ja T0 vakioksi
% ja ratkaistaan dy sen eri avoilla "mittausdataksi"
T0 = 10;
t = linspace(1,T0*30,5000);
omega = [0.1,1.0,1.1];
y = [];
for i=1:length(omega)
    % Ratkaistaan differentiaaliyhtalo
    [tout,xout]=ode45(@drosc,t,x0,options,T0,omega(i),M,F,omega0);
    y(i,:) = xout(:,2);
end

% RAJATAAN OTOKSET LOPPUPAASTA JA HARVENNETAAN "MITTAUSDATA"
% REGRESSIAMALLIA VARTEN
% omega = 0.1
omg1t = tout(1600:end);
omg1y = y(1,1600:end)';
fakeDataT1 = omg1t(1:50:end);
fakeDataY1 = omg1y(1:50:end);
% omega = 1.0
omg2t = tout(4600:end);
omg2y = y(2,4600:end)';
fakeDataT2 = omg2t(1:5:end);
fakeDataY2 = omg2y(1:5:end);
% omega = 1.1
omg3t = tout(4600:end);
omg3y = y(3,4600:end)';
fakeDataT3 = omg3t(1:5:end);
fakeDataY3 = omg3y(1:5:end);

% Estimaatit sovitusparametreille kullakin omegan arvolla
est1 = lsqcurvefit(@(b,t) kosinimalli(b,t), [1, 0.1, 0], omg1t, omg1y);
est2 = lsqcurvefit(@(b,t) kosinimalli(b,t), [10, 1, 0], omg2t, omg2y);
est3 = lsqcurvefit(@(b,t) kosinimalli(b,t), [5, 1.1, 0], omg3t, omg3y);

% PLOTATAAN ALLEKKAIN "MITTAUSDATA JA REGRESSIOMALLI KULLAKIN OMEGAN
% ARVOLLA
% omega = 0.1
figure
subplot(3,1,1)
hold on
t=[min(fakeDataT1):0.1:max(fakeDataT1)];
plot(t, kosinimalli(est1, t))
plot(fakeDataT1, fakeDataY1, 'x')
axis tight
grid on
title('\omega=0.1')
xlabel('aika')
ylabel('värähtelijä')
legend('regressiomalli', '"mittausdata"')
% omega = 1.0
subplot(3,1,2)
hold on
t=[min(fakeDataT2):0.1:max(fakeDataT2)];
plot(t, kosinimalli(est2, t))
plot(fakeDataT2, fakeDataY2, 'x')
axis tight
grid on
title('\omega=1.0')
xlabel('aika')
ylabel('värähtelijä')
legend('regressiomalli', '"mittausdata"')
% omega = 1.1
subplot(3,1,3)
hold on
t=[min(fakeDataT3):0.1:max(fakeDataT3)];
plot(t, kosinimalli(est3, t))
plot(fakeDataT3, fakeDataY3, 'x')
axis tight
grid on
title('\omega=1.1')
xlabel('aika')
ylabel('värähtelijä')
legend('regressiomalli', '"mittausdata"')

% Saadut sovitusparametrien estimaatit
est1
est2
est3