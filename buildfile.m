function plan = buildfile
import matlab.buildtool.Task;
import matlab.buildtool.tasks.*;

% Create a plan from task functions
plan = buildplan(localfunctions);

% Add a task to delete task outputs and traces
plan("clean") = CleanTask;

% Add a task to build a MEX file
plan("mex") = MexTask("src/arrayProduct.c", "toolbox");

% Add a task to run tests and generate test results
plan("test") = TestTask("tests/arrayProductTest.m", TestResults="test-results/results.xml", Dependencies = "mex");

plan("buildPythonPackage") = Task(Actions=@buildPythonPackage, ...
    Description = "Build a Python Package from MATLAB function");

% Add a task to run equivalence tests
plan("equivalenceTest") = TestTask("tests/KgToPoundsEquivalenceTest.m", Dependencies = ["mex" "buildPythonPackage"]);

% Add a task to package the toolbox
plan("package") = PackageTask(Dependencies=["mex", "test"]);

plan.DefaultTasks = "package";

end

function buildPythonPackage(~)
buildResults = compiler.build.pythonPackage("src/KgToPounds.m", OutputDir = "KgToPoundsPythonBuild");
save("pythonBuild.mat","buildResults");
end
