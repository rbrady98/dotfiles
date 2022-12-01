local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠔⡫⠒⠪⡲⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⣀⠄⣰⡿⡫⠊⡀⠀⠀⠀⠫⡻⣧⠉⠁⠐⠀⡤⣄⠀⠀⠀",
"⠀⠀⠀⠀⠐⠋⠁⠀⣜⡜⠠⠂⣀⡀⠀⠀⠐⢌⢝⡌⠑⢠⡐⢀⠎⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⣼⣿⡀⢁⣾⣿⡇⠀⣿⢷⡈⣸⣾⡄⢠⢓⠂⠀⠀⠀⠀",
"⠀⠀⠀⠠⣦⠀⠀⣿⣿⣿⠘⠷⠿⠃⣀⠻⠿⠧⢿⣿⡇⢂⢶⡆⠀⠀⠀⠀",
"⠀⣠⠤⣤⡿⢦⡀⠸⣻⣷⣤⣤⠀⠘⠉⠀⢢⣤⣾⢿⢃⣦⣾⣥⣤⣤⡀⠀",
"⠀⢉⡭⣿⣿⣹⣿⣦⣱⡙⣿⣿⡶⢶⣶⢶⠿⣿⣿⢊⣾⣿⡳⣿⣭⣍⠀⠀",
"⠀⠀⠉⠿⢿⣿⣿⣿⣿⣿⣶⣿⣾⣿⣾⣿⣿⣷⢋⣾⡷⣿⡟⢯⠎⠁⠀⠀",
"⠀⠀⠀⠀⠈⢽⣿⣿⣿⣿⣿⣿⡉⠙⠏⠉⣹⢃⣾⣿⣇⣟⠇⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠈⠙⠛⠋⠹⣿⣿⣷⣦⣠⣾⢃⣾⡏⠈⠉⠁⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⢣⣾⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⣀⣤⣤⣄⠀⠀⠀⠀⣿⣿⣿⡿⢡⣾⣿⣿⡇⠀⠀⢠⣴⠶⣶⣖⣄⠀",
"⢠⣿⣿⡋⡤⢽⡇⠀⠀⣼⣿⣿⡿⢡⣿⣿⣿⣿⣿⠀⠀⠸⣧⣲⠈⣩⣾⡇",
"⠉⣛⡛⢆⠉⠉⠀⣠⣾⣿⣿⠟⢠⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⣴⣿⠿⠗",
"⠀⢤⠉⢸⡿⣿⣿⣿⣿⣿⠋⢠⣿⣿⣿⢿⣿⣿⣿⣿⣿⣟⣿⣿⡛⠁⠐⡒",
"⠀⠀⠀⠁⠿⢟⣫⣭⠟⠁⠀⡜⠆⠉⠸⠀⠙⠛⠟⠿⡟⠉⠀⢁⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}


dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button("r", "淚 Recent files", ":Telescope oldfiles<CR>"),
  dashboard.button("q", "⏻  Quit", ":qa<CR>")
}

dashboard.section.header.opts.hl = "Macro"

alpha.setup(dashboard.opts)
vim.cmd([[autocmd Filetype alpha setlocal nofoldenable]])
