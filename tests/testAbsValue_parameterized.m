classdef testAbsValue_parameterized < matlab.unittest.TestCase
    
    properties (TestParameter)
        inputs = {-5, 5, -3.2, 3.2, 0};
        expected_outputs = {5, 5, 3.2, 3.2, 0};
    end
    
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src'));
             pause(10);
        end
    end
    
    methods (Test, ParameterCombination='sequential')
        function test(testCase, inputs, expected_outputs)
            testCase.verifyEqual(absValue(inputs), expected_outputs);
        end
    end
    
end