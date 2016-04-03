%% setting up graphics
ui.fig2=figure('numbertitle','off','menubar','none','name','Conversion To Pure DC');
set(ui.fig2, 'WindowButtonDownFcn','done=1;');
title('Pure DC');
dt = 2.0000e-3;
txt1 = text(-40,-40,['Time (sec) ', num2str(floor(0))]);
text(50,46,'Click on screne to exit');
time =0;
ripple =0;
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
    % Filters to remove ripples
    [ V.DC, ripple ] = Capacitor( V.ripple,ripple );
    %% graphs plot
    if time < 01
        subplot(1,1,1)
        hold on
        plot(time,V.DC)
        xlabel('Time(sec) \rightarrow')
        ylabel('Amplitude(V) \rightarrow');
        grid on
        axis([0 1 0 double(V.max)+10])
       set(txt1,'position',[0 double(V.max)+17],'string',['time (sec ', num2str(time)]);
    end
    pause(time-toc);
    drawnow
end
close(ui.fig2)