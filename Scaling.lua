---@class ZoxeTweaks
local ZT = LibStub("AceAddon-3.0"):GetAddon("ZoxeTweaks")

local RunOnAddonLoaded = EventUtil.ContinueOnAddOnLoaded

---Scale a frame, and prevent it from ever being changed by anything but us.
---@param frame Frame the frame to scale
---@param scale number the desired scale factor
function ZT:ScaleGuard(frame, scale)
    local guard
    self:SecureHook(frame, "SetScale", function()
        if guard then return end
        guard = true
        frame:SetScale(scale)
        guard = false
    end)
end

---Scale a frame with some basic safety.
---@param frame Frame the frame to scale
---@param scale number the desired scale factor
---@param script? ScriptFrame the script to hook onto
function ZT:ScaleFrame(frame, scale, script)
    if not frame then return end

    if script then
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

    -- Blizzard frames that are always loaded
    self:ScaleFrame(AddonList, scale)
    self:ScaleFrame(ChannelFrame, scale)
    self:ScaleFrame(CharacterFrame, scale)
    self:ScaleFrame(ChatConfigFrame, scale)
    self:ScaleFrame(CinematicFrameCloseDialog, scale)
    self:ScaleFrame(DressUpFrame, scale)
    self:ScaleFrame(ExpansionLandingPage, scale)
    self:ScaleFrame(FriendsFrame, scale)
    self:ScaleFrame(GameMenuFrame, scale)
    self:ScaleFrame(GossipFrame, scale)
    self:ScaleFrame(GroupLootHistoryFrame, scale, "OnShow")
    self:ScaleFrame(HelpFrame, scale)
    self:ScaleFrame(ItemTextFrame, scale)
    self:ScaleFrame(LFGDungeonReadyPopup, scale)
    self:ScaleFrame(LFGListApplicationDialog, scale)
    self:ScaleFrame(LFGListInviteDialog, scale)
    self:ScaleFrame(MajorFactionRenownFrame, scale)
    self:ScaleFrame(MailFrame, scale)
    self:ScaleFrame(MerchantFrame, scale, "OnShow")
    self:ScaleFrame(MirrorTimerContainer, scale)
    self:ScaleFrame(MirrorTimer1, scale)
    self:ScaleFrame(MirrorTimer2, scale)
    self:ScaleFrame(MirrorTimer3, scale)
    self:ScaleFrame(ObjectiveTrackerFrame, scale)
    self:ScaleFrame(ObjectiveTrackerBlocksFrame, scale)
    self:ScaleFrame(OpenMailFrame, scale)
    self:ScaleFrame(PetStableFrame, scale)
    self:ScaleFrame(PVEFrame, scale)
    self:ScaleFrame(QuestFrame, scale)
    self:ScaleFrame(QuestLogFrame, scale)
    self:ScaleFrame(QueueStatusFrame, scale)
    self:ScaleFrame(ReadyCheckListenerFrame, scale, "OnShow")
    self:ScaleFrame(RaidUtilityPanel, scale)
    self:ScaleFrame(RaidUtility_ShowButton, scale, "OnShow")
    self:ScaleFrame(RaidUtility_CloseButton, scale, "OnShow")
    self:ScaleFrame(ReportFrame, scale)
    self:ScaleFrame(SettingsPanel, scale, "OnShow")
    self:ScaleFrame(SpellBookFrame, scale)
    self:ScaleFrame(StackSplitFrame, scale)
    self:ScaleFrame(SuperTrackedFrame, scale)
    self:ScaleFrame(TimeManagerFrame, scale)
    self:ScaleFrame(TradeFrame, scale)
    self:ScaleFrame(UIWidgetTopCenterContainerFrame, scale)
    self:ScaleFrame(WatchFrame, scale)

    -- Blizzard frames that are loaded on demand.
    RunOnAddonLoaded("Blizzard_AchievementUI", function() self:ScaleFrame(AchievementFrame, scale) end)
    RunOnAddonLoaded("Blizzard_AuctionHouseUI", function() self:ScaleFrame(AuctionHouseFrame, scale) end)
    RunOnAddonLoaded("Blizzard_Calendar", function() self:ScaleFrame(CalendarFrame, scale) end)
    RunOnAddonLoaded("Blizzard_ClassTalentUI", function()
        self:ScaleFrame(ClassTalentFrame, scale, "OnShow")
        self:ScaleFrame(ClassTalentLoadoutImportDialog, scale)

        local listScale = globalScale * scale
        self:ScaleFrame(L_Numy_DropDownList1, listScale, "OnShow")
        self:ScaleFrame(L_Numy_DropDownList2, listScale, "OnShow")
    end)
    RunOnAddonLoaded("Blizzard_Collections", function()
        self:ScaleFrame(CollectionsJournal, scale)
        self:ScaleFrame(WardrobeFrame, scale)
    end)
    RunOnAddonLoaded("Blizzard_Communities", function() self:ScaleFrame(CommunitiesFrame, scale) end)
    RunOnAddonLoaded("Blizzard_EncounterJournal", function() self:ScaleFrame(EncounterJournal, scale) end)
    RunOnAddonLoaded("Blizzard_GarrisonUI", function()
        self:ScaleFrame(CovenantMissionFrame, scale, "OnShow")
        self:ScaleFrame(GarrisonCapacitiveDisplayFrame, scale)
        self:ScaleFrame(OrderHallMissionFrame, scale, "OnShow")
    end)
    RunOnAddonLoaded("Blizzard_GenericTraitUI", function() self:ScaleFrame(GenericTraitFrame, scale) end)
    RunOnAddonLoaded("Blizzard_GuildBankUI", function() self:ScaleFrame(GuildBankFrame, scale) end)
    RunOnAddonLoaded("Blizzard_InspectUI", function() self:ScaleFrame(InspectFrame, scale) end)
    RunOnAddonLoaded("Blizzard_ItemInteractionUI", function() self:ScaleFrame(ItemInteractionFrame, scale) end)
    RunOnAddonLoaded("Blizzard_ItemSocketingUI", function() self:ScaleFrame(ItemSocketingFrame, scale) end)
    RunOnAddonLoaded("Blizzard_ItemUpgradeUI", function()
        self:ScaleFrame(ItemUpgradeFrame, scale)
        self:ScaleFrame(EquipmentFlyoutFrame, scale)
    end)
    RunOnAddonLoaded("Blizzard_MacroUI", function() self:ScaleFrame(MacroFrame, scale) end)
    RunOnAddonLoaded("Blizzard_PlayerChoice", function() self:ScaleFrame(PlayerChoiceFrame, scale) end)
    -- Professions and orders frames use ScaleGuard because Blizzard constantly resets their scale.
    RunOnAddonLoaded("Blizzard_Professions", function() self:ScaleGuard(ProfessionsFrame, scale) end)
    RunOnAddonLoaded("Blizzard_ProfessionsCustomerOrders", function()
        self:ScaleGuard(ProfessionsCustomerOrdersFrame, scale)
    end)
    RunOnAddonLoaded("Blizzard_TrainerUI", function() self:ScaleFrame(ClassTrainerFrame, scale, "OnShow") end)
    RunOnAddonLoaded("Blizzard_WeeklyRewards", function() self:ScaleFrame(WeeklyRewardsFrame, scale) end)

    self:SecureHook("AlertFrame_ShowNewAlert", function(frame) frame:SetScale(scale) end)
    self:SecureHook("StaticPopup_OnShow", function(frame) frame:SetScale(scale) end)

    self:SecureHook("ToggleDropDownMenu", function(level, _, _, anchorName, xOffset, yOffset)
        if not level then level = 1 end

        local listFrame = _G["DropDownList"..level]
        if not listFrame then return end

        local listScale = globalScale * scale
        self:ScaleFrame(listFrame, listScale)

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
        self:ScaleFrame(MinimapRightClickMenu, scale)
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

    self:ScaleFrame(ElvLootFrame, scale)
end
