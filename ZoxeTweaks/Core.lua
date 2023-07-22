---@class AceAddon : AceEvent-3.0, AceHook-3.0, AceConsole-3.0
local ZT = LibStub("AceAddon-3.0"):NewAddon("ZoxeTweaks", "AceConsole-3.0", "AceHook-3.0", "AceEvent-3.0")

_G["ZoxeTweaks"] = ZT

---@diagnostic disable-next-line: duplicate-set-field
function ZT:OnInitialize()
    local defaults = {
        profile = {
            scaleFactor = 1.20,
            auctionator = true
        }
    }

    self.db = LibStub("AceDB-3.0"):New("ZoxeTweaksDB", defaults, true)

    local options = {
        name = "ZoxeTweaks",
        handler = ZT,
        type = "group",
        args = {
            scaleFactor = {
                name = "Scale Factor",
                desc = "A percentage multiplier used to determine how much to scale.  You need to reload UI after changing this.",
                type = "range",
                min = 1.00,
                max = 2.00,
                step = 0.01,
                isPercent = true,
                set = function(_, val) self.db.profile.scaleFactor = val end,
                get = function(_) return self.db.profile.scaleFactor end
            },
            auctionator = {
                name = "Auctionator Tweaks",
                desc = "Hide vendor price on tooltips when Auctionator is installed.",
                type = "toggle",
                set = function(_, val)
                    self.db.profile.auctionator = val
                    self:ApplyAuctionatorFix()
                end,
                get = function(_) return self.db.profile.auctionator end
            },
            profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
        }
    }

    LibStub("AceConfig-3.0"):RegisterOptionsTable("ZoxeTweaks", options)
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions("ZoxeTweaks", "Zoxe Tweaks")

    self:RegisterChatCommand("zt", "ChatCommand")
end

function ZT:ChatCommand(input)
    if not input or input:trim() == "" then
        LibStub("AceConfigDialog-3.0"):Open("ZoxeTweaks")
    else
        LibStub("AceConfigCmd-3.0").HandleCommand(ZT, "zt", "ZoxeTweaks", input)
    end
end

---@diagnostic disable-next-line: duplicate-set-field
function ZT:OnEnable()
    self:ApplyAuctionatorFix()
    self:RegisterEvent("PLAYER_ENTERING_WORLD", function() ZT:ApplyScaling() end)
end

---@diagnostic disable-next-line: duplicate-set-field
function ZT:OnDisable()
    self:DisableAuctionatorFix()
    self:UnhookAll()
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    self:UnregisterEvent("ADDON_LOADED")
end