#!/bin/sh

git filter-branch -f --env-filter '

CORRECT_NAME="XanderWang"
CORRECT_EMAIL="420640763@qq.com"

echo "start==="
echo "GIT_COMMITTER_NAME=$GIT_COMMITTER_NAME"
echo "GIT_COMMITTER_EMAIL=$GIT_COMMITTER_EMAIL" 
echo "GIT_AUTHOR_NAME=$GIT_AUTHOR_NAME" 

if [ "$GIT_COMMITTER_NAME" != "$CORRECT_NAME" ]
then
	echo "GIT_COMMITTER_NAME=$GIT_COMMITTER_NAME" 
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_COMMITTER_EMAIL" != "$CORRECT_EMAIL" ]
then
	echo "GIT_COMMITTER_EMAIL=$GIT_COMMITTER_EMAIL" 
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_NAME" != "$CORRECT_NAME" ]
then
	echo "$GIT_AUTHOR_NAME=$GIT_AUTHOR_NAME" 
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi

' --tag-name-filter cat -- --branches --tags


# git push --force --tags origin 'refs/heads/*'