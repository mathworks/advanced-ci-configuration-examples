function plan = buildfile
import matlab.buildtool.tasks.*;

% Create a plan from task functions
plan = buildplan(localfunctions);

% Add a task to delete task outputs and traces
plan("clean") = CleanTask;

% Add a task to build a MEX file
plan("mex") = MexTask("src/arrayProduct.c", "toolbox");
plan("mex").Outputs = "toolbox/arrayProduct*";

% Add a task to run tests and generate test results
plan("test") = TestTask("tests/arrayProductTest.m", TestResults="test-results/results.xml");
plan("test").Dependencies = "mex";

% Add a task to package the toolbox   
plan("packageToolbox").Dependencies = "test";
plan("packageToolbox").Inputs = plan("mex").Outputs;
plan("packageToolbox").Outputs = "toolbox.mltbx";
plan("packageToolbox").Description = "Package toolbox";

plan.DefaultTasks = "packageToolbox";

end

function packageToolboxTask(~)
    % Create an mltbx toolbox package
    identifier = "arrayProduct";
    toolboxFolder = "toolbox";
    opts = matlab.addons.toolbox.ToolboxOptions(toolboxFolder,identifier);
    
    opts.ToolboxName = "Cross-Platform Array Product Toolbox";
    opts.MinimumMatlabRelease = "R2024a";

    matlab.addons.toolbox.packageToolbox(opts);
end