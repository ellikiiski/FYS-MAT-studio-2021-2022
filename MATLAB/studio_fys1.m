% Alustetaan data
dataL = [3,9,15,21,27.5,34,41]';
dataU = [19.3,63,102.1,142.1,188,229.6,278.8]';
% LASKETAAN RESISTANSSIT
% Muutetaan millivoltit volteiksi
v = (0.001).*dataU;
% Sijoitetaan jannitehaviot kaavaan
dataR = 470*v./(30-v);

% Luodaan lineaarinen malli
% - tulosteesta voidaan lukea kulmakerroin ja sen virhearvio
model = fitlm(dataL,dataR, 'linear')

% Plotataan samaan kuvaan data ja lineaarinen malli valilla [0,50]
figure
hold on
t = [0:50]';
plot(t, predict(model, t))
plot(dataL, dataR, 'x')
title('Vastuslangan resistanssi pituuden funktiona')
xlabel('langan pituus (cm)')
ylabel('resistanssi (\Omega)')
legend('sovitettu suora', 'mittaustulokset', 'location', 'southeast')
grid on
axis tight

% LASKIN
k = 0.10737;
d = 0.4 * 10^(-3);
Dk = 0.0005954;
Dd = 0.005 * 10^(-3);
roo = pi * k * d^2 / 4
Droo = pi * k * d / 2 * Dd + pi * d^2 / 4 * Dk
max = roo + Droo
min = roo - Droo