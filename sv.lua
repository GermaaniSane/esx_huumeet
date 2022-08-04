ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function sendToDiscord(color, name, message, footer)
  local embed = {
        {
            ["color"] = color,
            ["title"] = "".. name .."",
            ["description"] = "**```"..message.."```**",
            ["footer"] = {
            ["text"] = footer,
            },
        }
    }

  PerformHttpRequest('WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord2(color, name, message, footer)
  local embed = {
        {
            ["color"] = color,
            ["title"] = "".. name .."",
            ["description"] = "**```"..message.."```**",
            ["footer"] = {
            ["text"] = footer,
            },
        }
    }

  PerformHttpRequest('WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('huume:kerays')
AddEventHandler('huume:kerays', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local nimi = GetPlayerName(source)
  local paljonkoantaa = math.random(1,3)
  local _source  = source
	local xPlayers = ESX.GetPlayers()
  local rahamaara  = 1000

  local cops = 0
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
		end
	end
	
	if cops >= Config.CopsRequired then

	xPlayer.addInventoryItem("meth_pooch", paljonkoantaa)
  sendToDiscord(3447003, "Meta keräys","Pelaaja: "..nimi.."\nKeräsi metalikööriä määrän: "..paljonkoantaa.."")
  TriggerClientEvent('esx:showNotification', xPlayer.source, ('Keräsit ~b~metalikööriä'))
else
  TriggerClientEvent('esx:showNotification', xPlayer.source, ('Ei tarpeeksi ~b~poliiseja~w~ kaupungissa'))
    end
end)

RegisterServerEvent('huume:valmistus')
AddEventHandler('huume:valmistus', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local nimi = GetPlayerName(source)
  local _source  = source
	local xPlayers = ESX.GetPlayers()

  local cops = 0
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
		end
	end
	
	if cops >= Config.CopsRequired then

	if xPlayer.getInventoryItem('meth_pooch').count >= 3 then
	xPlayer.removeInventoryItem('meth_pooch', 3)
	xPlayer.addInventoryItem("meth", 1)
	sendToDiscord2(3447003, "Metan valmistus","Pelaaja: "..nimi.."\nValmisti metaa määrän: 1")
  TriggerClientEvent('esx:showNotification', xPlayer.source, ('Valmistit ~b~metaa'))
  else
  TriggerClientEvent('esx:showNotification', xPlayer.source, ('Mihis ne 3 kpl~b~ metalikööriä~w~ jäikään'))
	end
else
  TriggerClientEvent('esx:showNotification', xPlayer.source, ('Ei tarpeeksi ~b~poliiseja~w~ kaupungissa'))
end
end)

RegisterServerEvent('H:myin')
AddEventHandler('H:myin', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local nimi = GetPlayerName(source)

	if xPlayer.getInventoryItem('meth').count >= 5 then
	xPlayer.removeInventoryItem('meth', 5)

  if Config.blackmoney then
    xPlayer.addAccountMoney('black_money', math.random(Config.MinMoneyFrom5Drug,Config.MaxMoneyFrom5Drug))
    TriggerClientEvent('esx:showNotification', xPlayer.source, ('Myit 5x ~b~metaa'))
  else
    xPlayer.addAccountMoney('bank', math.random(Config.MinMoneyFrom5Drug,Config.MaxMoneyFrom5Drug))
    TriggerClientEvent('esx:showNotification', xPlayer.source, ('Myit 5x ~b~metaa'))
  end
else
  TriggerClientEvent('esx:showNotification', xPlayer.source, ('Ei sulla näytä olevan ~b~5~w~ metaa'))
	end
end)
