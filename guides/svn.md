# Subversion (SVN)
Subversion is an Apache software that is used to version software.

It is decentralized, and based on the client-server topology.

To get help use `svn help [cmd]`.

# Folder Structure
Trunk is where all the stable code resides.

```
Main Repo

├── branches/
│   └── tasks1/
│       └── README.md
│       └── CONTRIB.md
├── tags/
│   └── v1.0/
│   └── v2.0/
└── trunk/
    └── README.md
```

# Server
To enable same default settings to the repository go to `conf/svnserve.conf`.

To enable users go to `conf/passwd`.

`svnadmin create [repo_path]`

Create a repository.

`svnserve -d -r [repo_root_path]`

Start svnserve daemon.

# Client

`svn import [local_path] [repo_url]`

Push local files to the server.

`svn co [repo_url]`

Get files from repo (checkout).

`svn add [path]`

Track a file or a folder. **NOTE:** files already tracked don't need to be added to be in the next commit.

`svn revert [path]`

Reverts `add` action.

`svn rm [path]`

Untrack a file or a folder.

`svn status`

Show status of the working directory.

`svn commit -m [message]`

Commit changes. **NOTE:** commits are sent directly to the server, there is no need to push.

`svn copy ^/trunk ^/branches/[branch_name]`

Create a branch.

`svn switch ^/branches/[branch_name]`

Switch branch of working copy.

`svn cp ^/trunk@[rev_num] ^/tags/[tag_name] -m [commit message]`

Create a tag.

`svn up`

Update working copy with repo (pull).

`svn up -r [revision_num]`

Update working copy to the revision number.

`svn merge ^/trunk`

Merge `trunk` in current branch. **NOTE:** merge only joins code, commit after it.

`svn merge --reintegrate ^/branches/[branch_name]`

Merge branch to `trunk`.

`svn diff`

Show current diff.

`svn revert -R .`

Revert all non-committed changes on the working directory.

`svn info`

Return information about the repository.

## Working With Branches
- update trunk
- create branch
- commit
- update branch with trunk
- merge branch into trunk
- delete branch

### Conflicts
- postpone
  - 3 files are created
  - `file.mine` is the local file of the branch
  - `file.r14` is the previous change of the repo
  - `file.r15` is the current file of the repo
  - `file` will contain markers to resolve the conflict
  - edit `file` to resolve the conflict
  - `svn resolve file`
  - commit

## Stash

`svn diff > [patch_file]; svn revert -R .`

Stash current changes.

`patch -p0 < [patch_file]`

Stash apply.

## Revert Committed Changes

- `svn log [file]`: show revisions that modified a file.
- `svn log -v | grep [file]`: search for file.
- `svn cat -r [revision_num] [file]`: show content of a file on that revision.
  - `svn cat ^/trunk/[file]@[revision_num] > [file]`
- `svn cp ^/trunk/[file]@[revision_num] .`: recover a deleted file.

## SVN Properties
SVN properties are metadata associated with files or folders that are versioned.

- `svn:executable`: executable files
- `svn:mime-type`: indicate type of file.
- `svn:needs-lock`: make file read-only.
- `svn:global-ignores`: contain list of ignored file patterns.
  - this property is associated just for folders.
- `svn:auto-props`: contain property patterns for file patterns.
  - this property is associated just for folders.
  - `*.sh = svn:executable=*`

### Commands To Edit Properties
- `svn propset`: define a property
- `svn proplist`: list properties
- `svn propget`: get value of a property
- `svn propdel`: delete a property
- `svn propedit`: edit a property
- `svn propset svn:auto-props "*.sh = svn:executable=*" .`
  - this is an example of auto-props set in the root directory
  - after `propset` the changes must be committed

## Lock
When a user locks a file no one can change or lock it. This action is saved in a separate location in the repo and it not committed.

When a commit is made all locks are released.

  - `svn propset svn:auto-props "*.jpg = svn:needs-lock" .`: set permissions so the file can only be edited if locked
  - `svn lock file.png`: lock file
  - `svn unlock file.png`: unlock file
  - use the `--force` flag to break or steal a locked file
