
function get-head-branch() {
	local head=$(git branch -r | grep -Eo "origin/HEAD -> origin/.*" | sed -e 's/origin\/HEAD -> origin\///');
	echo $head;
}

function git-clear-branch() {
	echo " ♻️ Clearing git branch (except for $(get-head-branch))...";

	local force=false
	
	while getopts 'f' opt; do
    case $opt in
      f) force=true ;;
    esac
  done

	if [[ "$force" == true ]]; then 
		echo " -> 🔥 Will force remove branches!";
	fi

	for branch in $(git branch -l | grep -Ev "(\*.*)|($(get-head-branch))"); do
		echo " -> 🗑️ Deleting branch $branch";
		if [[ "$force" == true ]]; then 
			git branch -D $branch;
		else 
			git branch -d $branch;
		fi
	done;

	git remote prune origin;

	echo " ✅ Branch cleaned";
}

function git-pr() {
	if ! git rev-parse --git-dir > /dev/null 2>&1; then
		echo "Not a git directory !";
		return;
	fi

	local gitUrl=$(git remote get-url origin | sed -r 's/git@//' | sed -e 's/:/\//' | sed -e 's/.git//');
	local currentBranch=$(git branch --show-current);
	$BROWSER "$gitUrl/compare/$(get-head-branch)...$currentBranch";
}
