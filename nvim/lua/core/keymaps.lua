local luasnip = require("luasnip")
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
local conform = require("conform")

local keymap = vim.keymap

vim.g.tmux_navigator_no_mappings = 1 -- disable default tmux navigator keymaps

------------------------
-- GENERAL KEYMAPS
------------------------
keymap.set("n", "<leader>%", ":luafile %<CR>", { desc = "Reload Lua Config" })
keymap.set("n", "x", '"_x') -- do not copy to register the symbol that are deleted with x
keymap.set({ "n", "v" }, "c", '"_c') -- do not copy to register the target of change command

-- remap hjkl to jkl; for basic movement
keymap.set({ "n", "v" }, "j", "h", { noremap = true })
keymap.set({ "n", "v" }, "k", "j", { noremap = true })
keymap.set({ "n", "v" }, "l", "k", { noremap = true })
keymap.set({ "n", "v" }, ";", "l", { noremap = true })
keymap.set({ "n", "v" }, "gj", "gh", { noremap = true })
keymap.set({ "n", "v" }, "gk", "gj", { noremap = true })
keymap.set({ "n", "v" }, "gl", "gk", { noremap = true })
keymap.set({ "n", "v" }, "g;", "gl", { noremap = true })
keymap.set("n", "z;", "zl", { noremap = true })
keymap.set("n", "zj", "zh", { noremap = true })
keymap.set("n", "z:", "zL", { noremap = true })
keymap.set("n", "zJ", "zH", { noremap = true })

-- text wrap
keymap.set("n", "<leader>we", ":set wrap<CR>", { noremap = true, desc = "Enable Text Wrap" })
keymap.set("n", "<leader>wd", ":set nowrap<CR>", { noremap = true, desc = "Disable Text Wrap" })

-- change lines order
-- these symbols are Alt+k and Alt+l on Mac
keymap.set("n", "˚", ":m .+1<CR>")
keymap.set("n", "¬", ":m .-2<CR>")
keymap.set("v", "˚", ":m '>+1<CR>gv=gv", { noremap = true })
keymap.set("v", "¬", ":m '<-2<CR>gv=gv", { noremap = true })

-- splits management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Create Vertical Split" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Create Horizontal Split" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make Splits Equal" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close Current Split" })

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open New Tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close Current Tab" })
keymap.set("n", "<leader>tt", ":tabclose #<CR>", { desc = "Close Last Tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go To Next Tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go To Previous Tab" })

-- copy file path
keymap.set("n", "<leader>cf", ':let @+ = expand("%:t")<cr>', { desc = "Copy Filename" })
keymap.set("n", "<leader>cP", ':let @+ = expand("%:p")<cr>', { desc = "Copy Absolute Path" })
keymap.set("n", "<leader>cp", ':let @+ = expand("%")<cr>', { desc = "Copy File Path from Content Root" })

-- rename
keymap.set("n", "<leader>cn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })

-- show hover docs
keymap.set("n", "<leader>ch", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Show Hover Docs", noremap = true })

------------------------
-- PLUGIN KEYMAPS
------------------------

-- lazy
keymap.set("n", "<leader>p", ":Lazy<CR>", { desc = "Lazy: Plugin management" })

-- mason
keymap.set("n", "<leader>m", ":Mason<CR>")

-- zen-mode
keymap.set("n", "<leader>z", ":ZenMode<CR>")

-- vim-tmux-navigator
keymap.set("n", "<C-k>", ":<C-U>TmuxNavigateDown<cr>", { noremap = true })
keymap.set("n", "<C-l>", ":<C-U>TmuxNavigateUp<cr>", { noremap = true })
keymap.set("n", "<C-;>", ":<C-U>TmuxNavigateRight<cr>", { noremap = true })
keymap.set("n", "<C-j>", ":<C-U>TmuxNavigateLeft<cr>", { noremap = true })

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "Toggle Split Maximization" })

-- treesj
keymap.set("n", "<leader>e", ":TSJToggle<CR>", { desc = "Expand/Collapse code block" })

-- nvim-notify
keymap.set("n", "<leader>n", ":Notifications<CR>", { noremap = true, desc = "See Notifications List" })

