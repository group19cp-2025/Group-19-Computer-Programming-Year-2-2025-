classdef RungeKutta < Numerical_Methods
    properties (Access = public)
        X_0
        Y_0
        H
        X_end
    end

    methods
        function obj = RungeKutta(f, x0, y0, h, x_end)
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
                k1 = obj.F(x(i), y(i));
                k2 = obj.F(x(i) + obj.H/2, y(i) + obj.H*k1/2);
                k3 = obj.F(x(i) + obj.H/2, y(i) + obj.H*k2/2);
                k4 = obj.F(x(i) + obj.H, y(i) + obj.H*k3);
                y(i+1) = y(i) + (obj.H/6)*(k1 + 2*k2 + 2*k3 + k4);
            end

            fprintf('\nRunge-Kutta Method Results:\n');
            disp(table(x', y', 'VariableNames', {'x', 'y'}));
        end
    end
end
