classdef testCubeRoot_parameterized < matlab.unittest.TestCase
    
    properties (TestParameter)
        positiveInputs = {8, 27, 64, 125};
        positiveExpectedOutputs = {2, 3, 4, 5};
        negativeInput = {8};
        negativeExpectedOutput = {2};
    end
    
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src')); 
             pause(10);
        end
    end       
    
    methods (Test, ParameterCombination='sequential')
        function testPositive(testCase, positiveInputs, positiveExpectedOutputs)
            testCase.verifyEqual(cubeRoot(positiveInputs), positiveExpectedOutputs);
        end
        
        function testNegative(testCase, negativeInput, negativeExpectedOutput)
            testCase.verifyEqual(cubeRoot(negativeInput), negativeExpectedOutput);
        end
        
        function testError(testCase)
            testCase.verifyError(@()cubeRoot(-27),'CUBEROOT:INVALIDINPUT');
        end
    end
end
