-- ESX = nil

-- -- local give = false
-- -- local usedRope = false

-- TriggerEvent('esx:getSharedObject', function(obj)
-- 	ESX = obj
-- end)

RegisterServerEvent('esx_barbie_lyftupp:lyfter')
AddEventHandler('esx_barbie_lyftupp:lyfter', function(target)
	-- local targetPlayer = ESX.GetPlayerFromId(target)

	TriggerClientEvent('esx_barbie_lyftupp:upplyft', target, source)
end)

RegisterServerEvent('taeratto_interaction:server:RequestInteraction')
AddEventHandler('taeratto_interaction:server:RequestInteraction', function(target, dead)
	textNotification(target, 'inform', 'หมายเลข '..source..' พยายามอุ้มคุณ!', 4500, {})
	if not dead then
		textNotification(target, 'inform', '<font color="#7CFC00">กด Y ยอมรับ</font> | <font color="#FF0000">กด L ปฎิเสธ</font>', 8500, { ['background-color'] = '#FFFFE0', ['color'] = '#000000' })
	end
	TriggerClientEvent('taeratto_interaction:client:RequestReceive', target, dead)
end)

RegisterNetEvent('taeratto_interaction:server:ExitFromInteraction')
AddEventHandler('taeratto_interaction:server:ExitFromInteraction', function(target)
	TriggerClientEvent('taeratto_interaction:client:ReleaseTarget', target)
end)

RegisterNetEvent('taeratto_interaction:server:AcceptRequest')
AddEventHandler('taeratto_interaction:server:AcceptRequest', function(target)
	TriggerClientEvent('taeratto_interaction:client:SendAcceptToSource', target)
	TriggerClientEvent('taeratto_interaction:client:SendAcceptToTarget', source, target)
end)


function textNotification(_source, type, text, length, style)
	TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = type, text = text, length = length, style = style })
end