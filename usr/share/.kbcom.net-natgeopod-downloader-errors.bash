#!/bin/bash

declare -a GLOBAL_CODES_ERROR

GLOBAL_MESSAGE_ERRORSTOP="Exit"

GLOBAL_CODES_ERROR[10]="Error when try to fetch image URL"
GLOBAL_CODES_ERROR[11]="Image URL is empty"
GLOBAL_CODES_ERROR[12]="Image download error"

error_showexit()
{
 local LOCAL_CODE_ERROR="$1"

 echo "${GLOBAL_CODES_ERROR[$LOCAL_CODE_ERROR]}!"
 echo "$GLOBAL_MESSAGE_ERRORSTOP"
 exit $LOCAL_CODE_ERROR
}
