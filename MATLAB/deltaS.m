function s = deltaS(susceptible, infected, alpha, t)
s = -alpha * infected(t) * susceptible(t);