These are some helper scripts to integrate the Meld diff tool tightly with git.  The advantages you get are:
-Diffing many files in the same instance of meld.
-Cross-branch diffing (you don't even have to have the branch checked out!).
-Has the full power of the "git diff" command, like tracking moves and renames.


How to set up:
- Make sure Meld is installed.
- Copy the git_meld folder to a local folder.
- In .gitconfig, add this alias:

[alias]
	meld = !/home/elliottc/bin/git_meld/git_meld

(Or wherever you installed to. You can also choose a different alias for the command instead of meld.)
(Note you may have to log out and in for the changes to take effect.)


Running the command:
Run it with the exact same arguments you would use with "git diff."
Examples:
"git meld"                      # See workspace changes not yet added to the index.
"git meld HEAD"                 # See all changes in workspace.
"git meld <branch>"             # See workspace changes relative to <branch>.
"git meld <branch1> <branch2>"  # See changes between branches.
"git meld -M 50"                # Track renames with a certain threshold.
