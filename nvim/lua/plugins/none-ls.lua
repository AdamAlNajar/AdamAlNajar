return
{
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
            }
        })

        vim.keymap.set('n', '<leader>fc', vim.lsp.buf.format, {}) -- space + f +c to (f)ormat (c)ode
    end
}
