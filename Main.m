%% clean up environment
CleanUp
%% setting up graphics
ui.fig=figure('numbertitle','off','menubar','none','name','Initializing Of Input Suplly','color','black'); 
axis equal;
axis off;
title('\fontsize{16}\color{red}Initializing Input Supply ');
%% GUI initalizin for main supply
% main Voltage
ui.h1 = uicontrol(ui.fig,'Style','edit','Units','normalized',...
    'String','','Position',[.2 .8 .3 .1]);
ui.h1txt = sprintf('Enter Your Required Main Voltage Supply');
set(ui.h1,'TooltipString',ui.h1txt);
ui.h2 = uicontrol(ui.fig,'Style','pushbutton','Units','normalized',...
    'String','Set Input Voltages','fontsize',11.2,'Position',[.6 .8 .25 .1]);
set(ui.h2,'callback','a.a = get(ui.h1,''string''); V.max = str2num(a.a);');
ui.h2txt = sprintf('Hit the button to Model');
set(ui.h2,'TooltipString',ui.h2txt);

% main frequency

ui.h3 = uicontrol(ui.fig,'Style','edit','Units','normalized',...
    'String','','Position',[.2 .6 .3 .1]);
ui.h3txt = sprintf('Enter Your Required Main Frequency');
set(ui.h3,'TooltipString',ui.h3txt);

ui.h4 = uicontrol(ui.fig,'Style','pushbutton','Units','normalized',...
    'String','Set Input Frequency','fontsize',11.2,'Position',[.6 .6 .25 .1]);
set(ui.h4,'callback',' a.b = get(ui.h3,''string'');f.main = str2num(a.b);');
ui.h4txt = sprintf('Hit the button to Model');
set(ui.h4,'TooltipString',ui.h4txt);

% main suply ploting
ui.h4 = uicontrol(ui.fig,'Style','pushbutton','Units','normalized',...
    'String','View Waves Plot','fontsize',11.2,'Position',[.23 .4 .25 .1]);
set(ui.h4,'callback','InPutSupply');
ui.h4txt = sprintf('Hit the Button To see Iput Supply');
set(ui.h4,'TooltipString',ui.h4txt);
% motor working on main suply
ui.h5 = uicontrol(ui.fig,'Style','pushbutton','Units','normalized',...
    'String','Start Motor 3D View','fontsize',11.2,'Position',[.55 .4 .25 .1]);
set(ui.h5,'callback','MotorInputSupply');

ui.h5txt = sprintf('Hit the Button To see Working');
set(ui.h5,'TooltipString',ui.h5txt);
%% VFD startup
ui.h6 = uicontrol(ui.fig,'Style','pushbutton','Units','normalized',...
    'String','Open VFD  ! !','fontsize',13,'Position',[.38 .1 .25 .2]);
set(ui.h6,'callback','SecureVFD');
ui.h6txt = sprintf('Open VFD \n NOTE: only authorize persons can acess it');
set(ui.h6,'TooltipString',ui.h6txt);

%% Credits
ui.credits = uicontrol(ui.fig,'Style','pushbutton','Units','normalized',...
    'String','Credits','fontsize',13,'Position',[.70 .1 .20 .1]);
set(ui.credits,'callback','Credits()');
ui.creditstxt = sprintf('Hit the button to see Who made this');
set(ui.credits,'TooltipString',ui.creditstxt);