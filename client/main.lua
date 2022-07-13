ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(10)
    end

ESX.PlayerData = ESX.GetPlayerData()
end)

print('^1By^7 ^4Tanukii#7115 - dsc.gg/rfs-store')

function SpawnVehicle(model)
    local hash = GetHashKey(model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do Wait(10) end 

    local veh = CreateVehicle(hash, Spawn.coords.x, Spawn.coords.y, Spawn.coords.z, Spawn.coords.h, true, false)
    SetVehicleNumberPlateText(veh, Spawn.Plate)
    SetVehicleCustomPrimaryColour(veh, Spawn.primaryColor.R,Spawn.primaryColor.G,Spawn.primaryColor.B) 
	SetVehicleCustomSecondaryColour(veh, Spawn.secondaryColor.R,Spawn.secondaryColor.G,Spawn.secondaryColor.B)
    if Spawn.MaxSpeed then
        Spawn.MaxSpeed = Spawn.MaxSpeed/3.6
        SetEntityMaxSpeed(veh, Spawn.MaxSpeed)
    end
    if Spawn.TpPlayerInVehicle then
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    end 
end
open = false
local mainMenu = RageUI.CreateMenu("tnLocation", "Interaction")
mainMenu.Closed = function()
	open = false 
end

function OpenMenu()
	if open then 
		open = false 
		RageUI.Visible(mainMenu, false)
		return 
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		Citizen.CreateThread(function()
			while open do 
				RageUI.IsVisible(mainMenu, function()

                    for k,v in pairs(Vehicles) do
                        RageUI.Button(v.name, nil, {RightLabel = "~g~"..v.price.."~s~ $"}, true, {
                            onSelected = function()
                                ESX.TriggerServerCallback("tnLocation:payLocation", function(data)
                                    if data then 
                                        SpawnVehicle(v.model)
                                    end
                                end, v.price)
                            end
                        })

                    end
					end)
				Wait(0)
			end
		end)
	end
end

Citizen.CreateThread(function()
    while true do
        local waito = false
            local dist = Vdist2(GetEntityCoords(GetPlayerPed(-1)), LocationBlip.coords.x, LocationBlip.coords.y, LocationBlip.coords.z)
            if dist < 6 then
                waito = true 
			          
                if dist < 5 then 
                    Visual.Subtitle("Appuyez sur ~b~E~s~ pour ~p~louer un véhicule~s~.", 1)
                    if IsControlJustPressed(0, 51) then
                        RageUI.CloseAll()
                        OpenMenu()
                    end
                end
            end
        if waito then
            Wait(0)
        else 
            Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
        MapBlip = AddBlipForCoord(LocationBlip.coords.x, LocationBlip.coords.y, LocationBlip.coords.z)
        SetBlipSprite(MapBlip, LocationBlip.sprite)
        SetBlipDisplay(MapBlip, 4)
        SetBlipScale(MapBlip, LocationBlip.scale)
        SetBlipColour(MapBlip, LocationBlip.color)
        SetBlipAsShortRange(MapBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(LocationBlip.name)
        EndTextCommandSetBlipName(MapBlip)
        Citizen.CreateThread(function()
            local hash = GetHashKey(Ped)
            while not HasModelLoaded(hash) do
            RequestModel(hash)
            Wait(20)
            end
            ped = CreatePed("PED_TYPE_MALE", Ped, LocationBlip.coords.x, LocationBlip.coords.y, LocationBlip.coords.z, LocationBlip.coords.h, false, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            TaskStartScenarioInPlace(ped, PedScenario, 0, false)
        end)
end)
