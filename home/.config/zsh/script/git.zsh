
function get-head-branch() {
	head=$(git branch -r | egrep -Eo "origin/HEAD -> origin/.*" | sed -e 's/origin\/HEAD -> origin\///')
	echo $head;
}

function git-clear-branch() {
	echo "Clearing git branch (except for master) . . ."	
	
	for branch in $(git branch -l | grep -Ev "(\*.*)|($(get-head-branch))"); do
		echo "Deleting branch $branch";
		git branch -d $($branch);
	done;

	echo "Branch cleared"
}

function git-pr() {
	if ! git rev-parse --git-dir > /dev/null 2>&1; then
		echo "Not a git directory !";
		return;
	fi

	gitUrl=$(git remote get-url origin | sed -r 's/git@//' | sed -e 's/:/\//' | sed -e 's/.git//');
	currentBranch=$(git branch --show-current)
	$BROWSER "$gitUrl/compare/$(get-head-branch)...$currentBranch";
}
