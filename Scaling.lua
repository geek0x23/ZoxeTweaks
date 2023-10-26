---@class AceAddon : AceEvent-3.0, AceHook-3.0, AceConsole-3.0
local ZT = LibStub("AceAddon-3.0"):GetAddon("ZoxeTweaks")

function ZT:ApplyScaling()
    self:Debug("ApplyScaling() called")
    local scale = self.db.profile.scaleFactor
    local globalScale = UIParent:GetEffectiveScale()
    local scaledScreenWidth = GetScreenWidth() * globalScale

    -- Blizzard Frames
    AddonList:SetScale(scale)
    ChannelFrame:SetScale(scale)
    CharacterFrame:SetScale(scale)
    ChatConfigFrame:SetScale(scale)
    CinematicFrameCloseDialog:SetScale(scale)
    DressUpFrame:SetScale(scale)
    ExpansionLandingPage:SetScale(scale)
    FriendsFrame:SetScale(scale)
    GameMenuFrame:SetScale(scale)
    GossipFrame:SetScale(scale)
    HelpFrame:SetScale(scale)
    ItemTextFrame:SetScale(scale)
    LFGDungeonReadyPopup:SetScale(scale)
    LFGListApplicationDialog:SetScale(scale)
    LFGListInviteDialog:SetScale(scale)
    if MajorFactionRenownFrame then MajorFactionRenownFrame:SetScale(scale) end
    MailFrame:SetScale(scale)
    self:SecureHookScript(MerchantFrame, "OnShow", function(frame) frame:SetScale(scale) end)
    MirrorTimerContainer:SetScale(scale)
    ObjectiveTrackerFrame:SetScale(scale)
    ObjectiveTrackerBlocksFrame:SetScale(scale)
    OpenMailFrame:SetScale(scale)
    PVEFrame:SetScale(scale)
    -- these frames constantly remove the scaling, so we have to trap a lot of events
    self:SecureHookScript(ProfessionsFrame, "OnShow", function() ProfessionsFrame:SetScale(scale) end)
    self:SecureHookScript(ProfessionsFrame.MaximizeMinimize.MinimizeButton, "OnClick", function() ProfessionsFrame:SetScale(scale) end)
    self:SecureHookScript(ProfessionsFrame.MaximizeMinimize.MaximizeButton, "OnClick", function() ProfessionsFrame:SetScale(scale) end)
    self:SecureHookScript(ProfessionsFrame.CraftingPage.CraftingOutputLog, "OnShow", function() ProfessionsFrame:SetScale(scale) end)
    self:SecureHookScript(ProfessionsFrame.OrdersPage.OrderView.CraftingOutputLog, "OnShow", function () ProfessionsFrame:SetScale(scale) end)
    self:SecureHookScript(ProfessionsFrame.OrdersPage.OrderView.CraftingOutputLog, "OnHide", function () ProfessionsFrame:SetScale(scale) end)
    self:RegisterEvent("CRAFTINGORDERS_FULFILL_ORDER_RESPONSE", function() ProfessionsFrame:SetScale(scale) end)
    self:RegisterEvent("TRADE_SKILL_ITEM_CRAFTED_RESULT", function() ProfessionsFrame:SetScale(scale) end)
    EventRegistry:RegisterCallback("ProfessionsFrame.TabSet", function() ProfessionsFrame:SetScale(scale) end)
    EventRegistry:RegisterCallback("Professions.ProfessionSelected", function() ProfessionsFrame:SetScale(scale) end)
    EventRegistry:RegisterCallback("Professions.TransactionUpdated", function() ProfessionsFrame:SetScale(scale) end)
    EventRegistry:RegisterCallback("Professions.AllocationUpdated", function() ProfessionsFrame:SetScale(scale) end)
    -- same as profession frame.  this one removes scaling constantly.
    self:SecureHookScript(ProfessionsCustomerOrdersFrame, "OnShow", function() ProfessionsCustomerOrdersFrame:SetScale(scale) end)
    self:SecureHookScript(ProfessionsCustomerOrdersFrame, "OnHide", function() ProfessionsCustomerOrdersFrame:SetScale(scale) end)
    self:SecureHookScript(ProfessionsCustomerOrdersFrame.Form, "OnShow", function() ProfessionsCustomerOrdersFrame:SetScale(scale) end)
    self:SecureHookScript(ProfessionsCustomerOrdersFrame.Form.BackButton, "OnClick", function() ProfessionsCustomerOrdersFrame:SetScale(scale) end)
    self:SecureHookScript(ProfessionsCustomerOrdersFrame.BrowseOrders.RecipeList, "OnShow", function() ProfessionsCustomerOrdersFrame:SetScale(scale) end)
    self:SecureHookScript(ProfessionsCustomerOrdersFrame.MyOrdersPage.OrderList, "OnShow", function() ProfessionsCustomerOrdersFrame:SetScale(scale) end)
    self:SecureHookScript(ProfessionsCustomerOrdersFrameOrdersTab, "OnClick", function() ProfessionsCustomerOrdersFrame:SetScale(scale) end)
    self:SecureHookScript(ProfessionsCustomerOrdersFrameBrowseTab, "OnClick", function() ProfessionsCustomerOrdersFrame:SetScale(scale) end)
    QuestFrame:SetScale(scale)
    QueueStatusFrame:SetScale(scale)
    self:SecureHookScript(ReadyCheckListenerFrame, "OnShow", function(frame) frame:SetScale(scale) end)
    RaidUtilityPanel:SetScale(scale)
    self:SecureHookScript(RaidUtility_ShowButton, "OnShow", function(frame) frame:SetScale(scale) end)
    self:SecureHookScript(RaidUtility_CloseButton, "OnShow", function(frame) frame:SetScale(scale) end)
    self:SecureHookScript(SettingsPanel, "OnShow", function(frame) frame:SetScale(scale) end)
    SpellBookFrame:SetScale(scale)
    SuperTrackedFrame:SetScale(scale)
    TimeManagerFrame:SetScale(scale)
    TradeFrame:SetScale(scale)
    UIWidgetTopCenterContainerFrame:SetScale(scale)

    self:RegisterEvent("ADDON_LOADED", function(_, addonName)
        self:Debug("Addon Loaded: %s", addonName)

        if addonName == "Blizzard_AchievementUI" then
            AchievementFrame:SetScale(scale)
        elseif addonName == "Blizzard_AuctionHouseUI" then
            AuctionHouseFrame:SetScale(scale)
        elseif addonName == "Blizzard_Calendar" then
            CalendarFrame:SetScale(scale)
        elseif addonName == "Blizzard_ClassTalentUI" then
            self:SecureHookScript(ClassTalentFrame, "OnShow", function(frame) frame:SetScale(scale) end)
        elseif addonName == "Blizzard_Collections" then
            CollectionsJournal:SetScale(scale)
            WardrobeFrame:SetScale(scale)
        elseif addonName == "Blizzard_Communities" then
            CommunitiesFrame:SetScale(scale)
        elseif addonName == "Blizzard_EncounterJournal" then
            EncounterJournal:SetScale(scale)
        elseif addonName == "Blizzard_GarrisonUI" then
            self:SecureHookScript(CovenantMissionFrame, "OnShow", function(frame) frame:SetScale(scale) end)
            GarrisonCapacitiveDisplayFrame:SetScale(scale)
            self:SecureHookScript(OrderHallMissionFrame, "OnShow", function(frame) frame:SetScale(scale) end)
        elseif addonName == "Blizzard_GenericTraitUI" then
            GenericTraitFrame:SetScale(scale)
        elseif addonName == "Blizzard_GuildBankUI" then
            GuildBankFrame:SetScale(scale)
        elseif addonName == "Blizzard_InspectUI" then
            InspectFrame:SetScale(scale)
        elseif addonName == "Blizzard_ItemInteractionUI" then
            ItemInteractionFrame:SetScale(scale)
        elseif addonName == "Blizzard_ItemSocketingUI" then
            ItemSocketingFrame:SetScale(scale)
        elseif addonName == "Blizzard_ItemUpgradeUI" then
            ItemUpgradeFrame:SetScale(scale)
            EquipmentFlyoutFrame:SetScale(scale)
        elseif addonName == "Blizzard_MacroUI" then
            MacroFrame:SetScale(scale)
        elseif addonName == "Blizzard_TrainerUI" then
            self:SecureHookScript(ClassTrainerFrame, "OnShow", function(frame) frame:SetScale(scale) end)
        elseif addonName == "Blizzard_WeeklyRewards" then
            WeeklyRewardsFrame:SetScale(scale)
        end
    end)

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
