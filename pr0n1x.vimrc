" ----------------------------------------------------------------------------
"   Plug
" ----------------------------------------------------------------------------

" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
	" Ensure all needed directories exist  (Thanks @kapadiamush)
	execute 'mkdir -p ~/.vim/plugged'
	execute 'mkdir -p ~/.vim/autoload'
	" Download the actual plugin manager
	execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" === BEGIN PLUGINS === "
call plug#begin('~/.vim/plugged')

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
map <C-l> :NERDTreeToggle<CR>

" GDBp debugger
Plug 'joonty/vdebug'
let g:vdebug_options = {
	\ 'ide_key': 'PHPSTORM',
	\ 'break_on_open': 0,
	\ 'server': '',
	\ 'port': '9000',
	\ 'timeout': 40
	\ }
" Максимальное количество отображаемых элементов массивов
let g:vdebug_features = { 'max_children': 1024 }

" PHP highlighter
Plug 'stanangeloff/php.vim', { 'for': 'php' }
" twig plugin
Plug 'evidens/vim-twig', { 'for': ['twig', 'njk'] }

" HTML5 highlight
Plug 'othree/html5.vim'

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'js' }

" PhpStorm like visual theme
Plug 'nanotech/jellybeans.vim'

" Yet another PhpStrorm like visual theme
Plug 'damage220/solas.vim'

" zen-coding with emmet
Plug 'mattn/emmet-vim'
let g:user_emmet_expandabbr_key = '<C-Bslash>'


Plug 'terryma/vim-multiple-cursors'

" Плагин для удобной работы с командами git
" Plug 'tpope/vim-fugitive' " ну очень глючный плагин для vim-nox в ubuntu

" Интеграция с git: Показывает изменения в строках
Plug 'airblade/vim-gitgutter'

" == begin VIM AIRLINE ==
" Cool status bar with buffer-tabs and color themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tab navigation like Firefox.
nnoremap <C-S-tab> :bprevious<CR>
nnoremap <C-tab>   :bNext<CR>

" solarized не входит в стандартную поставку, необходимо загрузить набор тем
" let g:allirline_theme='solarized'

" использовать пропатченные шрифты
let g:airline_powerline_fonts = 1

" включить управление табами
let g:airline#extensions#tabline#enabled = 1

" всегда показывать tabline
let g:airline#extensions#tabline#tab_min_count = 0

" такое же поведение, как и в sublime: если файл с уникальным именем - показывается только имя, если встречается файл с таким же именем, отображается также и директория
let g:airline#extensions#tabline#formatter = 'unique_tail'

" скрыть буферы
let g:airline#extensions#tabline#show_buffers = 0

" имя файла + расширение :help filename-modifiers
let g:airline#extensions#tabline#fnamemod = ':t'

" убираем раздражающие ненужные красные панели с предупреждениями или ошибками. Предупреждения, как по мне, не нужны, поскольку ругаются даже на trailing-spaces и разные отступы: например табы и пробелы (привет от phpDoc). Для ошибок и так открывается дополнительное окно. Впрочем, вам решать.
let g:airline_section_warning = ''
let g:airline_section_error = ''

" убираем "X" для закрытия вкладки мышью (мышью!?)
let g:airline#extensions#tabline#show_close_button = 0

" убираем разделитель для вкладок
" let g:airline#extensions#tabline#left_alt_sep = ''

" отключаем tagbar
let g:airline#extensions#tagbar#enabled = 0

" показывать номер вкладки
let g:airline#extensions#tabline#show_tab_nr = 1

" показывать только номер вкладки
let g:airline#extensions#tabline#tab_nr_type = 1
" == end VIM AIRLINE ==

call plug#end()
" === END PLUGINS === "


" Settings update after file wrote
set autoread

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4

"set autoindent
"set smartindent

" show row numbers
" set rnu

" always show status bar
set laststatus=2

" Выставляем кодировку
set encoding=utf-8
set termencoding=utf-8

" Отключаем swap-файлы. Ставьте на свое усмотрение, мне эта возможность чаще мешала
" set noswapfile

" Если в течении этого времени, вы не будете перемещать курсор или печатать, vim обновит swap-файл,
" а также активирует событие CursorHold. Некоторые плагины, вроде tagbar, слушают это событие для обновления состояния.
" Так как swap-файлы я не использую, решил сделать значение поменьше (по умолчанию - 4000).
set updatetime=500

" :vsplit открывает окна справа
set splitright

" :split открывает окна снизу
set splitbelow

" убираем совместимость с vi
set nocompatible

" ищем тег-файл в текущей директории / Если ползуемся плашином
" set tags=./tags;

" Игнорировать регистр при поиске. Намного удобнее вводить команды без учета регистра, например ctrlsf, вместо CtrlSF.
" Для поиска с учетом регистра, нужно поместить \C в любое место искомой строки
set ignorecase

" например, при переходе к тегу, vim может ругаться, что текущий буфер не сохранен, hidden решает эту проблему
set hidden
" подсвечивать все совпадения при поиске
set hlsearch
" подсвечивать совпадение во время поиска на лету
set incsearch

" выделять строку, на которой находится курсор
set cursorline

" количество cтрок в всплывающем окне
" set pumheight=10

" использовать пробелы в качестве разделителей окон. Не забудьте поставить в конце строки символ пробела
set fillchars+=vert:\ 

" меняем mapleader на ',', по умолчанию - '\'
" let mapleader=","

" включить подсветку синтаксиса
syntax enable

" выбираем темный фон
set background=dark

" выбираем цветовую схему
" colorscheme jellybeans
colorscheme solas


" hightlight indents → »•›·↵
set list
" set listchars=eol:↵,tab:›·,extends:>,precedes:<
set listchars=tab:›·
hi HiGrpTabs ctermbg=NONE ctermfg=235 guibg=NONE
" hi HiGrpTabs ctermbg=black ctermfg=black guibg=NONE
match HiGrpTabs /\t/

" set switchbug=usetab
" nnoremap <C-Tab> :sbnext
" nnoremap <C-S-Tab> :sbprevious
" nmap <C-Tab> :bn
" nmap <C-S-Tab> :bp

