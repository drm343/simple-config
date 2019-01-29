ecd () {
    run_ecd () {
        echo -ne `pwd`
        result="`ls -al | sed 1d | fzf | awk '{print $NF}'`"
    }

    if [ ! -z "$1" ]; then
        cd $1
    else
        run_ecd

        while [ ! -z "$result" ]; do
            cd $result
            run_ecd
        done;
    fi
}


ecp () {
    run_ecd () {
        if [ ! -z "$files" ]; then
            echo -ne "to dir `pwd`"
            result="`ls -al | sed 1d | fzf | awk '{print $NF}'`"
        fi
    }

    echo -ne "move files from `pwd`"
    files="`ls -al | sed 1d | fzf -m | awk '{print $NF}'`"
    if [ ! -z "$files" ]; then
        files=`readlink -f $files`
        current_dir=`pwd`
        run_ecd

        while [ ! -z "$result" ]; do
            cd $result
            run_ecd
        done;
        cp $files `pwd`
        echo "cp $files `pwd`"
        cd $current_dir
    fi
}
