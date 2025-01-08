return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        -- ascii-image-converter -W 40 ~/Downloads/monkey-king-head-mascot-logo-line-art_160921-545.jpg -b -n --save-txt .
        -- image: https://www.freepik.com/premium-vector/monkey-king-head-mascot-logo-line-art_42520271.htm
        header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠤⠶⣶⠴⠖⠒⠲⠦⢤⣀⡀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠞⠁⠀⣠⠋⠀⠀⠀⠀⢀⣀⣤⣌⣉⣩⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠖⡏⠀⠀⠀⡇⠀⠀⠀⢀⠞⠁⠀⠀⠀⠀⢙⣲⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣯⠀⠹⣀⠔⢋⣉⠉⠳⣄⣾⠞⠉⣉⡙⠲⡋⠁⠀⠉⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢩⠟⠛⠢⣀⡏⢰⣿⠿⣿⡄⢸⡇⢠⣿⠿⣿⡆⢹⣀⠴⠒⠺⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢶⡋⠢⠀⠀⠈⢳⣤⣤⡴⠟⢀⣼⢷⡀⠻⢦⣤⣤⡞⠁⠀⠀⠔⢙⡶⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢠⡗⣚⣉⣉⣭⣭⣤⣤⠤⢶⠋⠀⠀⠙⠲⠤⣤⣤⣭⣭⣉⣉⣓⢺⡄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢳⡖⠋⠀⣀⠀⠁⠀⠀⠀⠑⢦⣧⠀⡀⣰⡴⠊⠀⠀⠀⠈⠀⣀⠀⠙⢲⡞⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣀⠀⠀⣹⠃⠀⣧⣤⣶⣾⣶⣄⠀⠀⠀⠛⠛⠀⠀⠀⣠⣶⣷⣶⣤⣼⠀⠘⣏⠀⠀⣀⠀⠀⠀⠀
⠀⠀⠀⠀⡟⠒⠚⠁⠀⠀⣼⠀⢻⡻⣄⣨⣷⣄⣠⡀⢀⣄⣠⣾⣅⣠⢟⡟⠀⣷⠀⠀⠈⠓⠒⢻⠀⠀⠀⠀
⠀⠀⠀⠀⠙⠲⣶⠃⠀⠀⠹⡤⠀⠉⠉⠩⡽⠛⠛⠤⠤⠚⠛⢯⠍⠉⠉⠀⢤⠏⠀⠀⠘⣶⠖⠋⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠚⢳⠆⠀⠀⣩⠟⠋⠀⠀⠀⢤⢶⣶⣤⣤⣶⡶⠤⠀⠀⠀⠙⠻⣍⠀⠀⠰⡞⠓⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣀⡴⠋⢀⠔⠈⢿⠀⢠⠒⣶⠦⠤⣀⣈⣻⣟⣁⣀⠤⠴⣶⠒⡄⠀⡿⠁⠢⡀⠙⢦⣀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠙⣿⠁⠀⠀⠈⣣⠈⠀⣿⠦⠒⠒⠀⠀⠀⠀⠒⠒⠴⣿⠀⠁⣜⠁⠀⠀⠈⣿⠋⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢿⠀⢀⠀⠘⠁⢧⣶⡟⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⢻⣶⡼⠈⠃⠀⡀⠀⡿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⠳⡿⡄⠀⠀⠀⠘⠛⣎⠉⠀⣠⠒⠒⣄⠀⠉⣱⠛⠃⠀⠀⠀⢠⢿⠞⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢦⣀⠀⢠⣄⠈⠒⢻⠃⠀⠀⠘⡟⠒⠁⣰⡄⠀⣀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡆⢀⣼⡄⠀⠈⠀⠀⠀⠀⠁⠀⢠⣧⡀⢰⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⠛⠉⠀⠙⢦⡴⢦⠀⠀⡴⢦⡴⠋⠀⠉⠛⠓⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]],
      },
    },
  },
}
