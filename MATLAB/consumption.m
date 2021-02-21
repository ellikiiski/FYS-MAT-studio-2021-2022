function c = consumption(bkt, alpha, t)
% Kulutus ajan hetkellä t
c = alpha * bkt(t-1);