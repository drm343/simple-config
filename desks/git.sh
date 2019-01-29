# git.sh
#
# Description: git menu
#

# this
help () {
    desk
    echo '
You can use menu for git.
But need to enhance Interaction.'
}

# clone repo from remote
function git-clone-repo () {
    read -p "repo-url: " repo
    git clone $repo
}

# use vimdiff for check file
function git-vimdiff () {
    local result=`git status | grep modified | awk '{print $2}' | fzf`
    git difftool -y -t vimdiff HEAD $result
}


# open menu
function git-menu () {
    local result=`echo "git status
git-vimdiff
git log
git commit
git branch
git push
git-clone-repo
git init
help
exit" | fzf`
    $result
}


# Alias for menu
alias m='git-menu'
