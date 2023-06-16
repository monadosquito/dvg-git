# Description

Synchronize diverging branches with a main HEAD.

## Features

- to create a git worktree for each diverging branch
- to rebase each diverging branch onto a main HEAD when
    - the main `HEAD` reference is changed
    - a main branch is rebased (at each step)
    - a new commit is added to the main branch

## Notes

- A diverging branch contains its specific implementation of the feature
for that they are created.
- A main branch contains the modifications
concerning the main topic or shared by diverging branches.
- Each diverging branch must contain an empty commit
separating main commits from its ones.
- Diverging branches must not contain modifications of the files
introduced by a main branch.
- If rebasing of a diverging branch onto the main one introduces conflicts,
then they are resolved keeping a patch from a diverging branch.

## Hints

- This tool is usefull for a project which diverges in a way it is interpreted, namely, it will pick up modifications of a main branch in a worktree without interrupting interpreting source code in its specific way.

# Installation flow

1. Follow the [`unpath` tool installation flow](https://github.com/monadosquito/unpath#installation-flow).
2. Configure this tool.
3. Enable this tool.

# Configure

- Set the `dvgGit.divergingBranches` to a set of diverging branch names
separated by the space character.
- Set the `dvgGit.main` to a main branch name.

## Notes

- If the `dvgGit.main` git config option is not set,
then a value of the `init.defaultBranch` is considered a name of a main branch.

# Enable

1. Enter a git repository using the `cd` command.
2. Enter the nix shell using the `nix-shell` command.
3. Run the `init-dvg-git` command.

## Notes

- The `git` tool must be available
in the nix shell in which the command is executed.
- The `nix-shell` command must be executed either
from a dependee root directory
or with a path to either it
or the `shell.nix` file supplied.
- The `nix-shell` command must be executed without the `--pure` flag.

# Usage flow

1. Set up a workspace.
2. Work as usual.

# Set up

1. Enter a main git repository using the `cd` command.
2. Open a separate terminal instance
for each created git worktree and enter each one using the `cd` command.

## Notes

- Names of created worktree directories are a name of a main repository
prefixed with a diverging branch name
from the `dvgGit.divergingBranches` git config option.

# Convention

This tool follows the [convention](https://github.com/monadosquito/bem#convention)
followed by the [`bem` library](https://github.com/monadosquito/bem).

---

## Table 1

the `init-dvg-git` command flag and option descriptions

|Flag or option     |Default value|Description                                                                    |
|-------------------|-------------|-------------------------------------------------------------------------------|
|`-s`, `--separator`|`-`          |a git worktree name separator between diverging branch and git repository names|
