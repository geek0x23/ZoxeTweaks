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

    local elvBase = ElvDB["profiles"][profiles.atrocityUI]
    local elvColor = ElvDB["profiles"][profiles.atrocityUIColor]
    local elvHealer = ElvDB["profiles"][profiles.atrocityUIHealer]
    local elvHealerColor = ElvDB["profiles"][profiles.atrocityUIHealerColor]

    local elvPriv = ElvPrivateDB["profiles"][profiles.atrocityUI]
    local elvPrivColor = ElvPrivateDB["profiles"][profiles.atrocityUIColor]
    local elvPrivHealer = ElvPrivateDB["profiles"][profiles.atrocityUIHealer]
    local elvPrivHealerColor = ElvPrivateDB["profiles"][profiles.atrocityUIHealerColor]


    -- experience bar
    elvBase["databars"]["experience"]["fontSize"] = 16
    elvColor["databars"]["experience"]["fontSize"] = 16
    elvHealer["databars"]["experience"]["fontSize"] = 16
    elvHealerColor["databars"]["experience"]["fontSize"] = 16

    elvBase["databars"]["experience"]["height"] = 20
    elvColor["databars"]["experience"]["height"] = 20
    elvHealer["databars"]["experience"]["height"] = 20
    elvHealerColor["databars"]["experience"]["height"] = 20

    elvBase["databars"]["experience"]["showLevel"] = true
    elvColor["databars"]["experience"]["showLevel"] = true
    elvHealer["databars"]["experience"]["showLevel"] = true
    elvHealerColor["databars"]["experience"]["showLevel"] = true

    elvBase["databars"]["experience"]["questCompletedOnly"] = true
    elvColor["databars"]["experience"]["questCompletedOnly"] = true
    elvHealer["databars"]["experience"]["questCompletedOnly"] = true
    elvHealerColor["databars"]["experience"]["questCompletedOnly"] = true
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
end

local function ApplyBigWigsTweaks()
end

local function ApplyMRTTweaks()
end

local function ApplyOmniCDTweaks()
end

local function ApplyDetailsTweaks()
end

local function ApplyPlaterTweaks()
end

local function ApplyWarpDepleteTweaks()
end

function ZT:ApplyAtrocityTweaks()
    self:Debug("Applying AtrocityUI tweaks")

    ApplyElvUITweaks()
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
