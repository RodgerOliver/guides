# Subversion (SVN)
Subversion is an Apache software that is used to version software.

It is decentralized, and based on the client-server topology.

To get help use `svn help [cmd]`.

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
