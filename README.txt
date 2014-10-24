These are some helper scripts to integrate the Meld diff tool tightly with git.  The advantages you get are:
-Diffing many files in the same instance of meld.
-Cross-branch diffing (you don't even have to have the branch checked out).
-Has the full power of the "git diff" command, like tracking moves and renames.

How to set up:
- Install Meld.
- Clone git_meld to a local directory:
    cd <local_dir>
    git clone <repo_path>/git_meld.git
- Add a git alias for meld:
    git config --global alias.meld '!<local_dir>/git_meld/git_meld.sh'
    (Note the required preceding "!" and single quotes)

Running the command:
Run it with the exact same arguments you would use with "git diff."
Examples:
"git meld"                      # See workspace changes not yet added to the index.
"git meld HEAD"                 # See all changes in workspace.
"git meld <branch>"             # See workspace changes relative to <branch>.
"git meld <branch1> <branch2>"  # See changes between branches.
"git meld -M 50"                # Track renames with a certain threshold.
