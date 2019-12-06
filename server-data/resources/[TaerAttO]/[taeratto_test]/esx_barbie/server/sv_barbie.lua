ESX = nil

-- local give = false
-- local usedRope = false

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('esx_barbie_lyftupp:lyfter')
AddEventHandler('esx_barbie_lyftupp:lyfter', function(target)
	local targetPlayer = ESX.GetPlayerFromId(target)

	TriggerClientEvent('esx_barbie_lyftupp:upplyft', targetPlayer.source, source)
end)

RegisterServerEvent('taeratto_barbie:server:RequestLyftup')
AddEventHandler('taeratto_barbie:server:RequestLyftup', function(target, dead)
	textNotification(target, 'inform', 'หมายเลข '..source..' พยายามอุ้มคุณ!', 4500, {})
	if not dead then
		textNotification(target, 'inform', '<font color="#7CFC00">กด Y ยอมรับ</font> | <font color="#FF0000">กด L ปฎิเสธ</font>', 8500, { ['background-color'] = '#FFFFE0', ['color'] = '#000000' })
	end
	TriggerClientEvent('taeratto_barbie:client:RequestReceive', target, dead)
end)

RegisterNetEvent('taeratto_barbie:server:ExitFromLyftup')
AddEventHandler('taeratto_barbie:server:ExitFromLyftup', function(target)
	TriggerClientEvent('taeratto_barbie:client:ReleaseTarget', target)
end)

RegisterNetEvent('taeratto_barbie:server:AcceptRequest')
AddEventHandler('taeratto_barbie:server:AcceptRequest', function(target)
	TriggerClientEvent('taeratto_barbie:client:SendAcceptToSource', target)
	TriggerClientEvent('taeratto_barbie:client:SendAcceptToTarget', source, target)
end)


function textNotification(_source, type, text, length, style)
	TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = type, text = text, length = length, style = style })
end