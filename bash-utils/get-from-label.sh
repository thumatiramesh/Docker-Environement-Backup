# Get labeled containers (use r flag to filter running and s for stopped) 
get-from-label(){
	while getopts "rs" opt; do
	    case "${opt}" in
	    r) rc="$(docker ps -a -f label=$2 -f status=running --format {{.Names}})";
		echo $rc
		break;;
	    s) sc="$(docker ps -a -f label=$2 -f status=exited --format {{.Names}})";
		echo $sc
		break;;
      	esac
	  done
	lc="$(docker ps -a -f label=$1 --format {{.Names}})";
	echo $lc
}