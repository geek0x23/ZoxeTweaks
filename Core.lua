---@class ZoxeTweaks : AceAddon, AceEvent-3.0, AceHook-3.0, AceConsole-3.0
local ZT = LibStub("AceAddon-3.0"):NewAddon("ZoxeTweaks", "AceConsole-3.0", "AceHook-3.0", "AceEvent-3.0")
local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceConfigCmd = LibStub("AceConfigCmd-3.0")

_G["ZoxeTweaks"] = ZT

function ZT:OnInitialize()
    local defaults = {
        profile = {
            scaleFactor = 1.20,
            auctionator = true,
            debug = false
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
                get = function() return self.db.profile.scaleFactor end
            },
            auctionator = {
                name = "Auctionator Tweaks",
                desc = "Hide vendor price on tooltips when Auctionator is installed.",
                type = "toggle",
                set = function(_, val)
                    self.db.profile.auctionator = val
                    self:ApplyAuctionatorFix()
                end,
                get = function() return self.db.profile.auctionator end
            },
            debug = {
                name = "Debug Mode",
                desc = "Enable logging of debug data",
                type = "toggle",
                hidden = true,
                set = function(_, val) self.db.profile.debug = val end,
                get = function() return self.db.profile.debug end
            },
            profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
        }
    }

    AceConfig:RegisterOptionsTable("ZoxeTweaks", options)
    AceConfigDialog:AddToBlizOptions("ZoxeTweaks", "Zoxe Tweaks")

    self:RegisterChatCommand("zt", function(input)
        if not input or input:trim() == "" then
            AceConfigDialog:Open("ZoxeTweaks")
        else
            if input:trim() == "atrocity" then
                ZT:ApplyAtrocityTweaks()
            else
                AceConfigCmd.HandleCommand(ZT, "zt", "ZoxeTweaks", input)
            end
        end
    end)
end

function ZT:OnEnable()
    self:ApplyAuctionatorFix()
    self:ApplyScaling()
end

function ZT:OnDisable()
    self:DisableAuctionatorFix()
    self:UnhookAll()
    self:UnregisterEvent("ADDON_LOADED")
    self:UnregisterEvent("CRAFTINGORDERS_FULFILL_ORDER_RESPONSE")
    self:UnregisterEvent("TRADE_SKILL_ITEM_CRAFTED_RESULT")
    EventRegistry:UnregisterCallback("ProfessionsFrame.TabSet")
    EventRegistry:UnregisterCallback("Professions.ProfessionSelected")
    EventRegistry:UnregisterCallback("Professions.TransactionUpdated")
    EventRegistry:UnregisterCallback("Professions.AllocationUpdated")
end

function ZT:Debug(...)
    if self.db.profile.debug then
        if not DLAPI then
            self:Printf(...)
        else
            DLAPI.DebugLog("ZoxeTweaks", ...)
        end
    end
end
