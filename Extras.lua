---@class ZoxeTweaks
local ZT = LibStub("AceAddon-3.0"):GetAddon("ZoxeTweaks")

local autoPushName = "AutoPushSpellToActionBar"
local originalSpellPushValue = GetCVar(autoPushName)

function ZT:ApplySpellPushTweaks()
    if self.db.global.disableSpellPush then
        SetCVar(autoPushName, 0)
    end
end

function ZT:DisableSpellPushTweaks()
    SetCVar(autoPushName, originalSpellPushValue)
end
