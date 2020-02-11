--Welcome Mail (C) 2019 Shrooblord
--Main configuration file for the Welcome Mail mod.

package.path = package.path .. ";data/scripts/config/?.lua"

include("sMConf")
local wMail_groupConfig = include("wMail_groupConfig")

local wMailConf = {
    modID = "CPvP",                     --identifier for the mod used in print strings, in this case, "Welcome Mail"
    groups = wMail_groupConfig,         --the Groups as defined in wMail_groupConfig.lua, which includes each Group's Welcome Mail.
    develop = false,                    --development/debug mode
    dbgLevel = 4                        --0 = off; 1 = info; 2 = verbose; 3 = extremely verbose; 4 = I WANT TO KNOW EVERYTHING
}

table.insert(sMConf, wMailConf)

return wMailConf
