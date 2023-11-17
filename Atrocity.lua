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
            size = ztp.fonts.size - 2
        }

        elv["general"]["fonts"]["objective"] = smallFont
        elv["general"]["fonts"]["questsmall"] = normalFont
        elv["general"]["fonts"]["questtext"] = normalFont
        elv["general"]["fonts"]["questtitle"] = normalFont
        elv["general"]["fonts"]["mailbody"] = normalFont

        elvColor["general"]["fonts"]["objective"] = smallFont
        elvColor["general"]["fonts"]["questsmall"] = normalFont
        elvColor["general"]["fonts"]["questtext"] = normalFont
        elvColor["general"]["fonts"]["questtitle"] = normalFont
        elvColor["general"]["fonts"]["mailbody"] = normalFont

        elvHealer["general"]["fonts"]["objective"] = smallFont
        elvHealer["general"]["fonts"]["questsmall"] = normalFont
        elvHealer["general"]["fonts"]["questtext"] = normalFont
        elvHealer["general"]["fonts"]["questtitle"] = normalFont
        elvHealer["general"]["fonts"]["mailbody"] = normalFont

        elvHealerColor["general"]["fonts"]["objective"] = smallFont
        elvHealerColor["general"]["fonts"]["questsmall"] = normalFont
        elvHealerColor["general"]["fonts"]["questtext"] = normalFont
        elvHealerColor["general"]["fonts"]["questtitle"] = normalFont
        elvHealerColor["general"]["fonts"]["mailbody"] = normalFont
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

    if ztp.elvUI.panels then
        -- Combat Info
        WeakAurasSaved["displays"]["Combat Ress"]["xOffset"] = -1289
        WeakAurasSaved["displays"]["Combat Ress"]["yOffset"] = -432
        WeakAurasSaved["displays"]["Combat Ress"]["justify"] = "RIGHT"

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
        profile["growup"] = true
        profile["BigWigsAnchor_x"] = 1728
        profile["BigWigsAnchor_y"] = 162
        profile["BigWigsEmphasizeAnchor_x"] = 1080
        profile["BigWigsEmphasizeAnchor_y"] = 276
    end
end

