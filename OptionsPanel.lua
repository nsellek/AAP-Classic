if (tonumber(string.sub(AAPClassic.Build, 1,1)) > 2) then
	--return
end
AAPClassic.Panel = {}
AAPC_panel = {}

AAPClassic.Panel = CreateFrame('Frame', 'AAPC_Option_Panel', UIParent)
AAPClassic.Panel.name = 'Azeroth Auto Pilot Classic'
InterfaceOptions_AddCategory(AAPClassic.Panel)

AAPC_panel.title = CreateFrame('SimpleHTML', nil, AAPClassic.Panel)
AAPC_panel.title:SetWidth(500)
AAPC_panel.title:SetHeight(20)
AAPC_panel.title:SetPoint('TOPLEFT', AAPClassic.Panel, 0, -30)
AAPC_panel.title:SetFontObject('GameFontHighlightLarge')
AAPC_panel.title:SetText('Azeroth Auto Pilot Classic - v' .. AAPClassic.Version)

AAPC_panel.LoadButton = CreateFrame('Button', 'ZPButton2', AAPClassic.Panel)
AAPC_panel.LoadButton:SetPoint('TOPLEFT', AAPClassic.Panel, 'TOPLEFT', 120, -120)
AAPC_panel.LoadButton:SetWidth(70)
AAPC_panel.LoadButton:SetHeight(30)
AAPC_panel.LoadButton:SetText('Load')
AAPC_panel.LoadButton:SetNormalFontObject('GameFontNormal')
-------------------- Button Textures Start -------------------------
AAPC_panel.LoadButtonUpTexture = AAPC_panel.LoadButton:CreateTexture()
AAPC_panel.LoadButtonUpTexture:SetTexture('Interface/Buttons/UI-Panel-Button-Up')
AAPC_panel.LoadButtonUpTexture:SetTexCoord(0, 0.625, 0, 0.6875)
AAPC_panel.LoadButtonUpTexture:SetAllPoints()
AAPC_panel.LoadButton:SetNormalTexture(AAPC_panel.LoadButtonUpTexture)
AAPC_panel.LoadButtonHighlightTexture = AAPC_panel.LoadButton:CreateTexture()
AAPC_panel.LoadButtonHighlightTexture:SetTexture('Interface/Buttons/UI-Panel-Button-Highlight')
AAPC_panel.LoadButtonHighlightTexture:SetTexCoord(0, 0.625, 0, 0.6875)
AAPC_panel.LoadButtonHighlightTexture:SetAllPoints()
AAPC_panel.LoadButton:SetHighlightTexture(AAPC_panel.LoadButtonHighlightTexture)
AAPC_panel.LoadButtonDownTexture = AAPC_panel.LoadButton:CreateTexture()
AAPC_panel.LoadButtonDownTexture:SetTexture('Interface/Buttons/UI-Panel-Button-Down')
AAPC_panel.LoadButtonDownTexture:SetTexCoord(0, 0.625, 0, 0.6875)
AAPC_panel.LoadButtonDownTexture:SetAllPoints()
AAPC_panel.LoadButton:SetPushedTexture(AAPC_panel.LoadButtonDownTexture)
-------------------- Button Textures End --------------------------
AAPC_panel.LoadButton:SetScript('OnClick', function(self, arg1)
	InterfaceOptionsFrame:Hide()
	HideUIPanel(GameMenuFrame)
	AAPClassic.OptionsFrame.MainFrame:Show()
	AAPClassic.OptionsFrame.isOpen = 1
end)

