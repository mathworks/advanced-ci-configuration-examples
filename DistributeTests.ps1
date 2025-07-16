<#  
.SYNOPSIS  
    Distribute the tests in VSTS pipeline across multiple agents 
.DESCRIPTION  
    This script slices tests files across multiple agents for faster execution.
    We search for specific type of file structure (in this example test*), and slice them according to agent number
    If we encounter multiple files [file1..file10] and if we have 2 agents, agent1 executes tests odd number of files while agent2 executes even number of files
    For detalied slicing info: https://docs.microsoft.com/en-us/vsts/pipelines/test/parallel-testing-any-test-runner
    We use JUnit style test results to publish the test reports.
#>

$tests = Get-ChildItem .\tests -Filter "*.m" -Recurse | Select-Object -ExpandProperty FullName # search for test files with specific pattern.
$totalAgents = [int]$Env:CI_TOTAL # standard VSTS variables available using parallel execution; total number of parallel jobs running
$agentNumber = [int]$Env:CI_INDEX  # current job position
$testCount = $tests.Count

# below conditions are used if parallel pipeline is not used. i.e. pipeline is running with single agent (no parallel configuration)
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

# slice test files to make sure each agent gets unique test file to execute
For ($i=$agentNumber; $i -le $testCount;) {
    $file = $tests[$i-1]
    $formattedTests += "`"$file`""
    Write-Host "Added $file"
    $i = $i + $totalAgents 
 }

# join all test files seperated by space. pytest runs multiple test files in following format pytest test1.py test2.py test3.py
$joined = '[{0}]' -f ($formattedTests -join ', ')
Write-Host "Final test file list: $joined"
# write these files into variable so that we can run them using pytest in subsequent task. 
Write-Host "##vso[task.setvariable variable=MATLABTestFiles;]$joined"
 