#!/bin/bash
# Usage: sh scripts/deploy-mdtapi.sh

# Import functions
. ./scripts/lib/library.sh

orgName=$(prompt_string "Enter Org Name")
convert_deploy_mdtapi $orgName