vim.g.material_style = "palenight" -- palenight / oceanic / lighter /darker / deep ocean

require("material").setup({
  italics = {
    comments = false, -- Enable italic comments
    keywords = false, -- Enable italic keywords
    functions = false, -- Enable italic functions
    strings = false, -- Enable italic strings
    variables = false, -- Enable italic variables
  },
  contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
    "terminal", -- Darker terminal background
    "packer", -- Darker packer background
    "qf", -- Darker qf list background
  },
  async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
  plugins = { -- Here, you can disable(set to false) plugins that you don't use or don't want to apply the theme to
    trouble = false,
    nvim_cmp = true,
    neogit = false,
    gitsigns = true,
    git_gutter = true,
    telescope = true,
    nvim_tree = false,
    sidebar_nvim = false,
    lsp_saga = false,
    nvim_dap = false,
    nvim_navic = true,
    which_key = false,
    sneak = false,
    hop = false,
    indent_blankline = false,
    nvim_illuminate = true,
    mini = false,
  },
})

vim.api.nvim_command "colorscheme material"
