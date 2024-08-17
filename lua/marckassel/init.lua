require("marckassel.set")  -- Lädt benutzerdefinierte Einstellungen
require("marckassel.remap")  -- Lädt benutzerdefinierte Tastenkürzel
require("marckassel.lazy_init")  -- Lädt Lazy.nvim Konfiguration

--e eErstellen von Autogruppen für bessere Strukturierung
local augroup = vim.api.nvim_create_augroup
local MarcKasselGroup = augroup('MarcKassel', {})  -- Haupt-Autogruppe für User-spezifische Einstellungen
local yank_group = augroup('HighlightYank', {})  -- Gruppe für die Yank-Hervorhebung

-- Funktion zum Neuladen von Modulen für eine schnellere Entwicklung
function R(name)
    require("plenary.reload").reload_module(name)
end

-- Hinzufügen neuer Dateitypen basierend auf Dateiendungen
vim.filetype.add({
    extension = {
        templ = 'templ',  -- Dateien mit der Endung .templ als 'templ' Dateityp behandeln
    }
})

-- Automatisches Hervorheben von kopiertem Text (Yank)
local autocmd = vim.api.nvim_create_autocmd
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',  -- Hervorhebung der Yank-Aktion
            timeout = 40,  -- Dauer der Hervorhebung in Millisekunden
        })
    end,
})

-- Entfernt automatisch Leerzeichen am Ende der Zeilen beim Speichern
autocmd({"BufWritePre"}, {
    group = MarcKasselGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Setzt LSP-bezogene Tastenkürzel, sobald LSP angehängt wird
autocmd('LspAttach', {
    group = MarcKasselGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        -- Gehe zur Definition
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        -- Hover-Informationen anzeigen
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        -- Arbeitsbereichsymbole suchen
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        -- Diagnostik in einem schwebenden Fenster öffnen
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        -- Code-Aktion aufrufen
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        -- Referenzen anzeigen
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        -- Umbenennen eines Symbols
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        -- Signaturhilfe im Einfügemodus anzeigen
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        -- Zum nächsten Diagnostik-Fehler springen
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        -- Zum vorherigen Diagnostik-Fehler springen
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

-- Netrw Konfigurationen
vim.g.netrw_browse_split = 0  -- Kein automatisches Splitten beim Browsen
vim.g.netrw_banner = 0  -- Banner im Netrw-Explorer deaktivieren

