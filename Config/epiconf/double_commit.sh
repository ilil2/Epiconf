#!/bin/sh

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Use '$0 --link <master> <slave>' to link <master> with <slave>."
    echo "Then use '$0 <message>' in <master> to push on both repo."
    exit 0
elif [ "$1" = "--link" ] || [ "$1" = "-l" ]; then
    if [ $# -ne 3 ]; then
        echo "Invalid arguments: have $0 $1 'master' 'slave'"
        exit 1
    elif [ "$2" = "$3" ]; then
        echo "Master cannot be slave"
        exit 2
    fi
    echo "$(pwd)/$2;$(pwd)/$3" >> ~/afs/.link
    echo "$2 and $3 successfully linked."
    exit 0
fi

# Get other repo
line=$(grep -e "$(pwd);*" ~/afs/.link)
if [ "$line" = "" ]; then
    echo "Repo not linked."
    exit 1
fi
arr=(${line//;/ })
repo=${arr[1]}

# Commit and push om master
echo "Pushing on master..."
git add *
git commit -m "$1"
git push

# Commit and push on slave
echo "Pushing on slave..."
cp * "$repo/"
cd "$repo"
git add "*"
git commit -m "$1"
git push

echo "Done."
exit 0
