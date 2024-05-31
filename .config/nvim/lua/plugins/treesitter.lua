return { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local ts_configs = require("nvim-treesitter.configs")
        ts_configs.setup({
            ensure_installed = { "bash", "c", "cmake", "cpp", "gitignore", "glsl", "go", "json", "linkerscript", "markdown", "python", "lua", "rust", "tmux", "vim", "yaml", "zig" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
        })
    end
}
