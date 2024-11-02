#! /bin/bash

GROUP=""
PROJECT_VERSION="3"

echo "Please enter your Project $PROJECT_VERSION group name: "
read GROUP 

PROJECT_NAME="project-$PROJECT_VERSION-$GROUP"

URL="git@github.com:UMBC-CMSC421/$PROJECT_NAME.git"
REPO_DIR="$PWD"

cd ..
git clone $URL
if ! [[ $? == 0 ]]; then
  echo "ERROR: failed to clone the following repository:"
  echo $URL
  echo "Have you accepted the assignment and verified the repository exists?"
  exit 1
fi


cd "$REPO_DIR"
cd "../$PROJECT_NAME"
export GLOB_REPO_DIR="$PWD"
cp "$REPO_DIR/prepare.sh" ./
chmod +x prepare.sh && ./prepare.sh && rm ./prepare.sh

cd "$REPO_DIR"
if [[ -d "./project-$PROJECT_VERSION-resources" ]] && [[ -a "./project-$PROJECT_VERSION-resources/post-clone.sh" ]]; then
  cd "./project-$PROJECT_VERSION-resources"
  chmod +x post-clone.sh && ./post-clone.sh
fi
