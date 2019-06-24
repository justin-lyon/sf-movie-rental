#!/bin/bash

# myvar=$(prompt_string "message")
prompt_string () {
  read -p "$@: " stringInput
  echo $stringInput
}
