#!/usr/bin/bash

show_title () { 
  padding=$(printf -- '-%.0s' {1..80});
  printf "\n%s %s\n\n" "${padding:${#1}}" "$1"; 
}

show_title "printenv"
printenv | sort

show_title "Repo List"
ls /etc/apt/sources.list.d

show_title "ubuntu.sources"
cat /etc/apt/sources.list.d/ubuntu.sources

show_title  "Repo Preferences"
ls /etc/apt/preferences.d
