classdef testAbsValue_parameterized2 < matlab.unittest.TestCase
    
    properties (TestParameter)
        inputs = {-5, 5, -3.2, 3.2, 0};
        expected_outputs = {5, 5, 3.2, 3.2, 0};
    end
    
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src'));
        end
    end
    
    methods (Test, ParameterCombination='sequential')
        function test(testCase, inputs, expected_outputs)
            testCase.verifyEqual(absValue(inputs), expected_outputs);
        end
    end
    
end
