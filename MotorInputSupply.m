MotorGraphics;
time = 0;
dt = 4.000e-3;
tic
done=0;
while ~done
    time=time+dt;
    %% Power Generation !!!
    %initializing Voltage
    V.r = Phaser( V.max,f.main,time,0);    V.b  = Phaser( V.max,f.main,time,-((2*pi)./3) );
    V.g  = Phaser( V.max,f.main,time,- ((4*pi)/3));
    %% motor instalation
    [tht, I] = Motor( V.r,V.b,V.g );
    %% motor motions
    MyMotor;
    %% update working
    set(motor.time,'string',['time (sec) ', num2str(toc)]);
    set(motor.rpm,'string',['RPM =', num2str((120*f.main)/20)]);
    set(motor.angle,'string',['Angle Inst.', num2str(tht)]);
    set(motor.curent,'string',['Curent (A) ', num2str(I)]);
    set(motor.voltages,'string',['Voltage (V) ', num2str(V.max)]);
    
    pause(time-toc);
    drawnow;
end
set(motor.fig, 'closerequestfcn','delete(motor.fig);');
close(motor.fig)