--------
-- Go --
--------
return {
    'ray-x/go.nvim',
    dependencies = {
        'ray-x/guihua.lua',
        'neovim/nvim-lspconfig',
        'nvim-treesitter/nvim-treesitter',
    },
    ft = { 'go', 'gomod' },
    config = function()
        local function on_attach()
            vim.o.shiftwidth = 0 -- Use tabstop's width
            vim.keymap.set("n", "<leader>t", "<cmd>GoTestFile<CR>")
            vim.keymap.set("n", "<leader>fs", "<cmd>GoFillStruct<CR>")
            vim.keymap.set("n", "<leader>ta", "<cmd>GoAddTest<CR>")
        end

        require('go').setup({
            lsp_cfg = {
                settings = {
                    gopls = {
                        analyses = {
                            ST1003 = true,
                            fieldalignment = false,
                            fillreturns = true,
                            nilness = true,
                            nonewvars = true,
                            shadow = true,
                            undeclaredname = true,
                            unreachable = true,
                            unusedparams = true,
                            unusedwrite = true,
                            useany = true
                        },
                        buildFlags = { "-tags", "integration" },
                        codelenses = {
                            gc_details = true,
                            generate = true,
                            regenerate_cgo = true,
                            test = true,
                            tidy = true,
                            upgrade_dependency = true,
                            vendor = true
                        },
                        completeUnimported = true,
                        diagnosticsDelay = "500ms",
                        gofumpt = false,
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true
                        },
                        ["local"] = "...",
                        matcher = "Fuzzy",
                        semanticTokens = true,
                        staticcheck = true,
                        symbolMatcher = "fuzzy",
                        usePlaceholders = true
                    },
                }
            },
            lsp_keymaps = false,
            lsp_on_attach = on_attach,
            lsp_codelens = true,      -- Temporary fix for https://github.com/ray-x/go.nvim/issues/113
            luasnip = true,
            dap_debug_keymap = false, -- Disable default DAP keymaps
            icons = false,            -- Don't set custom DAP icons
        })
    end
}
