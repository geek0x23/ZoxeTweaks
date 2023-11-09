---@class ZoxeTweaks
local ZT = LibStub("AceAddon-3.0"):GetAddon("ZoxeTweaks")

local profiles = {
    atrocityUI = "AtrocityUI",
    atrocityUIColor = "AtrocityUI [C]",
    atrocityUIHealer = "AtrocityUI Healer",
    atrocityUIHealerColor = "AtrocityUI Healer [C]"
}

local function ApplyElvUITweaks()
    ZT:Debug("Applying ElvUI Tweaks")
    local E, _, _, _, _ = unpack(ElvUI)

    local elv = ElvDB["profiles"][profiles.atrocityUI]
    local elvColor = ElvDB["profiles"][profiles.atrocityUIColor]
    local elvHealer = ElvDB["profiles"][profiles.atrocityUIHealer]
    local elvHealerColor = ElvDB["profiles"][profiles.atrocityUIHealerColor]

    local elvPriv = ElvPrivateDB["profiles"][profiles.atrocityUI]
    local elvPrivColor = ElvPrivateDB["profiles"][profiles.atrocityUIColor]
    local elvPrivHealer = ElvPrivateDB["profiles"][profiles.atrocityUIHealer]
    local elvPrivHealerColor = ElvPrivateDB["profiles"][profiles.atrocityUIHealerColor]


    -- Fonts
    elvPriv["general"]["nameplateFontSize"] = 16
    elvPriv["general"]["nameplateLargeFontSize"] = 16
    elvPrivColor["general"]["nameplateFontSize"] = 16
    elvPrivColor["general"]["nameplateLargeFontSize"] = 16
    elvPrivHealer["general"]["nameplateFontSize"] = 16
    elvPrivHealer["general"]["nameplateLargeFontSize"] = 16
    elvPrivHealerColor["general"]["nameplateFontSize"] = 16
    elvPrivHealerColor["general"]["nameplateLargeFontSize"] = 16

    elv["general"]["fonts"] = elv["general"]["fonts"] or {}

    local smallFont = {
        enable = true,
        outline = "OUTLINE",
        size = 12
    }

    local normalFont = {
        enable = true,
        outline = "OUTLINE",
        size = 16
    }

    elv["general"]["fonts"]["objective"] = smallFont
    elv["general"]["fonts"]["questsmall"] = normalFont
    elv["general"]["fonts"]["questtext"] = normalFont
    elv["general"]["fonts"]["questtitle"] = normalFont

    elvColor["general"]["fonts"]["objective"] = smallFont
    elvColor["general"]["fonts"]["questsmall"] = normalFont
    elvColor["general"]["fonts"]["questtext"] = normalFont
    elvColor["general"]["fonts"]["questtitle"] = normalFont

    elvHealer["general"]["fonts"]["objective"] = smallFont
    elvHealer["general"]["fonts"]["questsmall"] = normalFont
    elvHealer["general"]["fonts"]["questtext"] = normalFont
    elvHealer["general"]["fonts"]["questtitle"] = normalFont

    elvHealerColor["general"]["fonts"]["objective"] = smallFont
    elvHealerColor["general"]["fonts"]["questsmall"] = normalFont
    elvHealerColor["general"]["fonts"]["questtext"] = normalFont
    elvHealerColor["general"]["fonts"]["questtitle"] = normalFont


    -- Data Bars
    elv["databars"]["experience"]["fontSize"] = 16
    elvColor["databars"]["experience"]["fontSize"] = 16
    elvHealer["databars"]["experience"]["fontSize"] = 16
    elvHealerColor["databars"]["experience"]["fontSize"] = 16

    elv["databars"]["experience"]["height"] = 20
    elvColor["databars"]["experience"]["height"] = 20
    elvHealer["databars"]["experience"]["height"] = 20
    elvHealerColor["databars"]["experience"]["height"] = 20

    elv["databars"]["experience"]["showLevel"] = true
    elvColor["databars"]["experience"]["showLevel"] = true
    elvHealer["databars"]["experience"]["showLevel"] = true
    elvHealerColor["databars"]["experience"]["showLevel"] = true

    elv["databars"]["experience"]["questCompletedOnly"] = true
    elvColor["databars"]["experience"]["questCompletedOnly"] = true
    elvHealer["databars"]["experience"]["questCompletedOnly"] = true
    elvHealerColor["databars"]["experience"]["questCompletedOnly"] = true


    -- Bags
    elvPriv["bags"] = elvPriv["bags"] or {}
    elvPrivColor["bags"] = elvPrivColor["bags"] or {}
    elvPrivHealer["bags"] = elvPrivHealer["bags"] or {}
    elvPrivHealerColor["bags"] = elvPrivHealerColor["bags"] or {}

    elvPriv["bags"]["enable"] = false
    elvPrivColor["bags"]["enable"] = false
    elvPrivHealer["bags"]["enable"] = false
    elvPrivHealerColor["bags"]["enable"] = false


    -- Alternative Power Bar
    elv["general"]["altPowerBar"]["fontSize"] = 16
    elvColor["general"]["altPowerBar"]["fontSize"] = 16
    elvHealer["general"]["altPowerBar"]["fontSize"] = 16
    elvHealerColor["general"]["altPowerBar"]["fontSize"] = 16


    -- Blizzard UI Improvements
    elv["general"]["lootRoll"]["nameFontSize"] = 16
    elvColor["general"]["lootRoll"]["nameFontSize"] = 16
    elvHealer["general"]["lootRoll"]["nameFontSize"] = 16
    elvHealerColor["general"]["lootRoll"]["nameFontSize"] = 16

    elv["general"]["itemLevel"]["itemLevelFontSize"] = 16
    elvColor["general"]["itemLevel"]["itemLevelFontSize"] = 16
    elvHealer["general"]["itemLevel"]["itemLevelFontSize"] = 16
    elvHealerColor["general"]["itemLevel"]["itemLevelFontSize"] = 16

    elv["general"]["queueStatus"]["fontSize"] = 16
    elvColor["general"]["queueStatus"]["fontSize"] = 16
    elvHealer["general"]["queueStatus"]["fontSize"] = 16
    elvHealerColor["general"]["queueStatus"]["fontSize"] = 16

    elv["general"]["queueStatus"]["scale"] = 0.4
    elvColor["general"]["queueStatus"]["scale"] = 0.4
    elvHealer["general"]["queueStatus"]["scale"] = 0.4
    elvHealerColor["general"]["queueStatus"]["scale"] = 0.4


    -- Action Bars
    elv["actionbar"]["extraActionButton"]["hotkeyFontSize"] = 16
    elvColor["actionbar"]["extraActionButton"]["hotkeyFontSize"] = 16
    elvHealer["actionbar"]["extraActionButton"]["hotkeyFontSize"] = 16
    elvHealerColor["actionbar"]["extraActionButton"]["hotkeyFontSize"] = 16

    elv["actionbar"]["bar5"]["buttonSize"] = 28
    elvColor["actionbar"]["bar5"]["buttonSize"] = 28
    elvHealer["actionbar"]["bar5"]["buttonSize"] = 26
    elvHealerColor["actionbar"]["bar5"]["buttonSize"] = 26

    elv["actionbar"]["bar6"]["buttonSize"] = 30
    elvColor["actionbar"]["bar6"]["buttonSize"] = 30
    elvHealer["actionbar"]["bar6"]["buttonSize"] = 28
    elvHealerColor["actionbar"]["bar6"]["buttonSize"] = 28

    elv["actionbar"]["bar3"]["buttons"] = 12
    elvColor["actionbar"]["bar3"]["buttons"] = 12
    elvHealer["actionbar"]["bar3"]["buttons"] = 12
    elvHealerColor["actionbar"]["bar3"]["buttons"] = 12

    elv["actionbar"]["bar4"]["point"] = "BOTTOMLEFT"
    elvColor["actionbar"]["bar4"]["point"] = "BOTTOMLEFT"
    elvHealer["actionbar"]["bar4"]["point"] = "BOTTOMLEFT"
    elvHealerColor["actionbar"]["bar4"]["point"] = "BOTTOMLEFT"

    elv["actionbar"]["bar5"]["buttonsPerRow"] = 6
    elvColor["actionbar"]["bar5"]["buttonsPerRow"] = 6
    elvHealer["actionbar"]["bar5"]["buttonsPerRow"] = 6
    elvHealerColor["actionbar"]["bar5"]["buttonsPerRow"] = 6

    elv["actionbar"]["bar5"]["backdrop"] = true
    elvColor["actionbar"]["bar5"]["backdrop"] = true
    elvHealer["actionbar"]["bar5"]["backdrop"] = true
    elvHealerColor["actionbar"]["bar5"]["backdrop"] = true

    elv["actionbar"]["bar6"]["buttonsPerRow"] = 12
    elvColor["actionbar"]["bar6"]["buttonsPerRow"] = 12
    elvHealer["actionbar"]["bar6"]["buttonsPerRow"] = 12
    elvHealerColor["actionbar"]["bar6"]["buttonsPerRow"] = 12

    elv["actionbar"]["bar6"]["backdrop"] = false
    elvColor["actionbar"]["bar6"]["backdrop"] = false
    elvHealer["actionbar"]["bar6"]["backdrop"] = false
    elvHealerColor["actionbar"]["bar6"]["backdrop"] = false


    -- Auras
    elv["auras"]["debuffs"]["timeFontSize"] = 16
    elvColor["auras"]["debuffs"]["timeFontSize"] = 16
    elvHealer["auras"]["debuffs"]["timeFontSize"] = 16
    elvHealerColor["auras"]["debuffs"]["timeFontSize"] = 16

    elv["auras"]["debuffs"]["countFontSize"] = 16
    elvColor["auras"]["debuffs"]["countFontSize"] = 16
    elvHealer["auras"]["debuffs"]["countFontSize"] = 16
    elvHealerColor["auras"]["debuffs"]["countFontSize"] = 16

    elv["auras"]["buffs"]["timeFontSize"] = 16
    elvColor["auras"]["buffs"]["timeFontSize"] = 16
    elvHealer["auras"]["buffs"]["timeFontSize"] = 16
    elvHealerColor["auras"]["buffs"]["timeFontSize"] = 16

    elv["auras"]["buffs"]["countFontSize"] = 16
    elvColor["auras"]["buffs"]["countFontSize"] = 16
    elvHealer["auras"]["buffs"]["countFontSize"] = 16
    elvHealerColor["auras"]["buffs"]["countFontSize"] = 16


    -- Chat
    elv["chat"]["fontSize"] = 16
    elvColor["chat"]["fontSize"] = 16
    elvHealer["chat"]["fontSize"] = 16
    elvHealerColor["chat"]["fontSize"] = 16

    elv["chat"]["tabFontSize"] = 16
    elvColor["chat"]["tabFontSize"] = 16
    elvHealer["chat"]["tabFontSize"] = 16
    elvHealerColor["chat"]["tabFontSize"] = 16

    elv["chat"]["panelWidth"] = 500
    elvColor["chat"]["panelWidth"] = 500
    elvHealer["chat"]["panelWidth"] = 500
    elvHealerColor["chat"]["panelWidth"] = 500

    elv["chat"]["panelHeight"] = 272
    elvColor["chat"]["panelHeight"] = 272
    elvHealer["chat"]["panelHeight"] = 272
    elvHealerColor["chat"]["panelHeight"] = 272


    -- DataTexts
    elv["datatexts"]["fontSize"] = 16
    elvColor["datatexts"]["fontSize"] = 16
    elvHealer["datatexts"]["fontSize"] = 16
    elvHealerColor["datatexts"]["fontSize"] = 16

    local minimapPanel = {
        nil, -- [1]
        "Durability", -- [2]
        ["enable"] = true,
        ["backdrop"] = true
    }

    elv["datatexts"]["panels"]["MinimapPanel"] = minimapPanel
    elvColor["datatexts"]["panels"]["MinimapPanel"] = minimapPanel
    elvHealer["datatexts"]["panels"]["MinimapPanel"] = minimapPanel
    elvHealerColor["datatexts"]["panels"]["MinimapPanel"] = minimapPanel

    E.global.datatexts.customPanels.Clock.width = 262


    -- Maps
    E.global.general.smallerWorldMap = false
    E.global.general.WorldMapCoordinates.enable = false

    elv["general"]["minimap"]["locationFontSize"] = 16
    elvColor["general"]["minimap"]["locationFontSize"] = 16
    elvHealer["general"]["minimap"]["locationFontSize"] = 16
    elvHealerColor["general"]["minimap"]["locationFontSize"] = 16

    elv["general"]["minimap"]["timeFontSize"] = 16
    elvColor["general"]["minimap"]["timeFontSize"] = 16
    elvHealer["general"]["minimap"]["timeFontSize"] = 16
    elvHealerColor["general"]["minimap"]["timeFontSize"] = 16

    elv["general"]["minimap"]["scale"] = 1.25
    elvColor["general"]["minimap"]["scale"] = 1.25
    elvHealer["general"]["minimap"]["scale"] = 1.25
    elvHealerColor["general"]["minimap"]["scale"] = 1.25

    elv["general"]["minimap"]["size"] = 210
    elvColor["general"]["minimap"]["size"] = 210
    elvHealer["general"]["minimap"]["size"] = 210
    elvHealerColor["general"]["minimap"]["size"] = 210


    -- Tooltip
    elv["tooltip"]["headerFontSize"] = 16
    elvColor["tooltip"]["headerFontSize"] = 16
    elvHealer["tooltip"]["headerFontSize"] = 16
    elvHealerColor["tooltip"]["headerFontSize"] = 16

    elv["tooltip"]["textFontSize"] = 16
    elvColor["tooltip"]["textFontSize"] = 16
    elvHealer["tooltip"]["textFontSize"] = 16
    elvHealerColor["tooltip"]["textFontSize"] = 16

    elv["tooltip"]["smallTextFontSize"] = 16
    elvColor["tooltip"]["smallTextFontSize"] = 16
    elvHealer["tooltip"]["smallTextFontSize"] = 16
    elvHealerColor["tooltip"]["smallTextFontSize"] = 16

    elv["tooltip"]["modifierID"] = "SHIFT"
    elvColor["tooltip"]["modifierID"] = "SHIFT"
    elvHealer["tooltip"]["modifierID"] = "SHIFT"
    elvHealerColor["tooltip"]["modifierID"] = "SHIFT"

    elv["tooltip"]["itemCount"] = "NONE"
    elvColor["tooltip"]["itemCount"] = "NONE"
    elvHealer["tooltip"]["itemCount"] = "NONE"
    elvHealerColor["tooltip"]["itemCount"] = "NONE"


    -- Unit Frames
    elv["unitframe"]["fontSize"] = 16
    elvColor["unitframe"]["fontSize"] = 16
    elvHealer["unitframe"]["fontSize"] = 16
    elvHealerColor["unitframe"]["fontSize"] = 16

    elv["unitframe"]["units"]["raid1"]["width"] = 99
    elvColor["unitframe"]["units"]["raid1"]["width"] = 99

    elv["unitframe"]["units"]["raid2"]["width"] = 99
    elvColor["unitframe"]["units"]["raid2"]["width"] = 99

    elv["unitframe"]["units"]["raid3"]["width"] = 99
    elvColor["unitframe"]["units"]["raid3"]["width"] = 99

    elv["unitframe"]["units"]["party"]["raidRoleIcons"]["xOffset"] = -27
    elvColor["unitframe"]["units"]["party"]["raidRoleIcons"]["xOffset"] = -27

    elv["unitframe"]["units"]["raid1"]["buffs"]["countFontSize"] = 14
    elvColor["unitframe"]["units"]["raid1"]["buffs"]["countFontSize"] = 14
    elvHealer["unitframe"]["units"]["raid1"]["buffs"]["countFontSize"] = 14
    elvHealerColor["unitframe"]["units"]["raid1"]["buffs"]["countFontSize"] = 14

    elv["unitframe"]["units"]["raid2"]["buffs"]["countFontSize"] = 14
    elvColor["unitframe"]["units"]["raid2"]["buffs"]["countFontSize"] = 14
    elvHealer["unitframe"]["units"]["raid2"]["buffs"]["countFontSize"] = 14
    elvHealerColor["unitframe"]["units"]["raid2"]["buffs"]["countFontSize"] = 14

    elv["unitframe"]["units"]["raid3"]["buffs"]["countFontSize"] = 14
    elvColor["unitframe"]["units"]["raid3"]["buffs"]["countFontSize"] = 14
    elvHealer["unitframe"]["units"]["raid3"]["buffs"]["countFontSize"] = 14
    elvHealerColor["unitframe"]["units"]["raid3"]["buffs"]["countFontSize"] = 14


    -- Movers
    elv["movers"]["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-290"
    elvColor["movers"]["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-290"
    elvHealer["movers"]["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-290"
    elvHealerColor["movers"]["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-290"

    elv["movers"]["DTPanelClockMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-233"
    elvColor["movers"]["DTPanelClockMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-233"
    elvHealer["movers"]["DTPanelClockMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-233"
    elvHealerColor["movers"]["DTPanelClockMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-233"

    elv["movers"]["PetAB"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-504,3"
    elvColor["movers"]["PetAB"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-504,3"
    elvHealer["movers"]["PetAB"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-504,3"
    elvHealerColor["movers"]["PetAB"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-504,3"

    elv["movers"]["ElvAB_3"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,504,3"
    elvColor["movers"]["ElvAB_3"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,504,3"
    elvHealer["movers"]["ElvAB_3"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,504,3"
    elvHealerColor["movers"]["ElvAB_3"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,504,3"

    elv["movers"]["VehicleLeaveButton"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-472,277"
    elvColor["movers"]["VehicleLeaveButton"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-472,277"
    elvHealer["movers"]["VehicleLeaveButton"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-472,277"
    elvHealerColor["movers"]["VehicleLeaveButton"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-472,277"

    elv["movers"]["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,239"
    elvColor["movers"]["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,239"
    elvHealer["movers"]["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,239"
    elvHealerColor["movers"]["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,239"

    elv["movers"]["LossControlMover"] = "TOP,ElvUIParent,TOP,0,-500"
    elvColor["movers"]["LossControlMover"] = "TOP,ElvUIParent,TOP,0,-500"
    elvHealer["movers"]["LossControlMover"] = "TOP,ElvUIParent,TOP,0,-500"
    elvHealerColor["movers"]["LossControlMover"] = "TOP,ElvUIParent,TOP,0,-500"

    elv["movers"]["BossHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-700,-300"
    elvColor["movers"]["BossHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-700,-300"
    elvHealer["movers"]["BossHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-700,-300"
    elvHealerColor["movers"]["BossHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-700,-300"

    elv["movers"]["ElvUF_FocusMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-800,550"
    elvColor["movers"]["ElvUF_FocusMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-800,550"
    elvHealer["movers"]["ElvUF_FocusMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-800,550"
    elvHealerColor["movers"]["ElvUF_FocusMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-800,550"

    elv["movers"]["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-3"
    elvColor["movers"]["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-3"
    elvHealer["movers"]["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-3"
    elvHealerColor["movers"]["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-3"

    elv["movers"]["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-211"
    elvColor["movers"]["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-211"
    elvHealer["movers"]["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-211"
    elvHealerColor["movers"]["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-211"

    elv["movers"]["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,277,3"
    elvColor["movers"]["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,277,3"
    elvHealer["movers"]["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,260,3"
    elvHealerColor["movers"]["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,260,3"

    elv["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-277,3"
    elvColor["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-277,3"
    elvHealer["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-260,3"
    elvHealerColor["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-260,3"

    elv["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,0,36"
    elvColor["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,0,36"
    elvHealer["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,0,34"
    elvHealerColor["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,0,34"

    elv["movers"]["ElvUF_Raid1Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"
    elvColor["movers"]["ElvUF_Raid1Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"

    elv["movers"]["ElvUF_Raid2Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"
    elvColor["movers"]["ElvUF_Raid2Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"

    elv["movers"]["ElvUF_Raid3Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"
    elvColor["movers"]["ElvUF_Raid3Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"

    elv["movers"]["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,893,580"
    elvColor["movers"]["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,893,580"
end

local function ApplyAddonSkinsTweaks()
    ZT:Debug("Applying AddonSkins Tweaks")

    AddOnSkinsDB["profiles"]["Default"]["EmbedLeftWidth"] = 250
    AddOnSkinsDB["profiles"]["Default"]["EmbedSystemDual"] = true
    AddOnSkinsDB["profiles"]["Default"]["EmbedSystemMessage"] = false
end

local function ApplySLETweaks()
    ZT:Debug("Applying Shadow & Light Tweaks")
    -- main profiles
    local sleBase = ElvDB["profiles"][profiles.atrocityUI]["sle"]
    local sleColor = ElvDB["profiles"][profiles.atrocityUIColor]["sle"]
    local sleHealer = ElvDB["profiles"][profiles.atrocityUIHealer]["sle"]
    local sleHealerColor = ElvDB["profiles"][profiles.atrocityUIHealerColor]["sle"]

    sleBase = sleBase or {}
    sleColor = sleColor or {}
    sleHealer = sleHealer or {}
    sleHealerColor = sleHealerColor or {}


    -- disable raid marker bar
    local raidmarkers = {
        ["enable"] = false
    }

    sleBase["raidmarkers"] = raidmarkers
    sleColor["raidmarkers"] = raidmarkers
    sleHealer["raidmarkers"] = raidmarkers
    sleHealerColor["raidmarkers"] = raidmarkers


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
                },
                TimerText = {
                    font = "Expressway",
                },
            },
            objectiveHeader = {
                font = "Expressway",
                fontOutline = "OUTLINE",
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
            },
            pvp = {
                font = "Expressway",
            }
        }
    }

    sleBase["media"] = media
    sleColor["media"] = media
    sleHealer["media"] = media
    sleHealerColor["media"] = media


    -- pvp
    local pvp = {
        autorelease = true
    }

    sleBase["pvp"] = pvp
    sleColor["pvp"] = pvp
    sleHealer["pvp"] = pvp
    sleHealerColor["pvp"] = pvp


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
                fontSize = 22,
                fontOutline = "OUTLINE",
            }
        }
    }

    sleBase["armory"] = armory
    sleColor["armory"] = armory
    sleHealer["armory"] = armory
    sleHealerColor["armory"] = armory


    -- private profiles
    local privates = {
        module = {
            shadows = {
                enable = false,
            },
        },
        characterGoldsSorting = {
            Stormrage = {
            },
        },
        install_complete = "4.73",
    }

    ElvPrivateDB["profiles"][profiles.atrocityUI]["sle"] = privates
    ElvPrivateDB["profiles"][profiles.atrocityUIColor]["sle"] = privates
    ElvPrivateDB["profiles"][profiles.atrocityUIHealer]["sle"] = privates
    ElvPrivateDB["profiles"][profiles.atrocityUIHealerColor]["sle"] = privates
end

local function ApplyWeakAurasTweaks()
    ZT:Debug("Applying WeakAuras Tweaks")

    -- Fix font size on various auras
    local auras = {
        "Speed",
        "Player Castbar",
        "Player Castbar (Caster)",
        "Player Castbar (Healer)",
        "Focus Castbar",
        "Automark"
    }

    for _, auraName in ipairs(auras) do
        local aura = WeakAurasSaved["displays"][auraName]
        if aura then
            local regions = aura["subRegions"]
            for i in ipairs(regions) do
                local region = regions[i]
                if region["text_fontSize"] then
                    region["text_fontSize"] = 16
                end
            end
        end
    end


    -- Automark
    WeakAurasSaved["displays"]["Automark"]["yOffset"] = 90


    -- Combat Info
    WeakAurasSaved["displays"]["Combat Ress"]["xOffset"] = -1289
    WeakAurasSaved["displays"]["Combat Ress"]["yOffset"] = -432
    WeakAurasSaved["displays"]["Combat Time"]["xOffset"] = -1668
    WeakAurasSaved["displays"]["Combat Time"]["yOffset"] = -432
end

local function ApplyBigWigsTweaks()
    ZT:Debug("Applying BigWigs Tweaks")

    local profile = BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][profiles.atrocityUI]

    profile["fontSize"] = 16
    profile["fontSizeEmph"] = 16
    profile["BigWigsAnchor_x"] = 1728
    profile["BigWigsAnchor_y"] = 162
    profile["BigWigsEmphasizeAnchor_x"] = 1080
    profile["BigWigsEmphasizeAnchor_y"] = 276
end

local function ApplyMRTTweaks()
    ZT:Debug("Applying MRT Tweaks")

    VMRT.Note.FontSize = 16
end

local function ApplyOmniCDTweaks()
    ZT:Debug("Applying OmniCD Tweaks")

    local profile = OmniCDDB["profiles"][profiles.atrocityUI]

    profile["General"]["fonts"]["statusBar"]["size"] = 24
    profile["General"]["fonts"]["anchor"]["size"] = 16
    profile["General"]["fonts"]["icon"]["size"] = 16

    profile["Party"]["party"]["icons"]["scale"] = 1.05
    profile["Party"]["party"]["position"]["offsetX"] = 2
    profile["Party"]["party"]["position"]["offsetY"] = 3

    profile["Party"]["party"]["extraBars"]["raidBar0"]["manualPos"]["raidBar0"]["x"] = 476.8001343409123
    profile["Party"]["party"]["extraBars"]["raidBar0"]["manualPos"]["raidBar0"]["y"] = 442.1335348447028

    profile["Party"]["party"]["extraBars"]["raidBar1"]["manualPos"]["raidBar1"]["x"] = 476.8001343409123
    profile["Party"]["party"]["extraBars"]["raidBar1"]["manualPos"]["raidBar1"]["y"] = 332.5332158565579

    local healerProfile = OmniCDDB["profiles"][profiles.atrocityUIHealer]

    healerProfile["General"]["fonts"]["statusBar"]["size"] = 24
    healerProfile["General"]["fonts"]["anchor"]["size"] = 16
    healerProfile["General"]["fonts"]["icon"]["size"] = 16

    healerProfile["Party"]["party"]["extraBars"]["raidBar0"]["manualPos"]["raidBar0"]["x"] = 620.5329708258505
    healerProfile["Party"]["party"]["extraBars"]["raidBar0"]["manualPos"]["raidBar0"]["y"] = 197.6001509825292
end

local function ApplyDetailsTweaks()
    ZT:Debug("Applying Details Tweaks")

    Details.tooltip.fontsize = 16
    Details.tooltip.fontsize_title = 16
    Details.tooltip.anchored_to = 1

    local count = 1
    for id, instance in Details:ListInstances() do
        count = count + 1
        instance:SetBarTextSettings(16)
        instance:AttributeMenu(nil, nil, nil, nil, 16)
    end

    -- Atrocity likes more than 2 windows.  I do not.
    if count >= 3 then
        for i = 3, count do
            Details:DeleteInstance(i)
        end
    end
end

local function ApplyPlaterTweaks()
    ZT:Debug("Applying Plater Tweaks")

    Plater.db.profile.plate_config.enemynpc.actorname_text_size = 8
    Plater.db.profile.plate_config.enemynpc.big_actorname_text_size = 8
    Plater.db.profile.plate_config.enemynpc.big_actortitle_text_size = 8
    Plater.db.profile.plate_config.enemynpc.level_text_size = 8
    Plater.db.profile.plate_config.enemynpc.percent_text_size = 8
    Plater.db.profile.plate_config.enemynpc.spellname_text_size = 8
    Plater.db.profile.plate_config.enemynpc.spellpercent_text_size = 8

    Plater.db.profile.plate_config.enemyplayer.actorname_text_size = 8
    Plater.db.profile.plate_config.enemyplayer.big_actorname_text_size = 8
    Plater.db.profile.plate_config.enemyplayer.big_actortitle_text_size = 8
    Plater.db.profile.plate_config.enemyplayer.level_text_size = 8
    Plater.db.profile.plate_config.enemyplayer.percent_text_size = 8
    Plater.db.profile.plate_config.enemyplayer.spellname_text_size = 8
    Plater.db.profile.plate_config.enemyplayer.spellpercent_text_size = 8

    Plater.db.profile.plate_config.friendlynpc.actorname_text_size = 8
    Plater.db.profile.plate_config.friendlynpc.big_actorname_text_size = 8
    Plater.db.profile.plate_config.friendlynpc.big_actortitle_text_size = 8
    Plater.db.profile.plate_config.friendlynpc.level_text_size = 8
    Plater.db.profile.plate_config.friendlynpc.percent_text_size = 8
    Plater.db.profile.plate_config.friendlynpc.spellname_text_size = 8
    Plater.db.profile.plate_config.friendlynpc.spellpercent_text_size = 8

    Plater.db.profile.plate_config.friendlyplayer.actorname_text_size = 8
    Plater.db.profile.plate_config.friendlyplayer.big_actorname_text_size = 8
    Plater.db.profile.plate_config.friendlyplayer.big_actortitle_text_size = 8
    Plater.db.profile.plate_config.friendlyplayer.level_text_size = 8
    Plater.db.profile.plate_config.friendlyplayer.percent_text_size = 8
    Plater.db.profile.plate_config.friendlyplayer.spellname_text_size = 8
    Plater.db.profile.plate_config.friendlyplayer.spellpercent_text_size = 8

    Plater.db.profile.auto_toggle_friendly_enabled = true
    Plater.db.profile.auto_toggle_friendly = {
        party = true,
        arena = false,
        raid = true,
        cities = false,
        world = false
    }

    Plater.RefreshDBUpvalues()
    Plater.UpdateAllPlates()
    Plater.RefreshAutoToggle()
end

local function ApplyWarpDepleteTweaks()
    ZT:Debug("Applying WarpDeplete Tweaks")

    local profile = WarpDepleteDB["profiles"][profiles.atrocityUI]

    profile["objectivesFontSize"] = 16
    profile["keyFontSize"] = 16
    profile["bar1FontSize"] = 16
    profile["bar2FontSize"] = 16
    profile["bar3FontSize"] = 16
    profile["timerFontSize"] = 24
    profile["keyDetailsFontSize"] = 16
    profile["deathsFontSize"] = 16
    profile["forcesFontSize"] = 16
end

function ZT:ApplyAtrocityTweaks()
    self:Debug("Applying AtrocityUI tweaks")

    ApplyElvUITweaks()
    ApplyAddonSkinsTweaks()
    ApplySLETweaks()
    ApplyWeakAurasTweaks()
    ApplyBigWigsTweaks()
    ApplyMRTTweaks()
    ApplyOmniCDTweaks()
    ApplyDetailsTweaks()
    ApplyPlaterTweaks()
    ApplyWarpDepleteTweaks()

    ReloadUI()

    self:Debug("Complete!")
end
