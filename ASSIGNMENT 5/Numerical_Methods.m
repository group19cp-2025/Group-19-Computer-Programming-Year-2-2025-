classdef (Abstract) Numerical_Methods
    properties (Access = public)
        F
        Tol
    end

    methods
        function obj = Numerical_Methods(f, tol)
            if nargin < 2
                tol = 5e-6; % default tolerance
            end
            obj.F = f;
            obj.Tol = tol;
        end
    end

    methods (Abstract)
        obj = Solution(obj)
    end
end
