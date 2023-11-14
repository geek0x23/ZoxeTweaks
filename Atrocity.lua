---@class ZoxeTweaks
local ZT = LibStub("AceAddon-3.0"):GetAddon("ZoxeTweaks")

local profiles = {
    atrocityUI = "AtrocityUI",
    atrocityUIColor = "AtrocityUI [C]",
    atrocityUIHealer = "AtrocityUI Healer",
    atrocityUIHealerColor = "AtrocityUI Healer [C]"
}

local function ApplyElvUITweaks(ztp)
    local E = select(1, unpack(ElvUI))

    local elv = ElvDB["profiles"][profiles.atrocityUI]
    local elvColor = ElvDB["profiles"][profiles.atrocityUIColor]
    local elvHealer = ElvDB["profiles"][profiles.atrocityUIHealer]
    local elvHealerColor = ElvDB["profiles"][profiles.atrocityUIHealerColor]

    local elvPriv = ElvPrivateDB["profiles"][profiles.atrocityUI]
    local elvPrivColor = ElvPrivateDB["profiles"][profiles.atrocityUIColor]
    local elvPrivHealer = ElvPrivateDB["profiles"][profiles.atrocityUIHealer]
    local elvPrivHealerColor = ElvPrivateDB["profiles"][profiles.atrocityUIHealerColor]

    if ztp.fonts.resize then
        -- Fonts
        elvPriv["general"]["nameplateFontSize"] = ztp.fonts.size
        elvPriv["general"]["nameplateLargeFontSize"] = ztp.fonts.size
        elvPrivColor["general"]["nameplateFontSize"] = ztp.fonts.size
        elvPrivColor["general"]["nameplateLargeFontSize"] = ztp.fonts.size
        elvPrivHealer["general"]["nameplateFontSize"] = ztp.fonts.size
        elvPrivHealer["general"]["nameplateLargeFontSize"] = ztp.fonts.size
        elvPrivHealerColor["general"]["nameplateFontSize"] = ztp.fonts.size
        elvPrivHealerColor["general"]["nameplateLargeFontSize"] = ztp.fonts.size

        elv["general"]["fonts"] = elv["general"]["fonts"] or {}
        elvColor["general"]["fonts"] = elvColor["general"]["fonts"] or {}
        elvHealer["general"]["fonts"] = elvHealer["general"]["fonts"] or {}
        elvHealerColor["general"]["fonts"] = elvHealerColor["general"]["fonts"] or {}

        local smallFont = {
            enable = true,
            outline = "OUTLINE",
            size = ztp.fonts.size - 4
        }

        local normalFont = {
            enable = true,
            outline = "OUTLINE",
            size = ztp.fonts.size
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
    end


    if ztp.elvUI.databars then
        -- Data Bars
        if ztp.fonts.resize then
            elv["databars"]["experience"]["fontSize"] = ztp.fonts.size
            elvColor["databars"]["experience"]["fontSize"] = ztp.fonts.size
            elvHealer["databars"]["experience"]["fontSize"] = ztp.fonts.size
            elvHealerColor["databars"]["experience"]["fontSize"] = ztp.fonts.size
        end

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
    end


    if ztp.elvUI.disableBags then
        -- Bags
        elvPriv["bags"] = elvPriv["bags"] or {}
        elvPrivColor["bags"] = elvPrivColor["bags"] or {}
        elvPrivHealer["bags"] = elvPrivHealer["bags"] or {}
        elvPrivHealerColor["bags"] = elvPrivHealerColor["bags"] or {}

        elvPriv["bags"]["enable"] = false
        elvPrivColor["bags"]["enable"] = false
        elvPrivHealer["bags"]["enable"] = false
        elvPrivHealerColor["bags"]["enable"] = false
    end


    if ztp.fonts.resize then
        -- Alternative Power Bar
        elv["general"]["altPowerBar"]["fontSize"] = ztp.fonts.size
        elvColor["general"]["altPowerBar"]["fontSize"] = ztp.fonts.size
        elvHealer["general"]["altPowerBar"]["fontSize"] = ztp.fonts.size
        elvHealerColor["general"]["altPowerBar"]["fontSize"] = ztp.fonts.size

        -- Blizzard UI Improvements
        elv["general"]["lootRoll"]["nameFontSize"] = ztp.fonts.size
        elvColor["general"]["lootRoll"]["nameFontSize"] = ztp.fonts.size
        elvHealer["general"]["lootRoll"]["nameFontSize"] = ztp.fonts.size
        elvHealerColor["general"]["lootRoll"]["nameFontSize"] = ztp.fonts.size

        elv["general"]["itemLevel"]["itemLevelFontSize"] = ztp.fonts.size
        elvColor["general"]["itemLevel"]["itemLevelFontSize"] = ztp.fonts.size
        elvHealer["general"]["itemLevel"]["itemLevelFontSize"] = ztp.fonts.size
        elvHealerColor["general"]["itemLevel"]["itemLevelFontSize"] = ztp.fonts.size

        elv["general"]["queueStatus"]["fontSize"] = ztp.fonts.size
        elvColor["general"]["queueStatus"]["fontSize"] = ztp.fonts.size
        elvHealer["general"]["queueStatus"]["fontSize"] = ztp.fonts.size
        elvHealerColor["general"]["queueStatus"]["fontSize"] = ztp.fonts.size

        -- Extra Action Button
        elv["actionbar"]["extraActionButton"]["hotkeyFontSize"] = ztp.fonts.size
        elvColor["actionbar"]["extraActionButton"]["hotkeyFontSize"] = ztp.fonts.size
        elvHealer["actionbar"]["extraActionButton"]["hotkeyFontSize"] = ztp.fonts.size
        elvHealerColor["actionbar"]["extraActionButton"]["hotkeyFontSize"] = ztp.fonts.size
    end

    elv["general"]["queueStatus"]["scale"] = 0.4
    elvColor["general"]["queueStatus"]["scale"] = 0.4
    elvHealer["general"]["queueStatus"]["scale"] = 0.4
    elvHealerColor["general"]["queueStatus"]["scale"] = 0.4


    if ztp.elvUI.actionBars then
        -- Action Bars
        elv["actionbar"]["bar5"]["buttonSize"] = 28
        elvColor["actionbar"]["bar5"]["buttonSize"] = 28
        elvHealer["actionbar"]["bar5"]["buttonSize"] = 26
        elvHealerColor["actionbar"]["bar5"]["buttonSize"] = 26

        elv["actionbar"]["bar6"]["buttonSize"] = 30
        elvColor["actionbar"]["bar6"]["buttonSize"] = 30
        elvHealer["actionbar"]["bar6"]["buttonSize"] = 28
        elvHealerColor["actionbar"]["bar6"]["buttonSize"] = 28

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
    end

    if ztp.fonts.resize then
        -- Auras
        elv["auras"]["debuffs"]["timeFontSize"] = ztp.fonts.size
        elvColor["auras"]["debuffs"]["timeFontSize"] = ztp.fonts.size
        elvHealer["auras"]["debuffs"]["timeFontSize"] = ztp.fonts.size
        elvHealerColor["auras"]["debuffs"]["timeFontSize"] = ztp.fonts.size

        elv["auras"]["debuffs"]["countFontSize"] = ztp.fonts.size
        elvColor["auras"]["debuffs"]["countFontSize"] = ztp.fonts.size
        elvHealer["auras"]["debuffs"]["countFontSize"] = ztp.fonts.size
        elvHealerColor["auras"]["debuffs"]["countFontSize"] = ztp.fonts.size

        elv["auras"]["buffs"]["timeFontSize"] = ztp.fonts.size
        elvColor["auras"]["buffs"]["timeFontSize"] = ztp.fonts.size
        elvHealer["auras"]["buffs"]["timeFontSize"] = ztp.fonts.size
        elvHealerColor["auras"]["buffs"]["timeFontSize"] = ztp.fonts.size

        elv["auras"]["buffs"]["countFontSize"] = ztp.fonts.size
        elvColor["auras"]["buffs"]["countFontSize"] = ztp.fonts.size
        elvHealer["auras"]["buffs"]["countFontSize"] = ztp.fonts.size
        elvHealerColor["auras"]["buffs"]["countFontSize"] = ztp.fonts.size

        -- Chat
        elv["chat"]["fontSize"] = ztp.fonts.size
        elvColor["chat"]["fontSize"] = ztp.fonts.size
        elvHealer["chat"]["fontSize"] = ztp.fonts.size
        elvHealerColor["chat"]["fontSize"] = ztp.fonts.size

        elv["chat"]["tabFontSize"] = ztp.fonts.size
        elvColor["chat"]["tabFontSize"] = ztp.fonts.size
        elvHealer["chat"]["tabFontSize"] = ztp.fonts.size
        elvHealerColor["chat"]["tabFontSize"] = ztp.fonts.size
    end

    if ztp.elvUI.panels then
        -- Chat continued
        elv["chat"]["panelWidth"] = 500
        elvColor["chat"]["panelWidth"] = 500
        elvHealer["chat"]["panelWidth"] = 500
        elvHealerColor["chat"]["panelWidth"] = 500

        elv["chat"]["panelHeight"] = 272
        elvColor["chat"]["panelHeight"] = 272
        elvHealer["chat"]["panelHeight"] = 272
        elvHealerColor["chat"]["panelHeight"] = 272

        -- this is here because we don't want to use 12 buttons unless
        -- we are resizing the chat panels, too.
        elv["actionbar"]["bar3"]["buttons"] = 12
        elvColor["actionbar"]["bar3"]["buttons"] = 12
        elvHealer["actionbar"]["bar3"]["buttons"] = 12
        elvHealerColor["actionbar"]["bar3"]["buttons"] = 12
    end


    -- DataTexts
    if ztp.fonts.resize then
        elv["datatexts"]["fontSize"] = ztp.fonts.size
        elvColor["datatexts"]["fontSize"] = ztp.fonts.size
        elvHealer["datatexts"]["fontSize"] = ztp.fonts.size
        elvHealerColor["datatexts"]["fontSize"] = ztp.fonts.size
    end

    if ztp.elvUI.minimapDataTexts then
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
    end

    -- Maps
    E.global.general.smallerWorldMap = false
    E.global.general.WorldMapCoordinates.enable = false

    if ztp.fonts.resize then
        elv["general"]["minimap"]["locationFontSize"] = ztp.fonts.size
        elvColor["general"]["minimap"]["locationFontSize"] = ztp.fonts.size
        elvHealer["general"]["minimap"]["locationFontSize"] = ztp.fonts.size
        elvHealerColor["general"]["minimap"]["locationFontSize"] = ztp.fonts.size

        elv["general"]["minimap"]["timeFontSize"] = ztp.fonts.size
        elvColor["general"]["minimap"]["timeFontSize"] = ztp.fonts.size
        elvHealer["general"]["minimap"]["timeFontSize"] = ztp.fonts.size
        elvHealerColor["general"]["minimap"]["timeFontSize"] = ztp.fonts.size
    end

    if ztp.elvUI.minimap then
        -- Minimap
        E.global.datatexts.customPanels.Clock.width = 262

        elv["general"]["minimap"]["scale"] = 1.25
        elvColor["general"]["minimap"]["scale"] = 1.25
        elvHealer["general"]["minimap"]["scale"] = 1.25
        elvHealerColor["general"]["minimap"]["scale"] = 1.25

        elv["general"]["minimap"]["size"] = 210
        elvColor["general"]["minimap"]["size"] = 210
        elvHealer["general"]["minimap"]["size"] = 210
        elvHealerColor["general"]["minimap"]["size"] = 210
    end


    if ztp.fonts.resize then
        -- Tooltip
        elv["tooltip"]["headerFontSize"] = ztp.fonts.size
        elvColor["tooltip"]["headerFontSize"] = ztp.fonts.size
        elvHealer["tooltip"]["headerFontSize"] = ztp.fonts.size
        elvHealerColor["tooltip"]["headerFontSize"] = ztp.fonts.size

        elv["tooltip"]["textFontSize"] = ztp.fonts.size
        elvColor["tooltip"]["textFontSize"] = ztp.fonts.size
        elvHealer["tooltip"]["textFontSize"] = ztp.fonts.size
        elvHealerColor["tooltip"]["textFontSize"] = ztp.fonts.size

        elv["tooltip"]["smallTextFontSize"] = ztp.fonts.size
        elvColor["tooltip"]["smallTextFontSize"] = ztp.fonts.size
        elvHealer["tooltip"]["smallTextFontSize"] = ztp.fonts.size
        elvHealerColor["tooltip"]["smallTextFontSize"] = ztp.fonts.size
    end

    if ztp.elvUI.tooltip then
        elv["tooltip"]["modifierID"] = "SHIFT"
        elvColor["tooltip"]["modifierID"] = "SHIFT"
        elvHealer["tooltip"]["modifierID"] = "SHIFT"
        elvHealerColor["tooltip"]["modifierID"] = "SHIFT"

        elv["tooltip"]["itemCount"] = "NONE"
        elvColor["tooltip"]["itemCount"] = "NONE"
        elvHealer["tooltip"]["itemCount"] = "NONE"
        elvHealerColor["tooltip"]["itemCount"] = "NONE"
    end

    if ztp.fonts.resize then
        -- Unit Frames
        elv["unitframe"]["fontSize"] = ztp.fonts.size
        elvColor["unitframe"]["fontSize"] = ztp.fonts.size
        elvHealer["unitframe"]["fontSize"] = ztp.fonts.size
        elvHealerColor["unitframe"]["fontSize"] = ztp.fonts.size

        elv["unitframe"]["units"]["party"]["raidRoleIcons"]["xOffset"] = -27
        elvColor["unitframe"]["units"]["party"]["raidRoleIcons"]["xOffset"] = -27

        elv["unitframe"]["units"]["raid1"]["buffs"]["countFontSize"] = ztp.fonts.size - 2
        elvColor["unitframe"]["units"]["raid1"]["buffs"]["countFontSize"] = ztp.fonts.size - 2
        elvHealer["unitframe"]["units"]["raid1"]["buffs"]["countFontSize"] = ztp.fonts.size - 2
        elvHealerColor["unitframe"]["units"]["raid1"]["buffs"]["countFontSize"] = ztp.fonts.size - 2

        elv["unitframe"]["units"]["raid2"]["buffs"]["countFontSize"] = ztp.fonts.size - 2
        elvColor["unitframe"]["units"]["raid2"]["buffs"]["countFontSize"] = ztp.fonts.size - 2
        elvHealer["unitframe"]["units"]["raid2"]["buffs"]["countFontSize"] = ztp.fonts.size - 2
        elvHealerColor["unitframe"]["units"]["raid2"]["buffs"]["countFontSize"] = ztp.fonts.size - 2

        elv["unitframe"]["units"]["raid3"]["buffs"]["countFontSize"] = ztp.fonts.size - 2
        elvColor["unitframe"]["units"]["raid3"]["buffs"]["countFontSize"] = ztp.fonts.size - 2
        elvHealer["unitframe"]["units"]["raid3"]["buffs"]["countFontSize"] = ztp.fonts.size - 2
        elvHealerColor["unitframe"]["units"]["raid3"]["buffs"]["countFontSize"] = ztp.fonts.size - 2
    end

    if ztp.elvUI.panels then
        elv["unitframe"]["units"]["raid1"]["width"] = 99
        elvColor["unitframe"]["units"]["raid1"]["width"] = 99

        elv["unitframe"]["units"]["raid2"]["width"] = 99
        elvColor["unitframe"]["units"]["raid2"]["width"] = 99

        elv["unitframe"]["units"]["raid3"]["width"] = 99
        elvColor["unitframe"]["units"]["raid3"]["width"] = 99
    end

    -- Movers
    if ztp.elvUI.minimap then
        elv["movers"]["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-290"
        elvColor["movers"]["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-290"
        elvHealer["movers"]["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-290"
        elvHealerColor["movers"]["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-290"

        elv["movers"]["DTPanelClockMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-233"
        elvColor["movers"]["DTPanelClockMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-233"
        elvHealer["movers"]["DTPanelClockMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-233"
        elvHealerColor["movers"]["DTPanelClockMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-233"
    end

    if ztp.elvUI.panels then
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
    end

    elv["movers"]["LossControlMover"] = "TOP,ElvUIParent,TOP,0,-500"
    elvColor["movers"]["LossControlMover"] = "TOP,ElvUIParent,TOP,0,-500"
    elvHealer["movers"]["LossControlMover"] = "TOP,ElvUIParent,TOP,0,-500"
    elvHealerColor["movers"]["LossControlMover"] = "TOP,ElvUIParent,TOP,0,-500"

    if ztp.elvUI.unitFrames then
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

        elv["movers"]["ElvUF_Raid1Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"
        elvColor["movers"]["ElvUF_Raid1Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"

        elv["movers"]["ElvUF_Raid2Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"
        elvColor["movers"]["ElvUF_Raid2Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"

        elv["movers"]["ElvUF_Raid3Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"
        elvColor["movers"]["ElvUF_Raid3Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"

        elv["movers"]["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,893,580"
        elvColor["movers"]["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,893,580"
    end

    if ztp.elvUI.actionBars then
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
    end
end

local function ApplyAddonSkinsTweaks(ztp)
    if ztp.elvUI.panels then
        AddOnSkinsDB["profiles"]["Default"]["EmbedLeftWidth"] = 250
        AddOnSkinsDB["profiles"]["Default"]["EmbedSystemDual"] = true
    end

    AddOnSkinsDB["profiles"]["Default"]["EmbedSystemMessage"] = false
end

local function ApplySLETweaks(ztp)
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
        install_complete = "4.73",
    }

    ElvPrivateDB["profiles"][profiles.atrocityUI]["sle"] = privates
    ElvPrivateDB["profiles"][profiles.atrocityUIColor]["sle"] = privates
    ElvPrivateDB["profiles"][profiles.atrocityUIHealer]["sle"] = privates
    ElvPrivateDB["profiles"][profiles.atrocityUIHealerColor]["sle"] = privates
end

local function ApplyWeakAurasTweaks(ztp)
    if ztp.fonts.resize then
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
                        region["text_fontSize"] = ztp.fonts.size
                    end
                end
            end
        end
    end

    -- Automark
    WeakAurasSaved["displays"]["Automark"]["yOffset"] = 90

    if ztp.elvUI.panels then
        -- Combat Info
        WeakAurasSaved["displays"]["Combat Ress"]["xOffset"] = -1289
        WeakAurasSaved["displays"]["Combat Ress"]["yOffset"] = -432
        WeakAurasSaved["displays"]["Combat Time"]["xOffset"] = -1668
        WeakAurasSaved["displays"]["Combat Time"]["yOffset"] = -432
    end
end

local function ApplyBigWigsTweaks(ztp)
    local profile = BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][profiles.atrocityUI]

    if ztp.fonts.resize then
        profile["fontSize"] = ztp.fonts.size
        profile["fontSizeEmph"] = ztp.fonts.size
    end

    if ztp.bigWigs then
        profile["BigWigsAnchor_x"] = 1728
        profile["BigWigsAnchor_y"] = 162
        profile["BigWigsEmphasizeAnchor_x"] = 1080
        profile["BigWigsEmphasizeAnchor_y"] = 276
    end
end

local function ApplyMRTTweaks(ztp)
    if ztp.fonts.resize then
        VMRT.Note.FontSize = ztp.fonts.size
    end
end

local function ApplyOmniCDTweaks(ztp)
    local profile = OmniCDDB["profiles"][profiles.atrocityUI]

    if ztp.fonts.resize then
        profile["General"]["fonts"]["statusBar"]["size"] = ztp.fonts.size + 8
        profile["General"]["fonts"]["anchor"]["size"] = ztp.fonts.size
        profile["General"]["fonts"]["icon"]["size"] = ztp.fonts.size
    end

    if ztp.omniCD then
        profile["Party"]["party"]["icons"]["scale"] = 1.05
        profile["Party"]["party"]["position"]["offsetX"] = 2
        profile["Party"]["party"]["position"]["offsetY"] = 3

        profile["Party"]["party"]["extraBars"]["raidBar0"]["manualPos"]["raidBar0"]["x"] = 476.8001343409123
        profile["Party"]["party"]["extraBars"]["raidBar0"]["manualPos"]["raidBar0"]["y"] = 442.1335348447028

        profile["Party"]["party"]["extraBars"]["raidBar1"]["manualPos"]["raidBar1"]["x"] = 476.8001343409123
        profile["Party"]["party"]["extraBars"]["raidBar1"]["manualPos"]["raidBar1"]["y"] = 332.5332158565579
    end

    local healerProfile = OmniCDDB["profiles"][profiles.atrocityUIHealer]

    if ztp.fonts.resize then
        healerProfile["General"]["fonts"]["statusBar"]["size"] = ztp.fonts.size + 8
        healerProfile["General"]["fonts"]["anchor"]["size"] = ztp.fonts.size
        healerProfile["General"]["fonts"]["icon"]["size"] = ztp.fonts.size
    end

    if ztp.omniCD then
        healerProfile["Party"]["party"]["extraBars"]["raidBar0"]["manualPos"]["raidBar0"]["x"] = 620.5329708258505
        healerProfile["Party"]["party"]["extraBars"]["raidBar0"]["manualPos"]["raidBar0"]["y"] = 197.6001509825292
    end
end

local function ApplyDetailsTweaks(ztp)
    if ztp.fonts.resize then
        Details.tooltip.fontsize = ztp.fonts.size
        Details.tooltip.fontsize_title = ztp.fonts.size
    end

    if ztp.details then
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
end

local function ApplyPlaterTweaks(ztp)
    if ztp.plater then
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
end

local function ApplyWarpDepleteTweaks(ztp)
    if ztp.fonts.resize then
        local profile = WarpDepleteDB["profiles"][profiles.atrocityUI]

        profile["objectivesFontSize"] = ztp.fonts.size
        profile["keyFontSize"] = ztp.fonts.size
        profile["bar1FontSize"] = ztp.fonts.size
        profile["bar2FontSize"] = ztp.fonts.size
        profile["bar3FontSize"] = ztp.fonts.size
        profile["timerFontSize"] = 24 -- default to big font for clock
        profile["keyDetailsFontSize"] = ztp.fonts.size
        profile["deathsFontSize"] = ztp.fonts.size
        profile["forcesFontSize"] = ztp.fonts.size
    end
end

function ZT:ApplyAtrocityTweaks()
    local ztp = self.db.profile.atrocityUI

    ApplyElvUITweaks(ztp)
    ApplyAddonSkinsTweaks(ztp)
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
