bgnInDvgRepo () {
    cd ../$1-$2
    GIT_INDEX_FILE=../$2/.git/worktrees/$1-$2/index
    git stash push --message dvg-git &> /dev/null
}
endInDvgRepo () {
    git stash apply stash^{/dvg-git} &> /dev/null
    if (( $? == 0 ))
    then
        git stash drop &> /dev/null
    fi
    GIT_INDEX_FILE=.git/index
    cd - > /dev/null
}
lastEmpCmt () {
    echo \
        $(git log -1 --invert-grep --oneline --grep=. $1 \
         | tr --delete [:space:]\
         )
}
mainBranch () {
    mainBranch=$(git config --get dvgGit.main)
    if [[ -z $mainBranch ]]
    then
        main=$(git config --get init.defaultBranch)
    fi
    echo $mainBranch
}
rbsDvgBranch () {
    git rebase --onto=$2 --strategy-option=theirs $(lastEmpCmt $1)^ $1
}
