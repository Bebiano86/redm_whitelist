fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'RedM Whitelist'

version '1.1.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'locale.lua',
	'config.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'locales/sv.lua',
	'server/main.lua',
	'server/commands.lua'
}
