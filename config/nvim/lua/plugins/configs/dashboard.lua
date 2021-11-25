local g = vim.g

g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"


local kraken = {
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠤⠤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠪⠃⠀⠀⠙⢕⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⢶⠰⠴⠤⣄⠀⠀⠀⠀⠀⠀⠀⠀⣰⠣⠀⠨⠂⠐⠅⠀⠘⣆⠀⠀⠀⠀⠀⠀⠀⠀⣠⠤⠦⠆⡶⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡎⡰⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⢰⢃⡅⠀⠨⠂⠐⠅⠀⠈⡘⡆⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⢆⢱⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⢅⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡾⡄⠈⢪⠵⡮⡕⠁⢠⢱⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠨⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⢀⣠⡤⠤⠤⠤⠤⣵⠀⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣟⣽⡃⠨⠂⠐⠅⢘⣯⣻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⠀⣯⠤⠤⠤⠤⢤⣄⡀⠀⠀⠀⠀⠀",
  "⠀⠀⢀⡴⠋⣁⡠⠥⠶⠭⠶⣶⣿⢁⠸⠉⠢⣀⠀⠀⠀⠀⠀⠀⠀⠘⣬⠿⠋⠀⠀⠀⠀⠙⠿⣥⠃⠀⠀⠀⠀⠀⠀⠀⣀⠔⢉⠇⡈⣷⣶⠶⠭⠶⠬⢤⣈⠙⢦⡀⠀⠀",
  "⠀⠀⠊⣤⠜⠃⠀⠀⠀⠀⠀⠀⢸⠀⠀⣧⣀⠈⠑⠠⠀⠀⠀⠀⠀⠀⢸⡎⠀⢜⡽⢯⡣⠀⢱⡇⠀⠀⠀⠀⠀⠀⠄⠊⠁⣠⣼⠀⠀⡇⠀⠀⠀⠀⠀⠀⠘⠣⡤⠑⠀⠀",
  "⠀⠀⠈⢻⠀⠀⠀⠀⠀⠀⠀⠀⢸⢅⠀⢇⠹⣌⢄⡀⠙⠲⠤⣀⡠⠔⡣⡃⠀⢜⡽⢯⡣⠀⢐⢌⠢⢄⣀⠤⠖⠋⢀⡠⣥⠎⡸⠀⡨⡇⠀⠀⠀⠀⠀⠀⠀⠀⡟⠁⠀⠀",
  "⠀⠀⢇⢻⡄⠀⠀⠀⠀⠀⠀⠀⠀⢏⣀⠀⠱⢄⣉⠛⠽⣂⣀⡤⠞⢋⡺⠈⠀⢜⡽⢯⡣⠀⠁⢗⡙⠲⢤⣀⣐⠮⠛⣉⡠⠎⠀⣠⡹⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⡸⠀⠀",
  "⠀⠀⠈⢪⠵⠀⠀⠀⠀⢀⡠⠴⠖⠚⠧⠶⣄⣀⡨⠍⡩⢡⢤⣠⡴⡞⠁⢸⠀⢜⡽⢯⡣⠀⡇⠈⢳⢦⣄⡠⡌⢍⠩⡁⣀⣤⠶⠼⠓⠲⠦⢄⡀⠀⠀⠀⠀⡮⡕⠁⠀⠀",
  "⠀⠀⠀⠀⢬⠀⠀⢀⡠⡉⡀⠴⠴⠶⠾⢄⣌⠙⠯⠗⣚⣚⣉⠡⠊⠀⠀⣻⠀⠀⢀⠀⠀⠀⣟⠀⠀⠑⠌⣉⣓⣓⠺⠽⠋⣡⡠⠳⠶⠶⠦⢀⢉⢄⡀⠀⠀⡥⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠸⡨⢽⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠀⠀⣠⠃⠀⢜⡽⢯⡣⠀⠘⣄⠀⠀⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡯⢅⠇⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠣⡰⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠄⠚⠁⢀⣪⠞⠁⠈⠳⣕⣀⠈⠓⠠⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢆⠜⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠙⡛⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠴⠊⢁⠀⣄⣦⠎⠁⠀⠀⠀⠀⠈⠱⣴⣠⠀⡈⠑⠦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⢛⠋⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢢⠣⠀⠀⠀⠀⢠⠔⠋⠁⢔⣢⠬⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⠥⣔⡢⠈⠙⠢⡄⠀⠀⠀⠀⠜⡔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⠂⠀⢀⠖⢁⣦⠕⠃⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠘⠪⣴⡈⠲⡀⠀⠐⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠔⠀⠀⡞⡠⠙⠁⠀⠀⠀⠀⠀⠀⠀ N E O V I M⠀⠀⠀⠀⠀⠀⠀⠈⠋⢄⢳⠀⠀⠣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⢊⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡑⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣄⠲⡀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠂⠀⠀⠀⠀⠀⠀⠐⠂⠀⠀⠀⠀⠀⠀⠀⠀⢀⠖⣠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⢞⡂⠄⡤⡤⠠⡴⠊⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠑⢦⠄⢤⢤⠠⢐⡳⠔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}

local hydra = {
   "                                   ",
   "                                   ",
   "                                   ",
   "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
   "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
   "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
   "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
   "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
   "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
   "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
   " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
   " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
   "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
   "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
   "                                   ",
}

local doggy = {
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣄⣤⣤⣤⣤⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⠟⠿⠛⠛⠛⠛⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⠿⠛⠁⡠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠉⠛⠿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡏⠀⠀⠀⢀⣼⡇⠀⠀⠀⠗⠀⠀⠀⣤⣶⣦⠀⠀⠈⠁⠀⠀⠀⢸⣿⣦⣀⠀⠀⠀⣸⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣇⠀⣀⣴⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠟⠛⠛⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣷⣦⣴⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠑⠠⠤⠛⠤⠤⠄⠃⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡇⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⡏⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⡇⢿⣿⣿⣶⣤⣤⣤⣤⣤⣤⣤⣤⣶⣾⣿⣿⣿⡟⠀⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⡇⠈⠻⣿⣿⣿⣿⣿⣿⠛⣿⣿⣿⣿⣿⣿⠟⠋⠀⠀⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⡇⠀⠈⠙⣿⣿⣶⠀⠀⢰⣿⣿⡿⠋⠁⠀⠀⠀⠀⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⡇⠀⠀⠀⠀⠈⠻⣷⣾⣿⣾⠟⠉⠀⠀⠀⠀⠀⠀⠀⢼⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠿⣷⠀⠀⠀⠀⠀⠀⠈⠛⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}

g.dashboard_custom_header = hydra

g.dashboard_custom_section = {
   a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
   b = { description = { "  Recents                   SPC f o" }, command = "Telescope oldfiles" },
   c = { description = { "  Find Word                 SPC f w" }, command = "Telescope live_grep" },
   d = { description = { "洛 New File                  SPC f n" }, command = "DashboardNewFile" },
   e = { description = { "  Ranger                    SPC r f" }, command = "!kitty ranger &" },
   g = { description = { "  Bookmarks                 SPC b m" }, command = "Telescope marks" },
   h = { description = { "  Load Last Session         SPC l  " }, command = "SessionLoad" },
}

g.dashboard_custom_footer = {
   "",
}
