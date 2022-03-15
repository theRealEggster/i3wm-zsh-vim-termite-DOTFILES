#!/bin/bash


# check to see is git command line installed in this machine
IS_GIT_AVAILABLE="$(git --version)"
if [[ $IS_GIT_AVAILABLE == *"version"* ]]; then
  echo "Git is Available"
else
  echo "Git is not installed"
  exit 1
fi


# copy Vs-Code files
cp  $HOME/Library/Application\ 
Support/Code/User/{keybindings.json,settings.json,spellright.dict} .

# copy snippets folder
cp -r $HOME/Library/Application\ Support/Code/User/snippets .

# copy list of extensions that currently installed
code --list-extensions --show-versions >> ../../vscode/extensions.txt

# copy other dot files 
cp  $HOME/{.zshrc,.vimrc} .



# Check git status
gs="$(git status | grep -i "modified")"
# echo "${gs}"

# If there is a new change
if [[ $gs == *"modified"* ]]; then
  echo "push"
fi


# push to Github
git add -u;
git commit -m "New backup `date +'%Y-%m-%d %H:%M:%S'`";
git push origin master
