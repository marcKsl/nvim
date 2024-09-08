return {
    "mbbill/undotree",

    config = function()
        vim.keymap.set("n", "<leader>u", function()
            vim.cmd.UndotreeToggle()  -- Öffnet/Schließt den Undo Tree
            vim.cmd("wincmd w")  -- Wechselt das Fenster
        end)
    end
}

