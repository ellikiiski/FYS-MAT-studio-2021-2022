function zt = z(t, tz, T1, Z0)
if (t<tz)
    zt = 0;
else
    zt = Z0*exp(-(t-tz)/T1);
end