fx_version 'adamant'
game 'gta5'

author "Tanukii"
description "dsc.gg/rfsstore"

client_scripts {
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua",
    "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",
    'client/*.lua',
    'config.lua'
}

server_scripts {
    "server/*.lua",
    'config.lua'
}

shared_script 'config.lua'