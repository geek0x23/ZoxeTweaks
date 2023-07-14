local _, zt = ...

zt.debug = function(...)
    if not DLAPI then
        --print(string.format(...))
    else
        DLAPI.DebugLog("ZoxeTweaks", ...)
    end
end

zt.eventFrame = CreateFrame("Frame", "ZoxeTweaksLoaderFrame", UIParent)