-- nvim-tree
keymap.set("n", "<leader>k", ":NvimTreeToggle<CR>", { desc = "Toggle Explorer" })
keymap.set("n", "<leader>l", ":NvimTreeFindFile<CR>", { desc = "Reveal current file in Explorer" })

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string use_regex=false search=<cr>", { desc = "Text Search" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Grep String" })
keymap.set("n", "<leader>fd", "<cmd>Telescope live_grep search_dirs=.<cr>", { desc = "Grep String In CWD" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List Buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "List Help Tags" })
keymap.set("n", "<leader>fc", "<cmd>Telescope git_status<cr>", { desc = "List Git Changes" })
keymap.set("n", "<leader>f?", "<cmd>Telescope commands<cr>", { desc = "Available Commands" })
keymap.set("n", "<leader>fa", "<cmd>Telescope colorscheme<cr>", { desc = "Colorschemes" })
keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", { desc = "Quickfix" })
keymap.set("n", "<leader>f_", "<cmd>Telescope registers<cr>", { desc = "Registers" })
keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "Resume the Last Search" })
keymap.set("n", "<leader>fp", "<cmd>Telescope pickers<cr>", { desc = "Pickers" })
keymap.set("n", "<leader>fn", "<cmd>Telescope notify<cr>", { desc = "Notifications" })
keymap.set("n", "<leader>fl", "<cmd>Telescope lsp_references<cr>", { desc = "LSP References" })
keymap.set(
	"n",
	"<leader>fF",
	"<cmd>Telescope find_files hidden=true no_ignore=true<cr>",
	{ desc = "Find Files including hidden" }
)

-- conform
vim.keymap.set("n", "<leader>cF", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Toggle Trouble Plugin Visibility" })

-- trouble
vim.keymap.set("n", "<leader>cc", "<cmd>TroubleToggle<cr>", { desc = "Toggle Trouble Plugin Visibility" })
vim.keymap.set("n", "<leader>cr", "<cmd>Trouble lsp_references<cr>", { desc = "Show references" })
vim.keymap.set("n", "<leader>cd", "<cmd>Trouble lsp_definitions<cr>", { desc = "Show Definitions" })
vim.keymap.set("n", "<leader>ct", "<cmd>Trouble lsp_type_definitions<cr>", { desc = "Show Type Definitions" })
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble loclist<cr>", { desc = "Show Loclist" })
vim.keymap.set("n", "<leader>cq", "<cmd>Trouble quickfix<cr>", { desc = "Show Quickfix" })
vim.keymap.set("n", "<leader>ce", "<cmd>Trouble document_diagnostics<cr>", { desc = "Document Diagnostics" })

-- nvim-code-actions-menu
vim.keymap.set("n", "<leader>ca", "<cmd>CodeActionMenu<cr>", { desc = "Code Actions" })

-- git blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "Toggle Git Blame" })
keymap.set("n", "<leader>ghf", ":GitBlameOpenFileURL<CR>", { desc = "Open File URL in Github" })
keymap.set("n", "<leader>ghc", ":GitBlameOpenCommitURL<CR>", { desc = "Open Commit URL in Github" })

-- diffview
keymap.set("n", "<leader>gc", ":DiffviewOpen<CR>", { desc = "View All Changes" })
keymap.set("n", "<leader>gf", ":DiffviewFileHistory %<CR>", { desc = "View File History" })
keymap.set("n", "<leader>gr", ":DiffviewFileHistory<CR>", { desc = "View Full Repo History" })

-- spectre
keymap.set("n", "<leader>r", ":Spectre<CR>", { desc = "Global Find & Replace" })

-- harpoon
-- this was hl for Harpoon List and ha for Harpoon Add
-- but then I moved from hjkl to jkl; and muscle memory stuck
vim.keymap.set("n", "<leader>ja", harpoon_mark.add_file)
vim.keymap.set("n", "<leader>j;", harpoon_ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function()
	harpoon_ui.nav_file(1)
end)
vim.keymap.set("n", "<C-t>", function()
	harpoon_ui.nav_file(2)
end)
vim.keymap.set("n", "<C-n>", function()
	harpoon_ui.nav_file(3)
end)
vim.keymap.set("n", "<C-s>", function()
	harpoon_ui.nav_file(4)
end)

-- luasnip
vim.keymap.set({ "i" }, "<C-K>", function()
	luasnip.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-n>", function()
	luasnip.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-b>", function()
	luasnip.jump(-1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end, { silent = true })

-- hlslens
vim.api.nvim_set_keymap(
	"n",
	"n",
	[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"N",
	[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>/",
	"<Cmd>noh<CR>",
	{ noremap = true, silent = true, desc = "Clear Search Highlight" }
)

-- leap
vim.keymap.set("n", "s", "<Plug>(leap-forward-to)", { noremap = true })
vim.keymap.set("n", "S", "<Plug>(leap-backward-to)", { noremap = true })
