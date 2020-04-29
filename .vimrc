" Make backspace behave in a sane manner.
set backspace=indent,eol,start

let g:airline_powerline_fonts = 1

set mouse=a
set number

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
call plug#end()

set background=dark
let g:gruvbox_contrast_light = 'hard'
" colorscheme gruvbox

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
