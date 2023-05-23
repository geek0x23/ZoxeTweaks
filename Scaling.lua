local _, zt = ...

zt.eventFrame:RegisterEvent("ADDON_LOADED")
zt.eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
zt.eventFrame:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_ENTERING_WORLD" then zt.FixScaling(1.2) end
end)

zt.FixScaling = function(scale)
    zt.debug("zt.FixScaling called.")

    local globalScale = UIParent:GetEffectiveScale()
    local scaledScreenWidth = GetScreenWidth() * globalScale

    -- Blizzard Frames
    AddonList:SetScale(scale)
    ChannelFrame:SetScale(scale)
    CharacterFrame:SetScale(scale)
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
    MerchantFrame:HookScript("OnShow", function(self) self:SetScale(scale) end)
    MirrorTimer1:SetScale(scale)
    MirrorTimer2:SetScale(scale)
    MirrorTimer3:SetScale(scale)
    ObjectiveTrackerFrame:SetScale(scale)
    ObjectiveTrackerBlocksFrame:SetScale(scale)
    OpenMailFrame:SetScale(scale)
    PVEFrame:SetScale(scale)
    QuestFrame:SetScale(scale)
    QueueStatusFrame:SetScale(scale)
    ReadyCheckListenerFrame:HookScript("OnShow", function(self) self:SetScale(scale) end)
    RaidUtilityPanel:SetScale(scale)
    RaidUtility_ShowButton:HookScript("OnShow", function(self) self:SetScale(scale) end)
    RaidUtility_CloseButton:HookScript("OnShow", function(self) self:SetScale(scale) end)
    SettingsPanel:HookScript("OnShow", function(self) self:SetScale(scale) end)
    SpellBookFrame:SetScale(scale)
    SuperTrackedFrame:SetScale(scale)
    TimeManagerFrame:SetScale(scale)
    TradeFrame:SetScale(scale)

    ProfessionsFrame:SetScale(scale)
    ProfessionsFrame:HookScript("OnShow", function(self) self:SetScale(scale) end)
    ProfessionsFrame:HookScript("OnHide", function(self) self:SetScale(scale) end)
    EventRegistry:RegisterCallback("ProfessionsFrame.TabSet", function() ProfessionsFrame:SetScale(scale) end)
    EventRegistry:RegisterCallback("Professions.ProfessionSelected", function() ProfessionsFrame:SetScale(scale) end)
    EventRegistry:RegisterCallback("Professions.TransactionUpdated", function() ProfessionsFrame:SetScale(scale) end)
    ProfessionsFrame.CraftingPage.CraftingOutputLog:HookScript("OnShow", function(self)
        self:GetParent():GetParent():SetScale(scale)
    end)

    zt.eventFrame:SetScript("OnEvent", function(_, event, addonName)
        if event ~= "ADDON_LOADED" then return end

        zt.debug("Addon loaded: %s", addonName)
        if addonName == "Blizzard_AchievementUI" then
            AchievementFrame:SetScale(scale)
        elseif addonName == "Blizzard_AuctionHouseUI" then
            AuctionHouseFrame:SetScale(scale)
        elseif addonName == "Blizzard_Calendar" then
            CalendarFrame:SetScale(scale)
        elseif addonName == "Blizzard_ClassTalentUI" then
            ClassTalentFrame:HookScript("OnShow", function(self) self:SetScale(scale) end)
        elseif addonName == "Blizzard_Collections" then
            CollectionsJournal:SetScale(scale)
            WardrobeFrame:SetScale(scale)
        elseif addonName == "Blizzard_Communities" then
            CommunitiesFrame:SetScale(scale)
        elseif addonName == "Blizzard_EncounterJournal" then
            EncounterJournal:SetScale(scale)
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
        elseif addonName == "Blizzard_ProfessionsCustomerOrders" then
            ProfessionsCustomerOrdersFrame:SetScale(scale)
            ProfessionsCustomerOrdersFrame:HookScript("OnShow", function(self) self:SetScale(scale) end)
            ProfessionsCustomerOrdersFrame:HookScript("OnHide", function(self) self:SetScale(scale) end)
            ProfessionsCustomerOrdersFrame.Form:HookScript("OnShow", function(self) self:GetParent():SetScale(scale) end)
            ProfessionsCustomerOrdersFrame.Form:HookScript("OnHide", function(self) self:GetParent():SetScale(scale) end)
            ProfessionsCustomerOrdersFrameOrdersTab:HookScript("OnClick", function(self) self:GetParent():SetScale(scale) end)
            ProfessionsCustomerOrdersFrameBrowseTab:HookScript("OnClick", function(self) self:GetParent():SetScale(scale) end)
        elseif addonName == "Blizzard_TrainerUI" then
            ClassTrainerFrame:HookScript("OnShow", function(self) self:SetScale(scale) end)
        elseif addonName == "Blizzard_WeeklyRewards" then
            WeeklyRewardsFrame:SetScale(scale)
        end
    end)

    hooksecurefunc("AlertFrame_ShowNewAlert", function(self) self:SetScale(scale) end)
    hooksecurefunc("StaticPopup_OnShow", function(self) self:SetScale(scale) end)

    hooksecurefunc("ToggleDropDownMenu", function(level, _, _, anchorName, xOffset, yOffset)
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
    if AstralKeys then
        AstralKeyFrame:SetScale(scale)
    end

    if MinimapRightClickMenu then
        MinimapRightClickMenu:SetScale(scale)
        MinimapRightClickMenu:SetScript("OnShow", function(self)
            local point, relativeTo, relativePoint, xOffset, yOffset = self:GetPoint()
            if not point then return end
            if not relativePoint then return end
            if not xOffset then xOffset = 0 end
            if not yOffset then yOffset = 0 end
            xOffset = xOffset / scale
            yOffset = yOffset / scale
            self:ClearAllPoints()
            self:SetPoint(point, relativeTo, relativePoint, xOffset, yOffset)
        end)
    end

    if ElvUI then
        ElvLootFrame:SetScale(scale)
    end
end
