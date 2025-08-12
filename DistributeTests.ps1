#!/usr/bin/env bash
# Distribute tests across multiple agents for parallel execution (Bash version)
# Produces MATLAB cell array like:
# {'/path/to/file1.m','/path/to/file2.m'}

# Find all test files (*.m) under ./tests
mapfile -t tests < <(find ./tests -type f -name "*.m" | sort)

totalAgents=${CI_TOTAL:-1}   # Default to 1 if not set
agentNumber=${CI_INDEX:-1}   # Default to 1 if not set
testCount=${#tests[@]}

echo "Total agents: $totalAgents"
echo "Agent number: $agentNumber"
echo "Total tests: $testCount"

testsToRun=()

# Slice test files so each agent gets unique tests
for (( i=agentNumber; i<=testCount; i+=totalAgents )); do
    file="${tests[i-1]}"
    testsToRun+=("$file")
    echo "Added $file"
done

# Format as MATLAB cell array: {'file1','file2'}
joined="{"
for idx in "${!testsToRun[@]}"; do
    if [[ $idx -gt 0 ]]; then
        joined+=","
    fi
    joined+="'${testsToRun[$idx]}'"
done
joined+="}"

echo "Final test file list (MATLAB cell array): $joined"

# Set as Azure Pipelines variable
echo "##vso[task.setvariable variable=MATLABTestFiles;]$joined"
