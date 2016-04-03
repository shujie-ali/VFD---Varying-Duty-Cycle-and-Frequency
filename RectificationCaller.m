
val = get(ui.h8,'Value');
if val == 1
    msgbox('Select Options Mentioned Bellow')
elseif val == 2
    HalfWaveRectification;
elseif val == 3
    PulsatingDC
elseif val == 4
    PureDC
end