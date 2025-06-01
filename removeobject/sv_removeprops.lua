RegisterServerEvent('removeProps:requestDelete')
AddEventHandler('removeProps:requestDelete', function()
    local src = source
    TriggerClientEvent('removeProps:deleteProps', src)
end)
