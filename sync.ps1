$ErrorActionPreference="Stop"

if (git status --porcelain) {
	throw "Commit or stash dev-gui changes before syncing."
}

$remote="gui-source"
$url="https://github.com/amyyzing/gui.git"
if (-not (git remote get-url $remote 2>$null)) {
	git remote add $remote $url
}

git fetch $remote main
git merge --no-ff "$remote/main"
