TriggerEvent('es:addGroupCommand', 'wlrefresh', 'admin', function (source, args, user)
	loadWhiteList(function()
		TriggerEvent('redm_whitelist:sendMessage', source, 'Whitelist', 'Whitelist reloaded')
	end)
end, function (source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficienct permissions!' } })
end, { help = _U('help_whitelist_load') })

TriggerEvent('es:addGroupCommand', 'wladd', 'admin', function (source, args, user)
	local steamID = 'steam:' .. args[1]:lower()

	if string.len(steamID) ~= 21 then
		TriggerEvent('redm_whitelist:sendMessage', source, '^1SYSTEM', 'Invalid steam ID length!')
		return
	end

	MySQL.Async.fetchAll('SELECT * FROM whitelist WHERE identifier = @identifier', {
		['@identifier'] = steamID
	}, function(result)
		if result[1] ~= nil then
			TriggerEvent('redm_whitelist:sendMessage', source, '^1SYSTEM', 'The player is already whitelisted on this server!')
		else
			MySQL.Async.execute('INSERT INTO whitelist (identifier) VALUES (@identifier)', {
				['@identifier'] = steamID
			}, function (rowsChanged)
				table.insert(WhiteList, steamID)
				TriggerEvent('redm_whitelist:sendMessage', source, 'Whitelist', 'The player has been whitelisted!')
			end)
		end
	end)
end, function (source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficienct permissions!' } })
end, { help = _U('help_whitelist_add'), params = { steam = 'SteamID', help = 'SteamID formated to hex, begins with 11' }})

-- console / rcon can also utilize es:command events, but breaks since the source isn't a connected player, ending up in error messages
AddEventHandler('redm_whitelist:sendMessage', function(source, title, message)
	if source ~= 0 then
		TriggerClientEvent('chat:addMessage', source, { args = { title, message } })
	else
		print('redm_whitelist: ' .. message)
	end
end)