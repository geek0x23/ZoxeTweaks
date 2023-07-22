---@class AceAddon : AceEvent-3.0, AceHook-3.0, AceConsole-3.0
local ZT = LibStub("AceAddon-3.0"):GetAddon("ZoxeTweaks")

ZT.defaultAddMoneyFunc = GameTooltip_OnTooltipAddMoney

function ZT:ApplyAuctionatorFix()
    if ZT.db.profile.auctionator then
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