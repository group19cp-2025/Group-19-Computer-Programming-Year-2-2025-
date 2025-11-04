classdef Secant < Numerical_Methods
    properties (Access = private)
        X_0
        X_1
    end

    methods
        function obj = Secant(f, x0, x1, tol)
            obj@Numerical_Methods(f, tol);
            obj.X_0 = x0;
            obj.X_1 = x1;
        end

        function obj = Solution(obj)
            x0 = obj.X_0;
            x1 = obj.X_1;
            f = obj.F;

            x2 = x1 - f(x1)*(x1 - x0)/(f(x1) - f(x0));

            if abs(x2 - x1) < obj.Tol
                fprintf('Secant Root = %.5f\n', x2);
                obj.X_0 = x2;
            else
                obj.X_0 = x1;
                obj.X_1 = x2;
                obj = obj.Solution();
            end
        end
    end
end
