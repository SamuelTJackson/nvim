local float_term_open = false

-- Define the function to handle opening and closing the floating terminal
function ToggleGoTestPkg()
    if float_term_open then
        -- Close the floating terminal if it is open
        -- require("go.term").close()
        --
        require('go.term').close()
        float_term_open = false
    else
        -- Run the GoTestPkg command in floating terminal without switching focus
        vim.cmd("GoTestPkg -F")
        float_term_open = true
    end
end

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
        "GoAddTest",
        "GoTermClose"
    },
    version = "v0.2.1",
    config = function()
        require("go").setup({
            fillstruct = 'gopls', -- set to fillstruct if gopls fails to fill struct
            lsp_keymaps = false,
        })
        vim.keymap.set("n", "<leader>t", ToggleGoTestPkg, { noremap = true, silent = true })

        vim.keymap.set("n", "<leader>fs", "<cmd>GoFillStruct<CR>")
        vim.keymap.set("n", "<leader>ta", "<cmd>GoAddTest<CR>")
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
}
