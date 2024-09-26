"=====================================================
" General settings
"=====================================================
" ---- цветовая схема ---- 
" set background=dark
" colorscheme koehler
" colorscheme ayu
" colorscheme ron
colorscheme gruvbox

" Работа сочетаний клавиш и на русском языке тоже
" set langmap=  "Здесь была проблема с вводом двойных кавычек в нормальном
" режиме, для ввода команд. Проверка с 16.11.2023
"      \!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;
"      \!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set langmap=
    \№\\;?ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;
    \#$&`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>


" Включаем распознавание типов файлов и типо-специфичные плагины:
filetype on
filetype plugin on
filetype plugin indent on

" Автоотступ
" set autoindent
set smartindent

" добавление нумерации строк
set number  " set nu - сокращённо
set relativenumber  " для отображения относительного номера (set rnu - кратко)

" влючение подсветки синтаксиса
syntax on

" игнорирование регистра при поиске
set ignorecase  " игнорирование регистра при поиске
set smartcase   " Игнорировать регистр, если нет заглавных букв
set incsearch	" подсвечивать поиск по мере набора
set showmatch   " Показать совпадения
set hlsearch    " подсвечивать результаты поиска
" Отключить выделение поиска одним нажатием клавиши
map - :nohls<cr>
nnoremap <Esc> :nohls<cr>

" поведение Backspace
" set backspace=indent,eol,start whichwrap+=<,>,[,]
set backspace=indent,eol,start

" поведение мыши
" set mousemodel=popup
set mouse=a    " включение мыши во всех режимах
set mousehide  " Спрятать курсор мыши когда набираем текст

" настройка отступов
set expandtab		" замена табов на пробелы
set smarttab		" при нажатии таба в начале строки добавляет количество пробелов равное shiftwidth
set tabstop=4		" количество пробелов в одном обычном табе
set softtabstop=4	" количество пробелов в табе при удалении
set shiftwidth=4

" Возможные кодировки файлов, если файл не в unicode кодировке,
" то будут использоваться другие кодировке в представленном порядке 
set fileencodings=utf8,cp1251,koi8-r,ucs-2,cp866
set encoding=utf-8	 " utf-8 по дефолту в файлах
set scrolloff=5	     " 5 строк при скролле за раз
set fileformat=unix  " формат переносов строк

" Включаем 256 цветов в терминале, мы ведь работаем из иксов?
" Нужно во многих терминалах, например в gnome-terminal
" set t_Co=256

" отключаем бэкапы и своп-файлы
set nobackup 	     " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile 	     " no swap files

"wrap заставляет переносить строчки без их разделения
"Соответсвенно nowrap рендерит строчки за границами экрана
set wrap linebreak nolist "Данная вариация работает как wrap...
			"... но переносит строчки не посимвольно, а по словам
set cursorline "А так мы можем подсвечивать строку с курсором
set colorcolumn=100

" отключаем пищалку и мигание
set noerrorbells
set visualbell t_vb= 
set novisualbell       

" Folding
set foldenable
set foldmethod=indent
set foldlevel=10
" autocmd FileType tex set foldmethod=indent

" ----===== Команды выполняющиеся автоматически =====-----
" Правильное распознование коментариев в json файле (рекондовано COC.NVIM)
autocmd FileType json syntax match Comment +\/\/.\+$+

" Кратковременное выделение скопированного участка
autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='Visual', timeout=300}

" Добавление в парные символы знаков < и >
set mps+=<:>

