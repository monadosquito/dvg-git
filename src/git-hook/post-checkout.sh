if [[ -d .git ]]
then
    currSymRef=$(git name-rev --name-only @)
    dvgBranches=$(git config --get dvgGit.divergingBranches)
    mainRepoPath=$(pwd)
    mainRepoName=${mainRepoPath##*/}
    source .git/dvg-git/utl.sh
    for dvgBranch in $dvgBranches
    do
        if [[ -d "../$dvgBranch-$mainRepoName" && $currSymRef != undefined ]]
        then
            bgnInDvgRepo $dvgBranch $mainRepoName
            rbsDvgBranch $dvgBranch $2
            endInDvgRepo
        fi
    done
fi
