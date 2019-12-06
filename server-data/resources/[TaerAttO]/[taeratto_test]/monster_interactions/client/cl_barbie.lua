-- Barbie was here --
local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local Blips                   = {}

local isCarry 				  = false
local hasRope 				  = true
local hasUsedRope 			= true
local isRequestAnim = false
local isDead = false

-- ESX                     = nil

-- Citizen.CreateThread(function()
--   while ESX == nil do
--     TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--     Citizen.Wait(0)
--   end
-- end)

RegisterCommand("barbielyftupp", function()
  OpenActionMenuInteraction()
end)


function OpenActionMenuInteraction(type)
	local closestPlayer, distance = ESX.Game.GetClosestPlayer()
	if isCarry then
		TriggerServerEvent('taeratto_interaction:server:ExitFromInteraction', GetPlayerServerId(closestPlayer))
		ClearPedTasksImmediately(PlayerPedId())
		isCarry = false
	else
		if distance ~= -1 and distance <= 3.0 then
			TriggerServerEvent('taeratto_interaction:server:RequestInteraction', GetPlayerServerId(closestPlayer), IsPedDeadOrDying(GetPlayerPed(closestPlayer)))
			

		else
			-- exports['Monster_base']:textNotification("ไม่มีใครอยู่ใกล้คุณ")
		end
	end
end

RegisterNetEvent('taeratto_interaction:client:SendAcceptToSource')
AddEventHandler('taeratto_interaction:client:SendAcceptToSource', function()
	Citizen.Wait(200)
	local dict = "anim@heists@box_carry@"
	
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end	

	-- TriggerServerEvent('esx_barbie_lyftupp:lyfter', GetPlayerServerId(closestPlayer))		
	
	TaskPlayAnim(PlayerPedId(), dict, "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
	isCarry = true
end)

RegisterNetEvent('taeratto_interaction:client:RequestReceive')
AddEventHandler('taeratto_interaction:client:RequestReceive', function(dead)
	isRequestAnim = true
	if dead then
		local closestPlayer, distance = ESX.Game.GetClosestPlayer()
		TriggerServerEvent('taeratto_interaction:server:AcceptRequest', GetPlayerServerId(closestPlayer))
		isRequestAnim = false
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 246) and isRequestAnim then
			local closestPlayer, distance = ESX.Game.GetClosestPlayer()
			TriggerServerEvent('taeratto_interaction:server:AcceptRequest', GetPlayerServerId(closestPlayer))
			isRequestAnim = false
		elseif IsControlJustPressed(1, 182) and isRequestAnim then
			isRequestAnim = false
		end
	end
end)

function LoadAnimationDictionary(animationD)
	while (not HasAnimDictLoaded(animationD)) do
		RequestAnimDict(animationD)
		Citizen.Wait(1)
	end
end

RegisterNetEvent('esx_barbie_lyftupp:upplyft')
AddEventHandler('esx_barbie_lyftupp:upplyft', function(target)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	-- local lPed = GetPlayerPed(-1)
	local dict = "amb@code_human_in_car_idles@low@ps@"
	
	if isCarry == false then
		LoadAnimationDictionary("amb@code_human_in_car_idles@generic@ps@base")
		TaskPlayAnim(playerPed, "amb@code_human_in_car_idles@generic@ps@base", "base", 8.0, -8, -1, 33, 0, 0, 40, 0)
		
		AttachEntityToEntity(playerPed, targetPed, 9816, 0.015, 0.38, 0.11, 0.9, 0.30, 90.0, false, false, false, false, 2, false)
		
		isCarry = true
	else
		DetachEntity(playerPed, true, false)
		ClearPedTasksImmediately(targetPed)
		ClearPedTasksImmediately(playerPed)
		
		isCarry = false
	end
end)

RegisterNetEvent('taeratto_interaction:client:SendAcceptToTarget')
AddEventHandler('taeratto_interaction:client:SendAcceptToTarget', function(target)
	local playerPed = PlayerPedId() --GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	-- local lPed = GetPlayerPed(-1)
	-- local dict = "amb@code_human_in_car_idles@low@ps@"
	
	if isCarry == false then
		LoadAnimationDictionary("amb@code_human_in_car_idles@generic@ps@base")
		TaskPlayAnim(playerPed, "amb@code_human_in_car_idles@generic@ps@base", "base", 8.0, -8, -1, 33, 0, 0, 40, 0)
		
		AttachEntityToEntity(playerPed, targetPed, 9816, 0.015, 0.38, 0.11, 0.9, 0.30, 90.0, false, false, false, false, 2, false)
		
		isCarry = true
	end
end)

RegisterNetEvent('taeratto_interaction:client:ReleaseTarget')
AddEventHandler('taeratto_interaction:client:ReleaseTarget', function()
	if isCarry then
		DetachEntity(PlayerPedId(), true, false)
		ClearPedTasksImmediately(PlayerPedId())
		
		isCarry = false
	end
end)

--[[Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsControlJustReleased(0, Keys['F9']) and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'action_menu') then
		OpenActionMenuInteraction()
    end
  end
end)--]]

RegisterNetEvent('esx_barbie_lyftupp')
AddEventHandler('esx_barbie_lyftupp', function()
  OpenActionMenuInteraction()
end)
