---@class ZoxeTweaks : AceAddon, AceEvent-3.0, AceHook-3.0, AceConsole-3.0
local ZT = LibStub("AceAddon-3.0"):NewAddon("ZoxeTweaks", "AceConsole-3.0", "AceHook-3.0", "AceEvent-3.0")
local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceConfigCmd = LibStub("AceConfigCmd-3.0")

_G["ZoxeTweaks"] = ZT

function ZT:OnInitialize()
    local defaults = {
        global = {
            scaleFactor = 1.20,
            auctionator = false,
            disableSpellPush = false
        }
    }

    local tocVersion = (select(4, GetBuildInfo()))
    local classic = tocVersion < 100000

    if not classic then
        defaults.global.atrocityUI = {
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
                unitFrames = true,
                guildRepairs = true,
                acceptInvitesFromGuildmates = true
            },
            sle = false,
            bigWigs = true,
            omniCD = true,
            details = true,
            weakAuras = true,
            plater = {
                fonts = {
                    resize = true,
                    size = 8
                },
                friendly = false,
                globalScale = 1
            },
            mrtRaidNotes = false
        }
    end

    self.db = LibStub("AceDB-3.0"):New("ZoxeTweaksDB", defaults)

    local options = {
        name = "ZoxeTweaks",
        handler = ZT,
        type = "group",
        args = {
            general = {
                order = 1,
                name = "General Tweaks",
                type = "group",
                args = {
                    settings = {
                        order = 10,
                        type = "group",
                        name = "Scaling",
                        inline = true,
                        args = {
                            scaleFactor = {
                                order = 1,
                                name = "Scale Factor",
                                desc = "A percentage multiplier used to determine how much to scale.",
                                type = "range",
                                min = 1.00,
                                max = 2.00,
                                step = 0.01,
                                isPercent = true,
                                set = function(_, val) self.db.global.scaleFactor = val end,
                                get = function() return self.db.global.scaleFactor end
                            },
                            reminder = {
                                order = 10,
                                type = "description",
                                fontSize = "medium",
                                name = "You need to reload your UI after changing this.\n"
                            }
                        }
                    },
                    addons = {
                        order = 20,
                        type = "group",
                        name = "Other Stuff",
                        inline = true,
                        args = {
                            auctionator = {
                                name = "Auctionator Tweaks",
                                desc = "Should we hide WoW's default vendor pricing on the item tooltip (only when Auctionator is installed)?",
                                type = "toggle",
                                set = function(_, val)
                                    self.db.global.auctionator = val
                                    self:ApplyAuctionatorFix()
                                end,
                                get = function() return self.db.global.auctionator end
                            },
                            disableSpellPush = {
                                name = "Disable Spell Push",
                                desc = "Should we set a CVar to disable pushing spells onto bars automatically?  Note: Unchecking this does not restore the orignal value.",
                                type = "toggle",
                                set = function(_, val)
                                    self.db.global.disableSpellPush = val
                                    self:ApplySpellPushTweaks()
                                end,
                                get = function() return self.db.global.disableSpellPush end
                            }
                        }
                    },
                    apply = {
                        order = 1000,
                        name = "Reload UI",
                        desc = "To apply scale factor changes, you need to reload your UI.",
                        type = "execute",
                        func = function () return ReloadUI() end
                    }
                }
            }
        }
    }

    if not classic then
        options.args.atrocityUI = {
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
                            fontSize = "medium",
                            name = "These settings are only applied when you click the `Apply Tweaks` button below.  "..
                                "You'll need to re-apply these settings every time you update or install AtrocityUI."
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
                            set = function(_, val) self.db.global.atrocityUI.fonts.resize = val end,
                            get = function() return self.db.global.atrocityUI.fonts.resize end
                        },
                        size = {
                            name = "Desired font size",
                            desc = "If 'Change font size' is enabled, what size should we use?",
                            type = "range",
                            min = 8,
                            max = 30,
                            step = 1,
                            set = function(_, val) self.db.global.atrocityUI.fonts.size = val end,
                            get = function() return self.db.global.atrocityUI.fonts.size end
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
                            set = function(_, val) self.db.global.atrocityUI.elvUI.databars = val end,
                            get = function() return self.db.global.atrocityUI.elvUI.databars end
                        },
                        disableBags = {
                            name = "Disable bags?",
                            desc = "Should ElvUI bags be disabled?  I use AdiBags instead.",
                            type = "toggle",
                            set = function(_, val) self.db.global.atrocityUI.elvUI.disableBags = val end,
                            get = function() return self.db.global.atrocityUI.elvUI.disableBags end
                        },
                        actionBars = {
                            name = "Swap action bars?",
                            desc = "Should we re-organize bars 4, 5, and 6?  You probably don't want this.",
                            type = "toggle",
                            set = function(_, val) self.db.global.atrocityUI.elvUI.actionBars = val end,
                            get = function() return self.db.global.atrocityUI.elvUI.actionBars end
                        },
                        panels = {
                            name = "Bigger chat panels?",
                            desc = "Should we increase the size of the chat and damage meter panels?",
                            type = "toggle",
                            set = function(_, val) self.db.global.atrocityUI.elvUI.panels = val end,
                            get = function() return self.db.global.atrocityUI.elvUI.panels end
                        },
                        minimapDataTexts = {
                            name = "Minimap data texts?",
                            desc = "Should we enable the data texts under the minimap?",
                            type = "toggle",
                            set = function(_, val) self.db.global.atrocityUI.elvUI.minimapDataTexts = val end,
                            get = function() return self.db.global.atrocityUI.elvUI.minimapDataTexts end
                        },
                        minimap = {
                            name = "Bigger minimap?",
                            desc = "Should we make the minimap bigger?",
                            type = "toggle",
                            set = function(_, val) self.db.global.atrocityUI.elvUI.minimap = val end,
                            get = function() return self.db.global.atrocityUI.elvUI.minimap end
                        },
                        tooltip = {
                            name = "Tooltip tweaks?",
                            desc = "Should we disable item count and set the modifier key to SHIFT?",
                            type = "toggle",
                            set = function(_, val) self.db.global.atrocityUI.elvUI.tooltip = val end,
                            get = function() return self.db.global.atrocityUI.elvUI.tooltip end
                        },
                        unitFrames = {
                            name = "Unit frame positions?",
                            desc = "On ultra-wide resolutions the unit frames are positioned incorrectly.  Should we fix them?",
                            type = "toggle",
                            set = function(_, val) self.db.global.atrocityUI.elvUI.unitFrames = val end,
                            get = function() return self.db.global.atrocityUI.elvUI.unitFrames end
                        },
                        guildRepairs = {
                            name = "Use guild repairs?",
                            desc = "Should we auto-repair with guild funds?",
                            type = "toggle",
                            set = function(_, val) self.db.global.atrocityUI.elvUI.guildRepairs = val end,
                            get = function() return self.db.global.atrocityUI.elvUI.guildRepairs end
                        },
                        autoAcceptInvites = {
                            name = "Auto accept invites?",
                            desc = "Should we automatically accept group invites from guild mates and friends?",
                            type = "toggle",
                            set = function(_, val) self.db.global.atrocityUI.elvUI.autoAcceptInvites = val end,
                            get = function() return self.db.global.atrocityUI.elvUI.autoAcceptInvites end
                        }
                    }
                },
                plater = {
                    order = 30,
                    type = "group",
                    name = "Plater Tweaks",
                    inline = true,
                    args = {
                        resizeFonts = {
                            order = 1,
                            name = "Change font size?",
                            desc = "Should we change font size for Plater nameplates?",
                            type = "toggle",
                            set = function(_, val) self.db.global.atrocityUI.plater.fonts.resize = val end,
                            get = function() return self.db.global.atrocityUI.plater.fonts.resize end
                        },
                        size = {
                            order = 10,
                            name = "Desired font size",
                            desc = "If 'Change font size' is enabled, what size should we use?",
                            type = "range",
                            min = 6,
                            max = 30,
                            step = 1,
                            set = function(_, val) self.db.global.atrocityUI.plater.fonts.size = val end,
                            get = function() return self.db.global.atrocityUI.plater.fonts.size end
                        },
                        friendly = {
                            order = 20,
                            name = "Friendly plates?",
                            desc = "Should we auto-enable friendly nameplates in dungeons and raids?",
                            type = "toggle",
                            set = function(_, val) self.db.global.atrocityUI.plater.friendly = val end,
                            get = function() return self.db.global.atrocityUI.plater.friendly end
                        },
                        globalScale = {
                            order = 30,
                            name = "Global Scale",
                            desc = "Sometimes Atrocity makes Plater stuff to small.  Should we scale it up?",
                            type = "range",
                            min = 1.00,
                            max = 2.00,
                            step = 0.01,
                            isPercent = true,
                            set = function(_, val) self.db.global.atrocityUI.plater.globalScale = val end,
                            get = function() return self.db.global.atrocityUI.plater.globalScale end
                        }
                    }
                },
                others = {
                    order = 100,
                    type = "group",
                    name = "Other Addons",
                    inline = true,
                    args = {
                        sle = {
                            name = "Shadow & Light?",
                            desc = "Enables a bunch of font and armory tweaks for Shadow & Light.",
                            type = "toggle",
                            set = function(_, val) self.db.global.atrocityUI.sle = val end,
                            get = function() return self.db.global.atrocityUI.sle end
                        },
                        bigWigs = {
                            name = "BigWigs Bars?",
                            desc = "Re-position BigWigs bars for ultra-wide, and set max bars shown to 5.",
                            type = "toggle",
                            set = function(_, val) self.db.global.atrocityUI.bigWigs = val end,
                            get = function() return self.db.global.atrocityUI.bigWigs end
                        },
                        omniCD = {
                            name = "OmniCD Bars?",
                            desc = "Re-position OmniCD bars for ultra-wide.",
                            type = "toggle",
                            set = function(_, val) self.db.global.atrocityUI.omniCD = val end,
                            get = function() return self.db.global.atrocityUI.omniCD end
                        },
                        details = {
                            name = "Details Tweaks?",
                            desc = "Fixes the details tooltip anchor for ultra-wide.",
                            type = "toggle",
                            set = function(_, val) self.db.global.atrocityUI.details = val end,
                            get = function() return self.db.global.atrocityUI.details end
                        },
                        weakAuras = {
                            name = "WeakAuras Tweaks?",
                            desc = "Moves missing buffs, combat time, and combat res indicators for ultra-wide.",
                            type = "toggle",
                            set = function(_, val) self.db.global.atrocityUI.weakAuras = val end,
                            get = function() return self.db.global.atrocityUI.weakAuras end
                        }
                    }
                },
                apply = {
                    order = 1000,
                    name = "Apply Tweaks",
                    desc = "Use this button to apply any the tweaks you have enabled.",
                    type = "execute",
                    func = function () return ZT:ApplyAtrocityTweaks() end
                }
            }
        }
    end

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
    self:ApplySpellPushTweaks()
    self:ApplyScaling()
end

function ZT:OnDisable()
    self:DisableAuctionatorFix()
    self:UnhookAll()
end
