
function git-clear-branch() {
	echo "Clearing git branch (except for master) . . ."	
	
	for branch in $(git branch -l | egrep -v "(\*.*)|(master)$"); do
		echo "Deleting branch $branch";
		git branch -d $($branch);
	done;

	echo "Branch cleared"
}

