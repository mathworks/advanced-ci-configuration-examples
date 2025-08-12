classdef testExpValue_parameterized2 < matlab.unittest.TestCase
    
    properties (TestParameter)
        inputs = {0, 1, -1, 2};
        expected_outputs = {exp(0), exp(1), exp(-1), exp(2)};
    end
    
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src'));
        end
    end
    
    methods (Test, ParameterCombination='sequential')
        function test(testCase, inputs, expected_outputs)
            testCase.verifyEqual(expValue(inputs), expected_outputs, 'AbsTol', 1e-10);
        end
    end
    
end
