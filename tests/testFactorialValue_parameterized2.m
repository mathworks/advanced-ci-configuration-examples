classdef testFactorialValue_parameterized2 < matlab.unittest.TestCase
    
    properties (TestParameter)
        inputs = {0, 1, 5, 7};
        expected_outputs = {1, 1, 120, 5040};
    end
    
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src'));
        end
    end
    
    methods (Test, ParameterCombination='sequential')
        function test(testCase, inputs, expected_outputs)
            testCase.verifyEqual(factorialValue(inputs), expected_outputs);
        end
    end
    
end
