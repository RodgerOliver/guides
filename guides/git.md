# Git Guide

[Markdown Guide](https://guides.github.com/features/mastering-markdown/)

Git is a 'version control system' that controls the changes of the files.

```
> HEAD, master and branch_name are just other names for the commit hash that they point to.

> HEAD~1: commit hash of the previous commit from HEAD.

        B
        | F
        | |
        |/
        A
        |
        M

> git diff master..feature == git diff master feature
> last hash of master (B) against last hash of feature (F)

> git diff master...feature
> changes since it was branched off from master
> A against F
```

![Git Rev List](../imgs/git-rev-list.png)

## Set Global Variables

`git config --global user.email "[email]"`
`git config --global user.name "[name]"`

## Initiate Git In A Folder

`git init`

A .git folder is created with all the config files and information about your repo.

## Process To Commit

Files created go to `Untracked Files` area.

Files edited go to `Not Staged` area.

The two areas above are also called `Working Directory`.

Files added go to `Staging` area.

Files on the `Staging` are go to the next commit.

## Get The Current Status Of The Repo

`git status`

This will list the changed files and tell if a file is staged or not.

## Stage Files

`git add [file]`

When a file is staged it is ready to be commited. files that are not in the stage area won't be in the commit.

Use the `.`  instead of the file name to stage all changed files.

If you want to stage a deleted file use `git rm [file]`, this will delete from the repo and from de local system. If you want to delete only from the repo use `git rm --cached [file]`.

To add hunks, some lines inside some files, use `git add -p`.

## Unstage Files

`git rm --cached [file]`

If you want to work on a file an commit before the work is done remove the wanted files from the stage area.

## Move Files Arround The Staging Area

`git reset HEAD [file]`

Unstage file.

`git checkout -- [file]`

Discard changes in `Working Directory`.

`git clean -df`

Remove untracked files from the `Working Directory`.

## Save Uncommited Changes

`git stash save "[message]"`

Save all the uncommited changes.

`git stash list`

List the stashes.

`git stash apply [stash]`

Apply the stash.

`git stash pop [stash]`

Apply and delete the stash.

`git stash drop [stash]`

Delete the stash.

## See Changes In The Files

`git diff .`

Get all changes in the files compared to the last commit.

`git diff --cached`

Diff staged changes compared to the last commit.

`git diff [old commit hash]..[new commit hash]`

Show changes made on that commit.

`git show [commit hash]`

Show changes made on that commit.

`git difftool [branch]`

Compare working directory with last commit, or branch, using the default tool for diff.

## Commit

`git commit -m "[message]"`

When a commit is make a history is created with the changes that you have made to the files.

`git commit --amend`

To override the last commit with the current changes made.

## Commit History

`git log`
`git log --all --graph --oneline --decorate`

This will list all commits made in order to identify them.

`git log master..[branch]`

Show commits made on a specific branch.

## Get Back In The Commits

`git checkout [commit id]`

This command makes you go back in a specific commit to check the older files. This is also used to create branches. With this method the commit history remain the same.

To go back to the last commit perform `git checkout master`.

`git revert [commit id]`

When you revert a commit, it's created a new commit without the changes made on the reverted commit.

If you get a conflict error, edit the needed files, add and commit the changes.

`git reset [commit id]`

This command will delete all the previous commits but keep the changes. If you want to combine all commits together just make a new commit. If you want to completely remove them perform `git reset [commit id] --hard`.

`git rebase -i`

This command can be used to change lines in files, edit commit messages and more.

## Branches
Branches are used to organize the code, this way you can work on a new feature, have a beta version of your code, and still use the complete version.

`git branch [branch name]`

Create branch.

`git branch -avv`

List all branches local and remote and their upstreams.

`git checkout -b [branch name]`

Create a branch and checkout in it.

`git branch -d [branch name]`

Remove the branch if it's merged.

`git branch -D [branch name]`

Remove the branch by force.

`git branch -m [new name]`
`git branch -m [old name] [new name]`

Rename local branch.

`git push origin [branch name]`

Push the local branch to origin remote.

`git push origin [local branch]:[remote branch]`

Apply local branch changes to remote branch name.

`git push origin --delete [branch name]`

Remove remote branch.

`git checkout -m master`

Change to the master branch and merge the changes.

### Merge Branches

```
git checkout master
git merge [branch name]
```

This will add the changes made in the beta branch to the master branch. This command handles if the merge is going to be recursive or fast-forward.

When the same line of the same file is editted on both branches there is a merge conflict. When this happens, edit the needed files, add and commit the changes.

When using `git merge` the HEAD stays on the branch that you are on, but with `git rebase` the HEAD moves until a conflict occurs.

#### Fast Forward Merge

The commit history is one straight line. This happens when no commits are made in the master branch. To force it use `git rebase`. This changes the commit history and is better to use when the branch is private.

```
git checkout [branch]
git rebase master
git push -uf origin [branch]
git checkout master
git <merge/rebase> [branch]
```

#### Recursive Merge

This makes two lines in the history, one for the master branch and one for the other deleted branch. This happens when there new commits in the master branch when you merge. To force it use `git merge --no-ff`.

### Update Branch

```
git checkout master
git pull origin master
git checkout [branch]
git <merge/rebase> master
```

## Merge A Pull Request Locally

```
git fetch origin
git checkout -b develop origin/develop
// make the changes here
git checkout master
git merge develop
git push origin master
```

Get changes.

```
git checkout master
git merge --no-ff develop
git push origin master
```

Merge changes and update the repo.

## Move Commits To Another Branch

### First Example

```
FROM

o-o-X (master HEAD)
     \
      q1a--q1b (quickfix1 HEAD)
              \
               q2a--q2b (quickfix2 HEAD)

TO

      q2a'--q2b' (quickfix2 HEAD)
     /
o-o-X (master HEAD)
     \
      q1a--q1b (quickfix1 HEAD)
```

#### Rebase Onto

```
git checkout master
git rebase --onto master quickfix1 quickfix2
```

#### Cherry-Pick

```
git checkout master
git checkout -b new_quickfix2
git cherry-pick quickfix1..quickfix2
git branch -D quickfix2
git branch -m new_quickfix2 quickfix2
```

### Second Example

```
FROM

master A - B - C - D - E

TO

feature       C - D - E
             /
master A - B
```

#### Moving To An Existing Branch

```
git checkout feature
git merge master
git checkout master
git reset --hard HEAD~3
```

#### Moving To An Existing Branch

```
git branch feature
git reset --hard HEAD~3
```

## Binary Search Bugs

Git bisect is used to search, based on tests made by you, and return a commit with the bug.

```
git bisect start
git bisect good [hash of good commit]
git bisect bad [hash of bad commit]
```

Now git will checkout to a middle commit. Then you can run tests. If the commit is good run `git bisect good`, otherwise run `git bisect bad`. Repeat this process until git tells you what commit had the bug.

## Working Locally

`git remote -v`

To get all the remote paths that your local repo can be pushed.

`git clone`

To clone from GitHub to your local machine.

## Push And Pull Commits

`git remote add origin [repo link (https or ssh)]`

If you made a folder and want to upload it to GitHub.

`git push origin master`

To update the GitHub repo with your version from the local machine.

`git pull origin master`

To update your local machine with the GitHub repo version.

`git fetch`

To search for commits and branches that are not pulled in the local repo.

`git fetch --all --prune`

To search for all commits and all branches that are not pulled in the local repo and deleted current remote branchs delete in the remote server.

## Tags

Tags are used to mark specific points in the history to control your versions.

`git tag v1.0`
`git tag v1.0 [commit hash]`
`git tag -a v1.0 -m 'stable version 1.0'`

Create tag or an annoted tag.

`git tag`
`git show v1.0`
`git tag -l 'v1.*'`

Show tags.

`git push origin v1.0`
`git push --tags`

Push tag.

`git tag --delete v1.0`

Delete tag locally.

`git push origin --delete v1.0`

Delete tag from the remote.

## Submodules
A submodule is a git repo inside another repo. It can be used for big features inside a project that requires another team, or when using a library.

```
Main Repo

├── README.md
├── lib (another repo)
│   └── index.js
└── main.js
```

The `.gitmodules` file is created when submodules are added to keep track of all submodules.

When using a submodule, the main repo only knows the last commit of the submodule, as a reference. If it is updated you just have to checkout the latest commit in the submodule.

`git submodule add <submodule url> <path>`

Clone a repo with all submodules.

`git submodule update --init`

Update submodule or initiate it.

`git clone --recursive <repo url>`

Clone a repo with all submodules.

`git submodule foreach '<command>`

Execute a command for every submodule.

## Working Trees
Working trees can be added so you can have two folders linked and checked out in different branches
without the need to stash or clone the repo again.

`git worktree add <path> <branch_name>`

Add another worktree.

`git worktree add --track -b <branch_name> <path> master`

Checkout a new branch within a new worktree.

```
git worktree remove <path>
git worktree prune
```

Remove working tree.

## Ignore Files

- Create a `.gitignore` file and add the name of the file or folder to ignore. This is recursive.
- To ignore files without creating a `.gitignore` put their paths inside `.git/info/exclude`.

## Fork

### Sync A Fork

`git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git`

Configure a remote that points to the original repository.

`git fetch upstream`

Get changed (fetch) branches and commits.

`git checkout master`

Switch to master branch.

`git merge upstream/master`

Merge the changes into master.

`git pull upstream master`

Or pull everything to master.

### Fetch Branch From Another Fork

```
git remote add [remote name] [repo url]
git fetch [remote name]
git checkout -b [remote branch] [repo owner]/[remote branch]
```

## Collaborating On Github

### Project That You Don't Own

On these repos you can clone and read it, but you cant write to it.

- Fork original the repo and clone the fork to your local machine.
- Add the original repo as a remote called upstream.
  - Origin points to your GitHub fork of the project. You can read and write to this remote.
  - Upstream points to the main project’s GitHub repository. You can only read from this remote.
- Create a branch and work on it.
- You can squash the commits for a cleaner history.
- Push the changes to the fork.
- Make a pull request.

### Project That You Are On

#### Approaches

1. Fork -> Clone -> Branch -> Commit -> Pull Request
2. Clone -> Branch -> Commit -> Pull Request

#### Workflows

1. Feature Branch
  - Master
  - feature1
  - feature2
  - All features are merged to Master.
2. Gitflow
  - Master
  - Develop
  - feature1
  - feature2
  - Features are merged to Develop, analyzed and merged to Master.

## Deploy With Git

### Server

```
cd /var/www/project/
mkdir app.git
cd app.git
git init --bare
vim hooks/post-receive
```

```
#!/bin/bash
git --work-tree=/var/www/project --git-dir=/var/www/project/app.git checkout -f
```

```
chmod +x hooks/post-receive
```

### Local

```
git remote add deploy ssh://user@host:port/var/www/project/app.git
git push deploy master
git push deploy branch:master -f
```

## Diff And Patch

`git show [commit hash] > file.patch`

Create a patch file from a commit.

`git format-patch <branch> -o patches`

Compare the current branch against the chosen branch, create a folder called patches and create a patch file for each commit of the current branch.

`git format-patch -1 <commit hash> -o patches`

Create a folder called patches and create a patch file for the commit.

`git apply <patch file>`

Apply patch to the working directory.

`git am <patch file>`

Apply patch and commit.

`git apply -R <patch file>`

Reverse patch.

## Additional

### Remove Large Files All History

The size of the git repo is the **content** (visible files) and the **history** (hidden files like `.git`).

If a large file is added and removed, the history keeps it and the repo stays big after deleting it, because it's still in the history.

`git reset --hard HEAD~1` doesn't delete the history, just deletes the timeline.

To list the big files that are in the history execute:

```
$ git gc --prune=now
$ ./git_find_big.sh
```

**If the file is in the directory it will be removed, so make backup or add it to the `.gitignore` file.**

```
$ git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch <file/path>' --prune-empty --tag-name-filter cat -- --all
$ git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
$ git reflog expire --expire=now --all
$ git gc --prune=now
```

### Update Repo After Adding .gitignore

`git rm -r --cached .`

Untrack all files.

`git add .`

Add all files based on .gitignore.

`git commit -m ".gitignore fix"`

Commit the changes.

### Get Changes To WIP From Commit
Commit hash can be a branch, and files can be `.` to get all files.

`git checkout <commit hash> <files>`

Brings all different files from another commit.

```
git cherry-pick <commit hash>
git reset --soft HEAD~1

```

Brings all changes of the commit to WIP.
