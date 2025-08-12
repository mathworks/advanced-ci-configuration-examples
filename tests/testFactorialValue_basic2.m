classdef testFactorialValue_basic2 < matlab.unittest.TestCase
    
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src'));
        end
    end
    
    methods (Test)
        function testSmallNumber(testCase)
            testCase.verifyEqual(factorialValue(3), 6);
        end
        
        function testZero(testCase)
            testCase.verifyEqual(factorialValue(0), 1);
        end
        
        function testOne(testCase)
            testCase.verifyEqual(factorialValue(1), 1);
        end
        
        function testErrorOnNegativeInput(testCase)
            testCase.verifyError(@()factorialValue(-1), 'FACTORIALVALUE:INVALIDINPUT');
        end
        
        function testErrorOnNonIntegerInput(testCase)
            testCase.verifyError(@()factorialValue(3.5), 'FACTORIALVALUE:INVALIDINPUT');
        end
    end
    
end
