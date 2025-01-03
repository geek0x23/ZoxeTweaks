---@class ZoxeTweaks
local ZT = LibStub("AceAddon-3.0"):GetAddon("ZoxeTweaks")

local profiles = {
    elv = {
        dps = {},
        healer = {}
    },
    elvPrivate = {
        dps = {},
        healer = {}
    },
    omniCD = {
        dps = {},
        healer = {},
    },
    bigWigs = {},
    warpDeplete = {},
    plater = {}
}

local function LoadProfiles()
    -- ElvUI Base
    if ElvDB then
        local elvProfiles = ElvDB["profiles"]
        for p, _ in pairs(elvProfiles) do
            local isAUI = ZT:StartsWithIgnoreCase(p, "atrocityui")
            if isAUI then
                local isHealer = ZT:ContainsIgnoreCase(p, "healer")
                if isHealer then
                    table.insert(profiles.elv.healer, elvProfiles[p])
                else
                    table.insert(profiles.elv.dps, elvProfiles[p])
                end
            end
        end
    end

    -- ElvUI Private
    if ElvPrivateDB then
        local elvPrivateProfiles = ElvPrivateDB["profiles"]
        for p, _ in pairs(elvPrivateProfiles) do
            local isAUI = ZT:StartsWithIgnoreCase(p, "atrocityui")
            if isAUI then
                local isHealer = ZT:ContainsIgnoreCase(p, "healer")
                if isHealer then
                    table.insert(profiles.elvPrivate.healer, elvPrivateProfiles[p])
                else
                    table.insert(profiles.elvPrivate.dps, elvPrivateProfiles[p])
                end
            end
        end
    end

    -- BigWigs
    if BigWigs3DB then
        local bigWigsProfiles = BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"]
        for p, _ in pairs(bigWigsProfiles) do
            local isAUI = ZT:StartsWithIgnoreCase(p, "atrocityui")
            if isAUI then
                table.insert(profiles.bigWigs, bigWigsProfiles[p])
            end
        end
    end

    -- OmniCD
    if OmniCDDB then
        local omniCDProfiles = OmniCDDB["profiles"]
        for p, _ in pairs(omniCDProfiles) do
            local isAUI = ZT:StartsWithIgnoreCase(p, "atrocityui")
            if isAUI then
                local isHealer = ZT:ContainsIgnoreCase(p, "healer")
                if isHealer then
                    table.insert(profiles.omniCD.healer, omniCDProfiles[p])
                else
                    table.insert(profiles.omniCD.dps, omniCDProfiles[p])
                end
            end
        end
    end

    -- WarpDeplete
    if WarpDepleteDB then
        local warpDepleteProfiles = WarpDepleteDB["profiles"]
        for p, _ in pairs(warpDepleteProfiles) do
            local isAUI = ZT:StartsWithIgnoreCase(p, "atrocityui")
            if isAUI then
                table.insert(profiles.warpDeplete, warpDepleteProfiles[p])
            end
        end
    end

    -- Plater
    if Plater then
        local platerProfiles = Plater.db["profiles"]
        for p, _ in pairs(platerProfiles) do
            local isAUI = ZT:StartsWithIgnoreCase(p, "atrocityui")
            if isAUI then
                table.insert(profiles.plater, platerProfiles[p])
            end
        end
    end
end


