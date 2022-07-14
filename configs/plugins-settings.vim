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

let g:lightline = {
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

nmap <Leader>rn <Plug>(coc-rename)
nmap <F2> <Plug>(coc-rename)

" xmap <Leader>ca <Plug>(coc-codeaction-selected)
nmap <Leader>cf <Plug>(coc-format)
nmap <Leader>cc :call CocAction('pickColor')<Enter>
"
" ShowDocumentation in functions.vim
nnoremap <silent>K :call ShowDocumentation()<Enter>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Highlight the symbol and its references when holding the cursor.
" Подсветка слова, находящегося под курсором, по всему тексту
autocmd CursorHold * silent call CocActionAsync('highlight')
" По умолчанию слишком долгая задержка перед показом вариантов вставки
" (4000 ms = 4 s) 
" делаем её меньше
set updatetime=500

" expand snippets 
imap <leader>sn <Plug>(coc-snippets-expand)
"select from menu by Enter
inoremap <silent><expr> <Enter> pumvisible() ? 
            \coc#_select_confirm() : 
            \"\<C-g>u\<Enter>\<C-r>=coc#on_enter()\<Enter>"

" подсмотрено
" function! ShowDocumentation()
"     if &filetype == 'vim'
"         execute 'h '.expand('<cword>')
"     elseif (coc#rpc#ready())
"         call CocActionAsync('doHover')
"     else
"         execute '!' . &keywordprg . " " . expand('<cword>')
"     endif
" endfunction

" с git разработчика
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

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


" Comment.nvim settings
lua << EOF
    require('Comment').setup()
EOF
