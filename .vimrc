execute pathogen#infect()
" Make vim more useful
set nocompatible

" Set syntax highlighting options.
set t_Co=256
set background=dark
syntax on
colorscheme molotov
highlight Normal ctermfg=lightgray
highlight markdownBold cterm=bold ctermfg=white
highlight markdownItalic cterm=none ctermfg=darkgray
hi markdownH1 cterm=bold ctermbg=39 ctermfg=0
highlight markdownH2 cterm=underline ctermfg=lightgreen
highlight markdownH3 cterm=bold ctermfg=lightblue
highlight markdownH4 ctermfg=197
hi SpellBad cterm=underline ctermfg=197 ctermbg=233

hi snipLeadingSpaces ctermbg=black

" Enabled later, after Pathogen
filetype off

" Change mapleader
let mapleader=","

" Local dirs
set backupdir=~/.vim-backups
set directory=~/.vim-backups
set undodir=~/.vim-backups

" Set some junk
set autoindent " Copy indent from last line when starting new line.
set backspace=indent,eol,start
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set esckeys " Allow cursor keys in insert mode.
set expandtab " Expand tabs to spaces
autocmd filetype make setlocal noexpandtab
set foldcolumn=4 " Column to show folds
set foldenable
set foldlevel=9
set foldmethod=syntax " Markers are used to specify folds.
set foldminlines=0 " Allow folding single lines
set foldnestmax=3 " Set max fold nesting level
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
"set gdefault " By default add g flag to search/replace. Add g to toggle.
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches.
set incsearch " Highlight dynamically as pattern is typed.
set laststatus=2 " Always show status line
set lispwords+=defroutes " Compojure
set lispwords+=defpartial,defpage " Noir core
set lispwords+=defaction,deffilter,defview,defsection " Ciste core
set lispwords+=describe,it " Speclj TDD/BDD
set magic " Enable extended regexes.
set mouse=a " Enable moouse in all in all modes.
set noerrorbells " Disable error bells.
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command.
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around.
set nowrap " Do not wrap lines.
set nu " Enable line numbers.
set ofu=syntaxcomplete#Complete " Set omni-completion method.
set report=0 " Show all changes.
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set shell=/bin/sh " Use /bin/sh for executing shell commands
set shiftwidth=2 " The # of spaces for indenting.
set shortmess=atI " Don't show the intro message when starting vim.
set showtabline=2 " Always show tab bar.
set sidescrolloff=3 " Start scrolling three columns before vertical border of window.
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set title " Show the filename in the window titlebar.
set ttyfast " Send more characters at a given time.
set ttymouse=xterm " Set mouse type to xterm.
set undofile " Persistent Undo.
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/.meteor/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/source_maps/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set wildmode=list:longest " Complete only until point of ambiguity.
set winminheight=0 "Allow splits to be reduced to a single line.
set wrapscan " Searches wrap around end of file

" javascript-libraries-syntax.vim 
" let g:used_javascript_libs = 'jquery,underscore,backbone,prelude,angularjs,angularui,react,flux,requirejs,sugar,jasmine,chai'
let g:used_javascript_libs = ''

" jsfmt on save
let g:js_fmt_autosave = 1

" jsfmt disable show errors
"let g:js_fmt_fail_silently = 1

" Browse with 'gx'
let g:netrw_browsex_viewer="open"

" Speed up transition from modes
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Faster split resizing (+,-)
if bufwinnr(1)
  map + <C-W>>
  map _ <C-W><
endif

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-H> <C-W>h
"map <C-L> <C-W>l

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" Get output of shell commands
" command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

" Remap :W to :w
command! W w

" Better mark jumping (line + col)
" nnoremap ' `

" Hard to type things
"imap >> →
"imap << ←
"imap ^^ ↑
"imap VV ↓
"imap aa λ

" Toggle show tabs and trailing spaces (,c)
" set lcs=tab:›\ ,trail:•,eol:¬,nbsp:_
set lcs=tab:›\ ,trail:•,nbsp:_
set fcs=fold:-
nnoremap <silent> <leader>c :set nolist!<CR>

