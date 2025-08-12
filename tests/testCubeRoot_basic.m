classdef testCubeRoot_basic < matlab.unittest.TestCase
   
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src'));
            pause(10);
        end
    end       
    
    methods (Test)
        function testPositiveValues(testCase)
            testCase.verifyEqual(cubeRoot(27), 3);
            testCase.verifyEqual(cubeRoot(64), 4);
        end
        
        function testNegativeValues(testCase)
            testCase.verifyError(@() cubeRoot(-27), 'CUBEROOT:INVALIDINPUT');
        end
        
        function testZeroValue(testCase)
            testCase.verifyEqual(cubeRoot(0), 0);
        end
    end
   
end