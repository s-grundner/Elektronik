"" --- Mappings ---
"" Leader key (Use <Space> instead of <leader>)

"" Convenient Escape
inoremap jk <ESC>
inoremap jj <ESC>

"" Preserve cursor position when joining lines
nnoremap J mzJ`z

"" Keep cursor in the middle of the screen when scrolling
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

"" Clipboard
nnoremap <Space>y \"+y
nnoremap <Space>Y \"+Y

"" Delete to void register
nnoremap <Space>dc \"_d
nnoremap <Space>dd \"_dd

"" Beginning (H) and End (J) of line
nnoremap H ^
nnoremap L $

"" Switch Tabs
exmap tabnext obcommand workspace:next-tab
nmap gt :tabnext<CR>
exmap tabprev obcommand workspace:previous-tab
nmap gT :tabprev<CR>

exmap openlink obcommand editor:open-link-in-new-leaf
nmap go :openlink<CR>
nmap gd :openlink<CR>

" [g]oto [f]ile (= Follow Link under cursor)
exmap followLinkUnderCursor obcommand editor:follow-link
nmap gf :followLinkUnderCursor<CR>
"
" g; go to last change - https://vimhelp.org/motion.txt.html#g%3B
nmap g; u<C-r>

