classdef KgToPoundsEquivalenceTest123 < matlabtest.compiler.TestCase
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(fileparts(pwd),'src')); 
             pause(10);
        end
    end

    methods(Test, TestTags = {'EquivalenceTest'})
        function pythonEquivalenceTest(testCase)
        end
    end

end