---@class ZoxeTweaks
local ZT = LibStub("AceAddon-3.0"):GetAddon("ZoxeTweaks")

function ZT:ApplySpellPushTweaks()
    if self.db.global.disableSpellPush then
        SetCVar("AutoPushSpellToActionBar", 0)
    end
end

function ZT:ApplyPlaterTargetTweaks()
    if self.db.global.keepTargetOnScreen then
        SetCVar("nameplateOtherBottomInset", 0.1)
        SetCVar("nameplateOtherTopInset", 0.08)
    end
end
