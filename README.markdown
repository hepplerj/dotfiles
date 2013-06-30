# Jason Heppler's dotfiles

## Installation

Clone the repository to your home directory under `~/.dotfiles` and run `make` to symlink the files to your home directory. Configuration files are separated out into their respective directories to keep everything organized and locate configurations easily.

```bash
$ git clone https://github.com/hepplerj/dotfiles.git ~/.dotfiles

$ cd ~/.dotfiles

$ rake
```

## Sensible OS X defaults

Hat tip to Mathias Bynen's excellent OS X defaults. You can set these by running:

```bash
$ cd system

$./osx
```
## Install Homebrew formulae

When setting up a new Mac, I install some common Homebrew formulae once Homebrew is installed:

```bash
./brew
```

## Feedback

Suggestions/improvements are [welcome](https://github.com/hepplerj/dotfiles/issues)!

## Thanks to...

* [Mathias Bynens](http://mathiasbynens.be) for sharing his excellent [dotfiles setup](https://github.com/mathiasbynens/dotfiles)
* [Lincoln Mullen](http://lincolnmullen.com/) for the thought he's put into making [`vim` a good writing environment](http://lincolnmullen.com/blog/writing-in-vim-with-placeholders-and-quickfix/)
* [W. Caleb McDaniel](http://wcm1.web.rice.edu) and his [dotfiles repository](https://github.com/wcaleb/dotfiles)
* [Zach Holeman](http://zachholman.com) and his [dotfiles repository](https://github.com/holman/dotfiles)
* [Tom Ryder](http://www.sanctum.geek.nz) and his [dotfiles repository](https://github.com/tejr/dotfiles)
