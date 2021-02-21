function i = deltaI2(susceptible, infected, alpha, beta, gamma, t)
i = alpha * infected(t) * susceptible(t) - beta * infected(t) - gamma * infected(t);