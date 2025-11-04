classdef Euler < Numerical_Methods
    properties (Access = public)
        X_0
        Y_0
        H
        X_end
    end

    methods
        function obj = Euler(f, x0, y0, h, x_end)
            obj@Numerical_Methods(f);
            obj.X_0 = x0;
            obj.Y_0 = y0;
            obj.H = h;
            obj.X_end = x_end;
        end

        function Solution(obj)
            x = obj.X_0:obj.H:obj.X_end;
            y = zeros(size(x));
            y(1) = obj.Y_0;

            for i = 1:length(x)-1
                y(i+1) = y(i) + obj.H * obj.F(x(i), y(i));
            end

            fprintf('\nEuler Method Results:\n');
            disp(table(x', y', 'VariableNames', {'x', 'y'}));
        end
    end
end
