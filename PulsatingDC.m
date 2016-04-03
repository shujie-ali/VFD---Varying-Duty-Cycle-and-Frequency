%% setting up graphics
ui.fig3=figure('numbertitle','off','menubar','none','name','Full Wave Rectification');
set(ui.fig3, 'WindowButtonDownFcn','done=1;');
title('Full Wave Rectification');
dt = 5.0000e-4;
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
    V.ripple= V.rrec+V.brec+V.grec;
    %% graphs plot
    if time < 0.5
        subplot(1,1,1)
        hold on
        plot(time,V.ripple,'r')
        xlabel('Time(sec) \rightarrow')
        ylabel('Amplitude(V) \rightarrow');
        axis([0 0.5 0 double(V.max)+10])
        grid on
            set(txt1,'position',[0 double(V.max)+15],'string',['time (sec) ', num2str(time)]);
    end
    pause(time-toc);
    drawnow
end
close(ui.fig3)