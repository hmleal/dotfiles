return {
    {
        'Mofiqul/dracula.nvim',
        name = 'dracula',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('dracula')
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
                ensure_installed = {
                    'lua',
                    'python',
                    'javascript',
                    'typescript'
                },
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
        opts = {},
        config = function(_, opts)
            vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal right toggle<CR>', {})
            vim.keymap.set('n', '<leader>bf', ':Neotree buffers reveal float<CR>', {})

            -- require("neo-tree").setup(opts)
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        opts = {
            options = {
                theme = 'dracula-nvim'
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
    },
    { 
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-python"
        },
        keys = {
            {
                "<leader>tl",
                function()
                    require("neotest").run.run_last()
                end,
                desc = "Run Last Test",
            },
            {
                "<leader>tL",
                function()
                    require("neotest").run.run_last({ strategy = "dap" })
                end,
                desc = "Debug Last Test",
            },
            {
                "<leader>tw",
                "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
                desc = "Run Watch",
            },
        },
        config = function()
            require('neotest').setup({
                adapters = {
                    require('neotest-python')
                }
            })
        end
    }
}
