classdef SolverTest1 < matlab.unittest.TestCase
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src')); 
             pause(10);
        end
    end
    methods(Test)
        function realSolution(testCase)
            actSolution = quadraticSolver(1,-3,2);
            expSolution = [2 1];
            testCase.verifyEqual(actSolution,expSolution)
        end
        function imaginarySolution(testCase)
            actSolution = quadraticSolver(1,2,10);
            expSolution = [-1+3i -1-3i];
            testCase.verifyEqual(actSolution,expSolution)
        end
    end
end