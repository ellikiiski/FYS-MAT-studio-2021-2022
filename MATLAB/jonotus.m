function [ajat, jono] = jonotus(k,a,p,h)
% Alustetaan muuttujat
t=0;
jono = [0];
ajat = [0];
% Ajetaan simulaatiota h tuntia
while t<h*60
    % Arvotaan seuraavan asiakkaan saapumisaika
    asiakas_saapuu = t+exprnd(a);
    % Alustetaan palvelun valmistuminen aarettomaksi vertailua varten
    palvelu_valmistuu = Inf;
    % Arvotaan kassojen maaran verran palvelun kestoaikoja ja
    % valitaan niista lyhyin
    for i=1:k
        palvelu_valmistuu = min(palvelu_valmistuu,t+exprnd(p));
    end
    % Tutukitaan tapahtuuko uuden asiakkaan sisaantulo vai
    % palvelun valmistuminen ensin ja pidennetaan tai lyhennetaan
    % jonoa sen mukaan seka asetetaan tapahtuma-aika muuttujaan t
    if (asiakas_saapuu < palvelu_valmistuu)
        jono = [jono, jono(end)+1];
        t = asiakas_saapuu;
    else
        jono = [jono, max(jono(end)-1,0)];
        t = palvelu_valmistuu;
    end
    % Lisataan tapahtuma-aika aikavektoriin
    ajat = [ajat,t];
end
