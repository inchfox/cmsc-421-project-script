#! /bin/bash

echo $GLOB_REPO_DIR

mkdir "$GLOB_REPO_DIR/kernelSpace"
mkdir "$GLOB_REPO_DIR/userSpace"
cp ./kernel-makefile "$GLOB_REPO_DIR/kernelSpace/Makefile"
cp ./user-makefile "$GLOB_REPO_DIR/userSpace/Makefile"

cd "$GLOB_REPO_DIR"
git add .
git commit -m "(autocommit) - Kernel and User Space Makefiles"
