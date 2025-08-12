classdef testNthRoot_basic < matlab.unittest.TestCase
   
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src'));
        end
    end       
    
    methods (Test)
        function testPositiveValues(testCase)
            testCase.verifyEqual(nthRoot(16, 4), 2);
            testCase.verifyEqual(nthRoot(32, 5), 2);
        end
        
        function testNegativeValuesForOddN(testCase)
            testCase.verifyEqual(nthRoot(-125, 3), -5);
        end
        
        function testNegativeValuesForEvenN(testCase)
            testCase.verifyError(@() nthRoot(-16, 4), 'NTHROOT:INVALIDINPUT');
        end
        
        function testZeroValue(testCase)
            testCase.verifyEqual(nthRoot(0, 10), 0);
        end
    end
   
end