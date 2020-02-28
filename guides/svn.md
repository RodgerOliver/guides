# Subversion (SVN)
Subversion is an Apache software that is used to version software.

It is decentralized, and based on the client-server topology.

To get help use `svn help [cmd]`.

# Folder Structure
Trunk is where all the stable code resides.

```
Main Repo

├── branches/
│   └── taks1/
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

`svn copy [repo_url]/trunk [repo_url]/branches/[branch_name]`

Create a branch.

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

`svn info`

Return information about the repository.

## Working With Branches
- update trunk
- create branch
- commit
- update branch with trunk
- merge branck into trunk
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
