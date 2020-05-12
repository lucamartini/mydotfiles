" Make backspace behave in a sane manner.
set backspace=indent,eol,start
set mouse=a
set number
set hlsearch
set showcmd
set wildmenu
set wildmode=list:longest,full
set hidden
" Enable file type detection and do language-dependent indenting.
filetype plugin indent on
runtime macros/matchit.vim
" Copy indent from current line when starting a new line (typing <CR>)
set autoindent

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'

" themes
Plug 'morhetz/gruvbox'
Plug 'sainnhe/edge'
Plug 'edkolev/tmuxline.vim'
Plug 'ayu-theme/ayu-vim'

call plug#end()

set background=dark
let g:gruvbox_contrast_light = 'hard'
let g:edge_style = 'aura'
let ayucolor="dark"
let g:airline_powerline_fonts = 1
" Ale syntax check
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#I #W #F',
      \'c'    : '#P #T',
      \'win'  : '#I #W #F',
      \'cwin' : '#I #W #F',
      \'x'    : '',
      \'y'    : '%R',
      \'z'    : '#H'}

if (has("termguicolors"))
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

colorscheme gruvbox
" colorscheme ayu
" colorscheme edge

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
