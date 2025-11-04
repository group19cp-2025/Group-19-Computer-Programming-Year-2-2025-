classdef NewtonRaphson < Numerical_Methods
    properties (Access = private)
        F_d
        X_0
    end

    methods
        function obj = NewtonRaphson(f, f_d, x0, tol)
            obj@Numerical_Methods(f, tol);
            obj.F_d = f_d;
            obj.X_0 = x0;
        end

        function obj = Solution(obj)
            x0 = obj.X_0;
            x1 = x0 - obj.F(x0)/obj.F_d(x0);

            if abs(x1 - x0) < obj.Tol
                fprintf('Newton-Raphson Root = %.5f\n', x1);
                obj.X_0 = x1;
            else
                obj.X_0 = x1;
                obj = obj.Solution();
            end
        end
    end
end
