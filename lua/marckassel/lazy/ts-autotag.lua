return {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter", -- Wird nur im Insert-Modus geladen
    config = function()
        require("nvim-ts-autotag").setup()
    end,
}
