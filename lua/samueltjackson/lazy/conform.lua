local formatters = {
    lua = { "stylua" },
    go = { "gofumpt" },
    terraform = { "terraform_fmt" },
    ["terraform-vars"] = { "terraform_fmt" },
    tf = { "terraform_fmt" },
    hcl = { "terragrunt_hclfmt" },
    sql = { "sqlfmt" },
    json = { "jq" },

    -- ["*"] = { "codespell" },
}
local prettier_ft = {
    "css",
    "html",
    "javascriptreact",
    "javascript",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "vue",
}

for _, filetype in pairs(prettier_ft) do
    formatters[filetype] = { "prettierd" }
end

return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = formatters,
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
