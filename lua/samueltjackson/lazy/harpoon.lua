return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({})

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers")
                .new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),

                    attach_mappings = function(prompt_buffer_number, map)
                        map(
                            "i",
                            "<C-d>", -- your mapping here
                            function()
                                local state = require("telescope.actions.state")
                                local selected_entry = state.get_selected_entry()
                                local current_picker = state.get_current_picker(prompt_buffer_number)

                                harpoon:list():remove_at(selected_entry.index)
                                current_picker:refresh(
                                    require("telescope.finders").new_table({
                                        results = harpoon:list():display(),
                                    }),
                                    conf.generic_sorter({})
                                )
                            end
                        )

                        return true
                    end

                })
                :find()
        end
        vim.keymap.set("n", "<leader>hl", function()
            toggle_telescope(harpoon:list())
        end, { desc = "Open harpoon window" })

        vim.keymap.set("n", "<leader>ha", function()
            harpoon:list():add()
        end)

        vim.keymap.set("n", "<leader>h1", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<leader>h2", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<leader>h3", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<leader>h4", function()
            harpoon:list():select(4)
        end)

        vim.keymap.set("n", "<leader>hc", function()
            harpoon:list():clear()
        end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<leader>hp", function()
            harpoon:list():prev()
        end)
        vim.keymap.set("n", "<leader>hn", function()
            harpoon:list():next()
        end)
    end,
}