" Markdown: highlight 2 spaces at end of line for <br />
highlight ExtraWhitespace ctermbg=darkgray guibg=darkgreen
match ExtraWhitespace /\s\s\+$/


" Clear last search (,qs)
map <silent> <leader>qs <Esc>:noh<CR>
" map <silent> <leader>qs <Esc>:let @/ = ""<CR>

" Vim on the iPad
if &term == "xterm-ipad"
  nnoremap <Tab> <Esc>
  vnoremap <Tab> <Esc>gV
  onoremap <Tab> <Esc>
  inoremap <Tab> <Esc>`^
  inoremap <Leader><Tab> <Tab>
endif

" Remap keys for auto-completion menu
inoremap <expr> <CR>   pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>   pumvisible() ? "\<C-p>" : "\<Up>"

" Indent/unident block (,]) (,[)
"nnoremap <leader>] >i{<CR>
"nnoremap <leader>[ <i{<CR>

" Paste toggle (,p)
set pastetoggle=<leader>p
map <leader>p :set invpaste paste?<CR>

" NERD Commenter
let NERDSpaceDelims=1
let NERDCompactSexyComs=1
let g:NERDCustomDelimiters = { 'racket': { 'left': ';', 'leftAlt': '#|', 'rightAlt': '|#' } }

" Buffer navigation (,,) (,]) (,[) (,ls)
"map <Leader>, <C-^>
nnoremap <LocalLeader>] :bnext<CR>
nnoremap <LocalLeader>[ :bprev<CR>
"map <Leader>ls :buffers<CR>

" Close Quickfix window (,qq)
nnoremap <leader>qq :cclose<CR>

" Yank from cursor to end of line
nnoremap Y y$

" Insert newline
map <leader><Enter> o<ESC>

" Search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

" Save and restore folds
" :au BufWinLeave * mkview
" :au BufWinEnter * silent loadview

" Join lines and restore cursor location (J)
"nnoremap J mjJ`j

" Toggle folds (<Space>)
nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>
" nnoremap <silent> <CR> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>
noremap <silent> ;; :exe 'silent! normal! '.'za'<CR>

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

" Jumping to tags. (via Steve Losh)
"
" Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
" split instead.
"
" Both of them will align the destination line to the upper middle part of the
" screen.  Both will pulse the cursor line so you can see where the hell you
" are.  <c-\> will also fold everything in the buffer and then unfold just
" enough for you to see the destination line.
"nnoremap <c-]> <c-]>mzzvzz15<c-e>`z:Pulse<cr>
"nnoremap <c-\> <c-w>v<c-]>mzzMzvzz15<c-e>`z:Pulse<cr>

" Word processor mode (:WP)
func! WordProcessorMode()
  "setlocal formatoptions=1
  setlocal ft=wiki.markdown
  setlocal spell spelllang=en_us
  set thesaurus+=/Users/pelon/.vim/thesaurus/mthesaur.txt
  set complete+=s
  set formatprg=par
  setlocal wrap
  setlocal linebreak
  setlocal formatoptions=t1
  setlocal textwidth=76
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4
  map j gj
  map k gk
  setlocal smartindent
  setlocal expandtab
  call pencil#init()
  call lexical#init()
  call litecorrect#init()
  let g:lexical#dictionary_key = '<localleader>k'
  let g:lexical#thesaurus_key = '<localleader>t'
endfu
com! WP call WordProcessorMode()

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Set relative line numbers
set relativenumber " Use relative line numbers. Current line is still in status bar.
au BufReadPost,BufNewFile * set relativenumber

