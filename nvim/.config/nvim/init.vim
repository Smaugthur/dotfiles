 """"""""""""""
"PLUGINS
"""""""""""""""
" {{{
call plug#begin('~/.vim/plugged')

" Themes
    Plug 'morhetz/gruvbox'
    Plug 'flrnd/candid.vim'
    Plug 'adrian5/oceanic-next-vim'
    Plug 'nightsense/cosmic_latte'
    Plug 'chriskempson/base16-vim'
    Plug 'mhinz/vim-startify'
    Plug 'vim-airline/vim-airline'

" IDE
    Plug 'scrooloose/nerdtree' 
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'Omnisharp/omnisharp-vim'
    Plug 'neoclide/coc.nvim'
    Plug 'dense-analysis/ale'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'tpope/vim-fugitive'

call plug#end()
"}}}

"""""""""""""""
" =>BASICS
"""""""""""""""
    let mapleader=" "
    set mouse=a

    " Themes and enconding
    set termguicolors
    colorscheme gruvbox
    set encoding=utf-8
    set foldmethod=marker

    " Rulers
    set relativenumber
    set number
    set numberwidth=1
    set cursorline
    set cursorcolumn

    "Spliting Buffers
    set splitright
    set splitbelow

    " File History
    set undofile
    set undodir=~/.vim/undodir
    set noswapfile
    set clipboard=unnamedplus

    " Highlighting
    syntax enable
    syntax on

    " Indent
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set expandtab
    set smartindent
    set nowrap

    " Others
    set showcmd
    set cmdheight=2
    set noerrorbells
    set scrolloff=8
    set signcolumn=yes

    " Theme configuration
    let g:gruvbox_italic=1
    let g:gruvbox_bold=1
    let g:gruvbox_termcolors=16
    let $BAT_THEME='ansi-dark'

    if strftime("%H") < 17
      set background=light
    else
      set background=dark
    endif
"""""""""""""""""
" KEY MAPS
"""""""""""""""""
    nmap <Leader>s :w<CR>
    nmap <Leader>e :q<CR>
    nmap <Leader>m :NERDTreeFind<CR>
    map <Leader>f :Files<CR>

""""""""""""""""""""""""
" PLUGINS CONFIGURATION
""""""""""""""""""""""""
    source ~/.config/nvim/vim-plug/nerdTree.vim
    source ~/.config/nvim/vim-plug/fzf.vim
    source ~/.config/nvim/vim-plug/ale.vim
    source ~/.config/nvim/vim-plug/airline.vim
    source ~/.config/nvim/vim-plug/startify.vim

" indentLine
    let g:indentLine_fileTypeExclude = ['text','vim','tree','help','startify']
    let g:indentLine_bufTypeExclude = ['help','terminal']

" Toggle transparent background {{{
    let t:is_transparent = 0
    function! Toggle_transparent()
        if t:is_transparent == 0
            hi Normal guibg=NONE ctermbg=NONE
            set nocursorcolumn
            let t:is_transparent = 1
        else
            set background=dark
            set cursorcolumn
            let t:is_transparent = 0
        endif
    endfunction
    map <Leader>t : call Toggle_transparent()<CR>
" }}}
