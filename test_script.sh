#!/usr/bin/bash

show_title () { 
  padding=$(printf -- '-%.0s' {1..97});
  printf "\n\n@@%s\n" ''
  printf "@@ %s %s\n" "${padding:${#1}}" "$1"; 
  printf "@@ %s\n\n" ''
}


do_info () {
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
}

do_podman () {
  show_title "Modify apt"
  sed -i \
    '/noble-backports/s/$/ contrib questing/' \
    /etc/apt/sources.list.d/ubuntu.sources

  cat /etc/apt/sources.list.d/ubuntu.sources

  prefs=(
    "Package: podman buildah golang-github-containers-common crun libgpgme11t64 libgpg-error0 golang-github-containers-image catatonit conmon containers-storage"
    "Pin: release n=questing"
    "Pin-Priority: 991"
    ""
    "Package: libsubid4 netavark passt aardvark-dns containernetworking-plugins libslirp0 slirp4netns"
    "Pin: release n=questing"
    "Pin-Priority: 991"
    ""
    "Package: *"
    "Pin: release n=questing"
    "Pin-Priority: 400"
  )
  printf '%s\n' "${prefs[@]}" > /etc/apt/preferences.d/podman.pref

  cat /etc/apt/preferences.d/podman.pref

  apt update
  apt-cache policy podman

  apt upgrade
}


do_$1
