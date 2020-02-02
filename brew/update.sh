#!/bin/sh 

mv Brewfile Brewfile.1
mv npmfile npmfile.1

brew bundle dump
npm list --global --parseable --depth=0 | sed '1d' | awk '{gsub(/\/.*\//,"",$1); print}' > npmfile
