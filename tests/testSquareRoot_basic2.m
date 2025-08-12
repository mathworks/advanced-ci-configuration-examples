classdef testSquareRoot_basic2 < matlab.unittest.TestCase
   
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src'));
        end
    end       
    
    
    methods (Test)
        function testValues(testCase)
            testCase.verifyEqual(squareRoot(16),4);
            testCase.verifyEqual(squareRoot(81),9);            
        end
        
    end
   
end
