fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
game "gta5"
lua54 'yes'

author "LeSiiN"
version '0.0.1'
description 'NPC Adjuster based of Online Players'
repository 'https://github.com/LeSiiN/lsn-npcadjuster'

shared_scripts {
    '@ox_lib/init.lua',
}

client_scripts {
    'client/main.lua',
}

server_script {
    'server/main.lua'
}

files {
    'config/shared.lua',
}

dependencies {
    'ox_lib',
}