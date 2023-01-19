#!/usr/bin/env bash
# Helper functions for shell.

# Clean py and __pycache__ directories in current tree
pyclean() {
    find . | grep -E "(__pycache__|\.py[cod]$)" | xargs rm -rf
}

# Create a new directory and enter it
mc () {
  mkdir -p "$@" && cd "$@"
}

man () {
  # Shows pretty `man` page.
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

# Check for updates
whatsnew() {
  echo "Checking homebrew packages..."
  brew update > /dev/null;
  new_packages=$(brew outdated --quiet)
  num_packages=$(echo $new_packages | wc -w)

  if [ $num_packages -gt 0 ]; then
    echo "New package updates available:"
    for package in $new_packages; do 
      echo "  * $package";
    done
  else
    echo "No new package updates available."
  fi
}