---@class ZoxeTweaks
local ZT = LibStub("AceAddon-3.0"):GetAddon("ZoxeTweaks")

ZT.defaultAddMoneyFunc = GameTooltip_OnTooltipAddMoney

function ZT:ApplyAuctionatorFix()
    if ZT.db.global.auctionator then
        ZT:EnableAuctionatorFix()
    else
        ZT:DisableAuctionatorFix()
    end
end

function ZT:EnableAuctionatorFix()
    if Auctionator then
        GameTooltip_OnTooltipAddMoney = function() end
    end
end

function ZT:DisableAuctionatorFix()
    GameTooltip_OnTooltipAddMoney = ZT.defaultAddMoneyFunc
end

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
