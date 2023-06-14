#!/bin/bash

action=$1

if [[ -z "$action" || "$action" == "--help" ]]; then
  echo "====== TeraSoft ======"
  echo "                      cd, push, pull, commit"
  echo "dk.                   up, re, down, in, logs, tail"
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

  "commit")
	  source cd-tt.sh
      git add .
      git commit -m "$2"
	;;

  "pull")
	  source cd-tt.sh
      git pull
	;;

  "dk.up")
	  source cd-tt.sh
    docker-compose up -d
	;;

  "dk.re")
	  source cd-tt.sh
    docker-compose restart
	;;

  "dk.down")
	  source cd-tt.sh
    docker-compose down
	;;

  "dk.in")
	  source cd-tt.sh
    docker exec -it ttweb bash
	;;

  "dk.logs")
	  source cd-tt.sh
    docker logs ttweb
	;;

  "dk.tail")
	  source cd-tt.sh
    docker logs -f ttweb
	;;

  *)
    # Handle unknown or missing arguments
    echo "Invalid or missing argument. Please specify a valid action or use --help for usage information."
    ;;

 esac
fi


