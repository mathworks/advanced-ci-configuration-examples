% classdef KgToPoundsEquivalenceTest < matlabtest.compiler.TestCase
% 
%     methods(Test, TestTags = {'EquivalenceTest'})
%         function pythonEquivalenceTest(testCase)
%             loadedData = load("../pythonBuild.mat");
%             buildResults = loadedData.buildResults;
%             executionResults = execute(testCase,buildResults,{[1,2,3,4,5]});
%             verifyExecutionMatchesMATLAB(testCase,executionResults);
%         end
%     end
% 
% end