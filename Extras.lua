---@class ZoxeTweaks
local ZT = LibStub("AceAddon-3.0"):GetAddon("ZoxeTweaks")

function ZT:ApplySpellPushTweaks()
    if self.db.global.disableSpellPush then
        SetCVar("AutoPushSpellToActionBar", 0)
    end
end
