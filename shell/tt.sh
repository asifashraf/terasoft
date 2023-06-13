#!/bin/bash

action=$1

if [[ -z "$action" || "$action" == "--help" ]]; then
  echo "  ====== TeraSoft ======"
  echo "                      cd, push"
else
 case $action in
  "cd")
	  source cd-tt.sh
	;;

  "push")
	  source cd-tt.sh
      git add .
      git commit -m "$2"
      git push
	;;

  *)
    # Handle unknown or missing arguments
    echo "Invalid or missing argument. Please specify a valid action or use --help for usage information."
    ;;

 esac
fi


