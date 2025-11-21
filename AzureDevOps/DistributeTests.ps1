<#  
.SYNOPSIS  
    Distribute tests across multiple agents in VSTS pipeline 
.DESCRIPTION  
    This script divides test files across multiple agents for faster execution. It searches for files matching a specific pattern (for example, `test*`) and assigns them based on the agent number.
    For example, if there are multiple files [test1..test10] and 2 agents:
        - Agent 1 runs tests from odd-numbered files.
        - Agent 2 runs tests from even-numbered files.
    For detailed slicing information, see https://docs.microsoft.com/en-us/vsts/pipelines/test/parallel-testing-any-test-runner
#>

$tests = Get-ChildItem .\tests\ -Filter *.m -File # Search for test files matching the specified pattern
$totalAgents = [int]$Env:SYSTEM_TOTALJOBSINPHASE # Standard VSTS variable containing the number of parallel jobs
$agentNumber = [int]$Env:SYSTEM_JOBPOSITIONINPHASE  # Current job position
$testCount = $tests.Count

# Handle cases where the pipeline runs without parallel configuration (single agent)
if ($totalAgents -eq 0) {
    $totalAgents = 1
}
if (!$agentNumber -or $agentNumber -eq 0) {
    $agentNumber = 1
}

Write-Host "Total agents: $totalAgents"
Write-Host "Agent number: $agentNumber"
Write-Host "Total tests: $testCount"

$testsToRun= @()
# Slice test files so each agent gets a unique set of files to execute
For ($i=$agentNumber; $i -le $testCount;) {
    $file = $tests[$i-1]

    $fileName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $testsToRun += "$fileName/*"
    $i = $i + $totalAgents 
 }

# Join all test files into a space-separated string
$testFiles = $testsToRun -Join " "
Write-Host "Tests to run $testFiles"
# Write files into a variable for execution in a subsequent task
Write-Host "##vso[task.setvariable variable=MATLABTestFiles;]$testFiles" 