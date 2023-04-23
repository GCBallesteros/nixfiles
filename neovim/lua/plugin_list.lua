return {
  plugins = {
    "wbthomason/packer.nvim", -- packer manages itself
    "nvim-lua/plenary.nvim", -- avoids callbacks, used by other plugins
    "nvim-lua/popup.nvim", -- popup for other plugins
    "nvim-treesitter/nvim-treesitter", -- language parsing completion engine
    "neovim/nvim-lspconfig", -- language server protocol implementation
    "williamboman/mason.nvim", -- lsp, dap, linter management
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/nvim-cmp", -- THE vim completion engine
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "nvim-telescope/telescope.nvim", -- finder, requires fzf and ripgrep
    "nvim-telescope/telescope-fzy-native.nvim",
    "voldikss/vim-floaterm", -- Simple floatterm
    "tpope/vim-vinegar", -- Netrw enhancements
    "mhinz/vim-startify", -- Spalsh screen
    "ggandor/leap.nvim", -- Move at the speed of light!
    "scrooloose/nerdcommenter", -- Easy commenting
    "kana/vim-textobj-user", -- More text objects
    "kana/vim-textobj-line", -- al, il textobjects for lines
    "https://gitlab.com/yorickpeterse/nvim-window.git", -- window jumping
    "tpope/vim-surround", -- easy surrounding in pairs
    "jiangmiao/auto-pairs", -- autopairs
    "qpkorr/vim-bufkill", -- for BD and BD!
    "wincent/loupe", -- saner highlighting and search
    "airblade/vim-rooter", -- Jump to root with Rooter
    "hkupty/iron.nvim", -- REPL for ipython
    "GCBallesteros/vim-textobj-hydrogen", -- Jump cells of hydrogen
    "GCBallesteros/jupytext.vim", -- Open jupyter notebooks
    "jose-elias-alvarez/null-ls.nvim", -- For extra linting
    -- Additional UIs
    "tpope/vim-fugitive", -- A Git wrapper so awesome, it should be illegal
    "folke/trouble.nvim",
    -- Cosmetic UI improvements (almost no learning required)
    "SmiteshP/nvim-navic", -- location in file using lsp
    "nvim-lualine/lualine.nvim", -- Status line
    "gelguy/wilder.nvim", -- Wild menu!
    "norcalli/nvim-colorizer.lua", -- Highlight colors
    "stevearc/dressing.nvim", -- better ui
    "rcarriga/nvim-notify", -- fancy notifications
    "kyazdani42/nvim-web-devicons", -- icons
    "ryanoasis/vim-devicons", -- more icons!
    "airblade/vim-gitgutter", -- show git status on gutter
    "chentoast/marks.nvim", -- show marks on gutter
    -- Colorschemes
    "rafamadriz/neon",
    "folke/tokyonight.nvim",
    { "catppuccin/nvim", as = "catppuccin" },
    "marko-cerovac/material.nvim",
  },
}
