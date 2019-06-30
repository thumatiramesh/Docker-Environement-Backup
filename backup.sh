#!/bin/bash

# Sourcing utilities
source ./start.sh
source ./bash-utils/is-running.sh
source ./bash-utils/get-from-label.sh

backup(){
	while ! is-running; do
	    echo "Starting Volumerize.."
	    start
	done
	# Check already running containers
	local running_containers=$(get-from-label -r backup)

	# Stop containers
	if [ ! -z "$running_containers" ];
		echo "Stopping containers.."
		then docker stop $running_containers;
	fi

	echo "Backing up.."
	docker exec -it volumerize backup;

	# Start containers
	if [ ! -z "$running_containers" ];
		echo "Starting containers.."
		then docker start $running_containers;
	fi
}

backup