
  ESX                    = nil
  
  Citizen.CreateThread(function()
	  while ESX == nil do
		  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		  Citizen.Wait(0)
	  end
  end)

  Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = vector3(510.76, -1074.96, 28.8)
        local pelaajanposition = GetEntityCoords(PlayerPedId())
        local distance = #(pelaajanposition - coords)
        if distance < 4 then
            ESX.Text3D(510.76, -1074.96, 28.8, "Paina [~w~E]~w~ myydäksesi ~b~metasi")
        end
    end
end)


Citizen.CreateThread(function()
	while true do
	  
	Citizen.Wait(5)

		local coords = GetEntityCoords(GetPlayerPed(-1))
		if GetDistanceBetweenCoords(coords, 510.76, -1074.96, 28.8, true) < 50 then
			if GetDistanceBetweenCoords(coords, 510.76, -1074.96, 28.8, true) < 1.5 then
				SetTextComponentFormat('STRING')
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				
				if IsControlPressed(0, 38) then
				FreezeEntityPosition(PlayerPedId(), true)
				  ExecuteCommand("e uncuff")
				  TriggerEvent("el1te_progbar:client:progress", {
					  name = "unique_action_name",
					  duration = 2000,
					  label = "Myyt huumeitasi...",
					  useWhileDead = false,
					  canCancel = false,
					  controlDisables = {
						  disableMovement = true,
						  disableCarMovement = true,
						  disableMouse = false,
						  disableCombat = true,
					  },
					  animation = {
						  animDict = " ",
						  anim = " ",
					  },
					  prop = {
						  model = " ",
					  }
				  }, function(status)
					  if not status then
					  end
				  end) 
				  Citizen.Wait(2000)
					TriggerServerEvent('H:myin')
					FreezeEntityPosition(PlayerPedId(), false)
				end
			end
		end
	end
end)

  Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords2 = vector3(5173.88, -4675.52, 2.44)
		local pelaajanposition = GetEntityCoords(PlayerPedId())
		local distance = #(pelaajanposition - coords2)
		if distance < 4 then
			ESX.Text3D(5173.88, -4675.52, 2.44, "Paina ~b~[E]~w~ kerätäksesi metalikööriä")
		end
	end
end)

  Citizen.CreateThread(function()
	while true do
	  
	Citizen.Wait(5)

		local coords = GetEntityCoords(GetPlayerPed(-1))
		if GetDistanceBetweenCoords(coords, 5173.88, -4675.52, 2.44, true) < 50 then
			if GetDistanceBetweenCoords(coords, 5173.88, -4675.52, 2.44, true) < 1.5 then
				SetTextComponentFormat('STRING')
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				
				if IsControlPressed(0, 38) then
				FreezeEntityPosition(PlayerPedId(), true)
				  ExecuteCommand("e mechanic4")
				  TriggerEvent("el1te_progbar:client:progress", {
					  name = "unique_action_name",
					  duration = 5000,
					  label = "Keräät metalikööriä...",
					  useWhileDead = false,
					  canCancel = false,
					  controlDisables = {
						  disableMovement = true,
						  disableCarMovement = true,
						  disableMouse = false,
						  disableCombat = true,
					  },
					  animation = {
						  animDict = " ",
						  anim = " ",
					  },
					  prop = {
						  model = " ",
					  }
				  }, function(status)
					  if not status then
					  end
				  end) 
				  Citizen.Wait(5100)
					TriggerServerEvent('huume:kerays')
					FreezeEntityPosition(PlayerPedId(), false)
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords2 = vector3(4864.04, -4627.0, 14.84)
        local pelaajanposition = GetEntityCoords(PlayerPedId())
        local distance = #(pelaajanposition - coords2)
        if distance < 4 then
            ESX.Text3D(4864.04, -4627.0, 14.84, "Paina ~b~[E]~w~ valmistaaksesi metaa")
        end
    end
end)

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(5)

		local coords = GetEntityCoords(GetPlayerPed(-1))
		if GetDistanceBetweenCoords(coords, 4864.04, -4627.0, 14.84, true) < 50 then
			if GetDistanceBetweenCoords(coords, 4864.04, -4627.0, 14.84, true) < 1.5 then
				SetTextComponentFormat('STRING')
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				
				if IsControlPressed(0, 38) then
					ExecuteCommand("e bbq")
					TriggerEvent("el1te_progbar:client:progress", {
						name = "unique_action_name",
						duration = 5000,
						label = "Valmistetaas metaa...",
						useWhileDead = false,
						canCancel = false,
						controlDisables = {
							disableMovement = true,
							disableCarMovement = true,
							disableMouse = false,
							disableCombat = true,
						},
						animation = {
							animDict = " ",
							anim = " ",
						},
						prop = {
							model = " ",
						}
					}, function(status)
						if not status then
						end
					end) 
					Citizen.Wait(5100)
					  TriggerServerEvent('huume:valmistus')
				  end
			  end
		  end
	  end
  end)

  function Draw3DText(coords, text, scale)
	  local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z + 1.0)
  
	  SetTextScale(scale, scale)
	  SetTextOutline()
	  SetTextDropShadow()
	  SetTextDropshadow(2, 0, 0, 0, 255)
	  SetTextFont(4)
	  SetTextProportional(1)
	  SetTextEntry('STRING')
	  SetTextCentre(1)
	  SetTextColour(255, 255, 255, 215)
	  AddTextComponentString(text)
	  DrawText(x, y)
	  local factor = (string.len(text)) / 400
	  DrawRect(x, y+0.012, 0.015+ factor, 0.03, 41, 11, 41, 68)
  end