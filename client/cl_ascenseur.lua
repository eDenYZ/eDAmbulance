Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)


--- MENU ---

local open = false 
local mainMenu = RageUI.CreateMenu('~b~Ascenseur', '~b~Ambulance') 
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
end

--- FUNCTION OPENMENU ---

function OpenMenuAscenseurAmbulance() 
    if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
        RageUI.IsVisible(mainMenu, function()


			RageUI.Button("~g~0 ~s~: ~s~[~o~Accueil~s~]", nil, {RightLabel = "→"}, true , {
				onSelected = function()
                    local coords = GetEntityCoords(GetPlayerPed(-1))
                    if GetDistanceBetweenCoords(coords,-436.11, -360.62, 34.95, true) > 0.5 then
                    SetEntityCoords(GetPlayerPed(-1), -436.11, -360.62, 34.95, 0.0, 0.0, 0.0, true)
                    SetEntityHeading(GetPlayerPed(-1), 356.94)
                    RageUI.CloseAll()
				end
            end
			})

			RageUI.Button("~g~1 ~s~: ~s~[~o~Direction~s~]", nil, {RightLabel = "→"}, true , {
				onSelected = function()
                    local coords = GetEntityCoords(GetPlayerPed(-1))
                    if GetDistanceBetweenCoords(coords, -493.61, -327.43, 42.31, true) > 0.5 then
                    SetEntityCoords(GetPlayerPed(-1), -493.61, -327.43, 42.31, 0.0, 0.0, 0.0, true)
                    SetEntityHeading(GetPlayerPed(-1), 175.3)
                    RageUI.CloseAll()
				end
            end
			})

            RageUI.Button("~g~2 ~s~: ~s~[~o~Héliport~s~]", nil, {RightLabel = "→"}, true , {
				onSelected = function()
                    local coords = GetEntityCoords(GetPlayerPed(-1))
                    if GetDistanceBetweenCoords(coords, -439.74, -335.69, 78.3, true) > 0.5 then
                    SetEntityCoords(GetPlayerPed(-1), -439.74, -335.69, 78.3, 0.0, 0.0, 0.0, true)
                    SetEntityHeading(GetPlayerPed(-1), 81.38)
                    RageUI.CloseAll()
				end
            end
			})

		end)			
		Wait(0)
	   end
	end)
 end
end

Citizen.CreateThread(function()
    while true do 
        local wait = 750
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
            for k in pairs(Config.Ascenseur) do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = Config.Ascenseur
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
  
                if dist <= 5.0 then 
                    wait = 0
                    DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
                end
  
                if dist <= 2.0 then 
                    wait = 0
                    Visual.Subtitle(Config.TextAscenseur, 1)
                    if IsControlJustPressed(1,51) then
                        OpenMenuAscenseurAmbulance()
                    end
                end
            end
        end
    Citizen.Wait(wait)
    end
  end)
  