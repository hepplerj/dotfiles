" Commands for editing wiki pages to Gitit

command! -nargs=1 Wiki execute ":split $HOME/projects/research.dissertation/wiki/wikidata/" . fnameescape("<args>.page") | execute ":Gwrite"
