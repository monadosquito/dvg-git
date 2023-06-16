# [Unreleased]

# [1.0.0] - 2023-06-16

## Added

- Each diverging branch is rebased onto a main HEAD when
    - the main `HEAD` reference is changed
    - a main branch is rebased (at each step)
    - a new commit is added to the main branch.
