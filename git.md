# Git Guide

[Markdown Guide](https://guides.github.com/features/mastering-markdown/)

Git is a 'version control system' that controls the changes of the files.

## Set global variables

`git config --global user.email "[email]"`
`git config --global user.name "[name]"`

## Initiate git in a folder

`git init`

A .git folder is created with all the config files and information about your repo.

## Get the current status of the repo

`git status`

This will list the changed files and tell if a file is staged or not.

## Stage files

`git add [file]`

When a file is staged it is ready to be commited. files that are not in the stage area won't be in the commit.

Use the `.`  instead of the file name to stage all changed files.

If you want to stage a deleted file use `git rm [file]`, this will delete from the repo and from de local system. If you want to delete only from the repo use `git rm --cached [file]`.

## Unstage files

`git rm --cached [file]`

If you want to work on a file an commit before the work is done remove the wanted files from the stage area.

## See Changes In The Files

`git diff .`

Get all changes in the files compared to the last commit.

## Commit

`git commit -m "[message]"`

When a commit is make a history is created with the changes that you have made to the files.

`git commit --amend`

To override the last commit with the current changes made.

## Commit history

`git log`

`git log --all --graph --oneline --decorate`

This will list all commits made in order to identify them.

## Get back in the commits

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

## Create branches

`git branch [branch name]`

`git branch -a`

Branches are used to organize the code, this way you can work on a new feature, have a beta version of your code, and still use the complete version.

`git checkout -b [branch name]`

This way you create a branch and checkout in it.

`git branch -d [branch name]`

Remove the branch if it's merged.

`git branch -D [branch name]`

Remove the branch by force.

## Merge branches

`git merge [branch name]`

This will add the changes made in the beta branch to the master branch.

When a conflict occures, edit the needed files, add and commit the changes.

### Fast forward merge

The commit history is one straight line. This happens when no commits are made in the master branch. To force it use `git rebase`.

### Recursive merge

This makes to lines in the history, one for the master branch and one for the other deleted branch. This happens when there new commits in the master branch when you merge. To force it use `git merge --no-ff`.

## Working locally

`git remote -v`

To get all the remote paths that your local repo can be pushed.

`git clone`

To clone from GitHub to your local machine.

## Push and pull commits

`git remote add origin [repo link (https or ssh)]`

If you made a folder and want to upload it to GitHub.

`git push origin master`

To update the GitHub repo with your version from the local machine.

`git pull origin master`

To update your local machine with the GitHub repo version.

`git fetch`

To search for commits that are not pulled in the local repo.

## Collaborating On Github

### Project That You Don't Own
On these repos you can clone and read it, but you cant write to it.

- Fork the repo.
- Clone to your local machine.
- Create a branch and work on it.
- Make a pull request.

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
