---@class ZoxeTweaks
local ZT = LibStub("AceAddon-3.0"):GetAddon("ZoxeTweaks")

-- this function is helpful for frames that tend to reset scale on their own.
local function ScaleGuard(frame, scale)
    local guard
    ZT:SecureHook(frame, "SetScale", function()
        if guard then return end
        guard = true
        frame:SetScale(scale)
        guard = false
    end)
end

function ZT:ApplyScaling()
    local scale = self.db.global.scaleFactor
    local globalScale = UIParent:GetEffectiveScale()
    local scaledScreenWidth = GetScreenWidth() * globalScale

    -- Blizzard Frames
    AddonList:SetScale(scale)
    ChannelFrame:SetScale(scale)
    CharacterFrame:SetScale(scale)
    ChatConfigFrame:SetScale(scale)
    CinematicFrameCloseDialog:SetScale(scale)
    DressUpFrame:SetScale(scale)
    if ExpansionLandingPage then ExpansionLandingPage:SetScale(scale) end
    FriendsFrame:SetScale(scale)
    GameMenuFrame:SetScale(scale)
    GossipFrame:SetScale(scale)
    if GroupLootHistoryFrame then
        self:SecureHookScript(GroupLootHistoryFrame, "OnShow", function() GroupLootHistoryFrame:SetScale(scale) end)
    end
    HelpFrame:SetScale(scale)
    ItemTextFrame:SetScale(scale)
    LFGDungeonReadyPopup:SetScale(scale)
    LFGListApplicationDialog:SetScale(scale)
    LFGListInviteDialog:SetScale(scale)
    if MajorFactionRenownFrame then MajorFactionRenownFrame:SetScale(scale) end
    MailFrame:SetScale(scale)
    self:SecureHookScript(MerchantFrame, "OnShow", function(frame) frame:SetScale(scale) end)
    if MirrorTimerContainer then MirrorTimerContainer:SetScale(scale) end
    if MirrorTimer1 then
        MirrorTimer1:SetScale(scale)
        MirrorTimer2:SetScale(scale)
        MirrorTimer3:SetScale(scale)
    end
    if ObjectiveTrackerFrame then ObjectiveTrackerFrame:SetScale(scale) end
    if ObjectiveTrackerBlocksFrame then ObjectiveTrackerBlocksFrame:SetScale(scale) end
    OpenMailFrame:SetScale(scale)
    PVEFrame:SetScale(scale)
    QuestFrame:SetScale(scale)
    if QuestLogFrame then QuestLogFrame:SetScale(scale) end
    QueueStatusFrame:SetScale(scale)
    self:SecureHookScript(ReadyCheckListenerFrame, "OnShow", function(frame) frame:SetScale(scale) end)
    RaidUtilityPanel:SetScale(scale)
    self:SecureHookScript(RaidUtility_ShowButton, "OnShow", function(frame) frame:SetScale(scale) end)
    self:SecureHookScript(RaidUtility_CloseButton, "OnShow", function(frame) frame:SetScale(scale) end)
    self:SecureHookScript(SettingsPanel, "OnShow", function(frame) frame:SetScale(scale) end)
    SpellBookFrame:SetScale(scale)
    if SuperTrackedFrame then SuperTrackedFrame:SetScale(scale) end
    TimeManagerFrame:SetScale(scale)
    TradeFrame:SetScale(scale)
    UIWidgetTopCenterContainerFrame:SetScale(scale)
    if WatchFrame then WatchFrame:SetScale(scale) end

    EventUtil.ContinueOnAddOnLoaded("Blizzard_AchievementUI", function() AchievementFrame:SetScale(scale) end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_AuctionHouseUI", function() AuctionHouseFrame:SetScale(scale) end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_Calendar", function() CalendarFrame:SetScale(scale) end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_ClassTalentUI", function()
        self:SecureHookScript(ClassTalentFrame, "OnShow", function(frame) frame:SetScale(scale) end)
    end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_Collections", function()
        CollectionsJournal:SetScale(scale)
        WardrobeFrame:SetScale(scale)
    end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_Communities", function() CommunitiesFrame:SetScale(scale) end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_EncounterJournal", function() EncounterJournal:SetScale(scale) end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_GarrisonUI", function()
        self:SecureHookScript(CovenantMissionFrame, "OnShow", function(frame) frame:SetScale(scale) end)
        GarrisonCapacitiveDisplayFrame:SetScale(scale)
        self:SecureHookScript(OrderHallMissionFrame, "OnShow", function(frame) frame:SetScale(scale) end)
    end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_GenericTraitUI", function() GenericTraitFrame:SetScale(scale) end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_GuildBankUI", function() GuildBankFrame:SetScale(scale) end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_InspectUI", function() InspectFrame:SetScale(scale) end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_ItemInteractionUI", function() ItemInteractionFrame:SetScale(scale) end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_ItemSocketingUI", function() ItemSocketingFrame:SetScale(scale) end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_ItemUpgradeUI", function()
        ItemUpgradeFrame:SetScale(scale)
        EquipmentFlyoutFrame:SetScale(scale)
    end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_MacroUI", function() MacroFrame:SetScale(scale) end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_Professions", function() ScaleGuard(ProfessionsFrame, scale) end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_ProfessionsCustomerOrders", function()
        ScaleGuard(ProfessionsCustomerOrdersFrame, scale)
    end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_TrainerUI", function()
        self:SecureHookScript(ClassTrainerFrame, "OnShow", function(frame) frame:SetScale(scale) end)
    end)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_WeeklyRewards", function() WeeklyRewardsFrame:SetScale(scale) end)

    self:SecureHook("AlertFrame_ShowNewAlert", function(frame) frame:SetScale(scale) end)
    self:SecureHook("StaticPopup_OnShow", function(frame) frame:SetScale(scale) end)

    self:SecureHook("ToggleDropDownMenu", function(level, _, _, anchorName, xOffset, yOffset)
        if not level then level = 1 end

        local listFrame = _G["DropDownList"..level]
        if not listFrame then return end

        local listScale = globalScale * scale
        listFrame:SetScale(listScale)

        -- frames anchored to mouse pointer need to be re-positioned because this manual scaling
        -- throws off Blizz's default calculations.
        if anchorName == "cursor" then
            if not xOffset then xOffset = 0 end
            if not yOffset then yOffset = 0 end

            local verticalAnchorPoint = "TOP"
            local horizontalAnchorPoint = "LEFT"
            local cursorX, cursorY = GetCursorPosition()
            local dropDownHeight = listFrame:GetHeight() * listScale
            local dropDownWidth = listFrame:GetWidth() * listScale

            if cursorY - dropDownHeight < 0 then
                verticalAnchorPoint = "BOTTOM"
            end

            if cursorX + dropDownWidth > scaledScreenWidth then
                horizontalAnchorPoint = "RIGHT"
            end

            local xPosition = cursorX / listScale + xOffset
            local yPosition = cursorY / listScale + yOffset

            local anchorPoint = verticalAnchorPoint .. horizontalAnchorPoint

            listFrame:ClearAllPoints()
            listFrame:SetPoint(anchorPoint, nil, "BOTTOMLEFT", xPosition, yPosition)
        end
    end)

    -- Addon Frames
    if MinimapRightClickMenu then
        MinimapRightClickMenu:SetScale(scale)
        self:SecureHookScript(MinimapRightClickMenu, "OnShow", function(frame)
            local point, relativeTo, relativePoint, xOffset, yOffset = frame:GetPoint()
            if not point then return end
            if not relativePoint then return end
            if not xOffset then xOffset = 0 end
            if not yOffset then yOffset = 0 end
            xOffset = xOffset / scale
            yOffset = yOffset / scale
            frame:ClearAllPoints()
            frame:SetPoint(point, relativeTo, relativePoint, xOffset, yOffset)
        end)
    end

    if ElvUI then
        ElvLootFrame:SetScale(scale)
    end
end
