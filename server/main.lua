ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('esx_gym:hireBmx')
AddEventHandler('esx_gym:hireBmx', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 250) then
		xPlayer.removeMoney(250)
			
		notification("Du hyrde en ~g~BMX")
	else
		notification("Du har inte tillräckligt med ~r~pengar")
	end	
end)

RegisterServerEvent('esx_gym:checkChip')
AddEventHandler('esx_gym:checkChip', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local oneQuantity = xPlayer.getInventoryItem('gym_membership').count
	
	if oneQuantity > 0 then
		TriggerClientEvent('esx_gym:trueMembership', source) -- true
	else
		TriggerClientEvent('esx_gym:falseMembership', source) -- false
	end
end)

ESX.RegisterUsableItem('gym_bandage', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('gym_bandage', 1)	
	
	TriggerClientEvent('esx_gym:useBandage', source)
end)

RegisterServerEvent('esx_gym:buyBandage')
AddEventHandler('esx_gym:buyBandage', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 50) then
		xPlayer.removeMoney(50)
		
		xPlayer.addInventoryItem('gym_bandage', 1)		
		notification("Du köpte ett ~g~bandage")
	else
		notification("Du har inte tillräckligt ~r~pengar")
	end	
end)

RegisterServerEvent('esx_gym:buyMembership')
AddEventHandler('esx_gym:buyMembership', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 800) then
		xPlayer.removeMoney(800)
		
		xPlayer.addInventoryItem('gym_membership', 1)		
		notification("Du köpte ett ~g~medlemskap")
		
		TriggerClientEvent('esx_gym:trueMembership', source) -- true
	else
		notification("Du har inte tillräckligt med ~r~pengar")
	end	
end)


RegisterServerEvent('esx_gym:buyProteinshake')
AddEventHandler('esx_gym:buyProteinshake', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 6) then
		xPlayer.removeMoney(6)
		
		xPlayer.addInventoryItem('protein_shake', 1)
		
		notification("Du köpte en ~g~proteinshake")
	else
		notification("Du har inte tillräckligt med ~r~pengar")
	end	
end)

ESX.RegisterUsableItem('protein_shake', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('protein_shake', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 350000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Du drack en ~g~proteinshake')

end)

RegisterServerEvent('esx_gym:buyWater')
AddEventHandler('esx_gym:buyWater', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 1) then
		xPlayer.removeMoney(1)
		
		xPlayer.addInventoryItem('water', 1)
		
		notification("Du köpte en ~g~vattenflaska")
	else
		notification("Du har inte tillräckligt med ~r~pengar")
	end		
end)

RegisterServerEvent('esx_gym:buySportlunch')
AddEventHandler('esx_gym:buySportlunch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 2) then
		xPlayer.removeMoney(2)
		
		xPlayer.addInventoryItem('sportlunch', 1)
		
		notification("Du köpte en ~g~sportlunch")
	else
		notification("Du har inte tillräckligt med ~r~pengar")
	end		
end)

ESX.RegisterUsableItem('sportlunch', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sportlunch', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Du åt en ~g~sportlunch')

end)

RegisterServerEvent('esx_gym:buyPowerade')
AddEventHandler('esx_gym:buyPowerade', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 4) then
		xPlayer.removeMoney(4)
		
		xPlayer.addInventoryItem('powerade', 1)
		
		notification("Du köpte en ~g~powerade")
	else
		notification("Du har inte tillräckligt med ~r~pengar")
	end		
end)

ESX.RegisterUsableItem('powerade', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('powerade', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 700000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Du drack en ~g~powerade')

end)

-- FUNCTIONS IN THE FUTURE (COMING SOON...)

--RegisterServerEvent('esx_gym:trainArms')
--AddEventHandler('esx_gym:trainArms', function()
	
--end)

--RegisterServerEvent('esx_gym:trainChins')
--AddEventHandler('esx_gym:trainArms', function()
	
--end)

--RegisterServerEvent('esx_gym:trainPushups')
--AddEventHandler('esx_gym:trainPushups', function()
	
--end)

--RegisterServerEvent('esx_gym:trainYoga')
--AddEventHandler('esx_gym:trainYoga', function()
	
--end)

--RegisterServerEvent('esx_gym:trainSitups')
--AddEventHandler('esx_gym:trainSitups', function()
	
--end)

function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end