#!/usr/bin/env bash
# Distribute tests across multiple agents for parallel execution (Bash version)
# Produces MATLAB cell array like:
# {'/path/to/file1.m','/path/to/file2.m'}

# Find all test files (*.m) under ./tests
mapfile -t tests < <(find ./tests -type f -name "*.m" | sort)

# Use Azure DevOps variables if available, else default to 1
totalAgents=${SYSTEM_TOTALJOBSINPHASE:-1}
agentNumber=${SYSTEM_JOBPOSITIONINPHASE:-1}
testCount=${#tests[@]}

# If not set or zero, default to 1
if [[ -z "$totalAgents" || "$totalAgents" -eq 0 ]]; then
    totalAgents=1
fi
if [[ -z "$agentNumber" || "$agentNumber" -eq 0 ]]; then
    agentNumber=1
fi

echo "Total agents: $totalAgents"
echo "Agent number: $agentNumber"
echo "Total tests: $testCount"

testsToRun=()

# Slice test files so each agent gets unique files (1-based index)
for (( i=agentNumber; i<=testCount; i+=totalAgents )); do
    file="${tests[i-1]}"
    testsToRun+=("$file")
    echo "Added $file"
done

# Join all test files separated by space
testFiles="${testsToRun[*]}"
echo "Test files $testFiles"

# Set as Azure Pipelines variable
echo "##vso[task.setvariable variable=pytestfiles;]$testFiles"