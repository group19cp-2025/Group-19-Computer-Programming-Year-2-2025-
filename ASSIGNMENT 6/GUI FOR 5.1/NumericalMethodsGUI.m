function NumericalMethodsGUI
    % Making Figure window
    fig = uifigure('Name','Numerical Methods GUI','Position',[100 100 840 420]);

    % INPUTS
    uilabel(fig,'Text','Function f(x,y) or f(x):','Position',[40 370 200 22]);
    funcs = uieditfield(fig,'text','Position',[240 370 300 22], ...
        'Value','Enter a Function of x and/or y');

    uilabel(fig,'Text','Derivative f''(x): (Field may be used for x_1 in Secant method)', ...
        'Position',[40 340 400 22]);
    dFuncs = uieditfield(fig,'text','Position',[440 340 300 22], ...
        'Value','Enter Derivative or x_1 (if required)');

    uilabel(fig,'Text','x_0:','Position',[40 300 30 22]);
    x0Field = uieditfield(fig,'numeric','Position',[70 300 70 22],'Value',0);

    uilabel(fig,'Text','y_0:','Position',[160 300 30 22]);
    y0Field = uieditfield(fig,'numeric','Position',[190 300 70 22],'Value',0);

    uilabel(fig,'Text','h:','Position',[280 300 20 22]);
    hField = uieditfield(fig,'numeric','Position',[300 300 70 22],'Value',0.1);

    uilabel(fig,'Text','x_end:','Position',[390 300 50 22]);
    x_endField = uieditfield(fig,'numeric','Position',[440 300 70 22],'Value',1);

    uilabel(fig,'Text','Tolerance:','Position',[530 300 70 22]);
    tolField = uieditfield(fig,'numeric','Position',[610 300 100 22],'Value',5e-6);

    % Output Area 
    uilabel(fig,'Text','Results:','Position',[40 260 80 22]);
    outputArea = uitextarea(fig,'Position',[40 50 760 200],'Editable','on');

    % Buttons
    uibutton(fig,'Text','Euler Method','Position',[60 10 120 30], ...
        'ButtonPushedFcn',@(btn,event) runEuler());
    uibutton(fig,'Text','Runge-Kutta','Position',[200 10 120 30], ...
        'ButtonPushedFcn',@(btn,event) runRK());
    uibutton(fig,'Text','Newton-Raphson','Position',[340 10 120 30], ...
        'ButtonPushedFcn',@(btn,event) runNR());
    uibutton(fig,'Text','Secant','Position',[480 10 120 30], ...
        'ButtonPushedFcn',@(btn,event) runSecant());

    % Button Functions 
    function runEuler()
        f = str2func(funcs.Value);
        x0 = x0Field.Value; y0 = y0Field.Value;
        h = hField.Value; xend = x_endField.Value;
        obj = Integral_Methods(f,x0,y0,h,xend);
        output = evalc('obj.SolutionEulers()');
        outputArea.Value = strsplit(output,newline);
    end

    function runRK()
        f = str2func(funcs.Value);
        x0 = x0Field.Value; y0 = y0Field.Value;
        h = hField.Value; xend = x_endField.Value;
        obj = Integral_Methods(f,x0,y0,h,xend);
        output = evalc('obj.SolutionRungeKutta()');
        outputArea.Value = strsplit(output,newline);
    end

    function runNR()
        f = str2func(funcs.Value);
        fd = str2func(dFuncs.Value);
        x0 = x0Field.Value; tol = tolField.Value;
        obj = Differential_Methods(f,fd,x0,tol);
        output = evalc('obj.SolutionNewtonRaphson()');
        outputArea.Value = strsplit(output,newline);
    end

    function runSecant()
        f = str2func(funcs.Value);
        x0 = x0Field.Value;
        x1 = str2double(dFuncs.Value);
        tol = tolField.Value;
        obj = Differential_Methods(f,x1,x0,tol);
        output = evalc('obj.SolutionSecant()');
        outputArea.Value = strsplit(output,newline);
    end
end
