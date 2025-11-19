#!/bin/bash
#===============================================================================
#
#          FILE:  distribute_tests.sh
#
#         USAGE:  ./distribute_tests.sh
#
#   DESCRIPTION:  This script divides test files among multiple agents for faster execution. It searches for files matching a specific pattern (for example, `test*`) and assigns them based on the agent number.
#                 For example, if there are multiple files [test1..test10] and 2 agents:
#                       - Agent 1 runs tests from odd-numbered files.
#                       - Agent 2 runs tests from even-numbered files.
#                 For detailed slicing information, see https://docs.microsoft.com/en-us/vsts/pipelines/test/parallel-testing-any-test-runner
#
#===============================================================================

tests=()
# Search for test files matching the specified pattern
while IFS= read -r file; do
    tests+=("$file")
done < <(find ./tests -type f -name "*.m" | sort)

# Use Azure DevOps variables
totalAgents=${SYSTEM_TOTALJOBSINPHASE} # Standard VSTS variable containing the number of parallel jobs
agentNumber=${SYSTEM_JOBPOSITIONINPHASE} # Current job positioN
testCount=${#tests[@]}

# Handle cases where the pipeline runs without parallel configuration (single agent)
if [ $totalAgents -eq 0 ]; then
    totalAgents=1
fi
if [ -z $agentNumber ]; then
    agentNumber=1
fi

echo "Total agents: $totalAgents"
echo "Agent number: $agentNumber"
echo "Total tests: $testCount"

testsToRun=()

# Slice test files so each agent gets a unique set of files
for (( i=agentNumber; i<=testCount; i+=totalAgents )); do
    file="${tests[i-1]}"

    fileName=$(basename "$file" .m)
    testsToRun+=("${fileName}/*")
done

# Join all test files into a space-separated string
testFiles="${testsToRun[*]}"
echo "Tests to run $testFiles"

# Write files into a variable for execution in a subsequent task
echo "##vso[task.setvariable variable=MATLABTestFiles;]$testFiles"