return {
    "gelguy/wilder.nvim",
    dependencies = { "romgrk/fzy-lua-native" },
    config = function()
        vim.cmd.source(vim.fn.stdpath "config" .. "/lua/plugins/wilder.vim")
    end,
}
