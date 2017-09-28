# GIT CONFIG

<p align="center">
  <a href="https://github.com/vonglasow/gitconfig/blob/master/LICENSE"><img src="https://img.shields.io/packagist/l/hoa/websocket.svg" alt="License" /></a>
</p>

## Install

```
git clone git@github.com:vonglasow/gitconfig.git
cd !$
make git
```

## Usage

* `git list-alias`
* `git config -l`

## Alias
* `git amend` => commit --amend (Modify the latest commit; add/modify/delete file and/or message)
* `git st` => status
* `git ci` => commit
* `git co` => checkout
* `git cp` => git cherry-pick -ex
    -e for editing the commit message
    -x for indicate which commit this change was cherry-picked from.
* `git ba` => git branch -a
    -a for all branches

* `git b` => branch -vv (display the link between the local branch and the remote branch
    useful when you have multiple remote.

* `git f` => fetch --all -p (fetch all branch and clean remote branch which was deleted)
    --all for all branches
    -p for prune.

* `git changes` => diff --name-status (display only modified files)

* `git dic` => diff --cached (Changes between the index and your last commit; what you would be committing if you run "git commit" without "-a" option.)
* `git diffstat` => diff --stat (Display statistics about modification for each file)

```sh
~/gitalias ❯❯❯ git diffstat                                                                                                                                                                                                   master ✱
 README.md | 39 ++++++++++++++++++++++++++++++---------
  gitalias  |  1 +
   2 files changed, 31 insertions(+), 9 deletions(-)
```

* `git oldest-ancestor` => display the first commit of the current branch.
