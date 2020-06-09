" Make backspace behave in a sane manner.
set backspace=indent,eol,start
set mouse=a
set number
set hlsearch
set showcmd
set wildmenu
" set wildmode=list:longest,full
set hidden
set ignorecase
set smartcase
set autoread
" Enable file type detection and do language-dependent indenting.
filetype plugin indent on
runtime macros/matchit.vim
" Copy indent from current line when starting a new line (typing <CR>)
set autoindent

" let mapleader = "<Space>"
" NERDTree
map <leader>n :NERDTreeToggle<CR>

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive' 
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'

" themes
" Plug 'edkolev/tmuxline.vim'

Plug 'jacoborus/tender.vim'
Plug 'ayu-theme/ayu-vim' 
Plug 'srcery-colors/srcery-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'arzg/vim-colors-xcode'

" nerdTree
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" set background=dark
let g:gruvbox_contrast_light = 'hard'
let g:edge_style = 'aura'
let ayucolor="mirage"
let g:srcery_italic = 1
" signature + gitgutter
let g:SignatureMarkTextHLDynamic = 1

let g:airline_powerline_fonts = 1
" Ale syntax check
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1

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

if (has("termguicolors"))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme tender

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

" expand active file directory with %%
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" autosource vimrc every save
autocmd BufWritePost .vimrc source %
