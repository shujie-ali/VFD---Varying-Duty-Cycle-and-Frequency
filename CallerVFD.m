% close(ui.fig);
%% user interface  
% ui.h7 used already
%% rectification stage ! 
% slide text
ui.Slidetext = sprintf('Slide down list tO view');
ui.fig3=figure('numbertitle','off','menubar','none','name','VFD','color','black'); 
axis equal;%'Three Phase Synchronous Motor} '
axis off;
title('\fontsize{12}{\color[rgb]{0 .5 .5}Varible Frequency Drive Of Varying Frequency And Duty Cycle}');
ui.h8 = uicontrol(ui.fig3,'Style','popupmenu','Units','normalized',...
'String',{'Select View Rectification Stage';'Half Wave Rectification';'Pulsating DC';'Pure DC Wave'},...
'Position',[.4 .57 .5 .3]);
set(ui.h8,'callback','RectificationCaller');           
set(ui.h8,'TooltipString',ui.Slidetext);

ui.h9 = uicontrol(ui.fig3,'Style','pushbutton','Units','normalized',...
'String','View First Stage','fontsize',10,'Position',[.15 .8 .2 .07]);
set(ui.h9,'callback',{@FirstStageDetail});           
ui.Firsttext = sprintf('Hit The Button To View');
set(ui.h9,'TooltipString',ui.Firsttext);

%% VFD
% RPMs 
ui.h10 = uicontrol(ui.fig3,'Style','edit','Units','normalized',...
'String','','Position',[.15 .65 .2 .1],'CreateFcn','set(gcbo,''BackgroundColor'',''white'')');
ui.h11 = uicontrol(ui.fig3,'Style','pushbutton','Units','normalized',...
'String','Set  RPMs  For  Motor','fontsize',12,'Position',[.40 .65 .4 .1]);
ui.rpmtext = sprintf('Enter Your Required RPM to Model');
set(ui.h10,'TooltipString',ui.rpmtext);
set(ui.h11,'callback','ui.rpm = get(ui.h10,''string''); f.massage = ((20*str2num(ui.rpm))/120);');
ui.Modeltext = sprintf('Hit The Button To Model');
set(ui.h11,'TooltipString',ui.Modeltext);
ui.text = text(.34,.6,'\color[rgb]{0 .5 .5}OR','fontsize',12);

% frequency
ui.h12 = uicontrol(ui.fig3,'Style','edit','Units','normalized',...
'String','','Position',[.15 .47 .2 .1],'CreateFcn','set(gcbo,''BackgroundColor'',''white'')');

ui.h13 = uicontrol(ui.fig3,'Style','pushbutton','Units','normalized',...
'String','Set  Frequency To Model','fontsize',12,'Position',[.40 .47 .4 .1]);

set(ui.h13,'callback','ui.frequency = get(ui.h12,''string''); f.massage = (str2num(ui.frequency));');

ui.Modeltext = sprintf('Hit The Button To Model');

set(ui.h13,'TooltipString',ui.Modeltext);

ui.h12txt = sprintf('Enter Your Required Frequency');
set(ui.h12,'TooltipString',ui.h12txt);

% Generate PWMs
ui.Generatetext = sprintf('Hit The Button Generate');
ui.h14 = uicontrol(ui.fig3,'Style','pushbutton','Units','normalized',...
'String','View 1st Phase PWMs','fontsize',12,'Position',[.6 .37 .33 .05]);
set(ui.h14,'callback','PwmMainr;');
set(ui.h14,'TooltipString',ui.Generatetext);
ui.h15 = uicontrol(ui.fig3,'Style','pushbutton','Units','normalized',...
'String','View 2nd Phase PWMs','fontsize',12,'Position',[.6 .30 .33 .05]);
set(ui.h15,'callback','PwmMainb;');
set(ui.h15,'TooltipString',ui.Generatetext);

ui.h16 = uicontrol(ui.fig3,'Style','pushbutton','Units','normalized',...
'String','View 3rd Phase PWMs','fontsize',12,'Position',[.6 .23 .33 .05]);
set(ui.h16,'callback','PwmMaing;');
set(ui.h16,'TooltipString',ui.Generatetext);
% View VFD model Diagram
ui.h17 = uicontrol(ui.fig3,'Style','pushbutton','Units','normalized',...
'String','VFD Diagram','fontsize',12,'Position',[.15 .23 .2 .2]);
set(ui.h17,'callback','VFDDiagram;');
ui.h17txt = sprintf('View VFD Basic Diagram');
set(ui.h17,'TooltipString',ui.h17txt);

% Help VFD
ui.h18 = uicontrol(ui.fig3,'Style','pushbutton','Units','normalized',...
'String','Help VFD','fontsize',12,'Position',[.38 .23 .2 .2]);
set(ui.h18,'callback','HelpVFD();');
ui.h18txt = sprintf('View VFD HElp');
set(ui.h18,'TooltipString',ui.h18txt);

%% show Motor Working
ui.h19 = uicontrol(ui.fig3,'Style','pushbutton','Units','normalized',...
'String','View  Motor  Working  3D ! !','fontsize',15,'Position',[.13 .10 .8 .1]);
set(ui.h19,'callback','VFDmotor;');
ui.h19txt = sprintf('Hit the Button To see Working');
set(ui.h19,'TooltipString',ui.h19txt);