return
{
    {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<C-x>', builtin.find_files, {}) -- key for file explorer is x (xplorer)
            vim.keymap.set('n', '<leader>g', builtin.live_grep, {}) -- key for grep is g (grep)
        end

    },

    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {

                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
}
