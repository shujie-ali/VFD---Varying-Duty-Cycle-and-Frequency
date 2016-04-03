V.gsawtooth = 1.*sawtooth(2*pi*f.sawtooth*(time))+1;
V.gmassage = A.*sin(2*pi*f.massage*time-((2*pi)./3))+1;%((2*pi)./3)
if f.massage ==0;
    V.gmassage =-1;
end

if V.gsawtooth < V.gmassage
    thtg1 = thtl1;
    thtg2 = thtl2;
else
    thtg1 = thtl2;
    thtg2 = thtl1;
end
V.gpwm1 = IGBT(V.DC,thtg1);
V.gpwm2 = IGBT(V.DC,thtg2);
V.gpwm3 = V.gpwm1-V.gpwm2;
