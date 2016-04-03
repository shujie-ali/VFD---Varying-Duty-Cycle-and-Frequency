%% Guide About Motor
% before installing a motor into any place first initialize its graphics if
% it is to be called in a loop(While or For or any) initalize it outside
% the loop(Its Recomended).
%% Setting up graphics
motor.fig=figure('numbertitle','off','name','Three Phase Synchronous Motor'); 
set(motor.fig, 'WindowButtonDownFcn','done=1;');%','closerequestfcn','done=1;
title('\fontsize{16}Three {\color{magenta}Phase \color[rgb]{0 .5 .5}Synchronous \color{red}Motor} ');
hold on
axis equal;
% axis off
axis([-30 30 -30 30 0 30])
view(3)
text(-2,1,30,'\fontsize{8}Rotor');
text(10,0,30,'\fontsize{8}Stator Coil 1');
text(-20,-5,30,'\fontsize{8}Stator Coil 2');
text(-10,20,30,'\fontsize{8}Stator coil 3');
 %% motor rotor's roads
[motor.x, motor.y, motor.z ] = cylinder(2);
motor.h=surf(motor.x+5,motor.y,motor.z*25);
%
[motor.x1, motor.y1, motor.z1] = cylinder(2);
motor.h1=surf(motor.x1-5,motor.y1,motor.z1*25);
 %
[motor.x2, motor.y2, motor.z2 ] = cylinder(2);
motor.h2=surf(motor.x,motor.y-5,motor.z*25);
%
[motor.x3, motor.y3, motor.z3] = cylinder(2);
motor.h3=surf(motor.x3,motor.y3+5,motor.z3*25);
%
[motor.x4, motor.y4, motor.z4 ] = cylinder(2);
motor.h4=surf(motor.x4+5*cosd(135),motor.y4+5*sind(135),motor.z4*25);
%
% mid placement
[motor.x5, motor.y5, motor.z5 ] = cylinder(2);
motor.h5=surf(motor.x5+5*cosd(45),motor.y5+5*sind(45),motor.z5*25);
 %
[motor.x6, motor.y6, motor.z6 ] = cylinder(2);
motor.h6=surf(motor.x6+5*cosd(315),motor.y6+5*sind(315),motor.z6*25);
%
[motor.x7, motor.y7, motor.z7] = cylinder(2);
motor.h7=surf(motor.x7+5*cosd(225),motor.y7+5*sind(225),motor.z7*25);
%
%% stator body 
[motor.statorx, motor.statory, motor.statorz] = cylinder(12);
motor.stator = surf(motor.statorx, 10*motor.statorz+8, 11+motor.statory,'edgecolor','none');
rotate(motor.stator,[0 0 1],0)
%
[motor.statorx1, motor.statory1, motor.statorz1] = cylinder(12);
motor.stator1 = surf(motor.statorx1, 10*motor.statorz1+8, 11+motor.statory1,'edgecolor','none');
rotate(motor.stator1,[0 0 1],120)
%
[motor.statorx, motor.statory, motor.statorz] = cylinder(12);
motor.stator = surf(motor.statorx, 10*motor.statorz+8, 11+motor.statory,'edgecolor','none');
rotate(motor.stator,[0 0 1],240)

% lighting
ui.lig1 = light('color',[1 0 0], 'Position',[-20 -20 1],'Style','local'); % a red light
ui.lig2=light('color',[1 0 0], 'Position',[-20 -20 1],'Style','local'); % a red light
ui.lig3=light('color',[0 0 1], 'Position',[10 -20 1],'Style','local');  % a green light
ui.lig4=light('color',[1 1 0], 'Position',[20 10 10],'Style','local');  % a yellow light
set(gca,'Color',[.5 .9 .2]);
lighting phong
camproj('perspective');
camlight left ;
%% initializing time
motor.time= text(30,30,30,['time (sec)','']);
%% Current Working
motor.voltages = text(-30,30,30,['Voltage (V) ','']);
motor.curent = text(0,30,30,['Current (A) ','']);
motor.rpm = text(30,00,30,['Current RPM ','']);
motor.angle = text(20,-30,30,['Angle inst. ','']);