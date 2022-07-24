Если вдруг кто-то свихнётся, и захочет работать в консоли (как я),то вот мой конфиг программы NeoVim.

Установить программу nvim можно так:

sudo apt-get install neovim

документация по установке тут;

    https://github.com/neovim/neovim/wiki/Installing-Neovim

Переходим в папку:

    cd ~/.config

И клонируем данный репозиторий:

    git clone git@github.com:alatricta/nvim.git

Запускаем neovim:

    nvim

Устанавливаем плагины:

    :PlugInstall
