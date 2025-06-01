local propsToRemove = {
    { hash = GetHashKey('prop_fnc_farm_01e'), coords = vector3(-701.8191, 985.1072, 236.9579), removed = false },
    { hash = GetHashKey('prop_fnc_farm_01e'), coords = vector3(-692.5625, 986.9385, 237.1908), removed = false }
}

local function removeFenceAtIndex(i)
    local prop = propsToRemove[i]
    local object = GetClosestObjectOfType(
        prop.coords.x, prop.coords.y, prop.coords.z,
        10.0, -- Search radius
        prop.hash, false, false, false
    )

    if object and object ~= 0 then
        SetEntityAsMissionEntity(object, true, true)
        DeleteEntity(object)
        print("[Remove Props] Deleted object at coords:", prop.coords)
    else
        print("[Remove Props] No object found at coords:", prop.coords)
    end
    propsToRemove[i].removed = true
end

CreateThread(function()
    Wait(5000) -- Wait for world to load
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for i, prop in ipairs(propsToRemove) do
            if not prop.removed then
                local dist = #(playerCoords - prop.coords)
                if dist < 800.0 then
                    removeFenceAtIndex(i)
                end
            end
        end

        Wait(3000) -- Check every 10 seconds
    end
end)
