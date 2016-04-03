%% setting up graphics
ui.fig2=figure('numbertitle','off','menubar','none','name','Half Wave Rectification'); 
set(ui.fig2, 'WindowButtonDownFcn','done=1;');
title('Half Wave Rectification');
dt = 8.0000e-4;
txt1 = text(-40,-40,['Time (sec) ', num2str(floor(0))]);
text(50,46,'Click on screne to exit');
time =0;
tic
%% main Body
done=0;
while ~done
    time=time+dt;
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
    %% graphs plot  
    if time < 0.5
        subplot(3,1,1);
        title('First Phase');
        xlabel('Time(sec) \rightarrow')
        ylabel('Amplitude(V) \rightarrow');
        hold on
        plot(time,V.rrec,'black');
        axis([0 0.5 -10 double(V.max)+10])
        grid on
        subplot(3,1,2)
        title('Second Phase');
        xlabel('Time(sec) \rightarrow')
        ylabel('Amplitude(V) \rightarrow');
        hold on
        plot(time,V.grec,'b')
        axis([0 0.5 -10 double(V.max)+10])
        grid on
        subplot(3,1,3)
        title('Third Phase');
        xlabel('Time(sec) \rightarrow')
        ylabel('Amplitude(V) \rightarrow');
        hold on
        plot(time,V.brec,'r')
        axis([0 0.5 -10 double(V.max)+10])
        grid on    
    end
    pause(time-toc);
    drawnow
end
close(ui.fig2)