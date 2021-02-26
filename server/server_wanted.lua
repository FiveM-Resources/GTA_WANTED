--> This is used only for Prediction to show the Form on the client side :
RegisterNetEvent("GTA_Prediction:ValueFormulaireWanted")
AddEventHandler("GTA_Prediction:ValueFormulaireWanted", function(bool)
    local source = source
    TriggerClientEvent('GTA_Prediction:UpdateDisplayFormulaire', source, bool)
end)

--> This will show the Wanted Announce to all the player : 
RegisterNetEvent("GTA_Prediction:RequestShowWanted")
AddEventHandler("GTA_Prediction:RequestShowWanted", function(fname, lname, reason, targetID)
    TriggerClientEvent('GTA_Prediction:ShowWanted', -1, fname, lname, reason, targetID)
end)