#!/bin/bash

# Sourcing utilities
source ./start.sh
source ./bash-utils/is-running.sh

verify(){
	while ! is-running; do
     	echo "Starting Volumerize.."
	    start
	done
	docker exec -it volumerize verify
}

verify