#! /bin/bash

if [[ -d ~/.cmsc421 ]]; then
  echo "Clearing old data ..."
  rm -rf ~/.cmsc421
fi

RETURN="$PWD"
mkdir ~/.cmsc421 && cd ~/.cmsc421

if [[ $? != 0 ]]; then
  echo "FAILED TO SETUP HIDDEN DIR"
  exit 1
fi

git clone git@github.com:UMBC-CMSC421/linux.git

if [[ $? != 0 ]]; then
  echo "FAILED TO CLONE LINUX KERNEL"
  exit 1
fi

cd ~/.cmsc421/linux && rm -rf ./.git

cd "$RETURN"
REPO_NAME=$(git rev-parse --show-toplevel 2> /dev/null)

if [[ $? != 0 ]]; then
  echo "ERROR: Current directory $PWD does not appear to be a git repository."
  exit 1
fi

echo "Copy kernel into $REPO_NAME?"
echo "Choose from: <y|n>"
CHOICE="n"

read CHOICE
if [[ $CHOICE =~ (n|N) ]]; then
  echo "ERROR: User denied copying linux kernel."
  exit 1
fi

if ! [[ $CHOICE =~ (y|Y) ]]; then
  echo "Error: invalid option $CHOICE"
  exit 1
fi

echo "Compressing and transferring kernel ... please be patient."
echo "THIS MIGHT TAKE SOME TIME, PLEASE DO NOT TERMINATE!"

cd ~/.cmsc421/linux
tar czvf ../compressed_kernel.tar ./* 1> /dev/null
if [[ $? != 0 ]]; then
  echo "FAILED TO COMPRESS KERNEL"
  exit 1
fi

cd "$RETURN" && cp ~/.cmsc421/compressed_kernel.tar ./ 1> /dev/null
if [[ $? != 0 ]]; then
  echo "FAILED TO TRANSFER COMPRESSED DATA!"
  exit 1
fi

tar xzvf ./compressed_kernel.tar
if [[ $? != 0 ]]; then
  echo "FAILED TO DECOMPRESS KERNEL!"
  exit 1
fi

rm ./compressed_kernel.tar
rm ./prepare.sh

echo "Staging files to git and creating a commit (this may also take some time) ..."
git add . &> /dev/null
git commit -m "(autocommit) - Base Linux Kernel" &> /dev/null

echo ""
echo "******** IMPORTANT STEPS ********"
echo "Staged autocommit! Here's what's left for you:"
echo -e "\t- Verify you see a commit prefixed with (autocommit)"
echo -e "\t- Run 'git push origin'"
