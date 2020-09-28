# git-mode.sh
#
# Description: git menu
#
. $SIMPLE_CONFIG/lib/fzy-multi-select


# this
help () {
    desk
    echo '
You can use menu for git.
But need to enhance Interaction.'
}

# clone repo from remote
git-clone-repo () {
    read -p "repo-url: " repo
    git clone $repo
}

# use vimdiff for check file
git-vimdiff () {
    local result=$(git -c color.status=always status --short -uno | \
    fzy | awk '{print $2}')

    if [ ! -z "$result" ]; then
        git difftool -y -t vimdiff HEAD $result
    fi
}


# action about branch
git-branch-mode () {
    git-branch () {
        git branch -a --color=always | grep -v '/HEAD\s' | fzy
    }

    local result=$(echo "show all branch
checkout
current branch?
create
delete" | fzy)

case $result in
    "create")
        read -p "create new branch: " BRANCH
        git branch $BRANCH
        ;;
    "checkout")
        git checkout `git-branch`
        ;;
    "current branch?")
        git branch | grep "\*"
        ;;
    "show all branch")
        git-branch
        ;;
    "delete")
        git branch -d `git-branch`
        ;;
    *)
        echo "action without select"
        ;;
esac
}


# action about commit
git-commit-mode () {
    local COMMAND="git status --short"
    local FILE=$(mktemp git-add.XXXXXX)

    echo -en "$($COMMAND)" > $FILE
    editor $FILE

    local result=$(cat $FILE | awk -e '{print $2}')

    if is not empty "$result";
    then
        git add $result
        git commit
    fi
    rm $FILE
}


# action about remote
git-remote-mode () {
    git-show-all-remotes () {
        local result=$(git remote | fzy)
        echo "$result  $(git remote get-url $result)"
    }

    remote-change-name () {
        local result=$(git remote | fzy)

        if is not empty "$result";
        then
            read -p "remote's name? " NAME
            git remote rename $result $NAME
        fi
    }

    remote-change-url () {
        local result=$(git remote | fzy)

        if is not empty "$result";
        then
            read -p "remote's url? " URL
            git remote set-url $result $URL
        fi
    }

    git-add-remote () {
        read -p "remote's name? " NAME
        read -p "remote's url? " URL
        git remote add $NAME $URL
    }

    git-remove-remote () {
        local result=$(git remote | fzy)

        if [ ! -z "$result" ]; then
            git remote remove $result
        fi
    }

    local result=$(echo "show all remotes
push from local
pull from remote
add new remote
change remote's name
change remote's url
remove unused remote" | fzy)

case $result in
    "show all remotes")
        git-show-all-remotes 
        ;;
    "push from local")
        git push
        ;;
    "pull from remote")
        git pull
        ;;
    "add new remote")
        git-add-remote
        ;;
    "change remote's name")
        remote-change-name
        ;;
    "change remote's url")
        remote-change-url
        ;;
    "remove unused remote")
        git-remove-remote
        ;;
    *)
        echo "action without select"
        ;;
esac
}


# action about tag
git-tag-mode () {
    git-create-tag () {
        read -p "tag name? " TAG

        if is not empty "$TAG";
        then
            git tag -a $TAG
            git push --tags
        fi
    }

    git-remove-tag () {
        local TAG=$(git tag | fzy)

        if is not empty "$TAG";
        then
            git tag -d $TAG
            git push origin :$TAG
            git fetch --prune --prune-tags
        fi
    }

    local result=$(echo "show all tags
sync tags
create tag
delete tag" | fzy)

case $result in
    "show all tags")
        git tag | fzy
        ;;
    "sync tags")
        git fetch -p -P
        ;;
    "create tag")
        git-create-tag
        ;;
    "delete tag")
        git-remove-tag
        ;;
    *)
        echo "action without select"
        ;;
esac
}


# init git repo
git-init-repo () {
    local result=$(echo "normal repo
bare repo" | fzy)

case $result in
    "normal repo")
        git init
        ;;
    "bare repo")
        git init --bare
        ;;
    *)
        echo "action without select"
        ;;
esac
}


# open menu
git-menu () {
    # show history log
    git-history () {
        git log --date=short \
            --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" \
            --graph --color=always | fzy |
            grep -o "[a-f0-9]\{7,\}"
    }


    local result=$(echo "git status
git-vimdiff
git-history
git-commit-mode
git-branch-mode
git-remote-mode
git-tag-mode
git-clone-repo
git-init-repo
help
exit" | fzy)
    $result
}


# Alias for menu
alias m='git-menu'
