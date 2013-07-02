pathdirs=(
  ./bin
  $ZSH/bin
  $HOME/.rbenv/shims
  /usr/local/bin
  /usr/local/sbin
  /usr/bin/
  /usr/texbin
  /usr/X11/bin
  ~/.cabal/bin
  /opt/X11/bin
  /usr/local/mysql/bin
  /usr/local/git/bin
  /usr/local/bin/node
  /usr/local/bin/npm
)

for dir in $pathdirs; do
  if [ -d $dir ]; then
    PATH=$dir:$PATH
  fi
done

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"