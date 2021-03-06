" show line number
set number

" tabs
set expandtab
set tabstop=2
set shiftwidth=2

" mouse support
set mouse=a

" sign column always on
set signcolumn=yes

" set hidden buffer instead of abandoned
set hidden

" incremental search highlight
set ignorecase
set smartcase
set incsearch
set inccommand=nosplit

let g:highlightedyank_highlight_duration = 2000

" show whitespaces
set list
set listchars=eol:¬,tab:»\ ,trail:·,extends:→,precedes:←,nbsp:+
set showbreak=↪\

" backspace
set backspace=indent,eol,start

" reload a changed file
set autoread

if has ('autocmd') " Remain compatible with earlier versions
  augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if exists("*ToggleBackground") == 0
  function ToggleBackground()
    if &background == "dark"
      set background=light
    else
      set background=dark
    endif
  endfunction
  command BG call ToggleBackground()
endif


call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'


" nerdTree
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

" colorschemes
" Plug 'edkolev/tmuxline.vim'


Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'gruvbox-community/gruvbox'
Plug 'srcery-colors/srcery-vim'

" experimenting
" Plug 'liuchengxu/vim-which-key'
Plug 'mhinz/vim-startify'
Plug 'machakann/vim-highlightedyank'
" Plug 'ap/vim-css-color'
" Plug 'justinmk/vim-dirvish'
" Plug 'severin-lemaignan/vim-minimap'

call plug#end()

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W #F'],
      \'cwin' : ['#I', '#W #F #P'],
      \'x'    : '#{prefix_highlight}',
      \'y'    : ['%a %Y-%m-%d', '%R'],
      \'z'    : '#(whoami)@#H',
      \'options': {
      \'status-justify': 'left'}
      \}

set termguicolors
set background=dark
let g:gruvbox_contrast_light = 'hard'
let g:airline_powerline_fonts = 1


" colorscheme gruvbox
colorscheme dracula
" colorscheme srcery

" fzf map
nnoremap <C-p> :<C-u>FZF<CR>

" nerdTree map
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Grepper
let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']
" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" CoC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" startify

let g:startify_custom_header = [
      \ '    =================     ===============     ===============   ========  ========',
      \ '    \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //',
      \ '    ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||',
      \ '    || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||',
      \ '    ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||',
      \ '    || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||',
      \ '    ||. . ||   ||-''  || ||  `-||   || . .|| ||. . ||   ||-''  || ||  `|\_ . .|. .||',
      \ '    || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||',
      \ '    ||_-'' ||  .|/    || ||    \|.  || `-_|| ||_-'' ||  .|/    || ||   | \  / |-_.||',
      \ '    ||    ||_-''      || ||      `-_||    || ||    ||_-''      || ||   | \  / |  `||',
      \ '    ||    `''         || ||         `''    || ||    `''         || ||   | \  / |   ||',
      \ '    ||            .==='' `===.         .===''.`===.         .==='' /==. |  \/  |   ||',
      \ '    ||         .==''   \_|-_ `===. .===''   _|_   `===. .==='' _-|/   `==  \/  |   ||',
      \ '    ||      .==''    _-''    `-_  `=''    _-''   `-_    `=''  _-''   `-_  /|  \/  |   ||',
      \ '    ||   .==''    _-''          `-__\._-''         `-_./__-''         `'' |. /|  |   ||',
      \ '    ||.==''    _-''                                                     `'' |  /==.||',
      \ '    ==''    _-''                                                            \/   `==',
      \ '    \   _-''                                                                `-_   /',
      \ '    `''''                                                                      ``''',
      \ ]

let g:startify_custom_footer = "startify#pad(['', 'version: ' . matchstr(execute('version'), 'NVIM v\\z\\s[^\\n]\*'), ''])"
