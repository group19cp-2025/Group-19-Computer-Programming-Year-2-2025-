classdef YieldModel < YieldEstimator
    properties (Access = private)
        Model
        Data
    end

    methods
        function obj = YieldModel(rain, fert, soil, sunlight, farmSize)
            obj@YieldEstimator(rain, fert, soil, sunlight, farmSize);
            obj.Data = [];
            obj.Model = [];
        end

        function estimateYield(obj)

           
            obj.Data = readtable('crop_yield_data.csv'); 
            fprintf('\nData loaded successfully from crop_yield_data.csv\n');
     
            % Making a Regression model using Machine toolboxes 
            obj.Model = fitlm(obj.Data, ...
                'crop_yield ~ rainfall_mm + fertilizer_kg + soil_quality_index + sunlight_hours + farm_size_hectares');

            % Predicting yield for new conditions
            newData = table(obj.Rainfall, obj.Fertilizer, obj.SoilQuality, ...
                            obj.Sunlight, obj.FarmSize, ...
                            'VariableNames', ...
                            {'rainfall_mm', 'fertilizer_kg', 'soil_quality_index', 'sunlight_hours', 'farm_size_hectares'});

            predYield = predict(obj.Model, newData);


            fprintf('\nYIELD ESTIMATION\n');
            fprintf('Rainfall: %.2f mm\n', obj.Rainfall);
            fprintf('Fertilizer: %.2f kg/ha\n', obj.Fertilizer);
            fprintf('Soil Quality: %.2f\n', obj.SoilQuality);
            fprintf('Sunlight: %.2f hours/day\n', obj.Sunlight);
            fprintf('Farm Size: %.2f hectares\n', obj.FarmSize);
            fprintf('\n----------------------------------------\n');
            fprintf('Predicted Yield: %.4f tonnes/hectare\n', predYield);
        end
    end
end
