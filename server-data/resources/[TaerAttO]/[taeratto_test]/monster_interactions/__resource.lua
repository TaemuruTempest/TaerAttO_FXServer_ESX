resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'monster interaction'

server_scripts {
	'server/main.lua',
	-- 'server/sv_barbie.lua',
	-- "server/sv_carry.lua",
	-- "server/sv_piggyback.lua",
	-- "server/sv_takehostage.lua",
}

client_scripts {
	'config.lua',
	'client/main.lua',
	-- 'client/cl_barbie.lua',
	-- "client/cl_carry.lua",
	-- "client/cl_piggyback.lua",
	-- "client/cl_takehostage.lua",
}
