#!/usr/bin/env bash
#- Reset current branch to the parent of HEAD  
git reset --soft HEAD~

#- Reset the unwanted files in order to leave them out from the commit:
git reset HEAD $1

#- Commit again using the same commit message:
git commit -c ORIG_HEAD

# (*) git reset --soft HEAD~ 
#     The last commit will be undone and the files touched will be back on the stage again. Also,
#     index and staging remains untouched.
#
# (*) git reset HEAD -- file
#     Moves file from stage to the working directory (unstage a file).
#
# (*) git reset --hard 
#     Unstage files AND undo any changes in the working directory since last commit
