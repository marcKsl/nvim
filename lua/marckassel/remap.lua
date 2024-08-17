vim.g.mapleader = " "  -- Leertaste als "Leader"-Taste festlegen

-- Öffnet den Netrw-Dateibrowser (Ex)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Springt zum nächsten Suchergebnis und zentriert die Ansicht
vim.keymap.set("n", "n", "<leader>sd")

-- Springt zum vorherigen Suchergebnis und zentriert die Ansicht
vim.keymap.set("n", "N", "<leader>as")

-- Startet den LSP neu (Leader + lspr)
vim.keymap.set("n", "<leader>lspr", "<cmd>LspRestart<cr>")

-- Fügt den Inhalt aus der Zwischenablage ein, ohne den vorher markierten Text zu überschreiben (visueller Modus)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Kopiert in die System-Zwischenablage (normaler und visueller Modus)
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- Kopiert die gesamte Zeile in die System-Zwischenablage (normaler Modus)
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Löscht den Text, ohne ihn in die Zwischenablage zu kopieren (normaler und visueller Modus)
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Deaktiviert die `Q`-Taste im normalen Modus (Q wird oft versehentlich gedrückt)
vim.keymap.set("n", "Q", "<nop>")

-- Formatiert den aktuellen Puffer (LSP)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Gehe zum nächsten Fehler in der Quickfix-Liste und zentriere die Ansicht
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")

-- Gehe zum vorherigen Fehler in der Quickfix-Liste und zentriere die Ansicht
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Gehe zum nächsten Eintrag in der lokalen Fehlerliste und zentriere die Ansicht
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

-- Gehe zum vorherigen Eintrag in der lokalen Fehlerliste und zentriere die Ansicht
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Suchen und Ersetzen des Wortes unter dem Cursor im gesamten Dokument
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Macht die aktuelle Datei ausführbar
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Fügt ein Fehlerprüfungs-Snippet für Go-Code ein
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

-- Startet das "Make it Rain"-Spiel im Terminal
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

-- Führt die aktuelle Neovim-Konfigurationsdatei aus
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Fügt den Inhalt aus der System-Zwischenablage ein
vim.keymap.set("n", "<leader>P", [["+p]])
vim.keymap.set("v", "<leader>P", [["+P"]])

vim.keymap.set("n", "<leader>LL", [[:noh<CR>]], { silent = true })
