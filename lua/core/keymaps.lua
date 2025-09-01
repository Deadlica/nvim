-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

local function set_keymap(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
end

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
set_keymap('n', '<leader>sn', '<cmd>noautocmd w <CR>', "[S]ave [No] Formatting")

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
set_keymap('n', '<leader>x', ':bdelete!<CR>', "Close buffer") -- close buffer
set_keymap('n', '<leader>b', '<cmd> enew <CR>', "New buffer") -- new buffer

-- Window management
set_keymap('n', '<leader>v', '<C-w>v', "Split vertical") -- split window vertically
set_keymap('n', '<leader>h', '<C-w>s', "Split horizontal") -- split window horizontally
set_keymap('n', '<leader>se', '<C-w>=', "Equalize splits") -- make split windows equal width & height
set_keymap('n', '<leader>xs', ':close<CR>', "Close split") -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
set_keymap('n', '<leader>to', ':tabnew<CR>', "[T]ab [O]pen") -- open new tab
set_keymap('n', '<leader>tx', ':tabclose<CR>', "[T]ab [X] Close") -- close current tab
set_keymap('n', '<leader>tn', ':tabn<CR>', "[T]ab [N]ext") --  go to next tab
set_keymap('n', '<leader>tp', ':tabp<CR>', "[T]ab [P]rev") --  go to previous tab

-- Toggle line wrapping
set_keymap('n', '<leader>lw', '<cmd>set wrap!<CR>', "Toggle [L]ine [W]rap")

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
