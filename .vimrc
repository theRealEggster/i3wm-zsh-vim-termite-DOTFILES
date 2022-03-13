syntax on
set history=1000
set autoread
set ignorecase
set smartcase
set hlsearch
set showmatch
set expandtab
set shiftwidth=4
set softtabstop=2
set ruler
set nonu
set mouse=
set laststatus=2
let g:airline_theme='minimalist'

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-@> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
"set runtimepath+=~/.vim-plugins/LanguageClient-neovim
"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"    \ 'python': ['/usr/local/bin/pyls'],
"    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"    \ }

"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR> 

map <F1> :set nonu! <CR>
"map <F3> :!firefox --newtabvim
"map <F2> :setlocal spell! spelllang=en_us <CR>
nnoremap -spell :setlocal spell! spelllang=en_us <CR>
map <F5> :!php -l %<CR>
map <F6> :%g/^$/d
nnoremap -ev :vsplit $MYVIMRC<cr>
nnoremap -sv :source $MYVIMRC<cr>
nnoremap -u g~iw<cr>
nnoremap -c :colo monokai<cr>
noremap -date "=strftime("%Y-%m-%d")<CR>P
iab <expr> ddd strftime("%Y-%m-%d")
noremap -time "=strftime("%H:%M:%S")<CR>P
iab <expr> ttt strftime("%H:%M:%S")
iab <expr> ddt strftime("%Y-%m-%d %H:%M:%S -")
colo PaperColor
" Save folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview 
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent! loadview 
"Save backups in .vim dir
set backup
set backupcopy=yes
set writebackup
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swap//
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")
" Delete backups older than 500h 
"au BufWritePost * silent !find /home//.vim/.backup/ -mtime +30 -exec rm {} \;



nnoremap -utf8 :call ChangeToUTF8()<cr>
function! ChangeToUTF8()
    set encoding=utf-8 
    set fileencoding=utf-8
    return
endfunction


iab switch_block define host{<CR> host_name              host<CR> address                ip<CR> use                    nameFromHostBlock<CR> notification_period    07-21<CR>}
iab bash_for for i in $(); do
       \<CR>   Something
       \<CR>   if [[ $VAR == 1 ]]; then
       \<CR>        Something
       \<CR>   fi
       \<CR>    done
iab bash_while while true; do
       \<CR>    Something 
       \<CR>    if [[ VAR == 0 ]]; then   
       \<CR>        Something
       \<CR>    else
       \<CR>        Somethingelse
       \<CR>    fi
       \<CR>done 