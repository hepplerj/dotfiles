# Jason Heppler's dotfiles

## Installation

You can clone the repository where ever you would like it (I keep mine
in ~/github/dotfiles). The `install.sh` script will symlink files to
your home directory. The install bootstrap isn't very robust, so you may
have to make some changes to the paths for it to work correctly.

```bash
git clone https://github.com/hepplerj/dotfiles.git

cd dotfiles

sh install.sh
```

## Sensible OS X defaults

Hat tip to Mathias Bynen's excellent OS X defaults. You can set these
by running:

```bash
./osx
```

## Install Homebrew formulae

When setting up a new Mac, I install some common Homebrew formulae once
Homebrew is installed:

```bash
./brew
```

## Feedback

Suggestions/improvements are
[welcome](https://github.com/hepplerj/dotfiles/issues)!

## Thanks to...

* [Mathias Bynens](http://mathiasbynens.be) for sharing his excellent [dotfiles setup](https://github.com/mathiasbynens/dotfiles)
* [Lincoln Mullen](http://lincolnmullen.com/) for the thought he's put into making [`vim` a good writing environment](http://lincolnmullen.com/blog/writing-in-vim-with-placeholders-and-quickfix/)
* [W. Caleb McDaniel](http://wcm1.web.rice.edu) and his [dotfiles repository](https://github.com/wcaleb/dotfiles)
* [Zach Holeman](http://zachholman.com) and his [dotfiles repository](https://github.com/holman/dotfiles)
