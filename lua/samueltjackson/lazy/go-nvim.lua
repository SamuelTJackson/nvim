return {
    "ray-x/go.nvim",
    dependencies = {
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    cmd = {
        "GoFillStruct",
        "GoVet",
        "GoTest",
        "GoTestFile",
        "GoTestFunc",
        "GoAddTest"
    },
    version = "v0.2.1",
    config = function()
        require("go").setup({
            fillstruct = 'fillstruct', -- set to fillstruct if gopls fails to fill struct
            lsp_keymaps = false,
        })
        vim.keymap.set("n", "<leader>t", "<cmd>GoTestFile<CR>")
        vim.keymap.set("n", "<leader>tf", "<cmd>GoTestFunc<CR>")
        vim.keymap.set("n", "<leader>fs", "<cmd>GoFillStruct<CR>")
        vim.keymap.set("n", "<leader>ta", "<cmd>GoAddTest<CR>")
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
}
