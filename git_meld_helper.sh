#!/bin/bash

DIFFALL_CMD_FILE="/tmp/diffallcommand"
DIFFALL_DIR_LEFT="/tmp/gitdiffallleft"
DIFFALL_DIR_RIGHT="/tmp/gitdiffallright"

# Save temporary left and right files to be compared later.
# Git deletes its temporary files after this script returns.
LEFT_FILE="$1"
if [[ "$1" == /tmp/* ]]; then
  cp "$1" "$DIFFALL_DIR_LEFT"
  LEFT_FILE="$DIFFALL_DIR_LEFT/`basename $1`"
fi

RIGHT_FILE="$2"
if [[ "$2" == /tmp/* ]]; then
  cp "$2" "$DIFFALL_DIR_RIGHT"
  RIGHT_FILE="$DIFFALL_DIR_RIGHT/`basename $2`"
fi

# Construct the diffall command by appending this file pair.
echo -n " --diff $LEFT_FILE $RIGHT_FILE" >> "$DIFFALL_CMD_FILE"
