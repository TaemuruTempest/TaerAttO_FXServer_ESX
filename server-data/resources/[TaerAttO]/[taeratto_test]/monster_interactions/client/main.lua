local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["J"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }

ESX              = nil
local PlayerData = {}
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
local typeclient = ''
local restricted = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)


RegisterCommand("barbielyftupp", function()
	OpenActionMenuInteraction("barbielyftupp")
end, restricted)

RegisterCommand('carry', function()
	OpenActionMenuInteraction("carry")
end, restricted)
  
RegisterCommand('piggyback', function()
	OpenActionMenuInteraction("piggyback")
end, restricted)
  
  function OpenActionMenuInteraction(type)
	  local closestPlayer, distance = ESX.Game.GetClosestPlayer()
	  if isCarry then
		  TriggerServerEvent('taeratto_interaction:server:ExitFromInteraction', GetPlayerServerId(closestPlayer))
		  ClearPedTasksImmediately(PlayerPedId())
		  isCarry = false
	  else
		  if distance ~= -1 and distance <= 3.0 then
			  TriggerServerEvent('taeratto_interaction:server:RequestInteraction', GetPlayerServerId(closestPlayer), IsPedDeadOrDying(GetPlayerPed(closestPlayer)), type)
			  
  
		  else
			  -- exports['Monster_base']:textNotification("ไม่มีใครอยู่ใกล้คุณ")
		  end
	  end
  end
  
  RegisterNetEvent('taeratto_interaction:client:SendAcceptToSource')
  AddEventHandler('taeratto_interaction:client:SendAcceptToSource', function(type)
	local animData = Config.Interaction[type].src
	  Citizen.Wait(200)
	  local dict = animData.animDictionary --"anim@heists@box_carry@"
	  
	  RequestAnimDict(dict)
	  while not HasAnimDictLoaded(dict) do
		  Citizen.Wait(100)
	  end	
  
	  -- TriggerServerEvent('esx_barbie_lyftupp:lyfter', GetPlayerServerId(closestPlayer))		
	  
	  TaskPlayAnim(PlayerPedId(), dict, animData.animationName, animData.blendInSpeed, animData.blendOutSpeed, animData.duration, animData.flag, 0, false, false, false)
	  isCarry = true
  end)
  
  RegisterNetEvent('taeratto_interaction:client:RequestReceive')
  AddEventHandler('taeratto_interaction:client:RequestReceive', function(dead, type)
	  isRequestAnim = true
	  typeclient = type
	  if dead then
		  local closestPlayer, distance = ESX.Game.GetClosestPlayer()
		  TriggerServerEvent('taeratto_interaction:server:AcceptRequest', GetPlayerServerId(closestPlayer), type)
		  isRequestAnim = false
	  end
  end)
  
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  if IsControlJustPressed(1, 246) and isRequestAnim then
			  local closestPlayer, distance = ESX.Game.GetClosestPlayer()
			  TriggerServerEvent('taeratto_interaction:server:AcceptRequest', GetPlayerServerId(closestPlayer), typeclient)
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
  AddEventHandler('taeratto_interaction:client:SendAcceptToTarget', function(target, type)
	  local playerPed = PlayerPedId() --GetPlayerPed(-1)
	  local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	  -- local lPed = GetPlayerPed(-1)
	  -- local dict = "amb@code_human_in_car_idles@low@ps@"
	  
	  if isCarry == false then
	  	local animData = Config.Interaction[type].dest
		LoadAnimationDictionary(animData.animDictionary)
		TaskPlayAnim(playerPed, animData.animDictionary, animData.animationName, animData.blendInSpeed, animData.blendOutSpeed, animData.duration, animData.flag, 0, 0, animData.lockY, 0)
		if type == 'carry' then
			AttachEntityToEntity(playerPed, targetPed, 0, 0.27, 0.15, 0.63, 0.5, 0.5, 0.0, false, false, false, false, 2, false)
		elseif type == 'barbielyftupp' then
			AttachEntityToEntity(playerPed, targetPed, 9816, 0.015, 0.38, 0.11, 0.9, 0.30, 90.0, false, false, false, false, 2, false)
		elseif type == 'piggyback' then
			AttachEntityToEntity(playerPed, targetPed, 0, 0.0, -0.07, 0.45, 0.5, 0.5, 0.0, false, false, false, false, 2, false)
		end
		  
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
  
