---@class ZoxeTweaks
local ZT = LibStub("AceAddon-3.0"):GetAddon("ZoxeTweaks")

local RunOnAddonLoaded = EventUtil.ContinueOnAddOnLoaded

---Scale a frame, and prevent it from ever being changed by anything but us.
---@param frame Frame the frame to scale
---@param scale number the desired scale factor
---@param script? ScriptFrame the script to hook onto
function ZT:ScaleGuard(frame, scale, script)
    if not frame then
        ZT:Debug("No frame found: " .. debugstack());
        return
    end
    if self:IsHooked(frame, "SetScale") then return end

    local guard
    self:SecureHook(frame, "SetScale", function()
        if guard then return end
        guard = true
        frame:SetScale(scale)
        guard = false
    end)

    if script and not self:IsHooked(frame, script) then
        self:SecureHookScript(frame, script, function() frame:SetScale(scale) end)
    else
        frame:SetScale(scale)
    end
end

---Apply scaling to all frames.
function ZT:ApplyScaling()
    local scale = self.db.global.scaleFactor
    local globalScale = UIParent:GetEffectiveScale()
    local scaledScreenWidth = GetScreenWidth() * globalScale

    -- Retail frames (always loaded)
    self:ScaleGuard(AddonList, scale)
    self:ScaleGuard(ChannelFrame, scale)
    self:ScaleGuard(CharacterFrame, scale)
    self:ScaleGuard(ChatConfigFrame, scale)
    self:ScaleGuard(CinematicFrameCloseDialog, scale)
    self:ScaleGuard(CurrencyTransferMenu, scale)
    self:ScaleGuard(DressUpFrame, scale)
    self:ScaleGuard(ExpansionLandingPage, scale)
    self:ScaleGuard(FriendsFrame, scale)
    self:ScaleGuard(GameMenuFrame, scale)
    self:ScaleGuard(GossipFrame, scale)
    self:ScaleGuard(GroupLootHistoryFrame, scale, "OnShow")
    self:ScaleGuard(GuildInviteFrame, scale)
    self:ScaleGuard(HelpFrame, scale)
    self:ScaleGuard(ItemTextFrame, scale)
    self:ScaleGuard(LFGDungeonReadyPopup, scale)
    self:ScaleGuard(LFGListApplicationDialog, scale)
    self:ScaleGuard(LFGListInviteDialog, scale)
    self:ScaleGuard(MajorFactionRenownFrame, scale)
    self:ScaleGuard(MailFrame, scale)
    self:ScaleGuard(MerchantFrame, scale, "OnShow")
    self:ScaleGuard(MirrorTimerContainer, scale)
    self:ScaleGuard(ObjectiveTrackerFrame, scale)
    self:ScaleGuard(OpenMailFrame, scale)
    self:ScaleGuard(PVEFrame, scale)
    self:ScaleGuard(QuestFrame, scale)
    self:ScaleGuard(QueueStatusFrame, scale)
    self:ScaleGuard(ReadyCheckFrame, scale)
    self:ScaleGuard(ReadyCheckListenerFrame, scale, "OnShow")
    self:ScaleGuard(RaidUtilityPanel, scale)
    self:ScaleGuard(RaidUtility_ShowButton, scale, "OnShow")
    self:ScaleGuard(ReportFrame, scale)
    self:ScaleGuard(SettingsPanel, scale, "OnShow")
    self:ScaleGuard(StackSplitFrame, scale)
    self:ScaleGuard(StableFrame, scale)
    self:ScaleGuard(SuperTrackedFrame, scale)
    self:ScaleGuard(TimeManagerFrame, scale)
    self:ScaleGuard(TradeFrame, scale)
    self:ScaleGuard(UIWidgetTopCenterContainerFrame, scale)

    -- Retail frames (loaded on demand)
    RunOnAddonLoaded("Blizzard_AchievementUI", function() self:ScaleGuard(AchievementFrame, scale) end)
    RunOnAddonLoaded("Blizzard_BlackMarketUI", function() self:ScaleGuard(BlackMarketFrame, scale) end)
    RunOnAddonLoaded("Blizzard_AuctionHouseUI", function() self:ScaleGuard(AuctionHouseFrame, scale) end)
    RunOnAddonLoaded("Blizzard_Calendar", function() self:ScaleGuard(CalendarFrame, scale) end)
    RunOnAddonLoaded("Blizzard_Collections", function()
        self:ScaleGuard(CollectionsJournal, scale)
        self:ScaleGuard(WardrobeFrame, scale)
    end)
    RunOnAddonLoaded("Blizzard_Communities", function()
        self:ScaleGuard(CommunitiesFrame, scale)
        self:ScaleGuard(CommunitiesGuildLogFrame, scale)
        self:ScaleGuard(CommunitiesGuildNewsFiltersFrame, scale)
        self:ScaleGuard(CommunitiesGuildTextEditFrame, scale)
    end)
    RunOnAddonLoaded("Blizzard_EncounterJournal", function() self:ScaleGuard(EncounterJournal, scale) end)
    RunOnAddonLoaded("Blizzard_GarrisonUI", function()
        self:ScaleGuard(CovenantMissionFrame, scale, "OnShow")
        self:ScaleGuard(GarrisonCapacitiveDisplayFrame, scale)
        self:ScaleGuard(OrderHallMissionFrame, scale, "OnShow")
    end)
    RunOnAddonLoaded("Blizzard_GenericTraitUI", function() self:ScaleGuard(GenericTraitFrame, scale) end)
    RunOnAddonLoaded("Blizzard_GuildBankUI", function() self:ScaleGuard(GuildBankFrame, scale) end)
    RunOnAddonLoaded("Blizzard_InspectUI", function() self:ScaleGuard(InspectFrame, scale) end)
    RunOnAddonLoaded("Blizzard_ItemInteractionUI", function() self:ScaleGuard(ItemInteractionFrame, scale) end)
    RunOnAddonLoaded("Blizzard_ItemSocketingUI", function() self:ScaleGuard(ItemSocketingFrame, scale) end)
    RunOnAddonLoaded("Blizzard_ItemUpgradeUI", function()
        self:ScaleGuard(ItemUpgradeFrame, scale)
        self:ScaleGuard(EquipmentFlyoutFrame, scale)
    end)
    RunOnAddonLoaded("Blizzard_MacroUI", function() self:ScaleGuard(MacroFrame, scale) end)
    RunOnAddonLoaded("Blizzard_PlayerChoice", function() self:ScaleGuard(PlayerChoiceFrame, scale) end)
    RunOnAddonLoaded("Blizzard_PlayerSpells", function()
        self:ScaleGuard(ClassTalentLoadoutImportDialog, scale)
        self:ScaleGuard(PlayerSpellsFrame, scale, "OnShow")
    end)
    RunOnAddonLoaded("Blizzard_Professions", function() self:ScaleGuard(ProfessionsFrame, scale) end)
    RunOnAddonLoaded("Blizzard_ProfessionsBook", function() self:ScaleGuard(ProfessionsBookFrame, scale) end)
    RunOnAddonLoaded("Blizzard_ProfessionsCustomerOrders", function()
        self:ScaleGuard(ProfessionsCustomerOrdersFrame, scale)
    end)
    RunOnAddonLoaded("Blizzard_TrainerUI", function() self:ScaleGuard(ClassTrainerFrame, scale, "OnShow") end)
    RunOnAddonLoaded("Blizzard_WeeklyRewards", function() self:ScaleGuard(WeeklyRewardsFrame, scale) end)


    -- Classic frames (always loaded)
    self:ScaleGuard(MirrorTimer1, scale)
    self:ScaleGuard(MirrorTimer2, scale)
    self:ScaleGuard(MirrorTimer3, scale)
    self:ScaleGuard(PetStableFrame, scale)
    self:ScaleGuard(PVPParentFrame, scale)
    self:ScaleGuard(QuestLogFrame, scale)
    self:ScaleGuard(WatchFrame, scale)

    -- Classic frames (loaded on demand)
    RunOnAddonLoaded("Blizzard_TalentUI", function() self:ScaleGuard(PlayerTalentFrame, scale) end)


    -- Frames that require secure hooks
    self:SecureHook("AlertFrame_ShowNewAlert", function(frame) self:ScaleGuard(frame, scale) end)
    self:SecureHook("StaticPopup_OnShow", function(frame) self:ScaleGuard(frame, scale) end)
    self:SecureHook("ToggleDropDownMenu", function(level, _, _, anchorName, xOffset, yOffset)
        if not level then level = 1 end

        local listFrame = _G["DropDownList" .. level]
        if not listFrame then return end

        local listScale = globalScale * scale

        self:ScaleGuard(listFrame, listScale)

        -- frames anchored to mouse pointer need to be re-positioned because this manual scaling
        -- throws off Blizz's default calculations.
        if anchorName == "cursor" then
            if MinimapRightClickMenu and listFrame.dropdown == MinimapRightClickMenu then
                -- ElvUI tries to move its micro menu left, but our logic should supersede
                xOffset = 0
            end

            if not xOffset then xOffset = 0 end
            if not yOffset then yOffset = 0 end

            local cursorX, cursorY = GetCursorPosition()
            local verticalAnchorPoint = "TOP"
            local horizontalAnchorPoint = "LEFT"
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
    self:ScaleGuard(ElvLootFrame, scale)
end
