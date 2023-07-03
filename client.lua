local markers = {}
local markersByID = {}

function AddMarker(coords, markerType, color, light, anim, range)
    local id = #markers + 1
    print(anim, light)

    local propName = "bzzz_marker_" .. markerType .. "_" .. color

    if type(anim) == "string" then
        anim = anim == "true"
    end

    if type(light) == "string" then
        light = light == "true"
    end

    if anim and light then
        propName = propName .. "_anim"
    elseif light then
        propName = propName .. "_light"
    elseif anim and not light then
        propName = propName .. "_anim_nonlight"
    end

    print(propName)

    local modelHash = GetHashKey(propName)

    if not HasModelLoaded(modelHash) then
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Citizen.Wait(1)
        end
    end

    local prop = CreateObject(modelHash, coords.x, coords.y, coords.z, true, false, false)

    local marker = {
        id = id,
        prop = prop,
        model = modelHash,
        range = tonumber(range),
        exists = true,
        coords = coords
    }
    markers[id] = marker
    markersByID[prop] = marker
end


function DeleteMarker(id_or_coords)
    local marker
    if type(id_or_coords) == 'number' then
        marker = markers[id_or_coords]
    else
        marker = markersByID[id_or_coords]
    end

    if marker then
        if marker.exists then
            DeleteEntity(marker.prop)
        end

        markers[marker.id] = nil
        markersByID[marker.prop] = nil
    end
end

RegisterNetEvent('PandaScriptZ_Markers:deleteMarker')
AddEventHandler('PandaScriptZ_Markers:deleteMarker', function(id_or_coords)
    DeleteMarker(id_or_coords)
end)

RegisterNetEvent('PandaScriptZ_Markers:addMarker')
AddEventHandler('PandaScriptZ_Markers:addMarker', function(coords, type, color, light, anim, range)
    AddMarker(coords, type, color, light, anim, range)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local playerCoords = GetEntityCoords(PlayerPedId())

        for id, marker in pairs(markers) do
            if marker.range then
                local distance = #(playerCoords - vector3(marker.coords.x, marker.coords.y, marker.coords.z))

                if distance > marker.range and marker.exists then
                    DeleteEntity(marker.prop)
                    marker.exists = false
                elseif distance <= marker.range and not marker.exists then
                    marker.prop = CreateObject(marker.model, marker.coords.x, marker.coords.y, marker.coords.z, true,
                        false, false)
                    marker.exists = true
                end
            end
        end
    end
end)

if Config.AllowCommands then
    RegisterCommand('AddMarker', function(source, args, rawCommand)
        local coords = GetEntityCoords(PlayerPedId())
        local type = args[1]
        local color = args[2]
        local light = args[3]
        local anim = args[4]
        local range = args[5]
        AddMarker(coords, type, color, light, anim, range)
    end)

    RegisterCommand('DeleteMarker', function(source, args, rawCommand)
        local id_or_coords = args[1]
        DeleteMarker(id_or_coords)
    end)
end

Citizen.CreateThread(function()
    for k, v in pairs(Config.Markers) do
        AddMarker(v.coords, v.type, v.color, v.light, v.anim, v.range)
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        for id, marker in pairs(markers) do
            DeleteEntity(marker.prop)
        end
    end
end)

exports('AddMarker', AddMarker)
exports('DeleteMarker', DeleteMarker)
