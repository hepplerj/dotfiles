" Correct text width
setlocal textwidth=72

" filter text through pandoc to clean markdown, using reference links and atx headers
setlocal equalprg=pandoc\ -t\ markdown\ --reference-links\ --atx-headers\ --standalone

" Add all tags in the style {TODO: description} or {PAGE} in current document 
" to quickfix list
nnoremap <leader>{ :vimgrep /\v\{[A-Z]+(:\_.{-})?\}/gj %<CR>:copen<CR>

" Do the same for all Markdown documents in this directory and subdirectories
nnoremap <leader>} :vimgrep /\v\{[A-Z]+(:\_.{-})?\}/gj ./**/*.md<CR>:copen<CR>
