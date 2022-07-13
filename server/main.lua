ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("tnLocation:payLocation", function(source, cb, price)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local xMoney = xPlayer.getMoney()
    if xMoney < price then
        TriggerClientEvent('esx:showAdvancedNotification', src, Notification.Name, "~r~Erreur", "Vous n'avez pas assez d'argent. Il vous manque ~g~"..price-xMoney.." ~s~$.", Notification.Char, 0)
        cb(false)
    else 
        TriggerClientEvent('esx:showAdvancedNotification', src, Notification.Name, "~g~Succès", "Vous venez de louer votre véhicule. Bonne route !", Notification.Char, 0)
        xPlayer.removeMoney(price)
        cb(true)
    end
end)