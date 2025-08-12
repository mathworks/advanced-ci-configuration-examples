classdef myBaselineTest < sltest.TestCase
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src')); 
             pause(10);
        end
    end
    methods (Test)
      function testOne(testCase)
         testCase.loadSystem...
           ('sltestMATLABBasedTestExample');
         evalin('base','gain2_var = 2.01;');
         simOut = testCase.simulate...
           ('sltestMATLABBasedTestExample');
         testCase.verifySignalsMatch(simOut,'baselineOne.mat',...
           'AbsTol',0.015);
      end
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
   end
end
