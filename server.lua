local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("uzum")
AddEventHandler("uzum", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem("grape", math.random(Config.uzummin,Config.uzummax))
end)

RegisterNetEvent("uzumisleme")
AddEventHandler("uzumisleme", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = math.random(1,100)
    if xPlayer.Functions.RemoveItem("grape", Config.uzumislememiktar) then
        if item > Config.kotusarapsans then
            xPlayer.Functions.AddItem("wine", 1)
        else
            xPlayer.Functions.AddItem("grapejuice", 1)
        end
        TriggerClientEvent('QBCore:Notify', source, { type = 'success', text = 'Şarap Yaptın!', length = 2500})
    else
        TriggerClientEvent('QBCore:Notify', source, { type = 'error', text = 'Yeterince Üzümün Yok!', length = 2500})
    end
end)

RegisterNetEvent("sarapsatis")
AddEventHandler("sarapsatis", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)

    if xPlayer.Functions.RemoveItem("wine", Config.sarapsatismiktar) then
        xPlayer.Functions.AddItem('izlipara', Config.sarapfiyat)
        TriggerClientEvent('QBCore:Notify', source,  { type = 'success', text = 'Şarap Sattın!', length = 2500})
    elseif xPlayer.Functions.RemoveItem("grapejuice", Config.sarapsatismiktar) then
        TriggerClientEvent('QBCore:Notify', source,  { type = 'success', text = 'Kötü Şarap Sattın!', length = 2500})
        xPlayer.Functions.AddItem('izlipara', Config.kotusarapfiyat)
    else
        TriggerClientEvent('QBCore:Notify', source, { type = 'error', text = 'Yeterince Şarabın Yok!', length = 2500})
    end
end)
