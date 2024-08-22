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

    local descaledFontSize = math.floor(ztp.fonts.size - (ztp.fonts.size * (ZT.db.global.scaleFactor - 1)))
    local diminishedFontSize = math.ceil((ztp.fonts.size - descaledFontSize) / 2) + ztp.fonts.size

    if ztp.fonts.resize then
        -- Fonts
        elvPriv["general"]["nameplateFontSize"] = ztp.fonts.size
        elvPriv["general"]["nameplateLargeFontSize"] = ztp.fonts.size
        elvPriv["general"]["chatBubbleFontSize"] = descaledFontSize
        elvPrivColor["general"]["nameplateFontSize"] = ztp.fonts.size
        elvPrivColor["general"]["nameplateLargeFontSize"] = ztp.fonts.size
        elvPrivColor["general"]["chatBubbleFontSize"] = descaledFontSize
        elvPrivHealer["general"]["nameplateFontSize"] = ztp.fonts.size
        elvPrivHealer["general"]["nameplateLargeFontSize"] = ztp.fonts.size
        elvPrivHealer["general"]["chatBubbleFontSize"] = descaledFontSize
        elvPrivHealerColor["general"]["nameplateFontSize"] = ztp.fonts.size
        elvPrivHealerColor["general"]["nameplateLargeFontSize"] = ztp.fonts.size
        elvPrivHealerColor["general"]["chatBubbleFontSize"] = descaledFontSize

        elv["general"]["fonts"] = elv["general"]["fonts"] or {}
        elvColor["general"]["fonts"] = elvColor["general"]["fonts"] or {}
        elvHealer["general"]["fonts"] = elvHealer["general"]["fonts"] or {}
        elvHealerColor["general"]["fonts"] = elvHealerColor["general"]["fonts"] or {}

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

        elv["chat"]["panelHeight"] = 268
        elvColor["chat"]["panelHeight"] = 268
        elvHealer["chat"]["panelHeight"] = 268
        elvHealerColor["chat"]["panelHeight"] = 268

        -- this is here because we don't want to use 12 buttons unless
        -- we are resizing the chat panels, too.
        elv["actionbar"]["bar3"]["buttons"] = 12
        elvColor["actionbar"]["bar3"]["buttons"] = 12
        elvHealer["actionbar"]["bar3"]["buttons"] = 12
        elvHealerColor["actionbar"]["bar3"]["buttons"] = 12

        elv["actionbar"]["bar3"]["buttonSize"] = 45
        elvColor["actionbar"]["bar3"]["buttonSize"] = 45
        elvHealer["actionbar"]["bar3"]["buttonSize"] = 45
        elvHealerColor["actionbar"]["bar3"]["buttonSize"] = 45

        elv["actionbar"]["barPet"]["buttonSize"] = 45
        elvColor["actionbar"]["barPet"]["buttonSize"] = 45
        elvHealer["actionbar"]["barPet"]["buttonSize"] = 45
        elvHealerColor["actionbar"]["barPet"]["buttonSize"] = 45
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
        E.global.datatexts.customPanels.Clock.width = 270
        E.global.datatexts.customPanels.Clock.textJustify = "CENTER"

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

        elv["unitframe"]["units"]["raid1"]["buffs"]["countFontSize"] = diminishedFontSize
        elvColor["unitframe"]["units"]["raid1"]["buffs"]["countFontSize"] = diminishedFontSize
        elvHealer["unitframe"]["units"]["raid1"]["buffs"]["countFontSize"] = diminishedFontSize
        elvHealerColor["unitframe"]["units"]["raid1"]["buffs"]["countFontSize"] = diminishedFontSize

        elv["unitframe"]["units"]["raid2"]["buffs"]["countFontSize"] = diminishedFontSize
        elvColor["unitframe"]["units"]["raid2"]["buffs"]["countFontSize"] = diminishedFontSize
        elvHealer["unitframe"]["units"]["raid2"]["buffs"]["countFontSize"] = diminishedFontSize
        elvHealerColor["unitframe"]["units"]["raid2"]["buffs"]["countFontSize"] = diminishedFontSize

        elv["unitframe"]["units"]["raid3"]["buffs"]["countFontSize"] = diminishedFontSize
        elvColor["unitframe"]["units"]["raid3"]["buffs"]["countFontSize"] = diminishedFontSize
        elvHealer["unitframe"]["units"]["raid3"]["buffs"]["countFontSize"] = diminishedFontSize
        elvHealerColor["unitframe"]["units"]["raid3"]["buffs"]["countFontSize"] = diminishedFontSize
    end

    if ztp.elvUI.panels then
        elv["unitframe"]["units"]["raid1"]["width"] = 99
        elvColor["unitframe"]["units"]["raid1"]["width"] = 99

        elv["unitframe"]["units"]["raid2"]["width"] = 99
        elvColor["unitframe"]["units"]["raid2"]["width"] = 99

        elv["unitframe"]["units"]["raid3"]["width"] = 99
        elvColor["unitframe"]["units"]["raid3"]["width"] = 99
    end

    elv["unitframe"]["units"]["raid1"]["roleIcon"] = elv["unitframe"]["units"]["raid1"]["roleIcon"] or {}
    elvColor["unitframe"]["units"]["raid1"]["roleIcon"] = elvColor["unitframe"]["units"]["raid1"]["roleIcon"] or {}
    elvHealer["unitframe"]["units"]["raid1"]["roleIcon"] = elvHealer["unitframe"]["units"]["raid1"]["roleIcon"] or {}
    elvHealerColor["unitframe"]["units"]["raid1"]["roleIcon"] =
        elvHealerColor["unitframe"]["units"]["raid1"]["roleIcon"] or {}

    elv["unitframe"]["units"]["raid2"]["roleIcon"] = elv["unitframe"]["units"]["raid2"]["roleIcon"] or {}
    elvColor["unitframe"]["units"]["raid2"]["roleIcon"] = elvColor["unitframe"]["units"]["raid2"]["roleIcon"] or {}
    elvHealer["unitframe"]["units"]["raid2"]["roleIcon"] = elvHealer["unitframe"]["units"]["raid2"]["roleIcon"] or {}
    elvHealerColor["unitframe"]["units"]["raid2"]["roleIcon"] =
        elvHealerColor["unitframe"]["units"]["raid2"]["roleIcon"] or {}

    elv["unitframe"]["units"]["raid3"]["roleIcon"] = elv["unitframe"]["units"]["raid3"]["roleIcon"] or {}
    elvColor["unitframe"]["units"]["raid3"]["roleIcon"] = elvColor["unitframe"]["units"]["raid3"]["roleIcon"] or {}
    elvHealer["unitframe"]["units"]["raid3"]["roleIcon"] = elvHealer["unitframe"]["units"]["raid3"]["roleIcon"] or {}
    elvHealerColor["unitframe"]["units"]["raid3"]["roleIcon"] =
        elvHealerColor["unitframe"]["units"]["raid3"]["roleIcon"] or {}

    elv["unitframe"]["units"]["raid1"]["roleIcon"]["enable"] = true
    elv["unitframe"]["units"]["raid1"]["roleIcon"]["damager"] = false
    elvColor["unitframe"]["units"]["raid1"]["roleIcon"]["enable"] = true
    elvColor["unitframe"]["units"]["raid1"]["roleIcon"]["damager"] = false
    elvHealer["unitframe"]["units"]["raid1"]["roleIcon"]["enable"] = true
    elvHealer["unitframe"]["units"]["raid1"]["roleIcon"]["damager"] = false
    elvHealerColor["unitframe"]["units"]["raid1"]["roleIcon"]["enable"] = true
    elvHealerColor["unitframe"]["units"]["raid1"]["roleIcon"]["damager"] = false

    elv["unitframe"]["units"]["raid2"]["roleIcon"]["enable"] = true
    elv["unitframe"]["units"]["raid2"]["roleIcon"]["damager"] = false
    elvColor["unitframe"]["units"]["raid2"]["roleIcon"]["enable"] = true
    elvColor["unitframe"]["units"]["raid2"]["roleIcon"]["damager"] = false
    elvHealer["unitframe"]["units"]["raid2"]["roleIcon"]["enable"] = true
    elvHealer["unitframe"]["units"]["raid2"]["roleIcon"]["damager"] = false
    elvHealerColor["unitframe"]["units"]["raid2"]["roleIcon"]["enable"] = true
    elvHealerColor["unitframe"]["units"]["raid2"]["roleIcon"]["damager"] = false

    elv["unitframe"]["units"]["raid3"]["roleIcon"]["enable"] = true
    elv["unitframe"]["units"]["raid3"]["roleIcon"]["damager"] = false
    elvColor["unitframe"]["units"]["raid3"]["roleIcon"]["enable"] = true
    elvColor["unitframe"]["units"]["raid3"]["roleIcon"]["damager"] = false
    elvHealer["unitframe"]["units"]["raid3"]["roleIcon"]["enable"] = true
    elvHealer["unitframe"]["units"]["raid3"]["roleIcon"]["damager"] = false
    elvHealerColor["unitframe"]["units"]["raid3"]["roleIcon"]["enable"] = true
    elvHealerColor["unitframe"]["units"]["raid3"]["roleIcon"]["damager"] = false


    -- Auto repairs
    if not ztp.elvUI.guildRepairs then
        elv["general"]["autoRepair"] = "PLAYER"
        elvColor["general"]["autoRepair"] = "PLAYER"
        elvHealer["general"]["autoRepair"] = "PLAYER"
        elvHealerColor["general"]["autoRepair"] = "PLAYER"
    end


    -- Auto accept invites
    elv["general"]["autoAcceptInvite"] = ztp.elvUI.autoAcceptInvites
    elvColor["general"]["autoAcceptInvite"] = ztp.elvUI.autoAcceptInvites
    elvHealer["general"]["autoAcceptInvite"] = ztp.elvUI.autoAcceptInvites
    elvHealerColor["general"]["autoAcceptInvite"] = ztp.elvUI.autoAcceptInvites


    -- Movers
    if ztp.elvUI.minimap then
        elv["movers"]["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-290"
        elvColor["movers"]["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-290"
        elvHealer["movers"]["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-290"
        elvHealerColor["movers"]["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-290"

        elv["movers"]["DTPanelClockMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-250"
        elvColor["movers"]["DTPanelClockMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-250"
        elvHealer["movers"]["DTPanelClockMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-250"
        elvHealerColor["movers"]["DTPanelClockMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-250"

        elv["movers"]["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-3"
        elvColor["movers"]["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-3"
        elvHealer["movers"]["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-3"
        elvHealerColor["movers"]["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-3"

        elv["movers"]["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-228"
        elvColor["movers"]["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-228"
        elvHealer["movers"]["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-228"
        elvHealerColor["movers"]["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-269,-228"

        elv["movers"]["QueueStatusMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-8,-210"
        elvColor["movers"]["QueueStatusMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-8,-210"
        elvHealer["movers"]["QueueStatusMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-8,-210"
        elvHealerColor["movers"]["QueueStatusMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-8,-210"
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

        elv["movers"]["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,234"
        elvColor["movers"]["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,234"
        elvHealer["movers"]["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,234"
        elvHealerColor["movers"]["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,234"

        elv["movers"]["ElvUF_Raid1Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"
        elvColor["movers"]["ElvUF_Raid1Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"

        elv["movers"]["ElvUF_Raid2Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"
        elvColor["movers"]["ElvUF_Raid2Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"

        elv["movers"]["ElvUF_Raid3Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"
        elvColor["movers"]["ElvUF_Raid3Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,300"
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

        elv["movers"]["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,965,535"
        elvColor["movers"]["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,965,535"
    end

    elv["movers"]["AlertFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-1000,-300"
    elvColor["movers"]["AlertFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-1000,-300"
    elvHealer["movers"]["AlertFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-1000,-300"
    elvHealerColor["movers"]["AlertFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-1000,-300"

    if ztp.elvUI.actionBars then
        elv["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-277,3"
        elvColor["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-277,3"
        elvHealer["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-259,3"
        elvHealerColor["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-259,3"

        elv["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,0,36"
        elvColor["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,0,36"
        elvHealer["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,0,34"
        elvHealerColor["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,0,34"
    else
        elv["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,36"
        elvColor["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,36"
        elvHealer["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,34"
        elvHealerColor["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,34"

        elv["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,-277,3"
        elvColor["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,-277,3"
        elvHealer["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,-259,3"
        elvHealerColor["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,-259,3"
    end

    elv["movers"]["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,277,3"
    elvColor["movers"]["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,277,3"
    elvHealer["movers"]["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,259,3"
    elvHealerColor["movers"]["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,259,3"

    elv["movers"]["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,3"
    elvColor["movers"]["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,3"
    elvHealer["movers"]["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,3"
    elvHealerColor["movers"]["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,3"
end

local function ApplySLETweaks(ztp)
    if not ztp.sle then return end

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
    local profile = BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][profiles.atrocityUI]

    if ztp.fonts.resize then
        profile["fontSize"] = ztp.fonts.size
        profile["fontSizeEmph"] = ztp.fonts.size
    end

    if ztp.bigWigs then
        if ztp.elvUI.minimap then
            profile["normalPosition"] = {
                "TOPRIGHT",
                "TOPRIGHT",
                -4,
                -291,
            }
            profile["normalWidth"] = 240
        end

        profile["visibleBarLimit"] = 5
        profile["visibleBarLimitEmph"] = 5
    end
end

local function ApplyMRTTweaks(ztp)
    if ztp.fonts.resize then
        VMRT.Note.FontSize = ztp.fonts.size

        -- Generic Column in Raid Cooldowns
        local genericSettings = VMRT.ExCD2.colSet[11]
        genericSettings.fontLeftSize = ztp.fonts.size
        genericSettings.fontLeftShadow = true
        genericSettings.fontLeftOutline = true
        genericSettings.iconMasque = false
    end

    if ztp.elvUI.panels then
        -- Raid CD's
        local raidCDs = VMRT.ExCD2.colSet[1]
        raidCDs.posX = 507.7777099609375
        raidCDs.posY = 523.1322631835938
    end

    if ZT.db.global.scaleFactor then
        VMRT.Addon.Scale = ZT.db.global.scaleFactor
    end
end

local function ApplyOmniCDTweaks(ztp)
    if ZT.db.global.scaleFactor then
        OmniCDDB.global.optionPanelScale = ZT.db.global.scaleFactor
    end

    local profile = OmniCDDB["profiles"][profiles.atrocityUI]

    if ztp.fonts.resize then
        profile["General"]["fonts"]["statusBar"]["size"] = ztp.fonts.size + 8
        profile["General"]["fonts"]["anchor"]["size"] = ztp.fonts.size
        profile["General"]["fonts"]["icon"]["size"] = ztp.fonts.size
    end

    if ztp.omniCD then
        profile["Party"]["party"]["extraBars"]["raidBar1"]["manualPos"]["raidBar1"]["x"] = 514.9332700888335
        profile["Party"]["party"]["extraBars"]["raidBar1"]["manualPos"]["raidBar1"]["y"] = 434.4000392119051
        profile["Party"]["party"]["extraBars"]["raidBar2"]["manualPos"]["raidBar2"]["x"] = 514.9332700888335
        profile["Party"]["party"]["extraBars"]["raidBar2"]["manualPos"]["raidBar2"]["y"] = 311.7332822004973

        profile["Party"]["arena"]["extraBars"]["raidBar1"]["manualPos"]["raidBar1"]["x"] = 514.9332700888335
        profile["Party"]["arena"]["extraBars"]["raidBar1"]["manualPos"]["raidBar1"]["y"] = 434.4000392119051
        profile["Party"]["arena"]["extraBars"]["raidBar2"]["manualPos"]["raidBar2"]["x"] = 514.9332700888335
        profile["Party"]["arena"]["extraBars"]["raidBar2"]["manualPos"]["raidBar2"]["y"] = 311.7332822004973
    end

    local healerProfile = OmniCDDB["profiles"][profiles.atrocityUIHealer]

    if ztp.fonts.resize then
        healerProfile["General"]["fonts"]["statusBar"]["size"] = ztp.fonts.size + 8
        healerProfile["General"]["fonts"]["anchor"]["size"] = ztp.fonts.size
        healerProfile["General"]["fonts"]["icon"]["size"] = ztp.fonts.size
    end

    if ztp.omniCD then
        healerProfile["Party"]["party"]["extraBars"]["raidBar1"]["manualPos"]["raidBar1"]["x"] = 1065.866798448551
        healerProfile["Party"]["arena"]["extraBars"]["raidBar1"]["manualPos"]["raidBar1"]["x"] = 1065.866798448551
    end
end

local function ApplyDetailsTweaks(ztp)
    local dtp = Details:GetProfile(profiles.atrocityUI)

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
    end

    if ztp.details then
        if ztp.elvUI.panels then
            Details.tooltip.anchor_screen_pos = { 1144, -710 }
        end

        Details.tooltip.anchored_to = 2
        Details.tooltip.anchor_point = "bottomright"
        Details.tooltip.anchor_relative = "bottomright"
        Details.tooltip.anchor_offset = { 0, -6 }
    end

    Details:SaveProfile()
    Details:ApplyProfile(profiles.atrocityUI, false)
end

local function ApplyPlaterTweaks(ztp)
    if ztp.plater.fonts.resize then
        Plater.db.profile.plate_config.enemynpc.actorname_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.enemynpc.big_actorname_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.enemynpc.big_actortitle_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.enemynpc.level_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.enemynpc.percent_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.enemynpc.spellname_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.enemynpc.spellpercent_text_size = ztp.plater.fonts.size

        Plater.db.profile.plate_config.enemyplayer.actorname_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.enemyplayer.big_actorname_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.enemyplayer.big_actortitle_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.enemyplayer.level_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.enemyplayer.percent_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.enemyplayer.spellname_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.enemyplayer.spellpercent_text_size = ztp.plater.fonts.size

        Plater.db.profile.plate_config.friendlynpc.actorname_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.friendlynpc.big_actorname_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.friendlynpc.big_actortitle_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.friendlynpc.level_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.friendlynpc.percent_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.friendlynpc.spellname_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.friendlynpc.spellpercent_text_size = ztp.plater.fonts.size

        Plater.db.profile.plate_config.friendlyplayer.actorname_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.friendlyplayer.big_actorname_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.friendlyplayer.big_actortitle_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.friendlyplayer.level_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.friendlyplayer.percent_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.friendlyplayer.spellname_text_size = ztp.plater.fonts.size
        Plater.db.profile.plate_config.friendlyplayer.spellpercent_text_size = ztp.plater.fonts.size
    end

    if ztp.plater.friendly then
        Plater.db.profile.auto_toggle_friendly_enabled = true
        Plater.db.profile.auto_toggle_friendly = {
            party = true,
            arena = false,
            raid = true,
            cities = false,
            world = false
        }
    end

    Plater.db.profile.saved_cvars.nameplateGlobalScale = ztp.plater.globalScale

    Plater.RefreshDBUpvalues()
    Plater.UpdateAllPlates()
    Plater.RefreshAutoToggle()
end

local function ApplyWarpDepleteTweaks(ztp)
    local profile = WarpDepleteDB["profiles"][profiles.atrocityUI]

    if ztp.fonts.resize then
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

    if ztp.elvUI.minimap then
        profile["frameY"] = 170
    end
end

function ZT:ApplyAtrocityTweaks()
    local ztp = self.db.global.atrocityUI

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
