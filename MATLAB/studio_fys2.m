% Alustetaan alkuarvot
R = 1000;
L = 0.068;
C = 0.0000001;
% Alustetaan mittaustulokset
F = xlsread('vaihtovirtapiiri.xlsx', 'A2:A35');
U = xlsread('vaihtovirtapiiri.xlsx', 'B2:B35');
Fii = xlsread('vaihtovirtapiiri.xlsx', 'C2:C35');
% Lasketaan virran amplitudi Ohmin lailla
I = U/R;
% Virta milliampeereina
I*1000

% RESONASSITAAJUUS
% mitattu
zeroFii = F(find(Fii(:)==0))
% laskennallinen
F0 = 1/(2*pi*sqrt(L*C))

% Plotataan virran amplitudi ja vaihe-ero taajuuden funktiona
% omiin kuvaajiinsa allekkain ja merkitään mitattu resonanssitaajuus
figure
subplot(2,1,1)
plot(F,I);
xline(zeroFii);
title('Sähkövirran amplitudi taajuuden funktiona')
xlabel('f (Hz)')
ylabel('I (A)')
subplot(2,1,2)
plot(F,Fii);
xline(zeroFii);
title('Vaihe-ero taajuuden funktiona')
xlabel('f (Hz)')
ylabel('\Phi (aste)')