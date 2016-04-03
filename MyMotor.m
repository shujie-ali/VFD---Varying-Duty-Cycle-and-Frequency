%% moving up graphics
% updating its coordinates
motor.xcor = 5.*cosd(tht);
motor.ycor = 5.*sind(tht);
% 
motor.xcor1 = 5.*cosd(tht+90);
motor.ycor1 = 5.*sind(tht+90);
% 
motor.xcor2 = 5.*cosd(tht+180);
motor.ycor2 = 5.*sind(tht+180);
%
motor.xcor3 = 5.*cosd(tht+270);
motor.ycor3 = 5.*sind(tht+270);
%
motor.xcor4 = 5.*cosd(tht+(45));
motor.ycor4 = 5.*sind(tht+(45));
% 
motor.xcor5 = 5.*cosd(tht+(135));
motor.ycor5 = 5.*sind(tht+(135));
% 
motor.xcor6 = 5.*cosd(tht+(225));
motor.ycor6 = 5.*sind(tht+(225));
%
motor.xcor7 = 5.*cosd(tht+(315));
motor.ycor7 = 5.*sind(tht+(315));

%% setting up new positions
set(motor.h,'XData',(motor.xcor+motor.x),'YData',(motor.ycor+motor.y));
set(motor.h1,'XData',(motor.xcor1+motor.x1),'YData',(motor.ycor1+motor.y1));
set(motor.h2,'XData',(motor.xcor2+motor.x2),'YData',(motor.ycor2+motor.y2));
set(motor.h3,'XData',(motor.xcor3+motor.x3),'YData',(motor.ycor3+motor.y3));

set(motor.h4,'XData',(motor.xcor4+motor.x4),'YData',(motor.ycor4+motor.y4));
set(motor.h5,'XData',(motor.xcor5+motor.x5),'YData',(motor.ycor5+motor.y5));
set(motor.h6,'XData',(motor.xcor6+motor.x6),'YData',(motor.ycor6+motor.y6));
set(motor.h7,'XData',(motor.xcor7+motor.x7),'YData',(motor.ycor7+motor.y7));

set(ui.lig2, 'Position',[20*cosd(tht) 20*sind(tht) 10]); % a red light
set(ui.lig3, 'Position',[20*cosd(tht+120) 20*sind(tht+120) 10]); % a gren light
set(ui.lig4, 'Position',[20*cosd(tht+240) 20*sind(tht+240) 10]); % a yellow light