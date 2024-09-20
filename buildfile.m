function plan = buildfile
import matlab.buildtool.tasks.TestTask;
import matlab.buildtool.tasks.MexTask;

% Create a plan from task functions
plan = buildplan(localfunctions);

% Add a task to build a MEX file
plan("mex") = MexTask("src/arrayProduct.c","toolbox");

% Add a task to run tests and generate test and coverage results
plan("test") = TestTask(TestResults="test-results/results.xml");
plan("test").Dependencies = ["mex"];

end

function packageToolboxTask(~)
    % Create an mltbx toolbox package
    dir toolbox/*.mex*;
    identifier = "arrayProduct";
    toolboxFolder = "toolbox";
    opts = matlab.addons.toolbox.ToolboxOptions(toolboxFolder,identifier);
    
    opts.ToolboxName = "Cross-Platform Array Product Toolbox";
    opts.MinimumMatlabRelease = "R2024a";

    matlab.addons.toolbox.packageToolbox(opts);
end