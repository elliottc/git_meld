#!/bin/bash

DIFFALL_BIN_DIR=$(dirname "$0")
DIFFALL_CMD_FILE="/tmp/diffallcommand"
DIFFALL_DIR_LEFT="/tmp/gitdiffallleft"
DIFFALL_DIR_RIGHT="/tmp/gitdiffallright"
DIFFALL_TOOL="meld"

# Reset command file.
echo -n "$DIFFALL_TOOL" > "$DIFFALL_CMD_FILE"

# Reset the temporary diffall directories.
rm -rf "$DIFFALL_DIR_LEFT"
mkdir "$DIFFALL_DIR_LEFT"
rm -rf "$DIFFALL_DIR_RIGHT"
mkdir "$DIFFALL_DIR_RIGHT"

# Git difftool will execute the helper script many times with the different file pairs.
# The helper script will collect files to be compared and construct the diffall command.
git difftool -y -x "$DIFFALL_BIN_DIR/git_meld_helper.sh" "$@"

# Execute command in command file.
DIFFALL_CMD=`cat "$DIFFALL_CMD_FILE"`
if [ "$DIFFALL_CMD" != "$DIFFALL_TOOL" ]; then
  $DIFFALL_CMD
fi
