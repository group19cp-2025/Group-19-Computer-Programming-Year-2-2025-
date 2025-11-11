classdef (Abstract) YieldEstimator
    properties (Access = protected)
        Rainfall
        SoilQuality
        FarmSize
        Sunlight
        Fertilizer
    end

    methods
        function obj = YieldEstimator(rain, fert, soil, sunlight, farmSize)
            obj.Rainfall = rain;
            obj.FarmSize = farmSize;
            obj.Sunlight = sunlight;
            obj.Fertilizer = fert;
            obj.SoilQuality = soil;
        end
    end

    methods (Abstract)
        estimateYield(obj)
    end
end
