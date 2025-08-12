classdef testPow_basic2 < matlab.unittest.TestCase
    
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src'));
        end
    end
    
    methods (Test)
        function testValues(testCase)
            testCase.verifyEqual(pow(2,3),8);
            testCase.verifyEqual(pow(5,2),25);
        end
    end
    
end