local function ApplyMRTTweaks(ztp)
    if ztp.fonts.resize then
        VMRT.Note.FontSize = ztp.fonts.size

        -- Generic Column in Raid Cooldowns
        local genericSettings = VMRT.ExCD2.colSet[11]
        genericSettings.fontCenterSize = ztp.fonts.size
        genericSettings.fontIconSize = ztp.fonts.size
        genericSettings.fontIconCDSize = ztp.fonts.size
        genericSettings.fontLeftSize = ztp.fonts.size
        genericSettings.fontRightSize = ztp.fonts.size
        genericSettings.fontSize = ztp.fonts.size
        genericSettings.iconMasque = true

    end

    if ztp.elvUI.unitFrames then
        -- Raid CD's
        local raidCDs = VMRT.ExCD2.colSet[1]
        raidCDs.posX = 507.7777099609375

        -- Healer CD's
        local healerCDs = VMRT.ExCD2.colSet[2]
        healerCDs.posX = 507.7777099609375
    end

    if ZT.db.profile.scaleFactor then
        VMRT.Addon.Scale = ZT.db.profile.scaleFactor
    end

    if ztp.mrtRaidNotes then
        VMRT.Note.AutoLoad = {
			2820, -- [1]
			2709, -- [2]
			2737, -- [3]
			2728, -- [4]
			2708, -- [5]
			2731, -- [6]
			2824, -- [7]
			2786, -- [8]
			2677, -- [9]
		}

        VMRT.Note.BlackLastUpdateName = {
			"Zoxormu-Stormrage", -- [1]
			"Zoxormu-Stormrage", -- [2]
			"Zoxormu-Stormrage", -- [3]
			"Zoxormu-Stormrage", -- [4]
			"Zoxormu-Stormrage", -- [5]
			"Zoxormu-Stormrage", -- [6]
			"Zoxormu-Stormrage", -- [7]
			"Zoxormu-Stormrage", -- [8]
			"Zoxormu-Stormrage", -- [9]
		}

		VMRT.Note.Black = {
			"AOE - LUST ON PULL\nPHASE 1\n- Avoid random frontal from {spell:422039}Shadowflame Cleave.\n- Tainted Lashers spawn and burrow underground.\n- {spell:421971}Controlled Burn is a big circle on a player.\n  - Drop near edges, but try to hit lots of Lashers.\n\nPHASE 2\n- Starts when Gnarlroot hits 100 energy.\n- Any remaining Tainted Lashers will activate.  Kill them ASAP.\n- He will cast {spell:421013}Doom Cultivation and spawn {spell:425648}Doom Roots.\n  - Soak small circles to gain {spell:421038}Ember-Charred debuff.\n  - When {spell:421038}Ember-Charred, stand by roots to burn them.\n{T}\nTANKS\n- Taunt swap after every {spell:424352}Dreadfire Barrage\n- Tainted Lashers have a stacking bleed.  Use defensives.\n- Stun Tainted Lashers that go near the boss.\n{/T}{H}\nHEALERS\n- {spell:422026}Tortured Scream increases the damage the raid takes.\n- Be ready after intermission.  Lots of raid damage going out.\n- {spell:425709}Rising Mania ramps damage 10% every time phase 2 ends.\n{/H}{D}\nDPS\n- Stun Tainted Lashers that go near the boss.\n- Double damage for 20 seconds after phase 2 ends.\n{/D}", -- [1]
			"SINGLE TARGET - LUST ON PULL\n{spell:414425}Blistering Spears is cast to tether random players.\n- Affected players cluster near the boss.  Damage is low.\n- DPS should destroy the spears to break players free.\n\n{spell:416998}Twisting Blade will fly towards a random player.  Dodge.\n\nAt 100 energy, {spell:422776}Marked for Torment will spawn zones.\n\n- The raid will soak Slicing Torment (middle) first.\n  - Uses {spell:418533}Smashing Viscera to leap at someone.  Dodge.\n\n- The raid will soak Hacking Torment (left) second.\n  - A tank will be hit with {spell:416056}Umbral Destruction\n  - Half the raid soaks and receives a {spell:429277}Brutalized debuff.\n\n- The raid will soak Flaying Torment (right) third.\n  - {spell:415624}Heart Stopper is a healing absorb.\n  - Affected players spread to avoid hitting others.\n{T}\nTANKS\n - Always be near each other because of {spell:423108}Viscious Swing.\n - Swap at ~6 stacks of {spell:414340}Drenched Blades.\n{/T}{H}\nHEALERS\n - Watch for {spell:414425}Blistering Spears (burst damage + DoT).\n - Save big AoE heals for {spell:415624}Heart Stopper.\n{/H}", -- [2]
			"SINGLE TARGET - LUST ON PULL\n{spell:420421}Scorchtail Crash drops a big shadow.  Dodge.\n\nBarfs {spell:421616}Volcanic Disgorge.  Dodge small circles.\n\n{spell:421672}Serpent's Fury does burst raid damage for 5 seconds.\n- Afterward, he casts {spell:421284}Coiling Flames on random players.\n  - {spell:421284}Coiling Flames cleaves, so run away from others.\n  - {spell:421284}Coiling Flames jumps to another player when it ends.\n\nAt 100 energy, {spell:420934}Flood of the Firelands spawns two soaks.\n- Raid splits in half to handle big soaks, and stays split.\n- Soaks cause a knockback, so position carefully.\n{T}\nTANKS\n- Always stay in melee to prevent {spell:421703}Serpent's Wrath.\n- He applies a stacking debuff called {spell:419054}Molten Venom.\n  - Each stack increases damage of {spell:423117}Cataclysm Jaws.\n  - Swap *before* every cast of {spell:423117}Cataclysm Jaws.\n{/T}{H}\nHEALERS\n- {spell:421284}Coiling Flames hurts more the longer it's on a target.\n- {spell:421672}Serpent's Fury causes big raid damage for 5 seconds.\n{/H}", -- [3]
			"CLEAVE BOSS - LUST ON PULL\nURCTOS\n- Casts {spell:420946}Barreling Charge at tank doign splash damage.\n  - About a third of the raid needs to soak this (melee).\n  - Aim at Aerwynn during {spell:421292}Constricting Thicket.\n- At 100 energy he channels {spell:420525}Blind Rage.\n  - Interrupt by dispelling a {spell:418720}Polymorph Bomb on top of him.\n\nAERWYNN\n- Throws {spell:420856}Poisonous Javelins at players. Dispel this.\n- Spawns {spell:420671}Noxious Blossoms that pulse aoe damage\n  - Destroy blossoms by running over them while {spell:418720} polymorphed.\n- At 100 energy she channels {spell:421292}Constricting Thicket.\n  - Aim a {spell:420946}Barreling Charge at Aerwynn to interrupt her.\n\nPIP\n- {spell:421024}Emerald Winds pushes players back for 3 seconds.\n- Casts {spell:418720}Polymorph Bomb to turn players into ducks.\n  - Eat {spell:420671}Noxious Blossoms to get {spell:422372}Preen (which cleanses it).\n  - Use {spell:422372}Preen on top of Urctos to stop his {spell:420525}Blind Rage.\n  - {spell:422372}Preen will stun players within 7 yards, so be careful.\n- At 100 energy he channels {spell:421029}Song of the Dragon.\n  - Players will get a shield called {spell:426390}Corrosive Pollen.\n  - Stand on {spell:420671}Noxious Blossoms until the shield is removed.\n{T}\nTANKS\n- Urctos is the only boss you can move.  Stack him on another boss.\n- {spell:421020}Agonizing Claws is a cleaving tank buster.  Swap every cast.\n- Point {spell:420946}Barreling Charge at Aerwynn she is channeling thickets.\n{/T}{H}\nHEALERS\n- Be sure to dispel {spell:420856}Poisonous Javelin (poison debuff)\n- Expect spiky damage during charge, winds, and thicket\n{/H}", -- [4]
			"SINGLE TARGET - LUST ON PULL\nPHASE 1\n- {spell:418423}Verdant Matrix creates lines on the floor that damage you.\n- She casts {spell:420836}Continuum to move the lines from time to time.\n- {spell:429785}Impending Loom are beams that slowly travel outward.  Dodge.\n- Small pools of {spell:425357}Surging Growth must be soaked by one player.\n- {spell:420907}Viridian Rain causes widespread raid damage.\n- At 100 energy, she casts {spell:426855}Full Bloom to start phase 2.\n  - Move within 16 yards for {spell:429127}Inflorescence to walk through lines.\n\nPHASE 2\n- The raid must split to opposite sides to deal with Cycle Wardens\n- Wardens cast {spell:425370}Radial Flourish.  Dodge the swirlies.\n- {spell:429108}Lumbering Slam is a frontal cone.  Dodge (tank can too).\n- When both Cycle Wardens are killed, she goes back to phase 1.\n{T}\nTANKS\n- {spell:427722}Weaver's Burden is a bomb.  Taunt swap and move out of raid.\n- {spell:426154}Threaded Blast is a tank buster.  Use defensives.\n- Big tree adds shouldn't cross any lines to avoid {spell:423842}Verdant Rend.\n{/T}{H}\nHEALERS\n- During {spell:420836}Continuum the raid will take heavy damage.\n- In phase 2 she will cast {spell:421368}Unravel, causing heavy raid damage.\n{/H}", -- [5]
			"SINGLE TARGET - LUST ON PULL\nPHASE 1\n- The Seed of Life can be used activate {spell:425249}Dream Blossom.\n  - {spell:425249}Dream Blossom clears {spell:417610}Burning Ground and {spell:417660}Scorching Roots\n  - To charge the seed, kill Fiery Treants, then heal Charred Treants.\n\n- At 100 energy, he will cast {spell:417634}Raging Inferno for 6 seconds.\n  - To survive this, we must stand in a Renewed Bramble Barrier.\n  - To spawn a barrier, kill Scorching Roots, then heal Charred Brambles.\n\nINTERMISSION\n- {spell:421316}Consuming Flame radiates damage and pulls players in.\n  - Stay at least 3 yards away from him to reduce the damage.\n\nPHASE 2 (BURN)\n- {spell:427252}Falling Embers is a mini-soak, 1 player per pool.\n- {spell:427343}Fire Whirl are spiraling tornadoes.  Dodge.\n{T}\nTANKS\n- Always position boss near the edge of {spell:417610}Burning Ground.\n- Run ~20 yards away from {spell:418637}Furious Charge.\n- Taunt swap after every {spell:418637}Furious Charge.\n{/T}{H}\nHEALERS\n- Make sure to heal Charred Treants to full and keep them healthy.\n- Heal Scorching Brambles to full to spawn Renewed Bramble Barrier.\n- Heal players with {spell:421326}Flash Fire to prevent {spell:427306}Encased in Ash.\n{/H}{D}\nDPS\n- Kill Fiery Treants as fast and interrupt their {spell:426524}Fiery Flourish\n- Kill Ashen Treants along the edges of the room to save space.\n{/D}", -- [6]
			"SINGLE TARGET - LUST ON PULL\nPHASE 1\n- {spell:422691}Lava Geysers target random players and create fire pools.\n  - We want to bait these so they stay near the edges.\n- {spell:421455}Overheated debuff causes damage around a player.\n- {spell:421343}Brand of Damnation must be soaked by at least 4 players.\n  - It leaves a debuff and heal absorb called {spell:421656}Cauterizing Wound\n  - When heal absorb is cleared, a pool is spawned.  Drop near edges.\n- At 100 energy, he casts {spell:422277}Devour Essence and starts phase 2\n  - Players with {spell:421656}Cauterizing Wound will be knocked back.\n\nPHASE 2 (BURN)\n- {spell:423904}Living Flames will spawn from players that are knocked back.\n  - The flames give a damage buff.  Don't let them hit the boss.\n- {spell:422172}World in Flames causes donut-style aoe patterns.  Dodge.\n- {spell:422067}Blazing Soul increases his heavy AoE raid damage.\n- At 100 energy, he will return to phase 1.\n{T}\nTANKS\n- Taunt swap after every {spell:421343}Brand of Damnation soak.\n{/T}{H}\nHEALERS\n- {spell:422067}Blazing Soul is heavy raid damage.\n- Watch for players with heal absorb from {spell:421656}Cauterizing Wound.\n{/H}", -- [7]
			"SINGLE TARGET - LUST ON PULL\nALWAYS\n- {spell:424495}Mass Entanglement roots players and spawns thorns.\n  - Loosely cluster up for AoE DPS to break players free.\n- {spell:420236}Falling Star spawns blue swirlies.  Dodge them.\n- {spell:424581}Fiery Growth spawns pools.  Go out for dispells.\n- Tanks must alternate soaking {spell:423260}Blazing Mushrooms\n\nMOONKIN\n- {spell:421398}Fire Beams are big orange circles.  Dodge.\n\nOWL\n- {spell:421636}Typoon knocks you back and spawns feathers.\n- Collect {spell:422509}Empowered Feathers to gain Dragon Riding!\n- Fly to the next platform, dodging {spell:421939}Scorching Plumes\n  - Fly through {spell:424258}Dream Essence for big buffs!\n  - Fly through {spell:421884}Emerald Gales for vigor and speed!\n- When you land, DPS the shield to interrupt {spell:424140}Supernova\n\nTREANT\n- {spell:424579}Suppressive Ember gives players a healing absorb\n- {spell:423265}Flaming Germination creates seeds.  Stomp them!\n{T}\nTANKS\n- Taunt swap every 6? stacks of {spell:421992}Searing Wrath\n- Alternate soaking {spell:423260}Blazing Mushrooms\n{/T}{H}\nHEALERS\n- Don't dispel {spell:424581}Fiery Growth until the target is in position.\n{/H}", -- [8]
			"SINGLE TARGET - LUST ON PULL\nPHASE 1\n- {spell:425346}Roots off Amirdrassil must be protected from fire.\n- {spell:419506}Firestorms create {spell:419066}Raging Flames. Don't burn the Roots!\n- A {spell:417455}Dream Rend portal spawns and sucks players in.\n- {spell:417807}Aflame is a ramping debuff.  Healers can dispell it.\n\nINTERMISSION (70%)\n- Burn his shield as quickly as possible (Lust?)\n- Soak {spell:421942}Shadowflame Orbs.  They cannot reach Fyrakk.\n\nPHASE 2\n- Heart is exposed.  We heal spirits.  Spirits heal the heart.\n- Two Burning Collosus spawn.  Kill them before they kill us!\n- {spell:422524}Shadowflame Devastation sweeps the arena.  Dodge.\n- Screaming Souls will spawn in the fire.  Kill them ASAP.\n\nPHASE 3\n- Dodge {spell:425530}Swirling Firestorm\n- Dont be in front of him.  He will {spell:410223}Shadowflame Breath.\n- {spell:422837}Apocalypse Roar does massive damage.\n  - We can mitigate it by grabbing a {spell:423601}Seed of Amirdrassil\n  - We must protect the seed holder while it charges.\n  - Once charged, the seed can be used to make a shield.\n{T}\nTANKS\n- Point him toward edges to mitigate {spell:428960}Fyr'alath's Flame\n- {spell:417431}Fyr'alath's Bite causes {spell:417443}Fyr'alath's Mark.  Swap every time?\n- He will jump and melee you if you get too far away.\n- In phase 3, swap after every {spell:425492}Infernal Maw\n{/T}", -- [9]
		}
    end
end

local function ApplyOmniCDTweaks(ztp)
    OmniCDDB.global.optionPanelScale = ZT.db.profile.scaleFactor

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

    local count = 1
    local idsToDelete = {};

    for id, instance in Details:ListInstances() do
        if count >= 3 then
            table.insert(idsToDelete, id)
        else
            if ztp.fonts.resize then
                instance:SetBarTextSettings(ztp.fonts.size)
                instance:AttributeMenu(nil, nil, nil, nil, ztp.fonts.size)
            end
        end

        count = count + 1
    end

    if ztp.details then
        Details.tooltip.anchored_to = 1

        -- Atrocity likes more than 2 windows.  I do not.
        for _, id in ipairs(idsToDelete) do
            Details:DeleteInstance(id)
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
