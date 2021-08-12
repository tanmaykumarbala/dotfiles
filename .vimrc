""" Vim Plug Plugins:
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'chiel92/vim-autoformat'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'KabbAmine/vullScreen.vim'
Plug 'Valloric/YouCompleteMe'
call plug#end()

""" Transparent Background:
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd BufRead * hi Normal guibg=NONE ctermbg=NONE
autocmd BufWrite *.java Autoformat
autocmd BufWrite *.sh Autoformat

""" Color Scheme:
colorscheme gruvbox

""" Powerline Setup:
" install fonts-Powerline for setup Powerline properly.
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 1
let g:airline_theme='gruvbox'
if !exists('g:airline_symbols')
		let g:airline_symbols = {}
endif

""" Vim Specific Settings:
let mapleader=" "					"Maping Leader.
set number relativenumber			"Line Number and Relative number.
set background=dark					"Background to dark.
set backspace=indent,eol,start		"For Backspace to work.
set tabstop=4						"Tabs limit to 4.
set incsearch						"Incremental Search.
set scrolloff=10					"Limit cursor to go dow uninl only 30 linse. Keep cursor in middle.
set modifiable						"Enable modify the dir.
set nowrap							"No Wrap, setting wrap to false.
set path+=**						"Setting path for file incremetal search in project for Files (Fuzzy search) Note:- :b filename/filenameSubset, b-stands for buffer, to move around the opened files.
set wildmenu						"Setting menu on (Fuzzy finder, file name, etc in botton bar).
set nocompatible					"Telling Vim to not act like VI editor.
syntax on							"File syntax on(netrw).
filetype plugin on					"Based on File type the plugin will be on. Its Default Plugin Comes with VIM.(For netrw).
set laststatus=2					"set the status line
set noswapfile
set noesckeys
set showtabline=2

""" My Shortcuts:
nnoremap <Leader>w		:w<CR>
nnoremap <Leader>q		:bd<CR>
nnoremap <Leader>n		:bn<CR>
nnoremap <Leader>b		:bN<CR>
nnoremap <f6>			:source ~/.vimrc<bar>:hi Normal guibg=NONE ctermbg=NONE<CR>
nnoremap <Leader>vs		:w !sudo tee %<CR>
nnoremap <Leader>.		:!ctags -R .<CR>
nnoremap <C-_>			:Commentary<CR>
nnoremap t				o<ESC>k
nnoremap T				O<ESC>
inoremap ii <ESC>
nnoremap <f5>			:set showtabline=0 nonumber norelativenumber showmode! showcmd! hidden! ruler! nowildmenu nocompatible laststatus=-1<bar>:VullScreen<CR>:redraw!<CR>
nnoremap <Leader>r		:w<CR>:!%:p<CR>
nnoremap <Leader>m		:set wrap<CR>
nnoremap <Leader>M		:set nowrap<CR>

" For Making Slides Presentations.
nnoremap <Leader>,bs	:.!boxes -d stone<CR>
nnoremap <Leader>,bp	:.!boxes -d parchment<CR>
nnoremap <Leader>,bu	:.!boxes -d unicornthink<CR>
nnoremap <Leader>,bn	:.!boxes -d nuke<CR>7jFjxxxi___<ESC>3jo<ESC>
nnoremap <Leader>,c		::%s/^/                                                    /<CR>
nnoremap <Leader>,cr	::%s/^                                                    //<CR>
nnoremap <Leader>,t		O<ESC>jO<ESC>jO<ESC>jO<ESC>jO<ESC>jO<ESC>jO<ESC>jO<ESC>jO<ESC>jO<ESC>jO<ESC>jO<ESC>jO<ESC>jO<ESC>jO<ESC>j
nnoremap <Leader>.-		i•
nnoremap <Leader>.o		i°
nnoremap <Leader>..		i⋄
nnoremap <Leader>right	i→
nnoremap <Leader>left	i←
nnoremap <Leader>root	i√
noremap <Left>			:silent bN<CR> :redraw!<CR>
noremap <Right>			:silent bn<CR> :redraw!<CR>

""" Disabling Arrow Keys:
nnoremap <Up>			:echo "No Up for you!"<CR>
vnoremap <Up>			:<C-u>echo "No Up for you!"<CR>
inoremap <Up> <C-o>		:echo "No Up for you!"<CR>
nnoremap <Down>			:echo "No Down for you!"<CR>
vnoremap <Down>			:<C-u>echo "No Down for you!"<CR>
inoremap <Down> <C-o>	:echo "No Down for you!"<CR>

""" Fase Esc:
augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
augroup END

""" Netrw Settings:
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
" augroup ProjectDrawer
" 		autocmd!
" 		autocmd VimEnter * :Vexplore
" augroup END
aug netrw_close
		au!
		au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw"|q|endif
aug END

