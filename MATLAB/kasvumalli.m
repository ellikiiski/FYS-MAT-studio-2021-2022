function w = kasvumalli(beta, t)
% Tallennetaan parametrien arvot kuvaaviin muuttujiin
wmax = beta(1); tmax = beta(2); tv = beta(3);
% Lasketaan jyvien painot vektorin t ajanhetkillä 
w = wmax.*(1+(tmax-t)/(tmax-tv)).*(t./tmax).^(tmax/(tmax-tv));
% Huolehditaan, ettei jyvan paino lahde laskuun
indmax = find(w==max(w));
w(indmax:end)=max(w);