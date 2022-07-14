" -------=======  KeyBindins  ======------
" открыть окно Netrw
nnoremap <F3> :Lexplore<CR>

" Удобный возврат в NORMAL mode из режима INSERT
inoremap JK <ESC>
inoremap ОЛ <ESC>
inoremap ii <ESC>
inoremap шш <ESC>

" Перемещение по тексту во время редактирования 
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

" сворачивание/разворачивание блока по пробелу в NORMAL 
nnoremap <space> za

" Удаление BACKSPACE'ом в режимах NORMAL, VISUAL
vnoremap <BS> d
nnoremap <BS> dh

" копиpование и вставка привычными сочетаниями: Ctrl+C и Ctrl+V
" операции производятся по средствам системного буфера
" почему-то не нормально не рабо
" inoremap <C-v> <C-O>""+p=']
" nnoremap <C-v> "+p=']
" vnoremap <C-c> "+y
" vnoremap <C-d> "+d

" CTRL-Z is Undo
nnoremap <C-z> u
inoremap <C-z> <C-O>u

" CTRL-Y is Redo
" nnoremap <C-y> <C-R>  " вызывает проблемы в некоторых терминалах при прокрутке вверх, например в Termux на Android
" inoremap <C-y> <C-O><C-R>

" CTRL-S is Quicksave command
nnoremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" Настройки работы с буферами
noremap <C-q> :bd!<CR>      " закрыть текущее окно (буфер)
noremap <C-l> :bn!<CR>  	" перейти к следующему окну (буферу)
noremap <C-h> :bp!<CR>   	" перейти к предыдущему окну (буферу)

" сместить строку вниз
" <C-CR> почему-то нифига не работает, а хотелось бы
nnoremap <C-o> O<ESC>j

" установка режима вставки 
" set paste  " сбивает работу некоторых сочетаний клавиш (например C-s в режиме INSERT)
" переключение режима вставки по клавише
set pastetoggle=<F5>

" перемещения курсора как в терминале в режиме редактирования
inoremap <C-a> <C-o>A
inoremap <C-e> <C-o>I

" run current script with python3 by in command and insert mode
autocmd FileType python map <buffer> <F8> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F8> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" -----====== настройки на попробовать =======-------
" Пролистывание текста постранично
noremap <C-j> <C-f>
noremap <C-k> <C-b>
inoremap <C-j> <C-o><C-f>
inoremap <C-k> <C-o><C-b>

" Высота строки комманд, стоит увеличивать только для большей информативности
" set cmdheight=2

" Блочное выделение вместо CTRL-V назначено на Alt-V
nnoremap <A-v> <C-v>

