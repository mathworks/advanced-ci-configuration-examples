classdef hTestCase < matlabtest.coder.TestCase
%hTestCase is an external test to be run by the tTestCase unit test.
%   The class contains test points that exercise matlabtest.coder.TestCase
%   methods and options. The accuracy of the test point execution is
%   assessed by tTestCase.

%   Copyright 2022-2024 The MathWorks, Inc.

    properties(TestParameter)
        RunTimeInputs = {{5,5}, {1:5,1:5}, {-1,-5}};
        Tolerance = {"AbsTol", "RelTol"};
        Values = struct("AbsTol", single(0.1), "RelTol", single(0.01));
    end

    methods (Test)
        function validateCalculationResult(testCase)
            actSolution = arrayProduct(5,[1.5, 2, 9]);
            expSolution = [7.5, 10, 45];
            testCase.verifyEqual(actSolution,expSolution)
        end
        function validateNumberOfInputs(testCase)
            testCase.verifyError(@()arrayProduct(2), "ArrayProduct:TwoInputsRequired");
        end
        function validateMultiplierDatatype(testCase)
            testCase.verifyError(@()arrayProduct('a',[1, 2, 3]), "ArrayProduct:NotScalar");
        end
        function validateMatrixDatatype(testCase)
            testCase.verifyError(@()arrayProduct(2,['a', 2, 3]), "ArrayProduct:NotDouble");
        end
        function validateMatrixAsRowVector(testCase)
            testCase.verifyError(@()arrayProduct(2,[1, 2, 3; 4, 5, 6]), "ArrayProduct:NotRowVector");
        end

        function validateCalculationResult1(testCase)
            actSolution = arrayProduct(5,[1.5, 2, 9]);
            expSolution = [7.5, 10, 45];
            testCase.verifyEqual(actSolution,expSolution)
        end
        function validateNumberOfInputs1(testCase)
            testCase.verifyError(@()arrayProduct(2), "ArrayProduct:TwoInputsRequired");
        end
        function validateMultiplierDatatype1(testCase)
            testCase.verifyError(@()arrayProduct('a',[1, 2, 3]), "ArrayProduct:NotScalar");
        end
        function validateMatrixDatatype1(testCase)
            testCase.verifyError(@()arrayProduct(2,['a', 2, 3]), "ArrayProduct:NotDouble");
        end
        function validateMatrixAsRowVector1(testCase)
            testCase.verifyError(@()arrayProduct(2,[1, 2, 3; 4, 5, 6]), "ArrayProduct:NotRowVector");
        end

        % function passingQualifications(testCase)
        %     buildOut = testCase.build('myAdd.m', Inputs={5,5});
        %     actual = testCase.execute(buildOut);
        % 
        %     testCase.verifyExecutionMatchesMATLAB(actual);
        %     testCase.assumeExecutionMatchesMATLAB(actual);
        %     testCase.assertExecutionMatchesMATLAB(actual);
        %     testCase.fatalAssertExecutionMatchesMATLAB(actual);
        % end
        % 
        % function specifyAbsTol(testCase)
        %     buildOut = testCase.build('addSubtract_Fail.m', Inputs={5,5});
        %     actual = testCase.execute(buildOut);
        %     testCase.verifyExecutionMatchesMATLAB(actual, AbsTol=1);
        % end
        % 
        % function specifyRelTol(testCase)
        %     buildOut = testCase.build('addSubtract_Fail.m', Inputs={5,5});
        %     actual = testCase.execute(buildOut);
        %     testCase.verifyExecutionMatchesMATLAB(actual, RelTol=0.1);
        % end
        % 
        % function specifyAbsTolAndRelTol(testCase)
        %     buildOut = testCase.build('addSubtract_Fail.m', Inputs={5,5});
        %     actual = testCase.execute(buildOut);
        %     testCase.verifyExecutionMatchesMATLAB(actual, AbsTol=1, RelTol=0.02);
        % end
        % 
        % function testFcnWithNoInputs(testCase)
        %     buildOut = testCase.build('fcnWithNoInputs.m');
        %     actual = testCase.execute(buildOut);
        %     testCase.verifyExecutionMatchesMATLAB(actual);
        % end
        % 
        % function testStringInputs(testCase)
        %     buildOut = testCase.build("myAdd.m", Inputs={5,5});
        %     actual = testCase.execute(buildOut);
        %     testCase.verifyExecutionMatchesMATLAB(actual);
        % end
        % 
        % function testWithMultipleRunTimeInputs(testCase, RunTimeInputs)
        %     buildOut = testCase.build( ...
        %         'myAdd.m', ...
        %         Inputs={coder.typeof(0, [1 10], 1), coder.typeof(0, [1 10], 1)} ...
        %         );
        %     actual = testCase.execute(buildOut, Inputs=RunTimeInputs);
        %     testCase.verifyExecutionMatchesMATLAB(actual);
        % end
        % 
        % function specifyCodeGenerationArguments(testCase)
        %     buildOut = testCase.build( ...
        %         'myAdd.m', ...
        %         Inputs={5,5}, ...
        %         CodeGenerationArguments={'-nargout', 0} ...
        %         );
        %     actual = testCase.execute(buildOut);
        %     testCase.verifyExecutionMatchesMATLAB(actual);
        % end
        % 
        % function specifyCoderConstantInputs(testCase)
        %     buildOut = testCase.build('myAdd.m', Inputs={coder.Constant(5), coder.Constant(5)});
        %     actual = testCase.execute(buildOut);
        %     testCase.verifyExecutionMatchesMATLAB(actual);
        % end
        % 
        % function testWithRelativePathAndNoExtension(testCase)
        %     buildOut = testCase.build('myAdd', Inputs={5,5});
        %     actual = testCase.execute(buildOut);
        %     testCase.verifyExecutionMatchesMATLAB(actual);
        % end
        % 
        % function testWithNargoutFlag(testCase)
        %     buildOut = testCase.build( ...
        %         'fcnWithTwoOutputs.m', ...
        %         Inputs={2}, ...
        %         CodeGenerationArguments={'-nargout', 1} ...
        %         );
        %     actual = testCase.execute(buildOut);
        % 
        %     testCase.verifyLength(actual.ExecutableOutput, 1);
        %     testCase.verifyExecutionMatchesMATLAB(actual);
        % end
        % 
        % function testFcnWithSameNameAsInternalVar(testCase)
        %     buildOut = testCase.build('aFcn.m', Inputs={5});
        %     actual = testCase.execute(buildOut);
        %     testCase.verifyExecutionMatchesMATLAB(actual);
        % end
        % 
        % function testFcnWithNoInputsForFcnWithInputArgValidation(testCase)
        %     myFcn = fullfile('myAddWithArgValidation.m');
        %     buildOut = testCase.build(myFcn);
        %     actual = testCase.execute(buildOut, Inputs={1,1});
        %     testCase.verifyExecutionMatchesMATLAB(actual);
        % end
    end

    methods (Test, ParameterCombination = 'sequential')
        % function testWithSinglePrecisionTolerance(testCase,Tolerance,Values)
        %     buildOut = testCase.build('fcnWithSingleArrays.m',Inputs={coder.typeof(single(0))});
        %     actual = testCase.execute(buildOut,Inputs={single(10)});
        %     testCase.verifyExecutionMatchesMATLAB(actual,Tolerance,Values);
        % end
    end
end