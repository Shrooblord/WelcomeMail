--Welcome Mail (C) 2019 Shrooblord
--Executed when a /group command is used targeting this Player (see /scripts/commands/group.lua).

package.path = package.path .. ";data/scripts/config/?.lua"
local wMConfig = include("wMConfig")

-- Don't remove or alter the following comment, it tells the game the namespace this script lives in. If you remove it, the script will break.
-- namespace wMailGroup
wMailGroup = {}

local fromScript = "player/wMailGroup"

function wMailGroup.initialize()
    
end
