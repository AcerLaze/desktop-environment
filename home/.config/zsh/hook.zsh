zshaddhistory(){
	# don't record failed command from history
	whence ${${(z)1}[1]} >| /dev/null || return 1
}