local function SetValue(dest, path, value)
    -- Do nothing if dest is nil
    if not dest then return end

    local keys = ZT:Split(path, ".");

    for j, _ in pairs(dest) do
        -- Traverse the table up to the second-to-last key
        local current = dest[j]
        for i = 1, #keys - 1 do
            local key = keys[i]
            key = tonumber(key) or key

            -- If the key doesn't exist or isn't a table, create a new table
            if type(current[key]) ~= "table" then
                current[key] = {}
            end
            current = current[key]
        end

        -- Set the value at the final key
        current[keys[#keys]] = value
    end
end

local function ApplyElvUITweaks(ztp)
    if not ElvUI then return end

    local E = select(1, unpack(ElvUI))
    local descaledFontSize = math.floor(ztp.fonts.size - (ztp.fonts.size * (ZT.db.global.scaleFactor - 1)))
    local diminishedFontSize = math.ceil((ztp.fonts.size - descaledFontSize) / 2) + ztp.fonts.size

    if ztp.fonts.resize then
        -- Fonts
        SetValue(profiles.elvPrivate.dps, "general.nameplateFontSize", ztp.fonts.size)
        SetValue(profiles.elvPrivate.dps, "general.nameplateLargeFontSize", ztp.fonts.size)
        SetValue(profiles.elvPrivate.dps, "general.chatBubbleFontSize", descaledFontSize)
        SetValue(profiles.elvPrivate.healer, "general.nameplateFontSize", ztp.fonts.size)
        SetValue(profiles.elvPrivate.healer, "general.nameplateLargeFontSize", ztp.fonts.size)
        SetValue(profiles.elvPrivate.healer, "general.chatBubbleFontSize", descaledFontSize)

        local smallFont = {
            enable = true,
            outline = "OUTLINE",
            size = descaledFontSize
        }

        local normalFont = {
            enable = true,
            outline = "OUTLINE",
            size = diminishedFontSize
        }

        SetValue(profiles.elv.dps, "general.fonts.objective", smallFont)
        SetValue(profiles.elv.dps, "general.fonts.questsmall", normalFont)
        SetValue(profiles.elv.dps, "general.fonts.questtext", normalFont)
        SetValue(profiles.elv.dps, "general.fonts.questtitle", normalFont)
        SetValue(profiles.elv.dps, "general.fonts.mailbody", normalFont)
        SetValue(profiles.elv.dps, "general.fonts.errortext", normalFont)

        SetValue(profiles.elv.healer, "general.fonts.objective", smallFont)
        SetValue(profiles.elv.healer, "general.fonts.questsmall", normalFont)
        SetValue(profiles.elv.healer, "general.fonts.questtext", normalFont)
        SetValue(profiles.elv.healer, "general.fonts.questtitle", normalFont)
        SetValue(profiles.elv.healer, "general.fonts.mailbody", normalFont)
        SetValue(profiles.elv.healer, "general.fonts.errortext", normalFont)
    end


    if ztp.elvUI.databars then
        -- Data Bars
        if ztp.fonts.resize then
            SetValue(profiles.elv.dps, "databars.experience.fontSize", ztp.fonts.size)
            SetValue(profiles.elv.healer, "databars.experience.fontSize", ztp.fonts.size)
        end

        SetValue(profiles.elv.dps, "databars.experience.height", 20)
        SetValue(profiles.elv.healer, "databars.experience.height", 20)

        SetValue(profiles.elv.dps, "databars.experience.showLevel", true)
        SetValue(profiles.elv.healer, "databars.experience.showLevel", true)

        SetValue(profiles.elv.dps, "databars.experience.questCompletedOnly", true)
        SetValue(profiles.elv.healer, "databars.experience.questCompletedOnly", true)
    end


    if ztp.elvUI.disableBags then
        -- Bags
        SetValue(profiles.elvPrivate.dps, "bags.enable", false)
        SetValue(profiles.elvPrivate.healer, "bags.enable", false)
    end


    if ztp.fonts.resize then
        -- Alternative Power Bar
        SetValue(profiles.elv.dps, "general.altPowerBar.fontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "general.altPowerBar.fontSize", ztp.fonts.size)

        -- Blizzard UI Improvements
        SetValue(profiles.elv.dps, "general.lootRoll.nameFontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "general.lootRoll.nameFontSize", ztp.fonts.size)

        SetValue(profiles.elv.dps, "general.itemLevel.itemLevelFontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "general.itemLevel.itemLevelFontSize", ztp.fonts.size)

        SetValue(profiles.elv.dps, "general.queueStatus.fontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "general.queueStatus.fontSize", ztp.fonts.size)

        -- Extra Action Button
        SetValue(profiles.elv.dps, "actionbar.extraActionButton.hotkeyFontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "actionbar.extraActionButton.hotkeyFontSize", ztp.fonts.size)
    end


    -- Dungeon Queue Icon
    SetValue(profiles.elv.dps, "general.queueStatus.scale", 0.4)
    SetValue(profiles.elv.healer, "general.queueStatus.scale", 0.4)


    if ztp.fonts.resize then
        -- Auras
        SetValue(profiles.elv.dps, "auras.debuffs.timeFontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "auras.debuffs.timeFontSize", ztp.fonts.size)

        SetValue(profiles.elv.dps, "auras.debuffs.countFontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "auras.debuffs.countFontSize", ztp.fonts.size)

        SetValue(profiles.elv.dps, "auras.buffs.timeFontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "auras.buffs.timeFontSize", ztp.fonts.size)

        SetValue(profiles.elv.dps, "auras.buffs.countFontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "auras.buffs.countFontSize", ztp.fonts.size)

        -- Chat
        SetValue(profiles.elv.dps, "chat.fontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "chat.fontSize", ztp.fonts.size)

        SetValue(profiles.elv.dps, "chat.tabFontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "chat.tabFontSize", ztp.fonts.size)
    end


    if ztp.elvUI.panels then
        -- Chat continued
        SetValue(profiles.elv.dps, "chat.panelWidth", 500)
        SetValue(profiles.elv.healer, "chat.panelWidth", 500)

        SetValue(profiles.elv.dps, "chat.panelHeight", 268)
        SetValue(profiles.elv.healer, "chat.panelHeight", 268)

        -- this is here because we don't want to use 12 buttons unless
        -- we are resizing the chat panels, too.
        SetValue(profiles.elv.dps, "actionbar.bar3.buttons", 12)
        SetValue(profiles.elv.healer, "actionbar.bar3.buttons", 12)

        SetValue(profiles.elv.dps, "actionbar.bar3.buttonSize", 43)
        SetValue(profiles.elv.healer, "actionbar.bar3.buttonSize", 43)

        SetValue(profiles.elv.dps, "actionbar.barPet.buttonSize", 43)
        SetValue(profiles.elv.healer, "actionbar.barPet.buttonSize", 43)
    end


    -- DataTexts
    if ztp.fonts.resize then
        SetValue(profiles.elv.dps, "datatexts.fontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "datatexts.fontSize", ztp.fonts.size)
    end

    if ztp.elvUI.minimapDataTexts then
        local minimapPanel = {
            nil, -- [1]
            "Durability", -- [2]
            ["enable"] = true,
            ["backdrop"] = true
        }

        SetValue(profiles.elv.dps, "datatexts.panels.MinimapPanel", minimapPanel)
        SetValue(profiles.elv.healer, "datatexts.panels.MinimapPanel", minimapPanel)
    end

    -- Maps
    E.global.general.smallerWorldMap = false
    E.global.general.WorldMapCoordinates.enable = false

    if ztp.fonts.resize then
        SetValue(profiles.elv.dps, "general.minimap.locationFontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "general.minimap.locationFontSize", ztp.fonts.size)

        SetValue(profiles.elv.dps, "general.minimap.timeFontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "general.minimap.timeFontSize", ztp.fonts.size)
    end

    if ztp.elvUI.minimap then
        -- Minimap
        E.global.datatexts.customPanels.Clock.width = 270
        E.global.datatexts.customPanels.Clock.textJustify = "CENTER"

        SetValue(profiles.elv.dps, "general.minimap.scale", 1.25)
        SetValue(profiles.elv.healer, "general.minimap.scale", 1.25)

        SetValue(profiles.elv.dps, "general.minimap.size", 210)
        SetValue(profiles.elv.healer, "general.minimap.size", 210)
    end


    if ztp.fonts.resize then
        -- Tooltip
        SetValue(profiles.elv.dps, "tooltip.headerFontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "tooltip.headerFontSize", ztp.fonts.size)

        SetValue(profiles.elv.dps, "tooltip.textFontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "tooltip.textFontSize", ztp.fonts.size)

        SetValue(profiles.elv.dps, "tooltip.smallTextFontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "tooltip.smallTextFontSize", ztp.fonts.size)
    end

    if ztp.elvUI.tooltip then
        SetValue(profiles.elv.dps, "tooltip.modifierID", "SHIFT")
        SetValue(profiles.elv.healer, "tooltip.modifierID", "SHIFT")

        SetValue(profiles.elv.dps, "tooltip.itemCount", "NONE")
        SetValue(profiles.elv.healer, "tooltip.itemCount", "NONE")
    end

    if ztp.fonts.resize then
        -- Unit Frames
        SetValue(profiles.elv.dps, "unitframe.fontSize", ztp.fonts.size)
        SetValue(profiles.elv.healer, "unitframe.fontSize", ztp.fonts.size)

        SetValue(profiles.elv.dps, "unitframe.units.party.raidRoleIcons.xOffset", -27)

        SetValue(profiles.elv.dps, "unitframe.units.raid1.buffs.countFontSize", diminishedFontSize)
        SetValue(profiles.elv.healer, "unitframe.units.raid1.buffs.countFontSize", diminishedFontSize)

        SetValue(profiles.elv.dps, "unitframe.units.raid2.buffs.countFontSize", diminishedFontSize)
        SetValue(profiles.elv.healer, "unitframe.units.raid2.buffs.countFontSize", diminishedFontSize)

        SetValue(profiles.elv.dps, "unitframe.units.raid3.buffs.countFontSize", diminishedFontSize)
        SetValue(profiles.elv.healer, "unitframe.units.raid3.buffs.countFontSize", diminishedFontSize)
    end

    if ztp.elvUI.panels then
        SetValue(profiles.elv.dps, "unitframe.units.raid1.width", 99)

        SetValue(profiles.elv.dps, "unitframe.units.raid2.width", 99)

        SetValue(profiles.elv.dps, "unitframe.units.raid3.width", 99)
    end

    SetValue(profiles.elv.dps, "unitframe.units.raid1.roleIcon.enable", true)
    SetValue(profiles.elv.dps, "unitframe.units.raid1.roleIcon.damager", false)
    SetValue(profiles.elv.healer, "unitframe.units.raid1.roleIcon.enable", true)
    SetValue(profiles.elv.healer, "unitframe.units.raid1.roleIcon.damager", false)

    SetValue(profiles.elv.dps, "unitframe.units.raid2.roleIcon.enable", true)
    SetValue(profiles.elv.dps, "unitframe.units.raid2.roleIcon.damager", false)
    SetValue(profiles.elv.healer, "unitframe.units.raid2.roleIcon.enable", true)
    SetValue(profiles.elv.healer, "unitframe.units.raid2.roleIcon.damager", false)

    SetValue(profiles.elv.dps, "unitframe.units.raid3.roleIcon.enable", true)
    SetValue(profiles.elv.dps, "unitframe.units.raid3.roleIcon.damager", false)
    SetValue(profiles.elv.healer, "unitframe.units.raid3.roleIcon.enable", true)
    SetValue(profiles.elv.healer, "unitframe.units.raid3.roleIcon.damager", false)


    -- Auto repairs
    if not ztp.elvUI.guildRepairs then
        SetValue(profiles.elv.dps, "general.autoRepair", "PLAYER")
        SetValue(profiles.elv.healer, "general.autoRepair", "PLAYER")
    end


    -- Auto accept invites
    SetValue(profiles.elv.dps, "general.autoAcceptInvite", ztp.elvUI.autoAcceptInvites)
    SetValue(profiles.elv.healer, "general.autoAcceptInvite", ztp.elvUI.autoAcceptInvites)


    -- Movers
    if ztp.elvUI.minimap then
        SetValue(profiles.elv.dps, "movers.BNETMover", "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-290")
        SetValue(profiles.elv.healer, "movers.BNETMover", "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-290")

        SetValue(profiles.elv.dps, "movers.DTPanelClockMover", "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-250")
        SetValue(profiles.elv.healer, "movers.DTPanelClockMover", "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-250")

        SetValue(profiles.elv.dps, "movers.BuffsMover", "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-3")
        SetValue(profiles.elv.healer, "movers.BuffsMover", "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-3")

        SetValue(profiles.elv.dps, "movers.DebuffsMover", "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-228")
        SetValue(profiles.elv.healer, "movers.DebuffsMover", "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-228")

        SetValue(profiles.elv.dps, "movers.QueueStatusMover", "TOPRIGHT,ElvUIParent,TOPRIGHT,-8,-210")
        SetValue(profiles.elv.healer, "movers.QueueStatusMover", "TOPRIGHT,ElvUIParent,TOPRIGHT,-8,-210")
    end

    if ztp.elvUI.panels then
        SetValue(profiles.elv.dps, "movers.PetAB", "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-504,3")
        SetValue(profiles.elv.healer, "movers.PetAB", "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-504,3")

        SetValue(profiles.elv.dps, "movers.ElvAB_3", "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,504,3")
        SetValue(profiles.elv.healer, "movers.ElvAB_3", "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,504,3")

        SetValue(profiles.elv.dps, "movers.VehicleLeaveButton", "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-472,277")
        SetValue(profiles.elv.healer, "movers.VehicleLeaveButton", "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-472,277")

        SetValue(profiles.elv.dps, "movers.TooltipMover", "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,234")
        SetValue(profiles.elv.healer, "movers.TooltipMover", "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,234")

        SetValue(profiles.elv.dps, "movers.ElvUF_Raid1Mover", "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300")

        SetValue(profiles.elv.dps, "movers.ElvUF_Raid2Mover", "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300")

        SetValue(profiles.elv.dps, "movers.ElvUF_Raid3Mover", "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300")
    end

    SetValue(profiles.elv.dps, "movers.LossControlMover", "TOP,ElvUIParent,TOP,0,-500")
    SetValue(profiles.elv.healer, "movers.LossControlMover", "TOP,ElvUIParent,TOP,0,-500")

    if ztp.elvUI.unitFrames then
        SetValue(profiles.elv.dps, "movers.BossHeaderMover", "TOPRIGHT,ElvUIParent,TOPRIGHT,-700,-300")
        SetValue(profiles.elv.healer, "movers.BossHeaderMover", "TOPRIGHT,ElvUIParent,TOPRIGHT,-700,-300")

        SetValue(profiles.elv.dps, "movers.ElvUF_FocusMover", "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-800,550")
        SetValue(profiles.elv.healer, "movers.ElvUF_FocusMover", "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-800,550")

        SetValue(profiles.elv.dps, "movers.ElvUF_PartyMover", "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,965,535")
    end

    SetValue(profiles.elv.dps, "movers.AlertFrameMover", "TOPRIGHT,ElvUIParent,TOPRIGHT,-1000,-300")
    SetValue(profiles.elv.healer, "movers.AlertFrameMover", "TOPRIGHT,ElvUIParent,TOPRIGHT,-1000,-300")
end

local function ApplySLETweaks(ztp)
    if not ztp.sle then return end

    -- disable raid marker bar
    local raidmarkers = {
        ["enable"] = false
    }

    SetValue(profiles.elv.dps, "sle.raidmarkers", raidmarkers)
    SetValue(profiles.elv.healer, "sle.raidmarkers", raidmarkers)


    -- media
    local media = {
        fonts = {
            gossip = {
                fontSize = 14,
                font = "Expressway",
            },
            zone = {
                font = "Expressway",
                fontOutline = "OUTLINE",
            },
            subzone = {
                font = "Expressway",
            },
            scenarioStage = {
                HeaderText = {
                    font = "Expressway",
                    fontSize = 14,
                    fontOutline = "OUTLINE",
                },
                TimerText = {
                    font = "Expressway",
                    fontSize = 14,
                    fontOutline = "OUTLINE",
                },
            },
            objectiveHeader = {
                font = "Expressway",
                fontOutline = "OUTLINE",
                fontSize = 14,
            },
            mail = {
                font = "Expressway",
                fontSize = 14,
                fontOutline = "OUTLINE",
            },
            questFontSuperHuge = {
                font = "Expressway",
                fontOutline = "OUTLINE",
            },
            objective = {
                font = "Expressway",
                fontSize = 14,
                fontOutline = "OUTLINE",
            },
            pvp = {
                font = "Expressway",
                fontSize = 14,
                fontOutline = "OUTLINE",
            }
        }
    }

    SetValue(profiles.elv.dps, "sle.media", media)
    SetValue(profiles.elv.healer, "sle.media", media)


    -- pvp
    local pvp = {
        autorelease = true
    }

    SetValue(profiles.elv.dps, "sle.pvp", pvp)
    SetValue(profiles.elv.healer, "sle.pvp", pvp)


    -- armory
    local armory = {
        inspect = {
            enchant = {
                font = "Expressway",
                showReal = false,
                fontSize = 13,
                yOffset = -2,
            },
            ilvl = {
                font = "Expressway",
                fontSize = 13,
            },
            enable = true,
            gem = {
                yOffset = -2,
                xOffset = 3,
            },
            transmog = {
                enableArrow = false,
            },
        },
        character = {
            durability = {
                fontSize = 13,
                font = "Expressway",
                display = "Hide",
            },
            enable = true,
            gem = {
                yOffset = -2,
                xOffset = 3,
            },
            enchant = {
                font = "Expressway",
                showReal = false,
                fontSize = 13,
                yOffset = -2,
            },
            ilvl = {
                font = "Expressway",
                fontSize = 13,
            },
            transmog = {
                enableArrow = false,
            },
        },
        stats = {
            IlvlFull = false,
            statHeaders = {
                font = "Expressway",
                fontSize = 14,
                fontOutline = "OUTLINE",
            },
            statLabels = {
                font = "Expressway",
                fontSize = 13,
                fontOutline = "OUTLINE",
            },
            itemLevel = {
                font = "Expressway",
                fontSize = 20,
                fontOutline = "OUTLINE",
            }
        }
    }

    SetValue(profiles.elv.dps, "sle.armory", armory)
    SetValue(profiles.elv.healer, "sle.armory", armory)


    -- quest tracker
    local objectiveTracker = {
        uiWidgets = {
            headerText = {
                text = {
                    font = "Expressway",
                    enable = true,
                    fontSize = 14,
                },
            },
            header = {
                text = {
                    fontSize = 16,
                    enable = true,
                    font = "Expressway",
                },
            },
            entryText = {
                text = {
                    enable = true,
                    font = "Expressway",
                    fontSize = 14,
                },
            },
        },
        scenario = {
            headerText = {
                text = {
                    font = "Expressway",
                    enable = true,
                    fontSize = 14,
                },
            },
            header = {
                text = {
                    font = "Expressway",
                    enable = true,
                },
            },
            entryText = {
                text = {
                    enable = true,
                    font = "Expressway",
                    fontSize = 14,
                },
            },
        },
        adventure = {
            headerText = {
                text = {
                    font = "Expressway",
                    enable = true,
                    fontSize = 14,
                },
            },
            header = {
                text = {
                    fontSize = 16,
                    enable = true,
                    font = "Expressway",
                },
            },
            entryText = {
                text = {
                    enable = true,
                    font = "Expressway",
                    fontSize = 14,
                },
            },
        },
        worldQuest = {
            headerText = {
                text = {
                    font = "Expressway",
                    enable = true,
                    fontSize = 14,
                },
            },
            header = {
                text = {
                    fontSize = 16,
                    enable = true,
                    font = "Expressway",
                },
            },
            entryText = {
                text = {
                    enable = true,
                    font = "Expressway",
                    fontSize = 14,
                },
            },
        },
        achievement = {
            headerText = {
                text = {
                    font = "Expressway",
                    enable = true,
                    fontSize = 14,
                },
            },
            header = {
                text = {
                    fontSize = 16,
                    enable = true,
                    font = "Expressway",
                },
            },
            entryText = {
                text = {
                    enable = true,
                    font = "Expressway",
                    fontSize = 14,
                },
            },
        },
        professionsReceipe = {
            headerText = {
                text = {
                    font = "Expressway",
                    enable = true,
                    fontSize = 14,
                },
            },
            header = {
                text = {
                    fontSize = 16,
                    enable = true,
                    font = "Expressway",
                },
            },
            entryText = {
                text = {
                    enable = true,
                    font = "Expressway",
                    fontSize = 14,
                },
            },
        },
        campaign = {
            headerText = {
                text = {
                    font = "Expressway",
                    enable = true,
                    fontSize = 14,
                },
            },
            header = {
                text = {
                    fontSize = 16,
                    enable = true,
                    font = "Expressway",
                },
            },
            entryText = {
                text = {
                    enable = true,
                    font = "Expressway",
                    fontSize = 14,
                },
            },
        },
        mainHeader = {
            header = {
                text = {
                    fontSize = 18,
                    enable = true,
                    font = "Expressway",
                },
            },
        },
        monthlyActivities = {
            headerText = {
                text = {
                    font = "Expressway",
                    enable = true,
                    fontSize = 14,
                },
            },
            header = {
                text = {
                    fontSize = 16,
                    enable = true,
                    font = "Expressway",
                },
            },
            entryText = {
                text = {
                    enable = true,
                    fontSize = 14,
                },
            },
        },
        quest = {
            headerText = {
                text = {
                    font = "Expressway",
                    enable = true,
                    fontSize = 14,
                },
            },
            header = {
                text = {
                    fontSize = 16,
                    enable = true,
                    font = "Expressway",
                },
            },
            entryText = {
                text = {
                    enable = true,
                    font = "Expressway",
                    fontSize = 14,
                },
            },
            progressBar = {
                text = {
                    fontSize = 14,
                    enable = true,
                    font = "Expressway",
                },
            },
        },
        bonus = {
            headerText = {
                text = {
                    font = "Expressway",
                    enable = true,
                    fontSize = 14,
                },
            },
            header = {
                text = {
                    fontSize = 16,
                    enable = true,
                    font = "Expressway",
                },
            },
            entryText = {
                text = {
                    enable = true,
                    font = "Expressway",
                    fontSize = 14,
                },
            },
        },
    }

    SetValue(profiles.elv.dps, "sle.objectiveTracker", objectiveTracker)
    SetValue(profiles.elv.healer, "sle.objectiveTracker", objectiveTracker)


    -- private profiles
    local privates = {
        module = {
            shadows = {
                enable = false,
            },
        },
        install_complete = "4.85",
    }

    SetValue(profiles.elvPrivate.dps, "sle", privates)
    SetValue(profiles.elvPrivate.healer, "sle", privates)
end

local function ApplyWeakAurasTweaks(ztp)
    if not WeakAurasSaved then return end

    if ztp.fonts.resize then
        -- Fix font size on various auras
        local auras = {
            "Speed",
            "Player Castbar",
            "Player Castbar (Caster)",
            "Player Castbar (Healer)",
            "Focus Castbar",
            "Combat Ress",
            "Combat Time",
        }

        local combatTextAuras = WeakAurasSaved["displays"]["Combat Text"]["controlledChildren"]
        for _, child in ipairs(combatTextAuras) do
            table.insert(auras, child)
        end

        for _, auraName in ipairs(auras) do
            local aura = WeakAurasSaved["displays"][auraName]
            if aura then
                if aura["regionType"] == "text" and aura["fontSize"] then
                    aura["fontSize"] = ztp.fonts.size
                end

                local regions = aura["subRegions"]
                for i in ipairs(regions) do
                    local region = regions[i]
                    if region["text_fontSize"] then
                        region["text_fontSize"] = ztp.fonts.size
                    end
                end
            end
        end
    end

    if ztp.weakAuras then
        WeakAurasSaved["displays"]["Missing Buffs"]["xOffset"] = -1716
        WeakAurasSaved["displays"]["Combat Ress"]["xOffset"] = -1657
        WeakAurasSaved["displays"]["Combat Time"]["xOffset"] = -1265
    end

    if ztp.elvUI.panels then
        WeakAurasSaved["displays"]["Combat Ress"]["yOffset"] = -437
        WeakAurasSaved["displays"]["Combat Time"]["yOffset"] = -437
    end
end

local function ApplyBigWigsTweaks(ztp)
    if not BigWigs3DB then return end

    if ztp.fonts.resize then
        SetValue(profiles.bigWigs, "fontSize", ztp.fonts.size)
        SetValue(profiles.bigWigs, "fontSizeEmph", ztp.fonts.size)
    end

    if ztp.bigWigs then
        if ztp.elvUI.minimap then
            SetValue(profiles.bigWigs, "normalPosition", { "TOPRIGHT", "TOPRIGHT", -4, -291 })
            SetValue(profiles.bigWigs, "normalWidth", 240)
        end

        SetValue(profiles.bigWigs, "visibleBarLimit", 5)
        SetValue(profiles.bigWigs, "visibleBarLimitEmph", 5)
    end
end

local function ApplyMRTTweaks(ztp)
    if not VMRT then return end

    -- disable the auto-accept invites option since we already use that in the ElvUI section.
    VMRT.InviteTool.AutoInvAccept = false

    if ZT.db.global.scaleFactor then
        VMRT.Addon.Scale = ZT.db.global.scaleFactor
    end
end

local function ApplyOmniCDTweaks(ztp)
    if not OmniCDDB then return end

    if ZT.db.global.scaleFactor then
        OmniCDDB.global.optionPanelScale = ZT.db.global.scaleFactor
    end

    if ztp.fonts.resize then
        SetValue(profiles.omniCD.dps, "General.fonts.statusBar.size", ztp.fonts.size + 8)
        SetValue(profiles.omniCD.dps, "General.fonts.anchor.size", ztp.fonts.size)
        SetValue(profiles.omniCD.dps, "General.fonts.icon.size", ztp.fonts.size)

        SetValue(profiles.omniCD.healer, "General.fonts.statusBar.size", ztp.fonts.size + 8)
        SetValue(profiles.omniCD.healer, "General.fonts.anchor.size", ztp.fonts.size)
        SetValue(profiles.omniCD.healer, "General.fonts.icon.size", ztp.fonts.size)
    end

    if ztp.omniCD then
        SetValue(profiles.omniCD.dps, "Party.party.extraBars.raidBar1.manualPos.raidBar1.x", 514.9332700888335)
        SetValue(profiles.omniCD.dps, "Party.party.extraBars.raidBar1.manualPos.raidBar1.y", 434.4000392119051)
        SetValue(profiles.omniCD.dps, "Party.party.extraBars.raidBar2.manualPos.raidBar2.x", 514.9332700888335)
        SetValue(profiles.omniCD.dps, "Party.party.extraBars.raidBar2.manualPos.raidBar2.y", 311.7332822004973)

        SetValue(profiles.omniCD.dps, "Party.arena.extraBars.raidBar1.manualPos.raidBar1.x", 514.9332700888335)
        SetValue(profiles.omniCD.dps, "Party.arena.extraBars.raidBar1.manualPos.raidBar1.y", 434.4000392119051)
        SetValue(profiles.omniCD.dps, "Party.arena.extraBars.raidBar2.manualPos.raidBar2.x", 514.9332700888335)
        SetValue(profiles.omniCD.dps, "Party.arena.extraBars.raidBar2.manualPos.raidBar2.y", 311.7332822004973)

        SetValue(profiles.omniCD.healer, "Party.party.extraBars.raidBar1.manualPos.raidBar1.x", 1065.866798448551)
        SetValue(profiles.omniCD.healer, "Party.arena.extraBars.raidBar1.manualPos.raidBar1.x", 1065.866798448551)
    end

    if ztp.elvUI.panels then
        -- move externals if we made panels bigger
        SetValue(profiles.omniCD.dps, "Party.raid.extraBars.raidBar2.manualPos.raidBar2.x", 270.1335264583522)
        SetValue(profiles.omniCD.dps, "Party.raid.extraBars.raidBar2.manualPos.raidBar2.y", 174.1336679359447)

        SetValue(profiles.omniCD.healer, "Party.raid.extraBars.raidBar2.manualPos.raidBar2.x", 270.1335264583522)
        SetValue(profiles.omniCD.healer, "Party.raid.manualPos.5.x", 270.1335264583522)
    end
end

local function ApplyDetailsTweaks(ztp)
    if not Details then return end

    -- We don't do the normal SetValue stuff for Details, because if you modify *some* profile values (like tooltip)
    -- without using the global "Details" table, the settings are not persisted.
    for _, profile in ipairs(Details:GetProfileList()) do
        local isAUI = ZT:StartsWithIgnoreCase(profile, "atrocityui")
        if isAUI then
            local dtp = Details:GetProfile(profile)

            -- Apply the profile first, so that references to Details below will resolve the correct profile.
            Details:ApplyProfile(profile)

            if ZT.db.global.scaleFactor then
                dtp.options_window = { scale = ZT.db.global.scaleFactor }
            end

            if ztp.fonts.resize then
                Details.tooltip.fontsize = ztp.fonts.size
                Details.tooltip.fontsize_title = ztp.fonts.size
                dtp.font_sizes = { menus = ztp.fonts.size }
            end

            for id, instance in Details:ListInstances() do
                if ztp.fonts.resize then
                    instance:SetBarTextSettings(ztp.fonts.size)
                    instance:AttributeMenu(nil, nil, nil, nil, ztp.fonts.size)
                end

                if ztp.elvUI.panels then
                    local position = instance:CreatePositionTable()

                    position.w = 248

                    -- Main damage window
                    if id == 1 then
                        position.x = -254
                        position.h = 242
                    end

                    -- Healing window
                    if id == 2 then
                        position.y = 125
                    end

                    -- Deaths window
                    if id == 3 then
                        position.h = 99
                    end

                    instance:RestorePositionFromPositionTable(position)
                end
            end

            -- Re-position tooltip for ultra-wide
            if ztp.details then
                Details.tooltip.anchored_to = 2
                Details.tooltip.anchor_point = "bottomright"
                Details.tooltip.anchor_relative = "bottomright"
                Details.tooltip.anchor_offset = { 0, -6 }

                if ztp.elvUI.panels then
                    Details.tooltip.anchor_screen_pos = { 1144, -710 }
                end
            end

            Details:SaveProfile(profile)
        end
    end
end

local function ApplyPlaterTweaks(ztp)
    if not Plater then return end

    if ztp.plater.fonts.resize then
        SetValue(profiles.plater, "plate_config.enemynpc.actorname_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.enemynpc.big_actorname_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.enemynpc.big_actortitle_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.enemynpc.level_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.enemynpc.percent_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.enemynpc.spellname_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.enemynpc.spellpercent_text_size", ztp.plater.fonts.size)

        SetValue(profiles.plater, "plate_config.enemyplayer.actorname_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.enemyplayer.big_actorname_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.enemyplayer.big_actortitle_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.enemyplayer.level_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.enemyplayer.percent_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.enemyplayer.spellname_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.enemyplayer.spellpercent_text_size", ztp.plater.fonts.size)

        SetValue(profiles.plater, "plate_config.friendlynpc.actorname_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.friendlynpc.big_actorname_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.friendlynpc.big_actortitle_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.friendlynpc.level_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.friendlynpc.percent_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.friendlynpc.spellname_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.friendlynpc.spellpercent_text_size", ztp.plater.fonts.size)

        SetValue(profiles.plater, "plate_config.friendlyplayer.actorname_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.friendlyplayer.big_actorname_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.friendlyplayer.big_actortitle_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.friendlyplayer.level_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.friendlyplayer.percent_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.friendlyplayer.spellname_text_size", ztp.plater.fonts.size)
        SetValue(profiles.plater, "plate_config.friendlyplayer.spellpercent_text_size", ztp.plater.fonts.size)
    end

    if ztp.plater.friendly then
        SetValue(profiles.plater, "auto_toggle_friendly_enabled", true)
        SetValue(profiles.plater, "auto_toggle_friendly", {
            party = true,
            arena = false,
            raid = true,
            cities = false,
            world = false
        })
    end

    SetValue(profiles.plater, "saved_cvars.nameplateGlobalScale", ztp.plater.globalScale)

    Plater.RefreshDBUpvalues()
    Plater.UpdateAllPlates()
    Plater.RefreshAutoToggle()
end

local function ApplyWarpDepleteTweaks(ztp)
    if not WarpDepleteDB then return end

    if ZT.db.global.scaleFactor then
        SetValue(profiles.warpDeplete, "frameScale", ZT.db.global.scaleFactor)
    end

    if ztp.fonts.resize then
        SetValue(profiles.warpDeplete, "objectivesFontSize", ztp.fonts.size)
        SetValue(profiles.warpDeplete, "keyFontSize", ztp.fonts.size)
        SetValue(profiles.warpDeplete, "bar1FontSize", ztp.fonts.size)
        SetValue(profiles.warpDeplete, "bar2FontSize", ztp.fonts.size)
        SetValue(profiles.warpDeplete, "bar3FontSize", ztp.fonts.size)
        SetValue(profiles.warpDeplete, "timerFontSize", 24) -- default to big font for clock
        SetValue(profiles.warpDeplete, "keyDetailsFontSize", ztp.fonts.size)
        SetValue(profiles.warpDeplete, "deathsFontSize", ztp.fonts.size)
        SetValue(profiles.warpDeplete, "forcesFontSize", ztp.fonts.size)
    end

    if ztp.elvUI.minimap then
        SetValue(profiles.warpDeplete, "frameY", 170)
    end
end

function ZT:ApplyAtrocityTweaks()
    local ztp = self.db.global.atrocityUI

    LoadProfiles()

    ApplyElvUITweaks(ztp)
    ApplySLETweaks(ztp)
    ApplyWeakAurasTweaks(ztp)
    ApplyBigWigsTweaks(ztp)
    ApplyMRTTweaks(ztp)
    ApplyOmniCDTweaks(ztp)
    ApplyDetailsTweaks(ztp)
    ApplyPlaterTweaks(ztp)
    ApplyWarpDepleteTweaks(ztp)

    ReloadUI()
end
