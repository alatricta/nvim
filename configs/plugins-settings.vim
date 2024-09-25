"=====================================================
" Plugins settings 
"=====================================================

" -------=======  Netrw settings  ======------
" вдохновение по настройке брал из этой статьи:
" https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/

let g:netrw_banner = 0  " убирает баннер в панели, чтобы его показать - нажать I
" let g:netrw_liststyle = 3  " список в виде дерева каталогов
let g:netrw_browse_split = 4  " сначала открыть в окне просмотра
let g:netrw_winsize = 30  " размер панели в % 
let g:netrw_sizestyle = 'H' " показ размера файлов в удобном виде   
let g:netrw_keepdir = 1  " синхронизация открытого файла с рабочей папкой
let g:netrw_localcopydircmd = 'cp -r'  " включение рекурсивного копирования для папок
" hi! link netrwMarkFile Search  " подсветка помеченных каталогов как при поиске

" рекурсивное удаление папок (для нормального удаления непустых папок)
function! NetrwRemoveRecursive()	
	if &filetype ==# 'netrw'
		cnoremap <buffer> <CR> rm -r<CR>
		normal mu
		normal mf
			          
		try
			normal mx
		catch
			echo "Canceled"
		endtry

		cunmap <buffer> <CR>
	endif
endfunction

" функция назначения клавиш только для окна Netrw
function! NetrwMapping()
	" назад по истории
	nmap <buffer> H u	
	" на папку вверх
	nmap <buffer> h -
	" открыть папку или файл
	nmap <buffer> l <CR>
	" Открыть файл и закрыть Netrw
	nmap <buffer> L <CR>:Lexplore<CR>
	" показать скрытые файлы
	nmap <buffer> . gh
	" закрыть Netrw
	nmap <buffer> Q :Lexplore<CR> 
	" пометить файл или папку
	nmap <buffer> <TAB> mf
	" снять пометки в текущем буфере
	nmap <buffer> <S-TAB> mF
endfunction

" включение назначенных клавиш
augroup netrw_mapping
	autocmd!
	autocmd filetype netrw call NetrwMapping()
augroup END
" ^^^^^^^^^^^^^^  Netrw settings  ^^^^^^^^^^^^^^


" -------=======  lightline.vim settings  ======------
" отображение строки статуса 
set laststatus=2
" убираем стандартное отображение режима ( --INSERT-- и т.п.)
set noshowmode
" пока строки табов (в нашем случае буферов вверху)
set showtabline=2

    " \ 'colorscheme': 'deus', 
let g:lightline = {
    \ 'colorscheme': 'powerlineish', 
    \ 'active': {
	\   'left': [ 
	\	[ 'mode', 'paste' ], 
	\	[  'cocstatus', 'readonly', 'filename', 'modified', 'gitbranch', 'curentfunction' ] ],
	\ },
	\ 'tabline': {
	\   'left': [ ['buffers'] ]
	\ },
	\ 'component_expand': {
	\   'buffers': 'lightline#bufferline#buffers'
	\ },
	\ 'component_type': {
	\   'buffers': 'tabsel'
	\ },
	\ 'component_function': {
	\   'gitbranch': 'gitbranch#name',
    \   'curentfunction': 'CocCurrentFunction',
    \   'cocstatus': 'coc#status'
	\ },
	\ }
" ^^^^^^^^^^^^^^  lightline.vim settings  ^^^^^^^^^^^^^^


" -------=======  TagBar settings  ======------
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии
" ^^^^^^^^^^^^^^ TagBar settings ^^^^^^^^^^^^^^


" -------=======  COC settings  ======------
" main commands
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga <Plug>(coc-codeaction-line)
xmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> gA <Plug>(coc-codeaction)

"Переименование объекта под курсором
" Rename object
nmap <Leader>rn <Plug>(coc-rename)
nmap <F2> <Plug>(coc-rename)

" xmap <Leader>ca <Plug>(coc-codeaction-selected)
nmap <Leader>cf <Plug>(coc-format)
nmap <Leader>cc :call CocAction('pickColor')<Enter>
"
" Клавиша показа документации
" Key for ShowDocumentation 
nnoremap <silent>K :call ShowDocumentation()<Enter>

" переход по диагностике Coc
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

" пролистывание во всплывающем окне
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? 
            \coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? 
            \coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? 
            \"\<C-r>=coc#float#scroll(1)\<Enter>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? 
            \"\<C-r>=coc#float#scroll(0)\<Enter>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? 
            \coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? 
            \coc#float#scroll(0) : "\<C-b>"

" добавление позиции мультикурсора
nmap <silent> <C-d> <Plug>(coc-cursors-position)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Клавиша для перехода по полям сниппетов
" Key for jump to snippets fields
let g:coc_snippet_next = '<tab>'

" Всегда показывать колонку слева от номера строки.
" В этой колонке показываются значки диагностики линтера.
" Иначе колонка будет появляться, только после появления сообщений линтера,
" потом будет пропадать
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" set signcolumn=yes

" CTRL+пробел для вызова автокомплита
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Подсветка слова, находящегося под курсором, по всему тексту
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" По умолчанию слишком долгая задержка перед показом вариатов вставки
" (4000 ms = 4 s). Делаем её меньше
set updatetime=300

" Вызов окна сниппетов
" expand snippets 
imap <leader>sn <Plug>(coc-snippets-expand)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

"select from menu by Enter
" inoremap <silent><expr> <Enter> pumvisible() ? 
"             \coc#_select_confirm() : 

"Показ документации
" Show documentation
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" -- Coc Formating
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" ^^ Coc Formating


" Функция для получение текущей функции в коде
" нужна для ligthline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:coc_global_extensions=[
            \'coc-json',
            \'coc-snippets',
            \'coc-pyright',
            \'coc-highlight',
            \'coc-sql',
            \'coc-xml',
            \]
" ^^^^^^^^^^^^^^ COC settings ^^^^^^^^^^^^^^


" -------=======  Comment.nvim settings  ======------
lua << EOF
    require('Comment').setup()
EOF

" Комментарий по кнопке  'CTRL+/'
" В некоторых терминалах (например в Termux'е) 
" при назначении необходимо поставить знак '_' вместо '/'
nmap <C-_> gcc
vmap <C-_> gc
" ^^^^^^^^^^^^^^ Comment.nvim settings ^^^^^^^^^^^^^^
