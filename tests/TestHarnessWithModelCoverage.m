classdef TestHarnessWithModelCoverage < sltest.TestCase
%

%   Copyright 2020 The MathWorks, Inc.

   methods (Test)
       function testOne(testCase)
           in = testCase.createSimulationInput('simpleSwitchWithSubsystemIn', 'WithHarness','simpleSwitchWithSubsystemIn_Harness1');
         
           % Simulate the model 
           simOut = testCase.simulate(in);
           testCase.verifySignalsMatch(simOut,'baselineOne1.mat');
       end
       function testTwo(testCase)
           in = testCase.createSimulationInput('simpleSwitchWithSubsystemIn', 'WithHarness','simpleSwitchWithSubsystemIn_Harness2');

           % Simulate the model 
           simOut = testCase.simulate(in);
           testCase.verifySignalsMatch(simOut,'baselineTwo.mat');
       end
   end
end




