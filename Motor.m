function [ tht, I ] = Motor( V1, V2, V3 )
%MOTOR Summary of this function goes here
%   Detailed explanation goes here
%it is a 2 pole synchronus motor
%it is a constant power motor in which by decrease in Voltage increases current
% motor model ignoring inertia 

%% motor strucutre is
 % voltage are converted into delta connection to minimize current
V1=V1./sqrt(3);
V2=V2./sqrt(3);
V3=V3./sqrt(3);
% current is given by
I1=V1./500;
I2=V2./500.98;
I3=V3./500.999;
I =(I1+I2+I3);
%% 
%number of turns of each side
N = 1;

%% field
% real parts are
B1real = (4*pi*10^7).*N.*I1.*cosd(0);
B2real = (4*pi*10^7).*N.*I2.*(cosd(-120));
B3real = (4*pi*10^7).*N.*I3.*(cosd(-240));
%imaginary parts are
B1imag =  (4*pi*10^7).*N.*I1.*(sind(0));
B2imag = (4*pi*10^7).*N.*I2.*(sind(-120));
B3imag = (4*pi*10^7).*N.*I3.*(sind(-240));
% Sum real parts;
Breal = (B1real+B2real+B3real);
% sum imaginary
Bimag = (B1imag+B2imag+B3imag);
%% angle calculations
if  Breal < 0 && Bimag < 0;
    tht = 180+atand(Bimag/Breal);
elseif Breal > 0 && Bimag > 0;
    tht = atand(Bimag/Breal);
elseif Breal > 0 && Bimag < 0;
    tht =360+ atand(Bimag/Breal);
elseif Breal < 0 && Bimag > 0 ;
    tht = 180 + atand(Bimag/Breal);
else tht = 0;
end
% B = 0.001;
end