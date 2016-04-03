%% setting up graphics
ui.fig=figure('numbertitle','off','menubar','none','name','Plots For Input Main Suplly'); done = 0;
set(ui.fig, 'WindowButtonDownFcn','done=1;');
hold on
title('Input Supply')
dt = 9.0000e-4;
txt = text(-40,-40,['Time (sec) ', num2str(floor(0))]);
text(50,46,'Click on screne to exit');
time =0;tic
%% main Body
while ~done
    time = time +dt;
    %% code for Input supply!!!
    %initializing Voltage
    if time < 0.5
        V.r= Phaser( V.max,f.main,time,0);
        V.b  = Phaser( V.max,f.main,time,-((4*pi)/3) );
        V.g  = Phaser( V.max,f.main,time,-((2*pi)./3) );
        subplot(3,1,1);
        title('First Phase');
        xlabel('Time(sec) \rightarrow')
        ylabel('Amplitude(V) \rightarrow');
        hold on
        plot(time,V.r,'black');
        axis([0 0.5 -double(V.max) double(V.max)])
        grid on
        subplot(3,1,2)
        title('Second Phase');
        xlabel('Time(sec) \rightarrow')
        ylabel('Amplitude(V) \rightarrow');
        hold on
        plot(time,V.g,'b')
        axis([0 0.5 -double(V.max) double(V.max)])
        grid on
        subplot(3,1,3)
        title('Third Phase');
        xlabel('Time(sec) \rightarrow')
        ylabel('Amplitude(V) \rightarrow');
        hold on
        plot(time,V.b,'r')
        axis([0 0.5 -double(V.max) double(V.max)])
        grid on
%         set(txt1,'position',[0 double(V.max)],'string',['time (1/196.0784)sec ', num2str(time)]);
    end
%     pause(time-toc);
    drawnow
end
close(ui.fig)