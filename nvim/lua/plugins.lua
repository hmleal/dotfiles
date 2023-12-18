return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority=1000,
        config = function()
            vim.cmd.colorscheme('catppuccin')
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag='0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local config = require('nvim-treesitter.configs')

            config.setup({
                ensure_installed = {'lua', 'python', 'javascript'},
                highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                }, 
            })
        end
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim'
        },
        config = function()
            vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal right toggle<CR>', {})
            vim.keymap.set('n', '<leader>bf', ':Neotree buffers reveal float<CR>', {})
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        opts = {
            options = {
                theme = 'dracula'
            }
        }
    },
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('bufferline').setup()
        end
    }
}
