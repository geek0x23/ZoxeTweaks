local _, zt = ...

zt.debug = function(...)
    if not DLAPI then return; end
    DLAPI.DebugLog("ZoxeTweaks", ...)
end

zt.eventFrame = CreateFrame("Frame", "ZoxeTweaksLoaderFrame", UIParent)
zt.eventFrame:RegisterEvent("ADDON_LOADED")
zt.eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
zt.eventFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_ENTERING_WORLD" then return zt.FixScaling(1.25); end
end)

zt.FixScaling = function(scale)
    zt.debug("zt.FixScaling called.")
    -- only scale on 1440p
    if GetScreenHeight() < 1440 then return; end

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
    LFGDungeonReadyPopup:SetScale(scale)
    LFGListApplicationDialog:SetScale(scale)
    LFGListInviteDialog:SetScale(scale)
    if MajorFactionRenownFrame then MajorFactionRenownFrame:SetScale(scale); end
    MailFrame:SetScale(scale)
    MerchantFrame:HookScript("OnShow", function(self) self:SetScale(scale); end)
    MirrorTimer1:SetScale(scale)
    MirrorTimer2:SetScale(scale)
    MirrorTimer3:SetScale(scale)
    ObjectiveTrackerFrame:SetScale(scale)
    ProfessionsFrame:HookScript("OnShow", function(self) self:SetScale(scale); end)
    PVEFrame:SetScale(scale)
    QuestFrame:SetScale(scale)
    ReadyCheckListenerFrame:HookScript("OnShow", function(self) self:SetScale(scale); end)
    SettingsPanel:HookScript("OnShow", function(self) self:SetScale(scale); end)
    SpellBookFrame:SetScale(scale)
    SuperTrackedFrame:SetScale(scale)
    TimeManagerFrame:SetScale(scale)
    WeeklyRewardsFrame:SetScale(scale)

    -- The profession frame is constantly re-scaling itself...
    hooksecurefunc(ProfessionsFrame.TabSystem, "SetTabVisuallySelected", function(self)
        self:GetParent():SetScale(scale)
    end)
    ProfessionsFrame.CraftingPage.CraftingOutputLog:HookScript("OnShow", function(self)
        self:GetParent():GetParent():SetScale(scale)
    end)

    zt.eventFrame:SetScript("OnEvent", function(self, event, addonName)
        if event ~= "ADDON_LOADED" then return; end

        zt.debug("Addon loaded: %s", addonName);
        if addonName == "Blizzard_AchievementUI" then
            AchievementFrame:SetScale(scale)
        elseif addonName == "Blizzard_AuctionHouseUI" then
            AuctionHouseFrame:SetScale(scale)
        elseif addonName == "Blizzard_Calendar" then
            CalendarFrame:SetScale(scale)
        elseif addonName == "Blizzard_ClassTalentUI" then
            ClassTalentFrame:HookScript("OnShow", function(self) self:SetScale(scale); end)
        elseif addonName == "Blizzard_Collections" then
            CollectionsJournal:SetScale(scale)
            WardrobeFrame:SetScale(scale)
        elseif addonName == "Blizzard_Communities" then
            CommunitiesFrame:SetScale(scale)
        elseif addonName == "Blizzard_EncounterJournal" then
            EncounterJournal:SetScale(scale)
        elseif addonName == "Blizzard_InspectUI" then
            InspectFrame:SetScale(scale)
        elseif addonName == "Blizzard_ItemInteractionUI" then
            ItemInteractionFrame:SetScale(scale)
        elseif addonName == "Blizzard_ItemSocketingUI" then
            ItemSocketingFrame:SetScale(scale)
        elseif addonName == "Blizzard_MacroUI" then
            MacroFrame:SetScale(scale)
        elseif addonName == "Blizzard_ProfessionsCustomerOrders" then
            ProfessionsCustomerOrdersFrame:HookScript("OnShow", function(self) self:SetScale(scale); end)
        elseif addonName == "Blizzard_TrainerUI" then
            ClassTrainerFrame:HookScript("OnShow", function(self) self:SetScale(scale); end)
        end
    end)

    hooksecurefunc("AlertFrame_ShowNewAlert", function(self) self:SetScale(scale) end)
    hooksecurefunc("StaticPopup_OnShow", function(self) self:SetScale(scale) end)

    hooksecurefunc("ToggleDropDownMenu", function(level, _, _, anchorName, xOffset, yOffset)
        if not level then level = 1; end

        local listFrame = _G["DropDownList"..level];
        if not listFrame then return end

        local globalScale = UIParent:GetScale()
        local listScale = globalScale * scale
        listFrame:SetScale(listScale)

        -- frames anchored to mouse pointer need to be re-positioned because this manual scaling
        -- throws off Blizz's default calculations.
        if anchorName == "cursor" then
            local cursorX, cursorY = GetCursorPosition();
            if not xOffset then xOffset = 0; end
            if not yOffset then yOffset = 0; end
            xOffset = cursorX / listScale + xOffset
            yOffset = cursorY / listScale + yOffset
            listFrame:SetPoint("TOPLEFT", nil, "BOTTOMLEFT", xOffset, yOffset)
        end
    end)

    -- Addon Frames
    if MinimapRightClickMenu then
        MinimapRightClickMenu:SetScale(scale)
        MinimapRightClickMenu:SetScript("OnShow", function(self)
            local point, relativeTo, relativePoint, xOffset, yOffset = self:GetPoint()
            if not point then return; end
            if not relativePoint then return; end
            if not xOffset then xOffset = 0; end
            if not yOffset then yOffset = 0; end
            xOffset = xOffset / scale
            yOffset = yOffset / scale
            self:SetPoint(point, relativeTo, relativePoint, xOffset, yOffset)
        end)
    end

    if ElvUI then
        ElvLootFrame:SetScale(scale)
    end
end

-- Hide vendor price from tooltip if Auctionator is installed.
if Auctionator then
    GameTooltip_OnTooltipAddMoney = function() end
end
