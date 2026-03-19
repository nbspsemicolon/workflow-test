#!/usr/bin/bash

show_title () { 
  padding=$(printf -- '-%.0s' {1..97});
  printf "\n\n@@%s\n" ''
  printf "@@ %s %s\n" "${padding:${#1}}" "$1"; 
  printf "@@ %s\n\n" ''
}

show_title "Printenv"
printenv | sort

show_title "Repo List"
ls /etc/apt/sources.list.d

show_title "ubuntu.sources"
cat /etc/apt/sources.list.d/ubuntu.sources

show_title  "Repo Preferences"
ls /etc/apt/preferences.d

show_title "Podman Info"
podman info
