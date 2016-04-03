V.rsawtooth = 1.*sawtooth(2*pi*f.sawtooth*time)+1;
V.rmassage = A.*sin(2*pi*f.massage*time)+1;
if f.massage ==0;
    V.rmassage =-1;
end

if V.rsawtooth < V.rmassage
    thtr1 = thtl1;
    thtr2 = thtl2;
else
    thtr1 = thtl2;
    thtr2 = thtl1;
end
V.rpwm1 = IGBT(V.DC,thtr1);
V.rpwm2 = IGBT(V.DC,thtr2);
V.rpwm3 = V.rpwm1-V.rpwm2;
