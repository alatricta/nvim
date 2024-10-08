"=====================================================
" Vim-plug  
"=====================================================
call plug#begin('/home/sprut/.vim/plugged')
	" коментирование текста или блока текста в зависимости от синтаксиса
    Plug 'numToStr/Comment.nvim'
	" Plug 'itchyny/tcomment_vim'
	" строка состояния (внизу экрана)
	 Plug 'itchyny/lightline.vim'
	" расширение для lightline - строка вверху с открытыми буферами
	Plug 'mengelbrecht/lightline-bufferline'
	" показ ветки Git
	Plug 'itchyny/vim-gitbranch'

    " Навигация по модулям и классам прогаммы
    " Для работы необходимо дополнительно установить в систему ctags:
    " apt install ctags
    " Plug 'majutsushi/tagbar'             " Class/module browser

    " lsp (Async Language Server Protocol)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Повторяющиеся символы
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'jiangmiao/auto-pairs'

    " colorshemes
    Plug 'morhetz/gruvbox'
    " Plug 'ayu-theme/ayu-vim'
    " Plug 'challenger-deep-theme/vim'
    " Plug 'sainnhe/sonokai'
    " Plug 'keith/parsec.vim'
    " Plug 'mkarmona/materialbox'
    " Plug 'dikiaap/minimalist'
    " Plug 'jacoborus/tender.vim'

    " to try
    Plug 'othree/xml.vim'

call plug#end()

