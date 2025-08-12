classdef testPow_parameterized2 < matlab.unittest.TestCase
    
    properties (TestParameter)
        bases = {2, 3, 10, 1, 0};
        exponents = {3, 2, 1, 0, 5};
        expected_outputs = {8, 9, 10, 1, 0};
    end
    
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src'));
        end
    end
    
    methods (Test, ParameterCombination='sequential')
        function test(testCase, bases, exponents, expected_outputs)
            testCase.verifyEqual(pow(bases, exponents), expected_outputs);
        end
    end
    
end
