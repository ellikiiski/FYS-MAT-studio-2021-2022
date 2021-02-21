function i = investments(cons, beta, gamma, t)
% Investoinnit ajan hetkellä t
i = beta * (cons(t) - cons(t-1)) + gamma;