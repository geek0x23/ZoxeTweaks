local _, zt = ...

zt.debug = function(...)
    if not DLAPI then return end
    DLAPI.DebugLog("ZoxeTweaks", ...)
end

zt.eventFrame = CreateFrame("Frame", "ZoxeTweaksLoaderFrame", UIParent)
