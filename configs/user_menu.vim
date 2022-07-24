" -------=======  User menu settings  ======------
set wildmenu
set wcm=<Tab>
menu Exec.Python    :!python % <CR>
menu Exec.bash      :!/bin/bash<CR>
menu Exec.mc        :!mc<CR>
map <F9> :emenu Exec.<Tab>

set wildmenu
set wcm=<Tab>
menu Exit.quit     :quit<CR>
menu Exit.quit!    :quit!<CR>
menu Exit.save     :update<CR>
map <F10> :emenu Exit.<Tab>
" ^^^^^^^^^^^^^^ User menu settings ^^^^^^^^^^^^^^

" User commands
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

nnoremap = :FormatXML<Cr>
