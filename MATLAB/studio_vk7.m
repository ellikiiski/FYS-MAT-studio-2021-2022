% Ajetaan simulaatio
malli = sim('petosaalis.slx');
% Plotataan peto- ja saalispopulaatioiden kehitys ajan funktiona
% samaan kuvaajaan
figure
plot(malli.x, malli.y)
title('Peto-saalis-malli: vaihetason kuvaaja')
xlabel('saaliit')
ylabel('pedot')
% Plotataan vaihetason kuvaaja populaatioista
figure
hold on
plot(malli.tout, malli.y)
plot(malli.tout, malli.x)
title('Populaatioden suuruus ajan funktiona')
legend('pedot', 'saaliit')