" Mithril
au BufRead,BufNewFile */mithril/*.js UltiSnipsAddFiletypes mithril.javascript
au BufRead,BufNewFile */mithril/*.{html,html} UltiSnipsAddFiletypes mithril.html
au BufRead,BufNewFile */mithril/*.js set ft=mithril.javascript
au BufRead,BufNewFile */mithril/*.{html,htm} set ft=mithril.html
nmap gf :e <cfile><CR>


" JSON
au BufRead,BufNewFile *.json set ft=json syntax=javascript

" Jade
au BufRead,BufNewFile *.jade set ft=jade syntax=jade

" Ruby
au BufRead,BufNewFile Rakefile,Capfile,Gemfile,.autotest,.irbrc,*.treetop,*.tt set ft=ruby syntax=ruby

" Nu
au BufNewFile,BufRead *.nu,*.nujson,Nukefile setf nu

" Coffee
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable shiftwidth=2 expandtab
hi link coffeeSpaceError NONE
let coffee_compile_vert=1
let coffee_watch_vert=1

" ZSH
au BufRead,BufNewFile .zsh_rc,.functions,.commonrc set ft=zsh

" Fish
au BufRead,BufNewFile *.fish set ft=fish

" XML
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" Highlight Custom C Types
autocmd BufRead,BufNewFile *.[ch] let fname = expand('<afile>:p:h') . '/types.vim'
autocmd BufRead,BufNewFile *.[ch] if filereadable(fname)
autocmd BufRead,BufNewFile *.[ch]   exe 'so ' . fname
autocmd BufRead,BufNewFile *.[ch] endif

" GitGutterDisable
let g:gitgutter_enabled = 0

" Ack.vim
let g:ackprg = 'ack -H --nocolor --nogroup --column'

" Airline.vim
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_enable_syntastic = 1
let g:airline_enable_tagbar = 0
let g:airline_enable_branch = 1
let g:airline_branch_empty_message = 'noBranch'

"let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '▶'
"let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '◀'
"let g:airline_linecolumn_prefix = '␊ '
"let g:airline_linecolumn_prefix = '␤ '
"let g:airline_linecolumn_prefix = '¶ '
let g:airline_branch_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
"let g:airline_paste_symbol = 'Þ'
"let g:airline_paste_symbol = '∥'
let g:airline_whitespace_symbol = 'Ξ'

let g:airline_powerline_fonts = 0

" Clojure.vim
let g:vimclojure#ParenRainbow = 1 " Enable rainbow parens
let g:vimclojure#DynamicHighlighting = 1 " Dynamic highlighting
let g:vimclojure#FuzzyIndent = 1 " Names beginning in 'def' or 'with' to be indented as if they were included in the 'lispwords' option


" Markdown.vim
let g:markdown_fenced_languages = ['python', 'ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']

" force markdown on .md files (as opposed to Modula-2)
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Notes.vim
let g:notes_directories = ['~/Dropbox/Notes']

"""" MY MAPS """"

" ENTER = insert new line
nmap <S-Enter> O<Esc>j

" Tabular.vim
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
vmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
nmap <Leader>a, :Tabularize /,\zs/l0l1<CR>
vmap <Leader>a, :Tabularize /,\zs/l0l1<CR>

" RainbowParenthesis.vim
nnoremap <leader>rp :RainbowParenthesesToggle<CR>

" Ruby.vim
let ruby_operators = 1
let ruby_space_errors = 1
let ruby_fold = 1

" Syntastic.vim
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_coffee_coffeelint_args = '-f /Users/pelon/.coffeelint.json'
" syntastic: stop annoying coffeelint warnings
let g:syntastic_coffee_coffeelint_quiet_messages = { "type":  "Style", "regex": '\m.*8' }
let g:syntastic_coffee_coffeelint_exec = '/usr/local/bin/coffeelint'

" Emulate bundles, allow plugins to live independantly. Easier to manage.
filetype plugin indent on

" My additions
nnoremap qq :q!<CR>
nnoremap QQ :qall!<CR>
" repeated replace with the same text
nnoremap yw yiw
nnoremap vw viw
nnoremap s viw"0P



" { nl }
"inoremap {<enter> {<CR>}<C-o>O
"inoremap (<enter> (<CR>)<C-o>O
"inoremap [<enter> [<CR>)<C-o>O
set runtimepath+=~/.vim/ultisnips_rep
autocmd QuickFixCmdPre *grep* silent
autocmd QuickFixCmdPost *grep* copen 10
nnoremap <f3> :Gcommit -a<CR>
nnoremap <f4> :silent Gstatus<CR>

" Switch windows
nnoremap <S-left> :wincmd h<CR>
nnoremap <S-right> :wincmd l<CR>
nnoremap <S-up> :wincmd k<CR>
nnoremap <S-down> :wincmd j<CR>

nnoremap <Leader>, :NERDTreeToggle<CR>
nnoremap <tab><tab> <c-w>p
autocmd BufNewFile,BufRead *.jade.html set ft=jade
autocmd BufNewFile,BufRead /**/meteor/**/* set ft+=.meteor

