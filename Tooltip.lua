---@diagnostic disable: undefined-global

-- Hide vendor price from tooltip if Auctionator is installed.
if Auctionator then
    GameTooltip_OnTooltipAddMoney = function() end
end
