#! /bin/bash

echo $GLOB_REPO_DIR

mkdir "$GLOB_REPO_DIR/userSpace"
cp ./user-makefile "$GLOB_REPO_DIR/userSpace/Makefile"
cp ./mk.c "$GLOB_REPO_DIR/userSpace/mkmemefs.c"

cd "$GLOB_REPO_DIR"
git add .
git commit -m "(autocommit) - User Space Files"
