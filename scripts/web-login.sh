#!/bin/bash
# Usage: sh scripts/web-login.sh

# Import functions
. ./scripts/lib/library.sh

devHubName=$(prompt_string "Enter Dev Hub Name")
web_login $devHubName