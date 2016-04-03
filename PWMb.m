V.bsawtooth = 1.*sawtooth(2*pi*f.sawtooth*time)+1;
V.bmassage = A.*sin(2*pi*f.massage*(time)-((4*pi)/3))+1;%((4*pi)/3)
if f.massage ==0;
    V.bmassage =-1;
end

if V.bsawtooth < V.bmassage
    thtb1 = thtl1;
    thtb2 = thtl2;
else
    thtb1 = thtl2;
    thtb2 = thtl1;
end
V.bpwm1 = IGBT(V.DC,thtb1);
V.bpwm2 = IGBT(V.DC,thtb2);
V.bpwm3 = V.bpwm1-V.bpwm2;
