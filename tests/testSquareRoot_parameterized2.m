classdef testSquareRoot_parameterized2 < matlab.unittest.TestCase
    
    properties (TestParameter)
        inputs = {4, 16, 81, 121, 49};
        expected_outputs = {2, 4, 9 , 11, 7};
    end
    
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src'));       
        end
    end       
    
    
    methods (Test,ParameterCombination='sequential')
        function test(testCase,inputs,expected_outputs)
            testCase.verifyEqual(squareRoot(inputs),expected_outputs);
        end
        
        function testError(testCase)
            testCase.verifyError(@()squareRoot(-1),'SQUAREROOT:INVALIDINPUT');
        end
  
    end
  
    
end
