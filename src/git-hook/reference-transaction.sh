if [[ -f .git/rebase-merge/stopped-sha ]]
then
    onto=$(cat .git/rebase-merge/stopped-sha)
    if [[ $1 != prepared ]]
    then
        source .git/dvg-git/utl.sh
        if [[ $1 == aborted ]]
        then
            onto=$(mainBranch)
            rm .git/packed-refs.lock
            rm .git/rebase-merge/stopped-sha
        fi
        dvgBranches=$(git config --get dvgGit.divergingBranches)
        mainRepoPath=$(pwd)
        mainRepoName=${mainRepoPath##*/}
        for dvgBranch in $dvgBranches
        do
            if [[ -d "../$dvgBranch-$mainRepoName" ]]
            then
                bgnInDvgRepo $dvgBranch $mainRepoName
                rbsDvgBranch $dvgBranch $onto
                endInDvgRepo
            fi
        done
    fi
fi
