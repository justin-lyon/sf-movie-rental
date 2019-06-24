#!/bin/bash
# Usage: sh scripts/create-org.sh

# Import defaults
. ./scripts/lib/defaults.sh

# Import functions
. ./scripts/lib/library.sh

# Main script starts here
scratchOrgName=$(prompt_string "Enter Scratch Org Name")
init_scratch_org $scratchOrgName $scratchDefPath $dataPath $permsetName $duration

