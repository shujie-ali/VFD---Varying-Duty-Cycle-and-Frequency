fig.g=figure('numbertitle','off','menubar','none','name','PWMs for 3rd Phase');
set(fig.g, 'WindowButtonDownFcn','done=1;');
title('VFD With Three Phase Synchronous Motor');
axis equal;


time=0;
dt = 8.0000e-4;  % time span
ripple = 0;   % charge stored in capacitor
A=0.7;         % apmlitude of massage waves in pwm
fic =3000;     % freqency of sawtooth wave
% frequency of sample wave set by user
thtl1 = 90;    % IGBT will give according to multiple of sin(thtl1)
thtl2 = 0;     % valuse at which IGBT is close


%% initializing Clock
tic;
txth = text(-40,-40,['Time (sec) ', num2str(floor(toc))]);
set(txth,'fontsize',15);

%% main Body
done=0;
while ~done
   if time < 0.5 
 time=time+dt;
    %     set(txth,'string',['time (sec) ', num2str(time)]);
    
    %% Generation starts here !!!
    %initializing Voltage
    % these voltages are out of phase at 120 to each other.
    V.r = Phaser( V.max,f.main,time,0);
    V.b  = Phaser( V.max,f.main,time,-((4*pi)/3) );
    V.g  = Phaser( V.max,f.main,time,-((2*pi)./3) );
    
    %% Rectification
    
    V.rrec = Rectifier(V.r);
    V.brec = Rectifier(V.b);
    V.grec = Rectifier(V.g);
    V.ripple= V.rrec+V.brec+V.grec;
    
    % Filters to remove ripples
    [ V.DC, ripple ] = Capacitor( V.ripple,ripple );
    
    %% PWM(Micreocontroller && IGBTs)
    PWMg;
    %     disp(V.gpwm1)
    
 
        %% plot Sawtooth wave
        subplot(3,1,1)
        hold on
        plot(time,V.gsawtooth,'black')
        title('Sawtooth Wave 3rd Phase')
        xlabel('Time(sec) \rightarrow')
        ylabel('Amplitude(V) \rightarrow');
        axis([0 0.5 0 2])
        grid on
        %% plot massage wave
        subplot(3,1,2)
        hold on
        plot(time,V.gmassage,'b')
        title('Massage Wave 3rd Phase')
        xlabel('Time(sec) \rightarrow')
        ylabel('Amplitude(V) \rightarrow');
        axis([0 0.5 0 2])
        grid on
        %% plot PWMs
        subplot(3,1,3)
        hold on
        plot(time,V.gpwm1,'r')
        title('PWMs 3rd Phase')
        xlabel('Time(sec) \rightarrow')
        ylabel('Amplitude(V) \rightarrow');
        grid on
        axis([0 0.5 -19 double(V.max)+20])
        % set(txt1,'position',[0 double(V.max)],'string',['time (sec) ', num2str(time)]);
    end
    
    pause(time-toc);
    drawnow
end
close(fig.g)