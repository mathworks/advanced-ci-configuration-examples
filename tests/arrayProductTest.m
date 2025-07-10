classdef arrayProductTest < matlab.unittest.TestCase
    methods(Test)
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
    end
end