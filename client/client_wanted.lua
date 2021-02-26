local isDisplayOn = false
local TimerAnnounce = 15000 --> change here the wanted timer as u needed to let open.

--> Used to show the form to the player : 
RegisterNetEvent("GTA_Prediction:UpdateDisplayFormulaire")
AddEventHandler("GTA_Prediction:UpdateDisplayFormulaire", function(bool)
    isDisplayOn = bool
    SetNuiFocus(isDisplayOn, isDisplayOn)

    SendNUIMessage({
        type = "enableui",
        activate = isDisplayOn
    })
end)

--> Used to show the wanted to all the player : 
RegisterNetEvent("GTA_Prediction:ShowWanted")
AddEventHandler("GTA_Prediction:ShowWanted", function(fName, lName, reason, targetID)
    local eventTriggered = true
    local isWantedON = true
    local targetPlayer = nil
    
    for i = 1, 255, 1 do
        if NetworkIsPlayerActive(i) then
            if GetPlayerServerId(i) == tonumber(targetID) then
                targetPlayer = GetPlayerPed(i)
                break
            end
        end
    end

    -- Get the ped headshot image.
    local handle = RegisterPedheadshot(targetPlayer)
    while not IsPedheadshotReady(handle) or not IsPedheadshotValid(handle) do
        Citizen.Wait(0)
    end
    local txd = GetPedheadshotTxdString(handle)

    --> Draw the target face :
    Citizen.CreateThread(function()
        while isWantedON do
            Citizen.Wait(0)
            DrawSprite(txd, txd, 0.610, 0.248, 0.055, 0.120, 0.0, 255, 255, 255, 1000)
        end
    end)

    Citizen.CreateThread(function()
        while eventTriggered do
            Citizen.Wait(300)
            if IsPauseMenuActive() then
                --> Remove the NUI WANTED :
                SendNUIMessage({
                    type = "wantedAnnouce",
                    activate = false,
                    dataFirstName = fName,
                    dataLastName = lName,
                    dataReason = reason,
                    dataTargetID = targetID
                })
            elseif not IsPauseMenuActive() then 
                -->  Show the NUI WANTED :
                SendNUIMessage({
                    type = "wantedAnnouce",
                    activate = true,
                    dataFirstName = fName,
                    dataLastName = lName,
                    dataReason = reason,
                    dataTargetID = targetID
                })
            end
        end
    end)

    TriggerServerEvent('GTA_WANTED:PlayOnAll', 'wanted', 0.2) --> play sound.

    --> Timer to show the announce :
    Wait(TimerAnnounce)
    eventTriggered = false

    --> Cleanup Face :
    UnregisterPedheadshot(txd)

    --> Stop the loop :
    isWantedON = false

    Wait(500)

    --> Remove the wanted nui : 
    SendNUIMessage({
        type = "wantedAnnouce",
        activate = false,
        dataFirstName = fName,
        dataLastName = lName,
        dataReason = reason,
        dataTargetID = targetID
    })
end)

--> Used when the player enter the command warn we request to open the nui form :
RegisterCommand("warn", function(source)
    TriggerServerEvent('GTA_Prediction:ValueFormulaireWanted', true) --> request to show the nui form.
    TriggerServerEvent("GTA_WANTED:PlayOnSource", 'click', 0.2) --> play sound.
end, false)


--> CallBack Main from NUI : used to show the wanted announce.
RegisterNUICallback("main", function(data)
    local fName = data.fName
    local lName = data.lName
    local reason = data.vreason
    local targetID = data.targetId
    TriggerServerEvent('GTA_Prediction:ValueFormulaireWanted', false) --> request to show off the nui form.
    TriggerServerEvent('GTA_Prediction:RequestShowWanted', fName, lName, reason, targetID) --> request to show the nui wanted.
    TriggerServerEvent("GTA_WANTED:PlayOnSource", 'click', 0.2) --> play sound.
end)


--> CallBack Error from NUI : used to exit the nui + show the data error.
RegisterNUICallback("error", function(data)
    print("NUI WANTED ERROR : ", data.error)
    TriggerServerEvent('GTA_Prediction:ValueFormulaireWanted', false) --> request to show off the nui.
    TriggerServerEvent("GTA_WANTED:PlayOnSource", 'click', 0.2) --> play sound.
end)

--> CallBack Exit from NUI : used to exit the nui without error.
RegisterNUICallback("exit", function(data)
    --print("NUI WANTED EXITED")
    TriggerServerEvent('GTA_Prediction:ValueFormulaireWanted', false) --> request to show off the nui.
    TriggerServerEvent("GTA_WANTED:PlayOnSource", 'click', 0.2) --> play sound.
end)