""" UltiSnips """
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsEditSplit="vertical"
nnoremap <f5> :UltiSnipsEdit<CR>

" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" CONFLICT with some plugins like tpope/Endwise
"inoremap <c-u> <C-R>=UltiSnips#ExpandSnippet<CR>
"inoremap <c-u> :UltiSnips#ExpandJumpForwards<CR>
"inoremap <c-i> :UltiSnips#ExpandJumpBackwards<CR>



command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:  ' . a:cmdline)
  call setline(2, 'Expanded to:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction
nmap \\ <plug>NERDCommenterToggle

nmap <F12> :TagbarToggle<CR>

" CtrlP Buffers
nnoremap \b :CtrlPBuffer<CR>
" CtrlP Recent Files
nnoremap \r :CtrlPMRU<CR>

" My file types
au BufRead */wiki/* set ft=wiki
au Filetype wiki call WordProcessorMode()

" git commands
nnoremap <localleader>gpa :call system('git commit -am "small change"')
nnoremap <localleader>gpt :call system('git commit -m "small change" expand('%')')

" UP DOWN LEFT RIGHT in insert mode
inoremap <C-h> <left>
inoremap <C-l> <right>

inoremap <C-j> <down>
inoremap <C-k> <up>
" move windows and tabs
nnoremap <C-h> <C-w>w
nnoremap <C-l> <C-W>W
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

" scroll other window
nmap <c-down> <c-w>p<c-e><c-w>p
nmap <c-up> <c-w>p<c-y><c-w>p
nmap <c-right> <c-w>pzl<c-w>p
nmap <c-left> <c-w>pzh<c-w>p

" find word under cursor
" nnoremap gt yiw:Ack! <C-R>"<CR>


" CTRL-P: remove buffer from list
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
    let line = getline('.')
    let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
        \ : fnamemodify(line[2:], ':p')
    exec "bd" bufid
    exec "norm \<F5>"
endfunc

" external vim files
"
source ~/.vim/vimrc-tagbar.vim
source ~/.vim/MetafileManager.vim
source ~/.vim/famous.vim
source ~/.vim/ctrlp.vim

" Sessions
nmap <F2> :wa<Bar>exe "mksession! " . v:this_session<CR>:so ~/sessions/

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
" let g:SuperTabDefaultCompletionType    = '<C-n>'
" let g:SuperTabCrMapping                = 0

" Show highlight group at cursor position
map <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Change cursor in Insert Mode
if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

" Correct recent mispelled word
"
noremap <leader>pp mp[s1z=`p

" choose first match in popup if shortest 
" function! ExpandPossibleShorterSnippet()
  " if len(UltiSnips#SnippetsInCurrentScope()) == 1 "only one candidate...
    " let curr_key = keys(UltiSnips#SnippetsInCurrentScope())[0]
    " normal diw
    " exe "normal a" . curr_key
    " exe "normal a "
    " return 1
  " endif
  " return 0
" endfunction
" inoremap <silent> <C-L> <C-R>=(ExpandPossibleShorterSnippet() == 0? '': UltiSnips#ExpandSnippet())<CR>

" function! SetFiletype(f)
  " exec 'set ft=' . a:f
" endfunction

function! UltisnipsStop()
  if &ft=="mithril\.javascript"
    exec "normal! \<ESC>"
  endif
endfunc

" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1

