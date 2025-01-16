
CreateThread(function()
	while true do
		Wait(0)
		if NetworkIsSessionStarted() then
            TriggerEvent('showNUI')
            CheckForCheats()
			return
		end
	end
end)

RegisterNetEvent('showNUI')
AddEventHandler('showNUI', function()
    SetNuiFocus(true, true)  
    SendNUIMessage({
        action = 'show' 
    })
end)

function CheckForCheats()
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local playerHeading = GetEntityHeading(playerPed)
    local forwardVector = GetEntityForwardVector(playerPed)

    if GetPlayerInvincible(playerPed) then
        print("God Mode tespit edildi!")
        QuitGame()
    end
    if GetPlayerInvincible_2(playerPed) then
        print("God Mode tespit edildi!")
        QuitGame()
    end

    SendNUIMessage({
        action = 'godmodefix' 
    })

    local npcModel = GetHashKey("mp_m_freemode_01")
    RequestModel(npcModel)
    while not HasModelLoaded(npcModel) do
        Wait(500)
    end

    local npcPosX = pos.x + forwardVector.x * 2.0
    local npcPosY = pos.y + forwardVector.y * 2.0
    local npcPosZ = pos.z - 0.5

    local npc = CreatePed(4, npcModel, npcPosX, npcPosY, npcPosZ, playerHeading, true, false)
    SetEntityInvincible(npc, true)
    SetEntityHealth(npc, 100)
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetPedDiesWhenInjured(npc, false)
    SetPedCanPlayAmbientAnims(npc, true)
    SetPedCanRagdollFromPlayerImpact(npc, false)
    FreezeEntityPosition(npc, true)
    GiveWeaponToPed(playerPed, GetHashKey("WEAPON_PISTOL"), 250, false, true)
    SetEntityVisible(npc, false, false) 
    SetEntityVisible(playerPed, false, false) 

    local isShooting = false
    local startTime = GetGameTimer()
    local hitCount = 0

    while GetGameTimer() - startTime < 3000 do
        TaskShootAtEntity(playerPed, npc, 1000, GetHashKey("FIRING_PATTERN_FULL_AUTO"))
        Wait(1000)

        if HasEntityBeenDamagedByEntity(npc, playerPed, true) then
            hitCount = hitCount + 1
            ClearEntityLastDamageEntity(npc)
        end

        isShooting = true
        if hitCount > 2 then
            QuitGame()
            print("Aim Bot tespit edildi!" )
            break
        end
    end
    SendNUIMessage({
        action = 'aimbotfix' 
    })

    Wait(4500)
    DeleteEntity(npc)
    SetEntityVisible(playerPed, true, true) 
    RemoveWeaponFromPed(playerPed, GetHashKey("WEAPON_PISTOL"))
    SetNuiFocus(false, false)  
    SendNUIMessage({
        action = 'close' 
    })
end