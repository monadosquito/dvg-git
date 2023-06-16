argsErr () {
    echo 'arguments not expected'
}
noFlagOrOptErr () {
    echo "$1 flag or option undefined"
}

sep=-
while (( $# > 0 ))
do
    case $1 in
        -s | --separator)
            sep=$2
            shift
            shift
            ;;
        -* | --*)
            echo "$noFlagOrOptErr"
            exit 1
            ;;
        *)
            echo "$argsErr"
            exit 1
            ;;
    esac
done

dvgGitOut=$(get-dvg-git-out)
mkdir --parents .git/dvg-git
cp $dvgGitOut/utl.sh .git/dvg-git
install -D $dvgGitOut/git-hook/* .git/hooks
dvgBranches=$(git config --get dvgGit.divergingBranches)
repoPath=$(pwd)
repoName=${repoPath##*/}
for dvgBranch in $dvgBranches
do
    git branch $dvgBranch &> /dev/null
    git worktree add "../$dvgBranch$sep$repoName" $dvgBranch &> /dev/null
done
