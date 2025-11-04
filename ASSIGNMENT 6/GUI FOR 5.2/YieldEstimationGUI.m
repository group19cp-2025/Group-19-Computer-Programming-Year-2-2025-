function YieldEstimationGUI
    % Making our Figure Window
    fig = uifigure('Name','Yield Estimation GUI','Position',[100 100 700 400]);

    % Inputs 
    uilabel(fig,'Text','Rainfall (mm):','Position',[40 340 150 22]);
    rainField = uieditfield(fig,'numeric','Position',[180 340 120 22],'Value',1000);

    uilabel(fig,'Text','Fertilizer (kg/ha):','Position',[40 300 150 22]);
    fertField = uieditfield(fig,'numeric','Position',[180 300 120 22],'Value',500);

    uilabel(fig,'Text','Soil Quality Index (0–10):','Position',[40 260 150 22]);
    soilField = uieditfield(fig,'numeric','Position',[180 260 120 22],'Value',3);

    uilabel(fig,'Text','Sunlight (hours/day):','Position',[40 220 150 22]);
    sunField = uieditfield(fig,'numeric','Position',[180 220 120 22],'Value',12);

    uilabel(fig,'Text','Farm Size (hectares):','Position',[40 180 150 22]);
    sizeField = uieditfield(fig,'numeric','Position',[180 180 120 22],'Value',100);

    % Buttons
    uibutton(fig,'Text','Estimate Yield','Position',[320 180 150 30], ...
        'ButtonPushedFcn',@(btn,event) estimateYieldButton());

    % Output Area
    uilabel(fig,'Text','Results:','Position',[40 140 80 22]);
    outputArea = uitextarea(fig,'Position',[40 30 620 110],'Editable','off');
 
    function estimateYieldButton()
        
        rain = rainField.Value;
        fert = fertField.Value;
        soil = soilField.Value;
        sunlight = sunField.Value;
        farmSize = sizeField.Value;

        obj = YieldModel(rain, fert, soil, sunlight, farmSize);
        outputText = evalc('obj.estimateYield()');
        outputArea.Value = strsplit(outputText, newline);
    end
end
