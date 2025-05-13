function plan = buildfile
import matlab.buildtool.tasks.*;

% Create a plan from task functions
plan = buildplan(localfunctions);

% Add a task to delete task outputs and traces
plan("clean") = CleanTask;

% Add a task to build a MEX file
plan("mex") = MexTask("src/arrayProduct.c", "toolbox");

% Add a task to run tests and generate test results
plan("test") = TestTask("tests/arrayProductTest.m", TestResults="test-results/results.xml", Dependencies = "mex");

% Add a task to run equivalence tests
plan("equivalenceTest") = TestTask("tests/KgToPoundsEquivalenceTest.m", Dependencies = ["mex" "buildPythonPackage"]);

% Add a task to package the toolbox   
plan("packageToolbox").Dependencies = "test";
plan("packageToolbox").Inputs = plan("mex").MexFile;
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

function buildPythonPackageTask(~)
% Build a Python Package from MATLAB function
buildResults = compiler.build.pythonPackage("src/KgToPounds.m", OutputDir = "KgToPoundsPythonBuild");
save("pythonBuild.mat","buildResults");
end