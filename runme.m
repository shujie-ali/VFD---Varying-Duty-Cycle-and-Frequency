ui.securitybar = waitbar(0,'Please wait Fetching Data..........');
ui.securitysteps = 3000;
for step = 1:ui.securitysteps
    % computations take place here
    waitbar(step / ui.securitysteps)
end
close(ui.securitybar)
ui.securitykey = 'Shujaat Ali';
% disp(ui.securitykey)
ui.securityfig = figure('numbertitle','off','menubar','none','position',[500 500 500 150]);
axis equal;
axis off;
ui.enteredacess = {''};
ui.securitytittle=title('Please Verify Yourself To Access This','fontsize',20);
axis([0 5 0 2])
ui.securityh1 = uicontrol(ui.securityfig,'Style','edit','Units','normalized',...
    'String','','Position',[.05 .3 .4 .4]);
ui.securityh2 = uicontrol(ui.securityfig,'Style','pushbutton','Units','normalized',...
    'String','Enter Acess Code','fontsize',11.2,'Position',[.5 .3 .4 .4]);
set(ui.securityh2,'callback','ui.enteredaccess = get(ui.securityh1,''string'');ui.securityproceed = 1;');
ui.securityproceed = 0;
done = 0;
while ~done
    if ui.securityproceed
        if isequal(ui.enteredaccess,ui.securitykey)
            ui.securitybar = waitbar(0,'Please wait Verifying Data..........');
            ui.securitysteps = 1000;
            for step = 1:ui.securitysteps
                % computations take place here
                waitbar(step / ui.securitysteps)
            end
            close(ui.securitybar)
            Main;
            done = 1;
        else
            ui.securitybar = waitbar(0,'Please wait Verifying Data..........');
            ui.securitysteps = 1000;
            for step = 1:ui.securitysteps
                % computations take place here
                waitbar(step / ui.securitysteps)
            end
            close(ui.securitybar)
            msgbox([{'Warning ....... Incorrect Password'};{''};{'NOTE:'};{'Capitalization does matter'}])
            ui.securityproceed = 0;
        end
    end
    pause(0.1)
end
done = 0;
ui.securityproceed =0;
% close(ui.securityfig)