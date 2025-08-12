classdef testNthRoot_parameterized2 < matlab.unittest.TestCase
    
    properties (TestParameter)
        positiveInputs = {16, 32, 243, 1024};
        positiveN = {4, 5, 5, 10};
        positiveExpectedOutputs = {2, 2, 3, 2};
        negativeInput = {-64};
        negativeN = {3};
        negativeExpectedOutput = {-4};
    end
    
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src'));       
        end
    end       
    
    methods (Test, ParameterCombination='sequential')
        function testPositive(testCase, positiveInputs, positiveN, positiveExpectedOutputs)
            testCase.verifyEqual(nthRoot(positiveInputs, positiveN), positiveExpectedOutputs);
        end
        
        function testNegative(testCase, negativeInput, negativeN, negativeExpectedOutput)
            testCase.verifyEqual(nthRoot(negativeInput, negativeN), negativeExpectedOutput);
        end
        
        function testError(testCase)
            testCase.verifyError(@()nthRoot(-16, 4),'NTHROOT:INVALIDINPUT');
        end
    end
    
end
