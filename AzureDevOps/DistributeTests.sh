#!/bin/bash
#===============================================================================
#
#          FILE:  distribute_tests.sh
#
#         USAGE:  ./distribute_tests.sh
#
#   DESCRIPTION:  This script slices tests files across multiple agents for faster execution.
#                 We search for specific type of file structure (in this example test*), and slice them according to agent number
#                 If we encounter multiple files [file1..file10] and if we have 2 agents, agent1 executes tests odd number of files while agent2 executes even number of files
#
#===============================================================================

tests=()
while IFS= read -r file; do
    tests+=("$file")
done < <(find ./tests -type f -name "*.m" | sort)

# Use Azure DevOps variables
totalAgents=${SYSTEM_TOTALJOBSINPHASE}
agentNumber=${SYSTEM_JOBPOSITIONINPHASE}
testCount=${#tests[@]}

if [ $totalAgents -eq 0 ]; then
    totalAgents=1
fi
# below conditions are used if parallel pipeline is not used. i.e. pipeline is running with single agent (no parallel configuration)
if [ -z $agentNumber ]; then
    agentNumber=1
fi

echo "Total agents: $totalAgents"
echo "Agent number: $agentNumber"
echo "Total tests: $testCount"

testsToRun=()

# Slice test files so each agent gets unique files (1-based index)
for (( i=agentNumber; i<=testCount; i+=totalAgents )); do
    file="${tests[i-1]}"

    fileName=$(basename "$file" .m)
    testsToRun+=("${fileName}/*")
    echo "Added $fileName"
done

# Join all test files separated by space
testFiles="${testsToRun[*]}"
echo "Test files $testFiles"

# Set as Azure Pipelines variable
echo "##vso[task.setvariable variable=MATLABTestFiles;]$testFiles"