function AAPClassic.LoadOptionsFrame()
	AAPClassic.OptionsFrame = {}
	AAPClassic.OptionsFrame.MainFrame = CreateFrame('frame', 'AAPC_OptionsMainFrame', UIParent)
	AAPClassic.OptionsFrame.MainFrame:SetWidth(450)
	AAPClassic.OptionsFrame.MainFrame:SetHeight(360)
	AAPClassic.OptionsFrame.MainFrame:SetFrameStrata('MEDIUM')
	AAPClassic.OptionsFrame.MainFrame:SetPoint('CENTER', UIParent, 'CENTER', 0, 0)
	AAPClassic.OptionsFrame.MainFrame:SetMovable(true)
	AAPClassic.OptionsFrame.MainFrame:EnableMouse(true)
	AAPClassic.OptionsFrame.MainFrame:SetBackdrop({
		bgFile = 'Interface\\DialogFrame\\UI-DialogBox-Background',
		edgeFile = 'Interface\\Tooltips\\UI-Tooltip-Border',
		tile = true,
		tileSize = 10,
		edgeSize = 10,
		insets = {
			left = 2,
			right = 2,
			top = 2,
			bottom = 2
		}
	})
	AAPClassic.OptionsFrame.MainFrame:SetScript('OnMouseDown', function(_, button)
		if button == 'LeftButton' and not AAPClassic.OptionsFrame.MainFrame.isMoving then
			AAPClassic.OptionsFrame.MainFrame:StartMoving()
			AAPClassic.OptionsFrame.MainFrame.isMoving = true
		end
	end)
	AAPClassic.OptionsFrame.MainFrame:SetScript('OnMouseUp', function(_, button)
		if button == 'LeftButton' and AAPClassic.OptionsFrame.MainFrame.isMoving then
			AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing()
			AAPClassic.OptionsFrame.MainFrame.isMoving = false
		end
	end)
	AAPClassic.OptionsFrame.MainFrame:SetScript('OnHide', function(_)
		if AAPClassic.OptionsFrame.MainFrame.isMoving then
			AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing()
			AAPClassic.OptionsFrame.MainFrame.isMoving = false
		end
	end)
	AAPClassic.OptionsFrame.MainFrame:Hide()
	AAPClassic.OptionsFrame.isOpen = 0

	AAPClassic.OptionsFrame.MainFrame.OptionsNav = CreateFrame("frame", "AAP_OptionsNav",  AAPC_OptionsMainFrame)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav:SetWidth(150)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav:SetHeight(320)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav:SetFrameStrata("MEDIUM")
	AAPClassic.OptionsFrame.MainFrame.OptionsNav:SetPoint("LEFT",  AAPC_OptionsMainFrame, "LEFT",0,-20)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav:SetMovable(true)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav:EnableMouse(true)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav:SetBackdrop( { 
		bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = true, tileSize = 10, edgeSize = 10, insets = { left = 2, right = 2, top = 2, bottom = 2 }
	});
	AAPClassic.OptionsFrame.MainFrame.OptionsNav:SetScript("OnMouseDown", function(self, button)
		if button == "LeftButton" and not AAPClassic.OptionsFrame.MainFrame.isMoving then
			AAPClassic.OptionsFrame.MainFrame:StartMoving();
			AAPClassic.OptionsFrame.MainFrame.isMoving = true;
		end
	end)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav:SetScript("OnMouseUp", function(self, button)
		if button == "LeftButton" and AAPClassic.OptionsFrame.MainFrame.isMoving then
			AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
			AAPClassic.OptionsFrame.MainFrame.isMoving = false;
		end
	end)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav:SetScript("OnHide", function(self)
		if ( AAPClassic.OptionsFrame.MainFrame.isMoving ) then
			AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
			AAPClassic.OptionsFrame.MainFrame.isMoving = false;
		end
	end)

	AAPClassic.OptionsFrame.Header = AAPClassic.OptionsFrame.MainFrame:CreateFontString('AAPC_OptionsHeader', 'ARTWORK', 'ChatFontNormal')
	AAPClassic.OptionsFrame.Header:SetParent(AAPClassic.OptionsFrame.MainFrame)
	AAPClassic.OptionsFrame.Header:SetPoint('TOP', AAPClassic.OptionsFrame.MainFrame, 'TOP', 0, 0)
	AAPClassic.OptionsFrame.Header:SetWidth(240)
	AAPClassic.OptionsFrame.Header:SetHeight(20)
	AAPClassic.OptionsFrame.Header:SetFontObject('GameFontHighlightLarge')
	AAPClassic.OptionsFrame.Header:SetText('Azeroth Auto Pilot Classic - v'..AAPClassic.Version)
	AAPClassic.OptionsFrame.Header:SetTextColor(1, 1, 0)

	AAPClassic.OptionsFrame.CloseButton = CreateFrame('Button', 'AAPC_OptionsCloseButton', AAPClassic.OptionsFrame.MainFrame, AAPClassic.OptionsFrame.MainFrame)
	AAPClassic.OptionsFrame.CloseButton:SetWidth(15)
	AAPClassic.OptionsFrame.CloseButton:SetHeight(15)
	AAPClassic.OptionsFrame.CloseButton:SetText('X')
	AAPClassic.OptionsFrame.CloseButton:SetFrameStrata('MEDIUM')
	AAPClassic.OptionsFrame.CloseButton:SetPoint('TOPRIGHT', AAPClassic.OptionsFrame.MainFrame, 'TOPRIGHT', 5, 5)
	AAPClassic.OptionsFrame.CloseButton:SetNormalFontObject('GameFontNormalLarge')
	-------------------- Button Textures Start -------------------------
	AAPClassic.OptionsFrame.CloseButtonUpTexture = AAPClassic.OptionsFrame.CloseButton:CreateTexture()
	AAPClassic.OptionsFrame.CloseButtonUpTexture:SetTexture('Interface/Buttons/UI-Panel-Button-Up')
	AAPClassic.OptionsFrame.CloseButtonUpTexture:SetTexCoord(0, 0.625, 0, 0.6875)
	AAPClassic.OptionsFrame.CloseButtonUpTexture:SetAllPoints()
	AAPClassic.OptionsFrame.CloseButton:SetNormalTexture(AAPClassic.OptionsFrame.CloseButtonUpTexture)
	AAPClassic.OptionsFrame.CloseButtonHighlightTexture = AAPClassic.OptionsFrame.CloseButton:CreateTexture()
	AAPClassic.OptionsFrame.CloseButtonHighlightTexture:SetTexture('Interface/Buttons/UI-Panel-Button-Highlight')
	AAPClassic.OptionsFrame.CloseButtonHighlightTexture:SetTexCoord(0, 0.625, 0, 0.6875)
	AAPClassic.OptionsFrame.CloseButtonHighlightTexture:SetAllPoints()
	AAPClassic.OptionsFrame.CloseButton:SetHighlightTexture(AAPClassic.OptionsFrame.CloseButtonHighlightTexture)
	AAPClassic.OptionsFrame.CloseButtonDownTexture = AAPClassic.OptionsFrame.CloseButton:CreateTexture()
	AAPClassic.OptionsFrame.CloseButtonDownTexture:SetTexture('Interface/Buttons/UI-Panel-Button-Down')
	AAPClassic.OptionsFrame.CloseButtonDownTexture:SetTexCoord(0, 0.625, 0, 0.6875)
	AAPClassic.OptionsFrame.CloseButtonDownTexture:SetAllPoints()
	AAPClassic.OptionsFrame.CloseButton:SetPushedTexture(AAPClassic.OptionsFrame.CloseButtonDownTexture)
	-------------------- Button Textures End --------------------------
	AAPClassic.OptionsFrame.CloseButton:SetScript('OnClick', function(_)
		AAPClassic.OptionsFrame.MainFrame:Hide()
		AAPClassic.OptionsFrame.isOpen = 0
	end)

	-------------------- Quest Options Start -------------------------
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption = CreateFrame('frame', 'AAPC_OptionsMainFrame_OptionsNav_QuestOptions', AAP_OptionsNav)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption:SetWidth(150)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption:SetHeight(30)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption:SetFrameStrata('HIGH')
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption:SetPoint('TOPLEFT', AAP_OptionsNav, 'TOPLEFT', 0, 0)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption:SetMovable(true)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption:EnableMouse(true)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption:SetScript('OnMouseDown', function(_, button)
		if button == 'LeftButton' then
			AAPClassic.OptionsFrame.MainFrame.QuestOptions:Show()
			AAPClassic.OptionsFrame.MainFrame.ArrowOptions:Hide()
		end
	end)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption:SetScript('OnMouseUp', function(_, button)
		if button == 'LeftButton' and AAPClassic.OptionsFrame.MainFrame.isMoving then
			AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing()
			AAPClassic.OptionsFrame.MainFrame.isMoving = false
		end
	end)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption:SetScript('OnHide', function(_)
		if AAPClassic.OptionsFrame.MainFrame.isMoving then
			AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing()
			AAPClassic.OptionsFrame.MainFrame.isMoving = false
		end
	end)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption.Title = AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption:CreateFontString('AAPC_QuestOptions_Title', 'ARTWORK', 'ChatFontNormal')
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption.Title:SetParent(AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption.Title:SetPoint('CENTER', AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption, 0, 0)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption.Title:SetWidth(240)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption.Title:SetHeight(20)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption.Title:SetFontObject('GameFontHighlightLarge')
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption.Title:SetText('Quest Options')
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.QuestOption.Title:SetTextColor(1, 1, 0)

	AAPClassic.OptionsFrame.MainFrame.QuestOptions = CreateFrame('frame', 'AAPC_OptionsMainFrame_QuestOptions', AAPC_OptionsMainFrame)
	AAPClassic.OptionsFrame.MainFrame.QuestOptions:SetWidth(295)
	AAPClassic.OptionsFrame.MainFrame.QuestOptions:SetHeight(320)
	AAPClassic.OptionsFrame.MainFrame.QuestOptions:SetFrameStrata('MEDIUM')
	AAPClassic.OptionsFrame.MainFrame.QuestOptions:SetPoint('LEFT', AAPC_OptionsMainFrame, 'LEFT', 155, -20)
	AAPClassic.OptionsFrame.MainFrame.QuestOptions:SetMovable(true)
	AAPClassic.OptionsFrame.MainFrame.QuestOptions:EnableMouse(true)
	AAPClassic.OptionsFrame.MainFrame.QuestOptions:SetScript('OnMouseDown', function(_, button)
		if button == 'LeftButton' then
			AAPClassic.OptionsFrame.MainFrame:StartMoving()
			AAPClassic.OptionsFrame.MainFrame.isMoving = true
		end
	end)
	AAPClassic.OptionsFrame.MainFrame.QuestOptions:SetScript('OnMouseUp', function(_, button)
		if button == 'LeftButton' and AAPClassic.OptionsFrame.MainFrame.isMoving then
			AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing()
			AAPClassic.OptionsFrame.MainFrame.isMoving = false
		end
	end)
	AAPClassic.OptionsFrame.MainFrame.QuestOptions:SetScript('OnHide', function(_)
		if AAPClassic.OptionsFrame.MainFrame.isMoving then
			AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing()
			AAPClassic.OptionsFrame.MainFrame.isMoving = false
		end
	end)

	AAPClassic.OptionsFrame.AutoAcceptCheckButton = CreateFrame('CheckButton', 'AAPC_AutoAcceptCheckButton', AAPClassic.OptionsFrame.MainFrame.QuestOptions, 'ChatConfigCheckButtonTemplate')
	AAPClassic.OptionsFrame.AutoAcceptCheckButton:SetPoint('TOPLEFT', AAPClassic.OptionsFrame.MainFrame.QuestOptions, 10, -10)
	if not AAPC1[AAPClassic.Realm][AAPClassic.Name]["noauto"] then
		AAPClassic.OptionsFrame.AutoAcceptCheckButton:SetChecked(true)
	else
		AAPClassic.OptionsFrame.AutoAcceptCheckButton:SetChecked(false)
	end
	getglobal(AAPClassic.OptionsFrame.AutoAcceptCheckButton:GetName() .. 'Text'):SetText(': Auto Accept and Complete Quests')
	getglobal(AAPClassic.OptionsFrame.AutoAcceptCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
	AAPClassic.OptionsFrame.AutoAcceptCheckButton:SetScript('OnClick', function()
		if AAPClassic.OptionsFrame.AutoAcceptCheckButton:GetChecked() == true then
			AAPC1[AAPClassic.Realm][AAPClassic.Name]["noauto"] = false
		else
			AAPC1[AAPClassic.Realm][AAPClassic.Name]["noauto"] = true
		end
	end)

	-------------------- Quest Options End ---------------------------

	--------------------- Arrow Options Start --------------------------
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption = CreateFrame('frame', 'AAPC_OptionsMainFrame_OptionsNav_ArrowOptions', AAP_OptionsNav)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption:SetWidth(150)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption:SetHeight(30)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption:SetFrameStrata('HIGH')
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption:SetPoint('TOPLEFT', AAP_OptionsNav, 'TOPLEFT', 0, -30)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption:SetMovable(true)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption:EnableMouse(true)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption:SetScript('OnMouseDown', function(_, button)
		if button == 'LeftButton' then
			AAPClassic.OptionsFrame.MainFrame.QuestOptions:Hide()
			AAPClassic.OptionsFrame.MainFrame.ArrowOptions:Show()
		end
	end)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption:SetScript('OnMouseUp', function(_, button)
		if button == 'LeftButton' and AAPClassic.OptionsFrame.MainFrame.isMoving then
			AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing()
			AAPClassic.OptionsFrame.MainFrame.isMoving = false
		end
	end)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption:SetScript('OnHide', function(_)
		if AAPClassic.OptionsFrame.MainFrame.isMoving then
			AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing()
			AAPClassic.OptionsFrame.MainFrame.isMoving = false
		end
	end)

	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption.Title = AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption:CreateFontString('AAPC_ArrowOptions_Title', 'ARTWORK', 'ChatFontNormal')
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption.Title:SetParent(AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption.Title:SetPoint('CENTER', AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption, 0, 0)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption.Title:SetWidth(240)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption.Title:SetHeight(20)
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption.Title:SetFontObject('GameFontHighlightLarge')
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption.Title:SetText('Arrow Options')
	AAPClassic.OptionsFrame.MainFrame.OptionsNav.ArrowOption.Title:SetTextColor(1, 1, 0)

	AAPClassic.OptionsFrame.MainFrame.ArrowOptions = CreateFrame('frame', 'AAPC_OptionsMainFrame_ArrowOptions', AAPC_OptionsMainFrame)
	AAPClassic.OptionsFrame.MainFrame.ArrowOptions:SetWidth(295)
	AAPClassic.OptionsFrame.MainFrame.ArrowOptions:SetHeight(320)
	AAPClassic.OptionsFrame.MainFrame.ArrowOptions:SetFrameStrata('MEDIUM')
	AAPClassic.OptionsFrame.MainFrame.ArrowOptions:SetPoint('LEFT', AAPC_OptionsMainFrame, 'LEFT', 155, -20)
	AAPClassic.OptionsFrame.MainFrame.ArrowOptions:SetMovable(true)
	AAPClassic.OptionsFrame.MainFrame.ArrowOptions:EnableMouse(true)
	AAPClassic.OptionsFrame.MainFrame.ArrowOptions:SetScript('OnMouseDown', function(_, button)
		if button == 'LeftButton' then
			AAPClassic.OptionsFrame.MainFrame:StartMoving()
			AAPClassic.OptionsFrame.MainFrame.isMoving = true
		end
	end)
	AAPClassic.OptionsFrame.MainFrame.ArrowOptions:SetScript('OnMouseUp', function(_, button)
		if button == 'LeftButton' and AAPClassic.OptionsFrame.MainFrame.isMoving then
			AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing()
			AAPClassic.OptionsFrame.MainFrame.isMoving = false
		end
	end)
	AAPClassic.OptionsFrame.MainFrame.ArrowOptions:SetScript('OnHide', function(_)
		if AAPClassic.OptionsFrame.MainFrame.isMoving then
			AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing()
			AAPClassic.OptionsFrame.MainFrame.isMoving = false
		end
	end)

	AAPClassic.OptionsFrame.MainFrame.ArrowOptions:Hide()
	AAPClassic.OptionsFrame.LockArrowButton = CreateFrame('CheckButton', 'AAPC_LockArrowCheckButton', AAPClassic.OptionsFrame.MainFrame.ArrowOptions, 'ChatConfigCheckButtonTemplate')
	AAPClassic.OptionsFrame.LockArrowButton:SetPoint('TOPLEFT', AAPClassic.OptionsFrame.MainFrame.ArrowOptions, 10, -10)
	if AAPC1[AAPClassic.Realm][AAPClassic.Name]['LockArrow'] then
		AAPClassic.OptionsFrame.LockArrowButton:SetChecked(true)
	else
		AAPClassic.OptionsFrame.LockArrowButton:SetChecked(false)
	end
	getglobal(AAPClassic.OptionsFrame.LockArrowButton:GetName() .. 'Text'):SetText(': Lock Arrow')
	getglobal(AAPClassic.OptionsFrame.LockArrowButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
	AAPClassic.OptionsFrame.LockArrowButton:SetScript('OnClick', function()
		if AAPClassic.OptionsFrame.LockArrowButton:GetChecked() == true then
			AAPC1[AAPClassic.Realm][AAPClassic.Name]['LockArrow'] = true
		else
			AAPC1[AAPClassic.Realm][AAPClassic.Name]['LockArrow'] = false
		end
	end)

	AAPClassic.OptionsFrame.ShowQuestArrowCheckButton = CreateFrame('CheckButton', 'AAPC_ShowQuestArrow', AAPClassic.OptionsFrame.MainFrame.ArrowOptions, 'ChatConfigCheckButtonTemplate')
	AAPClassic.OptionsFrame.ShowQuestArrowCheckButton:SetPoint('TOPLEFT', AAPClassic.OptionsFrame.MainFrame.ArrowOptions, 10, -30)
	if AAPC1[AAPClassic.Realm][AAPClassic.Name]['ShowArrow'] == true then
		AAPClassic.OptionsFrame.ShowQuestArrowCheckButton:SetChecked(true)
	else
		AAPClassic.OptionsFrame.ShowQuestArrowCheckButton:SetChecked(false)
	end
	getglobal(AAPClassic.OptionsFrame.ShowQuestArrowCheckButton:GetName() .. 'Text'):SetText(': Show Questing Arrow')
	getglobal(AAPClassic.OptionsFrame.ShowQuestArrowCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
	AAPClassic.OptionsFrame.ShowQuestArrowCheckButton:SetScript('OnClick', function()
		if AAPClassic.OptionsFrame.ShowQuestArrowCheckButton:GetChecked() then
			AAPC1[AAPClassic.Realm][AAPClassic.Name]['ShowArrow'] = true
			AAPClassic.ArrowActive = 1
		else
			AAPC1[AAPClassic.Realm][AAPClassic.Name]['ShowArrow'] = false
		end
	end)
	--------------------- Arrow Options End ----------------------------
end
