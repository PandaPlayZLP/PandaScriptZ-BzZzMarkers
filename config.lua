Config = {}

Config.AllowCommands = true -- Allow commands for spawning and despawning

Config.Notify = function(text) -- This is being called every tick! Be sure to adapt your notify script
    -- You can change this to whatever notification system you want
    AddTextEntry("MIROW", text)
    DisplayHelpTextThisFrame("MIROW", false)
end

Config.Markers = {{
    coords = vector3(395.7025, -984.2512, 29.335),
    type = "ambulance",
    color = "blue",
    light = true,
    anim = true,
    range = 10.0
}, {
    coords = {vector3(393.1204, -981.8807, 29.3959), vector3(395.1587, -978.4142, 29.2865)},
    type = "drink",
    color = "red",
    light = true,
    anim = true,
    range = 5.0,
    interactionRange = 2.0,
    notify = "Press ~INPUT_CONTEXT~ to open the bar",
    event = "TestEvent123",
    eventType = "client", -- client or server
    eventArgs = { -- Optional
        ["arg1"] = "value1",
        ["arg2"] = "value2"
    },
    keyToPress = 38 -- Optional
}}
