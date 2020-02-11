--Welcome Mail (C) 2019 Shrooblord
--Group command that allows you to add Players to Groups defined in config.

function execute(sender, commandName, ...)
    local args = {...}
    args[2] = tonumber(args[2])
    if type(args[1]) == "string" and type(args[2]) == "number" then
        Player(sender):setValue("goodName", args[1])
        Player(sender):setValue("amount", args[2])
        Player(sender):addScriptOnce("wMailGroup.lua")
    end
    return 0, "", ""
end

--[[

    Server():registerCallback("onPlayerLogIn", "onPlayerLogIn")
    function onPlayerLogIn(playerIndex) end

    Player():registerCallback("onSectorEntered", "onSectorEntered")
    function onSectorEntered(playerIndex, x, y, sectorChangeType) end

    Player():registerCallback("onShipChanged", "onShipChanged")
    function onShipChanged(playerIndex, craftId) end
    
]]

function getDescription()
    return "Add a Player to a Group defined in config. The next time that Player logs in, changes Ships, or jumps to a new Sector, they will receive a new Welcome Mail appropriate to the Group they were added to."
end

function getHelp()
    return "usage /group add <groupName> <playerName>"
end
