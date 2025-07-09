classdef mySimulinkTest < sltest.TestCase
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
   end
end