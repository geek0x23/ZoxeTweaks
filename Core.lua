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
            auctionator = false,
            debug = false,
            atrocityUI = {
                fonts = {
                    resize = true,
                    size = 16,
                },
                elvUI = {
                    databars = true,
                    disableBags = false,
                    actionBars = false,
                    panels = true,
                    minimapDataTexts = false,
                    minimap = true,
                    tooltip = false,
                    unitFrames = true
                },
                sle = false,
                bigWigs = true,
                omniCD = true,
                details = true,
                plater = true
            }
        }
    }

    self.db = LibStub("AceDB-3.0"):New("ZoxeTweaksDB", defaults, true)

    local options = {
        name = "ZoxeTweaks",
        handler = ZT,
        type = "group",
        args = {
            debug = {
                name = "Debug Mode",
                desc = "Enable logging of debug data",
                type = "toggle",
                hidden = true,
                set = function(_, val) self.db.profile.debug = val end,
                get = function() return self.db.profile.debug end
            },
            general = {
                order = 1,
                name = "General Tweaks",
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
                        desc = "Hides vendor price on tooltips when Auctionator is installed.",
                        type = "toggle",
                        set = function(_, val)
                            self.db.profile.auctionator = val
                            self:ApplyAuctionatorFix()
                        end,
                        get = function() return self.db.profile.auctionator end
                    }
                }
            },
            atrocityUI = {
                order = 10,
                name = "AtrocityUI Tweaks",
                type = "group",
                args = {
                    heading = {
                        order = 1,
                        type = "group",
                        name = "How it Works",
                        inline = true,
                        args = {
                            description = {
                                type = "description",
                                name = "Most of these tweaks are designed for 1440p ultra-wide.  These settings are "..
                                    "only applied when you click the `Apply` button below.  You'll need to re-apply "..
                                    "these settings every time you update or install AtrocityUI."
                            }
                        }
                    },
                    fonts = {
                        order = 10,
                        type = "group",
                        name = "Font Tweaks",
                        inline = true,
                        args = {
                            resizeFonts = {
                                name = "Change font size?",
                                desc = "Should we change the general UI font size?",
                                type = "toggle",
                                set = function(_, val) self.db.profile.atrocityUI.fonts.resize = val end,
                                get = function() return self.db.profile.atrocityUI.fonts.resize end
                            },
                            size = {
                                name = "Desired font size",
                                desc = "If 'Change font size' is enabled, what size should we use?",
                                type = "range",
                                min = 8,
                                max = 30,
                                step = 1,
                                set = function(_, val) self.db.profile.atrocityUI.fonts.size = val end,
                                get = function() return self.db.profile.atrocityUI.fonts.size end
                            }
                        }
                    },
                    elvUI = {
                        order = 20,
                        type = "group",
                        name = "ElvUI Tweaks",
                        inline = true,
                        args = {
                            databars = {
                                name = "Data bars?",
                                desc = "Should we increase the size of the experience bar when shown?",
                                type = "toggle",
                                set = function(_, val) self.db.profile.atrocityUI.elvUI.databars = val end,
                                get = function() return self.db.profile.atrocityUI.elvUI.databars end
                            },
                            disableBags = {
                                name = "Disable bags?",
                                desc = "Should ElvUI bags be disabled?  I use AdiBags instead.",
                                type = "toggle",
                                set = function(_, val) self.db.profile.atrocityUI.elvUI.disableBags = val end,
                                get = function() return self.db.profile.atrocityUI.elvUI.disableBags end
                            },
                            actionBars = {
                                name = "Swap action bars?",
                                desc = "Should we re-organize bars 4, 5, and 6?  You probably don't want this.",
                                type = "toggle",
                                set = function(_, val) self.db.profile.atrocityUI.elvUI.actionBars = val end,
                                get = function() return self.db.profile.atrocityUI.elvUI.actionBars end
                            },
                            panels = {
                                name = "Bigger chat panels?",
                                desc = "Should we increase the size of the chat and damage meter panels?",
                                type = "toggle",
                                set = function(_, val) self.db.profile.atrocityUI.elvUI.panels = val end,
                                get = function() return self.db.profile.atrocityUI.elvUI.panels end
                            },
                            minimapDataTexts = {
                                name = "Minimap data texts?",
                                desc = "Should we enable the data texts under the minimap?",
                                type = "toggle",
                                set = function(_, val) self.db.profile.atrocityUI.elvUI.minimapDataTexts = val end,
                                get = function() return self.db.profile.atrocityUI.elvUI.minimapDataTexts end
                            },
                            minimap = {
                                name = "Bigger minimap?",
                                desc = "Should we make the minimap bigger?",
                                type = "toggle",
                                set = function(_, val) self.db.profile.atrocityUI.elvUI.minimap = val end,
                                get = function() return self.db.profile.atrocityUI.elvUI.minimap end
                            },
                            tooltip = {
                                name = "Tooltip tweaks?",
                                desc = "Should we disable item count and set the modifier key to SHIFT?",
                                type = "toggle",
                                set = function(_, val) self.db.profile.atrocityUI.elvUI.tooltip = val end,
                                get = function() return self.db.profile.atrocityUI.elvUI.tooltip end
                            },
                            unitFrames = {
                                name = "Unit frame positions?",
                                desc = "On ultra-wide, the unit frames are off.  Should we fix them?",
                                type = "toggle",
                                set = function(_, val) self.db.profile.atrocityUI.elvUI.unitFrames = val end,
                                get = function() return self.db.profile.atrocityUI.elvUI.unitFrames end
                            }
                        }
                    },
                    others = {
                        order = 30,
                        type = "group",
                        name = "Other Addons",
                        inline = true,
                        args = {
                            sle = {
                                name = "Shadow & Light?",
                                desc = "A bunch of font and armory tweaks for Shadow & Light",
                                type = "toggle",
                                set = function(_, val) self.db.profile.atrocityUI.sle = val end,
                                get = function() return self.db.profile.atrocityUI.sle end
                            },
                            bigWigs = {
                                name = "BigWigs Bars?",
                                desc = "Re-position BigWigs bars for ultra-wide",
                                type = "toggle",
                                set = function(_, val) self.db.profile.atrocityUI.bigWigs = val end,
                                get = function() return self.db.profile.atrocityUI.bigWigs end
                            },
                            omniCD = {
                                name = "OmniCD Bars?",
                                desc = "Re-position OmniCD bars for ultra-wide",
                                type = "toggle",
                                set = function(_, val) self.db.profile.atrocityUI.omniCD = val end,
                                get = function() return self.db.profile.atrocityUI.omniCD end
                            },
                            details = {
                                name = "Details Tweaks?",
                                desc = "Removes the extra windows from Details and fixes tooltip anchor for ultra-wide",
                                type = "toggle",
                                set = function(_, val) self.db.profile.atrocityUI.details = val end,
                                get = function() return self.db.profile.atrocityUI.details end
                            },
                            plater = {
                                name = "Plater Tweaks?",
                                desc = "Slightly increases font size, and auto-toggles friendly nameplates for dungeons and raids",
                                type = "toggle",
                                set = function(_, val) self.db.profile.atrocityUI.plater = val end,
                                get = function() return self.db.profile.atrocityUI.plater end
                            }
                        }
                    },
                    apply = {
                        order = 1000,
                        name = "Apply",
                        type = "execute",
                        func = function () return ZT:ApplyAtrocityTweaks() end
                    }
                }
            },
            profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
        }
    }

    AceConfig:RegisterOptionsTable("ZoxeTweaks", options)
    local optionsFrame = AceConfigDialog:AddToBlizOptions("ZoxeTweaks", "ZoxeTweaks")

    self:RegisterChatCommand("zt", function(input)
        if not input or input:trim() == "" then
            InterfaceOptionsFrame_OpenToCategory(optionsFrame)
        else
            AceConfigCmd.HandleCommand(ZT, "zt", "ZoxeTweaks", input)
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
