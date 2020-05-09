" Make backspace behave in a sane manner.
set backspace=indent,eol,start
set mouse=a
set number
set hlsearch
set showcmd
set wildmenu
set wildmode=list:longest,full
set hidden
filetype plugin on

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-unimpaired'

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
