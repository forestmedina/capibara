source /etc/vim/vimrc

nmap <A-LEFT> :tabp<CR> 
nmap <A-RIGHT> :tabn<CR>
nmap <F2> :tabf  
nmap <F3> :ls<CR>:b   
nmap <F9> :wa<CR>:!compilar ${PROYECTO} --ejecutar <CR>
nmap <C-F9> :wa<CR>:!compilar ${PROYECTO}<CR>
nmap <F4> :w<CR>:FSHere<CR>
set noswapfile
"Navegar por las ventanas usando flechas
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
"4 espacions por tabulacion, usando siempre espacios
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set history=1000 
set foldmarker={{{,}}} foldlevel=0 foldmethod=marker 
colorscheme  torte


