classdef testExpValue_basic < matlab.unittest.TestCase
    
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src'));
        end
    end
    
    methods (Test)
        function testPositiveNumber(testCase)
            testCase.verifyEqual(expValue(1), exp(1), 'AbsTol', 1e-10);
        end
        
        function testZero(testCase)
            testCase.verifyEqual(expValue(0), 1);
        end
        
        function testNegativeNumber(testCase)
            testCase.verifyEqual(expValue(-1), exp(-1), 'AbsTol', 1e-10);
        end
    end
    
end