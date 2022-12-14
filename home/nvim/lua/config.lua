require('disables')
require('settings')
require('plugins')
require('mappings')
require('telescopeconfig')
require('lualineconfig')

if vim.g.include_treesitter == 1 then
    require('treesitterconfig')
end

require('gutentags')

-- plugins
require('fzf')
require('vim-test')
require('vtr')
require('fugitive')
require('which-key').setup()

require('completionconfig')
