classdef testAbsValue_basic2 < matlab.unittest.TestCase
    
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src'));
        end
    end
    
    methods (Test)
        function testPositiveValue(testCase)
            testCase.verifyEqual(absValue(10), 10);
        end
        
        function testNegativeValue(testCase)
            testCase.verifyEqual(absValue(-10), 10);
        end
        
        function testZeroValue(testCase)
            testCase.verifyEqual(absValue(0), 0);
        end
    end
    
end
