" -------=======  User menu settings  ======------
" set wildmenu
" set wcm=<Tab>
" menu Exec.Python    :!python %<CR>
" menu Exec.bash      :!/bin/bash %<CR>
" map <F9> :emenu Exec.<Tab>

set wildmenu
set wcm=<Tab>
menu Menu.Выполнить_в_Python    :!python %<CR>
menu Menu.Выйти     :quit<CR>
menu Menu.Выйти_без_сохранения    :quit!<CR>
menu Menu.Сохранить     :update<CR>
menu Menu.Форматировать_XML     :FormatXML<CR>
map <F10> :emenu Menu.<Tab>
" ^^^^^^^^^^^^^^ User menu settings ^^^^^^^^^^^^^^
  
" User commands
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

nnoremap = :FormatXML<CR>
