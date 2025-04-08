"" --- Mappings ---
"" Leader key (Use <Space> instead of <leader>)

"" Convenient Escape
inoremap jk <C-c>
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
