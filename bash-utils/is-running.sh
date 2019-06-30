# Check if Volumerize is running
is-running(){
	local container=$(get-from-label -r volumerize)
	if [ -z "$container" ];
		then return 1 # POSIX systems the standard convention | Failed exit code
		else return 0 # POSIX systems the standard convention | Successful exit code
	fi
}