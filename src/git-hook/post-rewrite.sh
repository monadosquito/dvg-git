if [[ $1 == rebase && -d .git ]]
then
    dvgBranches=$(git config --get dvgGit.divergingBranches)
    source .git/dvg-git/utl.sh
    mainBranch=$(mainBranch)
    mainRepoPath=$(pwd)
    mainRepoName=${mainRepoPath##*/}
    for dvgBranch in $dvgBranches
    do
        if [[ -d "../$dvgBranch-$mainRepoName" ]]
        then
            bgnInDvgRepo $dvgBranch $mainRepoName
            rbsDvgBranch $dvgBranch $mainBranch
            endInDvgRepo
        fi
    done
fi
