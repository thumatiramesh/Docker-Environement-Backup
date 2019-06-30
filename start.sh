#!/bin/bash

source ./bash-utils/get-from-label.sh
source ./bash-utils/is-running.sh

start(){
	export BACKUP_CONTAINERS="$(get-from-label backup)"

	while is-running; do
	    read -p "Volumerize is already running. Do you wish to restart it (yN)?" yn
	    case $yn in
	        [Yy]* ) docker-compose up -d --force-recreate volumerize; break;;
	        [Nn]* ) break;;
	        * ) break;;
	    esac
	done
	docker-compose up -d volumerize || exit 1;
}