" darkZ 1.1 (Vim color file)
" Create by ☆andy☆
" QQ24375048

if version > 580
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif

set cursorline
let g:colors_name="darkZ"

"hi CursorLine  cterm=NONE                                                                                                                                                   
hi LineNr term=bold ctermfg=7 ctermbg=0
hi SpecialKey   ctermfg=red
hi NonText      cterm=bold          ctermfg=darkblue
hi Directory    ctermfg=blue
hi ErrorMsg     cterm=bold          ctermfg=7         ctermbg=1
hi IncSearch    cterm=NONE          ctermfg=blue    ctermbg=green
hi Search       cterm=NONE          ctermfg=blue     ctermbg=blue
hi MoreMsg      ctermfg=darkgreen
hi ModeMsg      cterm=NONE          ctermfg=brown
hi Question     ctermfg=green
hi StatusLine   cterm=bold,reverse
hi StatusLineNC cterm=reverse
hi VertSplit    cterm=reverse
hi Title        ctermfg=white
hi Visual       cterm=reverse
hi VisualNOS    cterm=bold,underline
hi WarningMsg   ctermfg=1
hi WildMenu     ctermfg=0           ctermbg=3
hi Folded       ctermfg=darkgrey    ctermbg=NONE
hi FoldColumn   ctermfg=darkgrey    ctermbg=NONE
hi DiffAdd      ctermbg=4
hi DiffChange   ctermbg=5
hi DiffDelete   cterm=bold          ctermfg=4         ctermbg=6
hi DiffText     cterm=bold          ctermbg=2
hi Pmenu        ctermfg=black 

hi Comment      ctermfg=darkgreen
hi Constant     ctermfg=darkyellow
hi Special      ctermfg=brown
hi Identifier   ctermfg=gray
hi Statement    ctermfg=darkcyan
hi PreProc      ctermfg=magenta
hi Type         ctermfg=darkcyan
hi Underlined   cterm=underline     ctermfg=5
hi Ignore       ctermfg=blue
hi Error        cterm=bold          ctermfg=7         ctermbg=1
hi Number       ctermfg=darkred 
hi Conditional  ctermfg=darkmagenta 
