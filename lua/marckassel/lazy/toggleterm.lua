return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup{
            -- You can choose "horizontal", "vertical", "float", or "tab"
            direction = "horizontal",
            size = 20,  -- Size of the terminal
            open_mapping = [[<leader>tt]],  -- This key binding opens the terminal
        }
    end
}

