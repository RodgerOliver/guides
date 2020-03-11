# Software Configuration Management

Software Configuration Management (SCM) deals with problems during software development like changes on the code, development setup, demand, etc, making the project easy to develop, stable and organized.

To keep the development stable and organized, SCM answers some basic questions:
- Why the system changed?
  - Issue Tracker manages the demands
- What were the changes?
  - VCS registers the changes on the project
- Is the system working?
  - CI ensures the integrity of the project

A workflow example is:
  - Demand for new software or changes go to the Issue Tracker
  - This task is developed and committed in the VCS
  - The VCS triggers two hooks, one for the Issue Tracker and one for the CI for testing

## Basic Tools
- Version Control System
  - Git
  - SVN
- Issue Tracker / Project Management Software / Change Control
  - Redmine
  - Trello
  - qdPM
  - Bugzilla
  - Phabricator
  - Trac
  - Jira
  - BitBucket
  - GitHub
  - GitLab
- Continuous Integration
  - Jenkins
  - Circle CI
  - Travis CI
  - BuildBot
  - CodeClimate
  - Concourse
  - GitHub
  - GitLab

## Issue Tracker
The objective of an Issue Tracker is to register, evaluate and track the progress of tasks.

Each task must have some attributes like:

- Id
  - unique identifier
  - important to link the Issue Tracker with the VCS
- Type
  - bug, functionality, task, enhancement
- Author
  - who changed/created the task
- Date
  - when change was made
- Assignee
  - who is responsible for the task
- Title
  - short description
  - verbs in infinitive tense
  - what and why to do
- Description
  - what must be done do complete the task
- Milestone
  - group of tasks for a purpose
  - it can be a sprint, a project or a version to be released
- Progress

The Issue Tracker watches the repository for changes to always update its tasks.

Tasks must have only one solid objective and follow the following progress: `open -> in progress -> in test -> done/closed`.

## VCS
VCS stands for Version Control System and it is used to help the development of different features at the same time, keep various version of the project and have a history of the changes.

Changes registered on the VCS must be fully functional, meaning that they must be tested and working.

The VCS is linked with the Issue Tracker by the ID of the task. This way they can be linked providing the tracking of the progress of a task. The description of each commit (or branch) should contain the ID of the task with a small description, to see right away the scope of the task.

The main goals are:
- to keep the history of changes
- to control the concurrence
- to keep different versions of the project

VCS answer these questions:
- What was changed?
- When it was changed?
- Who made the change?

There are two types of VCS:
- Centralized
  - has only one central repository
  - each developer has its own working copy of the repo
  - client-server topology
  - sync is made by commit and update operations
  - revisions are sequential and linear
  - bad for large number of developers or big repository
- Decentralized
  - one main repo
  - each developer has its own copy of the repo with a working directory
  - changes are made to the local repo and pushed to the main repo
  - revision are tree-based and defined as hashes

### Concurrence Control
This topic focus on enable work team simultaneously. This way, all devs can work together without problems.

Ways to achieve the control:

- Locking
  - used in centralized VCS
  - a dev locks a file so one can change it
  - changes are made and when the commit is made the lock is released
  - other dev must update its working copy first to lock the file again
  - really bad for large dev teams
- Merge
  - both devs can edit the same file at the same time on the trunk
  - dev one commits first
  - dev two must update its working copy and resolve conflicts if they exist
  - dev two commits
- Individual Branches
  - each tasks has its own branch and its own dev
  - branches are merged into master

### Conflicts
Conflicts occur when the same lines of the code are edited by two different devs, and are caused by:
- Communication Failure
  - task is duplicated
  - task is redundant
  - changes out of original task
- Process Failure
  - develop procedures were bot followed (update branch)
  - add personal files to repo
- Project Failure
  - code is not well separated and two projects change the same file
  - refactoring during development (bad but needed)
  - can be solved with locking or dedicated branching

### Branches
Tasks on the Issue tracker generally require some specific tests that can't be done while other tasks are on develop. Branches come to help.

They allow simultaneous develop and test, because each branch has its own purpose and doe not affect the others until merged.

Types of branches:
- Main
  - this branch is the one that will be deploy in the next version release
  - always stable
  - almost all branches derivate from this one
- Feature
  - branch that is created to develop a task
  - always merge master to update the branch to facilitate the final merge
- Maintenance
  - fix problems on the Main branch
- Individual
  - made for tasks of tasks
  - only one dev per branch
  - merge of individual branches make a Collaborative branch
- Stable
  - if a software doesn't need to keep more than on version in production
  - tag Main -> develop on Stable tagging it -> update Main with Stable

There are two type of parallelism:
- between tasks
  - shared branches
  - branches Main, Feature, Maintenance
- inside tasks
  - concurrence control
  - locking, merging and individual branches

## Project Versions
Tags are created in the VCS to manage each stage of the software.

If a bug is found on any version, find the first version with this problem, fix it on its Maintenance branch and merge this branch to the other version branches.

- Alfa
  - running okay
  - lots of bugs
  - lots of tests
- Beta
  - running good
  - specific tests
  - bug corrections
- Release Candidate (rc)
  - maintenance branch is created before this tag
  - ready to be released
  - some minor tests
- Released
  - last rc is released
  - some minor bug correction version can be released
  - maintenance branch lasts till the version is discontinued
