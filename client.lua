local availableActions = {}
local cord = Config.uzumtoplama
-- üzüm toplama

Citizen.CreateThread(function()
    local sleep = 1000
    while true do
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, cord.x, cord.y, cord.z, true)
        if distance < 10 then
            sleep = 0
            DrawMarker(2,cord.x, cord.y, cord.z,0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.markerboyutu, Config.markerboyutu, Config.markerboyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 2 then
                DrawText3D(cord.x,cord.y,cord.z, '[E] Üzüm Topla')
                if IsControlJustReleased(0, 38) then
                    exports['progressbar']:Progress({
                        name = "üzüm",
                        duration = 5000,
                        label = "Üzüm Topluyorsun",
                        useWhileDead = false,
                        canCancel = true,
                        controlDisables = {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        },
                        animation = {
                            animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                            anim = "idle_c",
                            flags = 49,
                        },
                    }, function(status)
                        if not status then
                            TriggerServerEvent("uzum")
                        end
                    end)
                end
            else
                sleep = 1000
            end
        end
        Wait(sleep)
    end
end)

--işleme

local uzumisleme = Config.uzumisleme

Citizen.CreateThread(function()
    local sleep = 2000
    while true do
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, uzumisleme.x, uzumisleme.y, uzumisleme.z, true)
        if distance < 5 then
            sleep = 0
            DrawMarker(2,uzumisleme.x, uzumisleme.y, uzumisleme.z,0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.markerboyutu, Config.markerboyutu, Config.markerboyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 2 then
                DrawText3D(uzumisleme.x,uzumisleme.y,uzumisleme.z, '[E] Üzümlerini İşle')
                if IsControlJustReleased(0, 38) then
                    exports['progressbar']:Progress({
                        name = "üzüm",
                        duration = 5000,
                        label = "Şarap Yapıyorsun",
                        useWhileDead = false,
                        canCancel = true,
                        controlDisables = {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        },
                        animation = {
                            animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                            anim = "idle_c",
                            flags = 49,
                        },
                    }, function(status)
                        if not status then
                            TriggerServerEvent("uzumisleme")
                        end
                    end)
                end
            else
                sleep = 1000
            end
        end
        Wait(sleep)
    end
end)

-- Satış

local sarapsatis = Config.sarapsatis


Citizen.CreateThread(function()
    local sleep = 2000
    while true do
        Wait(sleep)
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, sarapsatis.x, sarapsatis.y, sarapsatis.z, true)
                if distance < 5 then
                    sleep = 0
                    DrawText3D(sarapsatis.x,sarapsatis.y,sarapsatis.z, '[E] Şaraplarını Sat')
                        if IsControlJustReleased(0, 38) then
                             TriggerEvent("progressbar:client:progress", {
                    name = "üzüm",
                    duration = 5000,
                    label = "Üzüm Satıyorsun",
                    useWhileDead = false,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                    animation = {
                        animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                        anim = "idle_c",
                        flags = 49,
                    },
                }, function(status)
                    if not status then
                        TriggerServerEvent("sarapsatis")
                    end
                end)
            end
        else
            sleep = 2000
        end
    end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end

--blips

if Config.BlipAc then
    CreateThread(function()
        local blip = AddBlipForCoord(Config.UzumToplamaBlip.x, Config.UzumToplamaBlip.y, Config.UzumToplamaBlip.z)
        SetBlipSprite(blip, 93)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.5)
        SetBlipColour(blip, 51)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.UzumToplamaBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.UzumIslemeBlip.x, Config.UzumIslemeBlip.y, Config.UzumIslemeBlip.z)
        SetBlipSprite(blip, 93)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.5)
        SetBlipColour(blip, 51)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.UzumIslemeBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.SarapSatisBlip.x, Config.SarapSatisBlip.y, Config.SarapSatisBlip.z)
        SetBlipSprite(blip, 93)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.5)
        SetBlipColour(blip, 51)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.SarapSatisBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
end


-- NPC

-- local NPC = Config.NPC
-- Citizen.CreateThread(function()
--     RequestModel(GetHashKey("s_m_m_ammucountry")) -- ped kodu
--     npc = CreatePed(1, GetHashKey("s_m_m_ammucountry"), NPC.x, NPC.y, NPC.z -1, false, true) -- ped kodu ve kordinatı
--     SetEntityHeading(npc, NPC.h)
--     SetPedCombatAttributes(npc, 46, true)              
--     SetPedFleeAttributes(npc, 0, 0)              
--     SetBlockingOfNonTemporaryEvents(npc, true)
--     SetEntityAsMissionEntity(npc, true, true)
--     SetEntityInvincible(npc, true)
--     FreezeEntityPosition(npc, true)
-- end)
