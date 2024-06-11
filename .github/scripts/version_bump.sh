#!/bin/bash

VARIABLES_FILE=$1
NEW_VERSION=$2
CURRENT_VERSION=$(< "$VARIABLES_FILE" grep 'version = \"v' | cut -d '=' -f 2 | cut -d ' ' -f 2)


sed -i s/"$CURRENT_VERSION"/"$NEW_VERSION"/g "$VARIABLES_FILE"
