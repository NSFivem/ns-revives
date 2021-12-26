--NS100#0001
AddEventHandler('onClientMapStart', function()
	exports.spawnmanager:spawnPlayer() 
	Citizen.Wait(2500)
	exports.spawnmanager:setAutoSpawn(false)
end)


local ped = GetPlayerPed(-1)
local test = PlayerPedId()
local creator = "NS100#0001"


Citizen.CreateThread(function()
while true do
    Citizen.Wait(0)
        if IsEntityDead(ped) and ped ~= nil and ped ~= 0 then
            SetPlayerInvincible(ped, true)
            SetEntityHealth(ped, 1)
            notify("Press [~r~E~w~] Or [~r~Q~w~] To Revive")

            if IsControlJustPressed(0, 38) then
                DoScreenFadeOut(800)
                revivePed(ped)
				else
					Citizen.Wait(3)
                end	

            elseif IsControlJustPressed(0, 45) then
				respawnPed(ped)
                SetEntityCoords(ped, 780.4787, 1334.886, 549.7113) -- put the coords for rz or something
                print("Set Coords.")
                print(creator)
            end
        end
end)


function revivePed(ped)
	local playerPos = GetEntityCoords(ped, true)
	isDead = false
	timerCount = reviveWait
	NetworkResurrectLocalPlayer(playerPos, true, true, false)
	SetPlayerInvincible(ped, false)
	ClearPedBloodDamage(ped)
end


function notify(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentSubstringPlayerName(text)
	DrawNotification(true, true)
end
