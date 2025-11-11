classdef Differential_Methods < Numerical_Methods
    properties (Access = private)
        F_d
        X_0
        X_1
    end

    methods
        function obj = Differential_Methods(f, f_d, x0, tol)
            obj@Numerical_Methods(f, tol);
            obj.F_d = f_d;
            obj.X_0 = x0;
            obj.X_1 = obj.F_d;
        end
    end
    methods
        function SolutionNewtonRaphson(obj)
            x0 = obj.X_0;
            x1 = x0 - obj.F(x0)/obj.F_d(x0);

            if abs(x1 - x0) < obj.Tol
                fprintf('Newton-Raphson Root = %.5f  \n', x1);
                obj.X_0 = x1;
            else
                obj.X_0 = x1;
                obj.SolutionNewtonRaphson();
            end
        end
        function SolutionSecant(obj)
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
                obj.SolutionSecant();
            end
        end
    end
end
