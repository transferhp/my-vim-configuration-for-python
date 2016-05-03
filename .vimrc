set nocompatible              " requed
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here 
" (note older versions of Vundle used Bundle instead of Plugin)

" Auto Complete
Bundle 'Valloric/YouCompleteMe'

" Auto-indent
Plugin 'vim-scripts/indentpython.vim'

" PEP8 Checking
Plugin 'nvie/vim-flake8'

" Code Folding
Plugin 'tmhedberg/SimpylFold'

" Syntex Highlighting
Plugin 'scrooloose/syntastic'

" Color Scheme
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" Super searching
Plugin 'kien/ctrlp.vim'

" File browsing
Plugin 'scrooloose/nerdtree'

" PowerLine
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Auto match brace
Plugin 'AutoClose'

" Better rainbow parenthese
Plugin 'kien/rainbow_parentheses.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Python Indention
au BufNewFile,BufRead *.py:
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" UTF-8 Support
set encoding=utf-8

" Set line number
set nu

" Swith between light and dark scheme
call togglebg#map("<F5>")

if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif

" Syntax highlight
let python_highlight_all=1
syntax on

" View docstrings of folded code
let g:SimpylFold_docstring_preview=1

" Auto brace match
set showmatch

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Set line length marker
set colorcolumn=79

" PowerLine setting
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab

" Display file tree structure by control + 'n'
map <C-n> :NERDTreeToggle<CR>
" Hide .pyc file in file browsing
let NERDTreeIgnore=['\.pyc$', '\~$']


" Full color support in vim
set t_Co=256

" Setting for parenthese display
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
" Always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Enable mouse on all modes
set mouse=a
