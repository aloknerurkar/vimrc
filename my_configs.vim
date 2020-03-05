" Wildmode options
" ----------------
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.o,*.out,*.obj,*.rbc,*.rbo,*.class,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.jpg,*.png,*.gif,*.jpeg,*.bmp
set wildignore+=*.hg,*.git,*.svn
set wildignore+=*.exe,*.dll
set wildignore+=*.pyc
set wildignore+=*.DS_Store

" Syntastic
" -------------
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Vim-go
" --------
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "gofmt" "Explicited the formater plugin (gofmt, goimports, goreturn...)

let g:go_list_type = "quickfix"

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Run/build/test/coverage
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

nmap <F8> :TagbarToggle<CR>

let g:tagbar_type_go = {
          \ 'ctagstype' : 'go',
          \ 'kinds'     : [
              \ 'p:package',
              \ 'i:imports:1',
              \ 'c:constants',
              \ 'v:variables',
              \ 't:types',
              \ 'n:interfaces',
              \ 'w:fields',
              \ 'e:embedded',
              \ 'm:methods',
              \ 'r:constructor',
              \ 'f:functions'
          \ ],
          \ 'sro' : '.',
          \ 'kind2scope' : {
              \ 't' : 'ctype',
              \ 'n' : 'ntype'
          \ },
          \ 'scope2kind' : {
              \ 'ctype' : 't',
              \ 'ntype' : 'n'
          \ },
          \ 'ctagsbin'  : 'gotags',
          \ 'ctagsargs' : '-sort -silent'
      \ }

let g:NERDTreeChDirMode = 2
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeAutoCenter = 1
let g:NERDTreeDirArrows=1
let g:NERDTreeMinimalUI=1

let g:nerdtree_tabs_open_on_console_startup=1

function! NERDTreeToggleOrFocus()
	if expand("%") =~ "NERD_tree"
		:NERDTreeTabsToggle
	else
		call NERDTreeFocus()
	endif
endfunction

map <leader>n <plug>NERDTreeTabsToggle<CR>

autocmd VimEnter * if !argc() | NERDTree | endif

" Toggle Paste/No Paste
" --------------------------
function! TogglePaste()
	if &paste
		:set nopaste
	else
		:set paste
	endif
endfunction
nmap <leader>p :call TogglePaste()<CR>

" Fast terminal connections
set ttyfast

" Don't redraw when running macros
set lazyredraw

" Syntax optimazations
syntax sync minlines=256

set history=999
set completeopt=longest,menu

set term=screen-256color
colorscheme dracula

" Tacc
au BufNewFile,BufRead *.tac,*.tin,*,itin setlocal expandtab
au BufNewFile,BufRead *.tac,*.tin,*,itin setlocal shiftwidth=3 tabstop=3

set list
set listchars=tab:>-

set cc=85
set number

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }
