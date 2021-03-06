function dyt = dy(t, y, T0, T1, Z0, tz)
dyt = -y/T0 + (z(t, tz, T1, Z0))/T1;