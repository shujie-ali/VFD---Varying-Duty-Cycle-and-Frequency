%% setting up graphics
MotorGraphics;
%%initializing variables
time = 0;        % initial time
dt = 4.00e-3;    % time span
ripple = 0;      % charge stored in capacitor
A=0.7;           % apmlitude of massage waves in pwm
f.sawtooth =900; % freqency of sawtooth wave
thtl1 = 90;      % IGBT will give according to multiple of sin(thtl1)
thtl2 = 0;       % valuse at which IGBT is close
%% user interface
ui.speedup = uicontrol(motor.fig,'Style','pushbutton','Units','normalized',...
    'String','speedup ^','fontsize',10,'Position',[.80 .2 .2 .07]);
set(ui.speedup,'callback','f.massage = f.massage+1;');
ui.speeddown = uicontrol(motor.fig,'Style','pushbutton','Units','normalized',...
    'String','Slow down ~^','fontsize',10,'Position',[.80 .12 .2 .07]);
set(ui.speeddown,'callback','f.massage = f.massage-1;');
%% initializing time
tic
%% Main body !!
done=0;
while ~done
    time=time+dt;
    %initializing Voltage
    V.r = Phaser( V.max,f.main,time,0);    V.b  = Phaser( V.max,f.main,time,-((4*pi)/3) );
    V.g  = Phaser( V.max,f.main,time,-((2*pi)./3) );
    %% Rectification
    V.rrec = Rectifier(V.r); V.brec = Rectifier(V.b); V.grec = Rectifier(V.g);
    V.ripple= V.rrec+V.brec+V.grec;
    % Filters to remove ripples
    [ V.DC, ripple ] = Capacitor( V.ripple,ripple );
    %% PWM
    % frequency check
    if f.massage <= 0
        f.massage = 0;
    end
    PWMr;
    PWMb;
    PWMg;
    %% as the main project is VFD which is already done! and output is shown in video as well as you can verify it, here i have given the voltage sample of massage wave as a multiple of V.max becouse it is the final output after instalation of other hardwarz which are not the part of project
    %% motor instalation5
    [tht, I] = Motor( V.max*V.rmassage,V.max*V.gmassage,V.max*V.bmassage );
    %% motor motions
    MyMotor;
    %% update working
    set(motor.time,'string',['time (sec) ', num2str(toc)]);
    set(motor.rpm,'string',['RPM =', num2str((120*f.massage)/20)]);
    set(motor.angle,'string',['Angle Inst.', num2str(tht)]);
    set(motor.curent,'string',['Curent (A) ', num2str(I)]);
    set(motor.voltages,'string',['Voltage (V) ', num2str(V.max)]);
    
    pause(time-toc);
    drawnow;
end

close(motor.fig)