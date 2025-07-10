classdef hEquivalenceTest < matlabtest.coder.TestCase

    %  Copyright 2023 The MathWorks, Inc.
    
    properties(TestParameter)
        CodingTarget = {'mex'};
    end

    methods(Test)
        function numericalVerificationFail(testCase, CodingTarget)
            buildOut = testCase.build('addSubtract_Fail.m', 'Inputs', {5,5}, 'Configuration', CodingTarget);
            actual = testCase.execute(buildOut);
            testCase.verifyExecutionMatchesMATLAB(actual);
        end

        function failWithCustomDiagnostic(testCase, CodingTarget)
            buildOut = testCase.build('addSubtract_Fail.m', 'Inputs', {5,5}, 'Configuration', CodingTarget);
            actual = testCase.execute(buildOut);

            testCase.verifyExecutionMatchesMATLAB(actual, "This is my first test diagnostic");
            testCase.verifyExecutionMatchesMATLAB(actual, "This is my second test diagnostic", AbsTol=1, RelTol=0.02);
        end

        function buildFails(testCase)
            buildOut = testCase.build('myAdd.m', Inputs={5,10}); %#ok<NASGU>
        end

        function executionFails(testCase)
            buildOut = testCase.build('myAdd.m', Inputs={5,5});
            executionOut = testCase.execute(buildOut); %#ok<NASGU>
        end

        function numericalVerificationPasses(testCase)
            buildOut = testCase.build('myAdd.m', 'Inputs', {5,5});
            actual = testCase.execute(buildOut);
            testCase.verifyExecutionMatchesMATLAB(actual);
        end
    end
end