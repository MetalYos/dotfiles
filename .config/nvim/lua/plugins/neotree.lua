return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = true, -- when true, they will just be displayed differently than normal items
                    show_hidden_content = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
            },
        })
        
        vim.keymap.set('n', '<leader>n', ':Neotree filesystem toggle left<CR>', {})
    end
}
