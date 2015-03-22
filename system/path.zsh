pathdirs=(
  ./bin
  $ZSH/bin
  $HOME/.rbenv/shims
  $HOME/Libaray/Haskell/bin
  $HOME/Library/Haskell/bin
  $HOME/.cabal/bin
  /usr/bin
  /usr/local/bin
  /usr/local/sbin
  /usr/texbin
  /usr/X11/bin
  /opt/X11/bin
  /usr/local/mysql/bin
  /usr/local/git/bin
  /usr/local/bin/node
  /usr/local/bin/npm
  $HOME/Dropbox/bin
  $HOME/.pandoc/filters
)

for dir in $pathdirs; do
  if [ -d $dir ]; then
    PATH=$dir:$PATH
  fi
done

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
