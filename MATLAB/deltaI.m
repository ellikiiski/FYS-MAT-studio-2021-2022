function i = deltaI(susceptible, infected, alpha, beta, t)
i = alpha * infected(t) * susceptible(t) - beta * infected(t);