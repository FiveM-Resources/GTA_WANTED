-- Resource Metadata
fx_version 'adamant'
game 'gta5'

author 'SuperCoolNinja'
description 'Experimented html stuff'
version '1.0.0'

client_scripts {
    "client/client_wanted.lua",
    "client/client_sounds.lua"
}

server_scripts {
    "server/server_wanted.lua",
    "server/server_sounds.lua"
}

ui_page "html/index.html"
files {
    "html/index.html",
    "html/config_language.js",
    "html/app.js",
    "html/style.css",
    "html/reset.css",
    "html/sounds/*.ogg", --> all sounds need to be on .ogg
    "img/*.png" --> all img need to be on .png
}