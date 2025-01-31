require('config.lazy')

--
-- misc
--

vim.opt.backup = false
vim.opt.writebackup = false

--
-- colorscheme
--

vim.cmd('colorscheme kanagawa')

--
-- neovide-related
--

vim.o.guifont = 'Iosevka:h13'
vim.g.neovide_cursor_animation_length = 0.02

--
-- keymaps
--

--
-- basic
--

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- telescope

local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', ':Oil<CR>', { desc = 'Oil find files' })
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope_builtin.oldfiles, { desc = 'Telescope history' })

vim.keymap.set('n', '<C-p>', telescope.extensions.project.project, { desc = 'Telescope project' })

-- coc
-- https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.lua

vim.opt.updatetime = 300
vim.opt.signcolumn = 'yes'

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `'suggest.noselect': true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : '\<C-h>']], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
vim.keymap.set('i', '<cr>', [[coc#pum#visible() ? coc#pum#confirm() : '\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>']], opts)

