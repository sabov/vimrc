"wtfil vimrc settings
	let g:solarized_termcolors=256
	set t_Co=256 "colors
	syntax enable
	set background=dark
	colorscheme solarized
	set nocp
	set ruler
	set laststatus=2
	set nowrap
"my hotkeys
	imap <C-f> function
	imap <C-g> ''<Esc>i
	imap <C-d> ()<Esc>i
	imap <C-a> <C-BS>
	imap <C-e> {}<ESC>i<CR><ESC>k$o<tab>
	imap <C-v> <End>
	imap <C-b> <Esc><S-i>
"bind russian keyboard
	map ё `
	map й q
	map ц w
	map у e
	map к r
	map е t
	map н y
	map г u
	map ш i
	map щ o
	map з p
	map х [
	map ъ ]
	map ф a
	map ы s
	map в d
	map а f
	map п g
	map р h
	map о j
	map л k
	map д l
	map ж ;
	map э '
	map я z
	map ч x
	map с c
	map м v
	map и b
	map т n
	map ь m
	map б ,
	map ю .
	map . /

	map Ё ~
	map Й Q
	map Ц W
	map К R
	map У E
	map Е T
	map Н Y
	map Г U
	map Ш I
	map Щ O
	map З P
	map Х {
	map Ъ }
	map Ф A
	map Ы S
	map В D
	map А F
	map П G
	map Р H
	map О J
	map Л K
	map Д L
	map Ж :
	map Э "
	map Я Z
	map Ч X
	map С C
	map М V
	map И B
	map Т N
	map Ь M
	map Б <
	map Ю >
	map , ?
	cmap ц w
	cmap цй qw
	cmap й q

	au BufNewFile,BufRead *.mxml set filetype=mxml
	au BufNewFile,BufRead *.as set filetype=actionscript
	noremap <F4> :set hlsearch! hlsearch?<CR>
"windows style
	nmap J vj
	vmap J j
	nmap K vk
	vmap K k
	nmap H vh
	vmap H h
	nmap L vl
	vmap L l
	map , $
	map m ^
"comments
	vmap <C-e> ""y:%s/<C-R>=escape(@", '/\')<CR>/\/\*<C-R>=escape(@", '/\')<CR>\*\//g<CR>

"miripiruni settings

"Interface
	set nonumber                  " Не показываем нумерацию строк
																" Во-первых, номер текущей строки всегда
																" есть в statusline, во-вторых, всегда можно
																" быстро перейти к нужной строке набрав :1
																" где 1 — номер строки.

	set encoding=utf-8            " character encoding used inside Vim.
	set fileencodings=utf8,cp1251 " Возможные кодировки файлов и последовательность определения
	set wildmenu " Саджест по <tab> в командной строке
							 " When 'wildmenu' is on, command-line completion operates in an enhanced
							 " mode.  On pressing 'wildchar' (usually <Tab>) to invoke completion,
							 " the possible matches are shown just above the command line, with the
							 " first match highlighted (overwriting the status line, if there is
							 " one).
							 " the title of the window will be set to the value of 'titlestring'
							 " (if it is not empty), or to: filename [+=-] (path) - VIM
	set showcmd  " Show (partial) command in the last line of the screen
							 " Set this option off if your terminal is slow.
							 " In Visual mode the size of the selected area is shown:
							 " - When selecting characters within a line, the number of characters.
							 "   If the number of bytes is different it is also displayed: "2-6"
							 "   means two characters and six bytes.
							 " - When selecting more than one line, the number of lines.
							 " - When selecting a block, the size in screen characters:
	set scrolloff=999       " focus mode like in Writer app http://www.iawriter.com/
	set showtabline=1       " Показывать табы всегда
	set list                " display unprintable characters
	set wrap                " Включаем перенос строк (http://vimcasts.org/episodes/soft-wrapping-text/)
	if version >= 703
			set colorcolumn=80 " Подсвечиваем 80 столбец
	end
	set backspace=2
	set formatoptions-=o    " dont continue comments when pushing o/O
	set linebreak           " Перенос не разрывая слов
	set autoindent          " Копирует отступ от предыдущей строки
	set shiftwidth=2        " Размер сдвига при нажатии на клавиши << и >>
	set tabstop=2           " Размер табуляции
	set softtabstop=2
	set linespace=1         " add some line space for easy reading
	set cursorline          " Подсветка строки, в которой находится в данный момент курсор
	set cursorcolumn
	set guioptions=         " Вырубаем все лишнее из ГУИ, если надо потогглить см <F6>
	set guicursor=          " Отключаем мигание курсора
	set splitbelow          " новый сплит будет ниже текущего :sp
	set splitright          " новый сплит будет правее текущего :vsp
	set shortmess+=I        " не показывать intro screen
	set mouseshape=s:udsizing,m:no " turn to a sizing arrow over the status lines
	set mousehide " Hide the mouse when typing text

	set hidden " this allows to edit several files in the same time without having to save them

	" Символ табуляции и конца строки
			if has('multi_byte')
					if version >= 700
							set listchars=tab:▸\ ,trail:·,extends:→,precedes:←,nbsp:×
					else
							set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_
					endif
			endif
	" Приводим в порядок status line

			function! FileSize()
					let bytes = getfsize(expand("%:p"))
					if bytes <= 0
							return ""
					endif
				if bytes < 1024
						return bytes . "B"
				else
						return (bytes / 1024) . "K"
				endif
		endfunction

		function! CurDir()
				let curdir = substitute(expand('%:p'), '/home/miripiruni', '~', 'g')
				return curdir
		endfunction

		set laststatus=2
		set statusline=\ 
		set statusline+=%n:\                 " buffer number
		set statusline+=%t                   " filename with full path
		set statusline+=%m                   " modified flag
		set statusline+=\ \ 
		set statusline+=%{&paste?'[paste]\ ':''}
		set statusline+=%{&fileencoding}
		set statusline+=\ \ %Y               " type of file
		set statusline+=\ %3.3(%c%)          " column number
		set statusline+=\ \ %3.9(%l/%L%)     " line / total lines
		set statusline+=\ \ %2.3p%%          " percentage through file in lines
		set statusline+=\ \ %{FileSize()}
		set statusline+=%<                   " where truncate if line too long
		set statusline+=\ \ CurDir:%{CurDir()}


" Show the line and column number of the cursor position
		set ruler
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

" Создаем меню с кодировками
		menu Encoding.UTF-8 :e ++enc=utf8 <CR>
		menu Encoding.Windows-1251 :e ++enc=cp1251<CR>
		menu Encoding.koi8-r :e ++enc=koi8-r<CR>
		menu Encoding.cp866 :e ++enc=cp866<CR>

" Проверка орфографии
		if version >= 700
				set spell spelllang= 
				set nospell " По умолчанию проверка орфографии выключена
				menu Spell.off :setlocal spell spelllang= <cr>
				menu Spell.Russian+English :setlocal spell spelllang=ru,en <cr>
				menu Spell.Russian :setlocal spell spelllang=ru <cr>
				menu Spell.English :setlocal spell spelllang=en <cr>
				menu Spell.-SpellControl- :
				menu Spell.Word\ Suggest<Tab>z= z=
				menu Spell.Previous\ Wrong\ Word<Tab>[s [s
				menu Spell.Next\ Wrong\ Word<Tab>]s ]s
		endif

" Фолдинг
		" Всё, что нужно знать для начала:
		" za - скрыть/открыть текущую складку.
		" {zR, zM} - {открыть, скрыть} все складки.
		" from https://github.com/sjl/dotfiles/blob/master/vim/.vimrc
		function! MyFoldText()
				let line = getline(v:foldstart)

				let nucolwidth = &fdc + &number * &numberwidth
				let windowwidth = winwidth(0) - nucolwidth - 3
				let foldedlinecount = v:foldend - v:foldstart

				" expand tabs into spaces
				let onetab = strpart(' ', 0, &tabstop)
				let line = substitute(line, '\t', onetab, 'g')

				let line = strpart(line, 0, windowwidth - 2 - len(foldedlinecount))
				let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
				return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
		endfunction
		set foldtext=MyFoldText()

		set foldcolumn=0        " Ширина строки где располагается фолдинг
		set foldmethod=indent   " Фолдинг по отступам
		set foldnestmax=10      " Глубина фолдинга 10 уровней
		set nofoldenable        " Не фолдить по умолчанию
		set foldlevel=1         " This is just what i use
		set fillchars="fold: "  " remove the extrafills --------

" Не показывать парную скобку
		let loaded_matchparen=1 " перестает прыгать на парную скобку, показывая где она. +100 к скорости
		set noshowmatch " Не показывать парные <> в HTML


" Search
  set incsearch   " При поиске перескакивать на найденный текст в процессе набора строки
  set hlsearch    " Включаем подсветку выражения, которое ищется в тексте
  set ignorecase  " Игнорировать регистр букв при поиске
  set smartcase   " Override the 'ignorecase' if the search pattern contains upper case characters
  set gdefault    " Включает флаг g в командах замены, типа :s/a/b/

" Шорткаты

 let mapleader = "," " мапим <Leader> на запятую. По умолчанию <Leader> это обратный слэш \

  " ,m
      " в Normal mode тогглит поддержку мыши
      set mouse=
      function! ToggleMouse()
        if &mouse == 'a'
          set mouse=
          echo "Mouse usage disabled"
        else
          set mouse=a
          echo "Mouse usage enabled"
        endif
      endfunction
      nnoremap <leader>m :call ToggleMouse()<CR>

  " ,r
      " Поиск и замена во всех открытых буферах http://vim.wikia.com/wiki/VimTip382
      function! Replace()
          let s:word = input("Replace " . expand('<cword>') . " with:")
          :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/gce'
          :unlet! s:word
      endfunction
      map <Leader>r :call Replace()<CR>

  " <Esc>
      " Clear the search highlight by pressing ENTER when in Normal mode (Typing commands)
      nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

  " < >
      vnoremap < <gv
      vnoremap > >gv

" ,p
      " Вставлять код извне без этой строчки проблематично, без нее начитается
      " бешеный реформат кода
      set pastetoggle=<Leader>p


  " ,n
      " Toggle type of line numbers
      " http://stackoverflow.com/questions/4387210/vim-how-to-map-two-tasks-under-one-shortcut-key
      " vim 7.3 required
      let g:relativenumber = 0
      function! ToogleRelativeNumber()
        if g:relativenumber == 0
          let g:relativenumber = 1
          set norelativenumber
          set number
          echo "Show line numbers"
        elseif g:relativenumber == 1
          let g:relativenumber = 2
          set nonumber
          set relativenumber
          echo "Show relative line numbers"
        else
          let g:relativenumber = 0
          set nonumber
          set norelativenumber
          echo "Show no line numbers"
        endif
      endfunction
      map <Leader>n :call ToogleRelativeNumber()<cr>

  " ,g
      function! ToggleGUINoise()
        if &go==''
          exec('se go=mTrL')
          echo "Show GUI elements"
        else
          exec('se go=')
          echo "Show no GUI elements"
        endif
      endfunction
      map <Leader>g <Esc>:call ToggleGUINoise()<cr>

  " ,f
      " Fast grep
      " грепает в текущей директории по слову, на котором стоит курсор
    "  map <Leader>f :execute "Ack " . expand("<cword>") <Bar> cw<CR>

  " Перемещение строк
      " переместить одну строку
      nmap <C-S-k> ddkP
      nmap <C-S-j> ddp
      " переместить несколько выделенных строк http://www.vim.org/scripts/script.php?script_id=1590
      vmap <C-S-k> xkP'[V']
      vmap <C-S-j> xp'[V']

  " Мапим {действие} от курсора до конца строки
      nnoremap Y y$
      nnoremap D d$
      nnoremap C c$

  " Pasting with correct indention
      "nmap p p=`]
      "nmap P P=`[

  " Disable <Arrow keys>
      " Warning: nightmare mode!
        inoremap <Up> <NOP>
        inoremap <Down> <NOP>
        inoremap <Left> <NOP>
        inoremap <Right> <NOP>
        noremap <Up> <NOP>
        noremap <Down> <NOP>
        noremap <Left> <NOP>
        noremap <Right> <NOP>
        " Позволяем передвигаться с помощью hjkl в Insert mode зажав <Ctrl>
        imap <C-h> <C-o>h
        imap <C-j> <C-o>j
        imap <C-k> <C-o>k
        imap <C-l> <C-o>l

    " ,v
        " Pressing ,v opens the .vimrc in a new tab
 "      nmap <leader>v :tabedit $MYVIMRC<CR>

    " <Space> = <PageDown> Как в браузерах
        nmap <Space> <PageDown>

    " n и N
        " когда бегаем по результатам поиска, то пусть они всегда будут в центре
        nmap n nzz
        nmap N Nzz
        nmap * *zz
        nmap # #zz
        nmap g* g*zz
        nmap g# g#zz

    " K to split
        " Basically this splits the current line into two new ones at the cursor position,
        " then joins the second one with whatever comes next.
        "
        " Example:                      Cursor Here
        "                                    |
        "                                    V
        " foo = ('hello', 'world', 'a', 'b', 'c',
        "        'd', 'e')
        "
        " becomes
        "
        " foo = ('hello', 'world', 'a', 'b',
        "        'c', 'd', 'e')
        "
        " Especially useful for adding items in the middle of long lists/tuples in Python
        " while maintaining a sane text width.
       nnoremap K <nop>
      " nnoremap K h/[^ ]<cr>"zd$jyyP^v$h"zpJk:s/\v +$//<cr>:noh<cr>j^

    " It's 2011. Don't skip wrap lines
        " Еще раз и попонятнее:
        " если строка n длиная и не влезла в окно — она перенесется на
        " следующую (wrap on). Шокткаты ниже нужны, чтобы попасть
        " на каждую псевдострочку этой врапнутой строки.
        noremap j gj
        noremap k gk

    " <Return> toggle command mode
        " С таким мапом возникают проблемы когда нужно грепнуть и перемещаться
        " по файлам в результатах поиска нажимая энтер.
       "nmap <Return> :

    " gf открывает фойл под курсором в вертикальном сплите
        " (по дефолту gf открывает файл в том же буфере)
        nmap gf :vertical wincmd f<CR>

    " Создаем пустой сплит относительно текущего
        nmap <Leader><left>  :leftabove  vnew<CR>
        nmap <Leader><right> :rightbelow vnew<CR>
        nmap <Leader><up>    :leftabove  new<CR>
        nmap <Leader><down>  :rightbelow new<CR>

    " ,c
        " camelCase => camel_case
"       vnoremap <silent> <Leader>c :s/\v\C(([a-z]+)([A-Z]))/\2_\l\3/g<CR>

    " Double space to ". "
      "  imap <Space><Space> . 

    " Fix Trailing White Space
"        map <leader>ts :%s/\s\+$//e<CR>


    " ,bl show buffers
        nmap <Leader>bl :ls<cr>:b

    " ,bp prev buffer
        nmap <Leader>bp :bp<cr>

    " ,bn next buffer
        nmap <Leader>bn :bn<cr>
