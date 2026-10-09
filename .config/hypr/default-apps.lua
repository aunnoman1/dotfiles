-- Set programs that you use
-- Other files get these via: local apps = require("default-apps")

return {
    terminal    = "kitty",
    fileManager = "thunar",
    menu        = [["$(wofi --show drun --define=drun-print_desktop_file=true | sed -E "s/(\.desktop) /\1:/")"]],
}
