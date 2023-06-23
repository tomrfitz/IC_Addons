CBN_SELENDCANCEL := 10
WM_COMMAND := 0x0111
CB_SETITEMHEIGHT := 0x0153
CB_GETDROPPEDSTATE := 0x0157
CB_SETDROPPEDWIDTH := 0x0160

GUIFunctions.AddTab("BrivGF LevelUp")
; Add GUI fields to this addon's tab.
Gui, ICScriptHub:Tab, BrivGF LevelUp
Gui, ICScriptHub:Font, w700
Gui, ICScriptHub:Add, GroupBox, x+5 w463 h700 vMinMaxSettingsGroup, BrivGemFarm LevelUp Settings
Gui, ICScriptHub:Font, w400
Gui, ICScriptHub:Add, Text, x23 y100, Seat
Gui, ICScriptHub:Add, Text, x+51, Name
Gui, ICScriptHub:Add, Text, x+64 vMinLevelText, MinLevel
Gui, ICScriptHub:Add, Text, x+31 vMaxLevelText, MaxLevel

; Create minLevel, maxLevel, order buttons/edits
leftAlign := 25
xSpacing := 15
ySpacing := 10

Loop, 12
{
    AddSeat(xSpacing, ySpacing, A_Index)
}
; Add settings for the next seat
AddSeat(xSpacing, ySpacing, seat)
{
    global
    Gui, ICScriptHub:Add, Text, Center x%leftAlign% y+%ySpacing% w15, % seat
    GUIFunctions.UseThemeTextColor("InputBoxTextColor")
    Gui, ICScriptHub:Add, DropDownList , vDDL_BrivGemFarmLevelUpName_%seat% gBrivGemFarm_LevelUp_Name x+%xSpacing% y+-16 w111
    Gui, ICScriptHub:Add, ComboBox, Limit6 hwndHBrivGemFarmLevelUpMinLevel_%seat% vCombo_BrivGemFarmLevelUpMinLevel_%seat% gBrivGemFarm_LevelUp_MinMax_Clamp x+%xSpacing% w60
    Gui, ICScriptHub:Add, ComboBox, Limit6 hwndHBrivGemFarmLevelUpMaxLevel_%seat% vCombo_BrivGemFarmLevelUpMaxLevel_%seat% gBrivGemFarm_LevelUp_MinMax_Clamp x+%xSpacing% w60
    GUIFunctions.UseThemeTextColor()
}

Gui, ICScriptHub:Add, Text, x%leftAlign% y+20 vLoadFormationText, Formation
Gui, ICScriptHub:Add, DropDownList, x+10 y+-17 w35 AltSubmit Disabled hwndBrivGemFarm_LevelUp_LoadFormation vBrivGemFarm_LevelUp_LoadFormation gBrivGemFarm_LevelUp_LoadFormation, Q||W|E
PostMessage, CB_SETITEMHEIGHT, -1, 17,, ahk_id %BrivGemFarm_LevelUp_LoadFormation%
Gui, ICScriptHub:Add, CheckBox, x+%xSpacing% y+-17 vBrivGemFarm_LevelUp_ShowSpoilers gBrivGemFarm_LevelUp_ShowSpoilers, Show spoilers

Gui, ICScriptHub:Font, w700
Gui, ICScriptHub:Add, GroupBox, xs+15 y500 w449 h80 vDefaultSettingsGroup, Default Settings
Gui, ICScriptHub:Font, w400
Gui, ICScriptHub:Add, Button, xs+%leftAlign% yp+20 Disabled vBrivGemFarm_LevelUp_Default gBrivGemFarm_LevelUp_Default, Load default settings
Gui, ICScriptHub:Add, Button, x+%xSpacing% Hidden vBrivGemFarm_LevelUp_Save gBrivGemFarm_LevelUp_Save, Save
Gui, ICScriptHub:Add, Button, x+%xSpacing% Hidden vBrivGemFarm_LevelUp_Changes gBrivGemFarm_LevelUp_Changes, Show unsaved changes
Gui, ICScriptHub:Add, Button, x+%xSpacing% Hidden vBrivGemFarm_LevelUp_Undo gBrivGemFarm_LevelUp_Undo, Undo
Gui, ICScriptHub:Add, Text, xs+%leftAlign% y+%ySpacing% vDefaultMinLevelText, Default min level:
Gui, ICScriptHub:Add, Radio, x+5 vBrivGemFarm_LevelUp_MinRadio0 gBrivGemFarm_LevelUp_MinDefault, 0
Gui, ICScriptHub:Add, Radio, x+1 vBrivGemFarm_LevelUp_MinRadio1 gBrivGemFarm_LevelUp_MinDefault, 1
Gui, ICScriptHub:Add, Text, x+5 vDefaultMaxLevelText, |   Default max level:
Gui, ICScriptHub:Add, Radio, x+5 vBrivGemFarm_LevelUp_MaxRadio1 gBrivGemFarm_LevelUp_MaxDefault, 1
Gui, ICScriptHub:Add, Radio, x+1 vBrivGemFarm_LevelUp_MaxRadioLast gBrivGemFarm_LevelUp_MaxDefault, Last upgrade

Gui, ICScriptHub:Font, w700
Gui, ICScriptHub:Add, GroupBox, xs+15 y585 w449 h100 vMinSettingsGroup, Min Settings
Gui, ICScriptHub:Font, w400
Gui, ICScriptHub:Add, CheckBox, xs+%leftAlign% yp+20 vBrivGemFarm_LevelUp_ForceBrivShandie gBrivGemFarm_LevelUp_ForceBrivShandie, Level up Briv/Shandie to MinLevel first
GUIFunctions.UseThemeTextColor("InputBoxTextColor")
Gui, ICScriptHub:Add, Edit, xs+%leftAlign% y+%ySpacing% w40 Limit2 vBrivGemFarm_LevelUp_MaxSimultaneousInputs gBrivGemFarm_LevelUp_MaxSimultaneousInputs
GUIFunctions.UseThemeTextColor()
Gui, ICScriptHub:Add, Text, x+5 y+-18, Maximum simultaneous F keys inputs during MinLevel
GUIFunctions.UseThemeTextColor("InputBoxTextColor")
Gui, ICScriptHub:Add, Edit, xs+%leftAlign% y+%ySpacing% w40 Limit5 vBrivGemFarm_LevelUp_MinLevelTimeout gBrivGemFarm_LevelUp_MinLevelTimeout
GUIFunctions.UseThemeTextColor()
Gui, ICScriptHub:Add, Text, x+5 y+-18, MinLevel timeout (ms)

Gui, ICScriptHub:Font, w700
Gui, ICScriptHub:Add, GroupBox, xs+15 y690 w449 h45 vMaxSettingsGroup, Fail Run Recovery Settings
Gui, ICScriptHub:Font, w400
Gui, ICScriptHub:Add, CheckBox, xs+%leftAlign% yp+20 vBrivGemFarm_LevelUp_LevelToSoftCapFailedConversion gBrivGemFarm_LevelUp_LevelToSoftCapFailedConversion, Level champions to soft cap after failed conversion
Gui, ICScriptHub:Add, CheckBox, x+%xSpacing% vBrivGemFarm_LevelUp_LevelToSoftCapFailedConversionBriv gBrivGemFarm_LevelUp_LevelToSoftCapFailedConversionBriv, Briv included

Gui, ICScriptHub:Add, Text, xs+15 y+25 w445 R2 hwndBrivGemFarm_LevelUp_Text vBrivGemFarm_LevelUp_Text, % "Status: No settings."
Gui, ICScriptHub:Add, Button, x13 y+20 Disabled vBrivGemFarm_LevelUp_LoadDefinitions gBrivGemFarm_LevelUp_LoadDefinitions, Load Definitions
Gui, ICScriptHub:Add, Text, x+10 y+-18 w450 R3 vBrivGemFarm_LevelUp_DefinitionsStatus, % "No definitions."

OnMessage(WM_COMMAND, "CheckComboStatus")

; Refresh min/max values after a ComboBox sends a selection cancel event to the parent tab
CheckComboStatus(W)
{
    global
    GuiControlGet, CurrentTab,, ModronTabControl, Tab
    if (CurrentTab != "BrivGF LevelUp")
        return
    seat_ID := 0
    Loop, 12
    {
        ctrlH := HBrivGemFarmLevelUpMinLevel_%A_Index%
        SendMessage, CB_GETDROPPEDSTATE, 0, 0,, ahk_id %ctrlH%
        if (Errorlevel)
        {
            seat_ID := A_Index
            break
        }
        ctrlH := HBrivGemFarmLevelUpMaxLevel_%A_Index%
        SendMessage, CB_GETDROPPEDSTATE, 0, 0,, ahk_id %ctrlH%
        if (Errorlevel)
        {
            seat_ID := A_Index
            break
        }
    }
    if (seat_ID)
    {
        if ((W >> 16) & 0xFFFF == CBN_SELENDCANCEL)
        {
            choice := % DDL_BrivGemFarmLevelUpName_%seat_ID%
            if (choice == "Briv") ; After %choice%, ErrorLevel is set to 1 for an unknown reason
                GuiControl, ICScriptHub:ChooseString, DDL_BrivGemFarmLevelUpName_5, % "|" . choice
            else
                GuiControl, ICScriptHub:ChooseString, %choice%, % "|" . choice
        }
    }
}

; Switch names
BrivGemFarm_LevelUp_Name()
{
    global
    Gui, ICScriptHub:Submit, NoHide
    local name := % %A_GuiControl%
    heroDefs := g_DefinesLoader.HeroDefines.hero_defines
    for k, v in heroDefs
    {
        if (v.name == name)
        {
            IC_BrivGemFarm_LevelUp_Seat.Seats[v.seat_id].UpdateMinMaxLevels(name)
            break
        }
    }
}

; Input upgrade level when selected from DDL, then verify that min/max level inputs are in 0-999999 range
BrivGemFarm_LevelUp_MinMax_Clamp()
{
    global
    Gui, ICScriptHub:Submit, NoHide
    local value := % %A_GuiControl%
    local clamped := value
    Loop, Parse, clamped, :, " "
    {
        clamped := A_LoopField
        break
    }
    if clamped is not integer
        clamped := 0
    clamped := clamped <= 0 ? 0 : clamped
    clamped := clamped > 999999 ? 999999 : clamped
    if (clamped != value)
        GuiControl, ICScriptHub:Text, %A_GuiControl%, % clamped
    split := StrSplit(A_GuiControl, "_")
    heroId := IC_BrivGemFarm_LevelUp_Seat.Seats[split[3]].GetCurrentHeroData().id
    Switch split[2]
    {
        Case "BrivGemFarmLevelUpMinLevel":
            g_BrivGemFarm_LevelUp.TempSettings.AddSetting(["BrivGemFarm_LevelUp_Settings", "minLevels", heroId], clamped)
        Case "BrivGemFarmLevelUpMaxLevel":
            g_BrivGemFarm_LevelUp.TempSettings.AddSetting(["BrivGemFarm_LevelUp_Settings", "maxLevels", heroId], clamped)
        Default:
            return
    }
}

; Load formation to the GUI
BrivGemFarm_LevelUp_LoadFormation()
{
    Gui, ICScriptHub:Submit, NoHide
    GuiControl, ICScriptHub:Disable, BrivGemFarm_LevelUp_LoadFormation
    Sleep, 20
    g_BrivGemFarm_LevelUp.LoadFormation(%A_GuiControl%)
    GuiControl, ICScriptHub:Enable, BrivGemFarm_LevelUp_LoadFormation
}

; Spoilers
BrivGemFarm_LevelUp_ShowSpoilers()
{
    global
    Gui, ICScriptHub:Submit, NoHide
    showSpoilers := BrivGemFarm_LevelUp_ShowSpoilers
    g_BrivGemFarm_LevelUp.TempSettings.AddSetting("ShowSpoilers", showSpoilers)
    g_BrivGemFarm_LevelUp.ToggleSpoilers(showSpoilers) ; Effect is immediate
}

; Default settings button
BrivGemFarm_LevelUp_Default()
{
    MsgBox, 4, , Restore Default settings?, 10
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return
    GuiControl, ICScriptHub:Disable, BrivGemFarm_LevelUp_Default
    g_BrivGemFarm_LevelUp.LoadSettings(true)
    GuiControl, ICScriptHub:Enable, BrivGemFarm_LevelUp_Default
}

; Save settings button
BrivGemFarm_LevelUp_Save()
{
    MsgBox, 4, , Save and apply changes?, 10
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return
    Gui, IC_BrivGemFarm_LevelUp_TempSettings:Hide
    Gui, ICScriptHub:Submit, NoHide
    g_BrivGemFarm_LevelUp.SaveSettings(true)
}

; TempsSettings changes
BrivGemFarm_LevelUp_Changes()
{
    g_BrivGemFarm_LevelUp.TempSettings.ReloadTempSettingsDisplay()
    Gui, IC_BrivGemFarm_LevelUp_TempSettings:Show
}

; Undo temp settings button
BrivGemFarm_LevelUp_Undo()
{
    MsgBox, 4, , Undo all changes?, 10
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return
    g_BrivGemFarm_LevelUp.UndoTempSettings()
    Gui, IC_BrivGemFarm_LevelUp_TempSettings:Hide
}

BrivGemFarm_LevelUp_MinDefault()
{
    global
    Gui, ICScriptHub:Submit, NoHide
    g_BrivGemFarm_LevelUp.TempSettings.AddSetting("DefaultMinLevel", BrivGemFarm_LevelUp_MinRadio0 ? 0 : 1)
    g_BrivGemFarm_LevelUp.FillMissingDefaultSettings()
}

BrivGemFarm_LevelUp_MaxDefault()
{
    global
    Gui, ICScriptHub:Submit, NoHide
    g_BrivGemFarm_LevelUp.TempSettings.AddSetting("DefaultMaxLevel", BrivGemFarm_LevelUp_MaxRadio1 ? 1 : "Last")
    g_BrivGemFarm_LevelUp.FillMissingDefaultSettings()
}

; Force Briv/Shandie MinLevel
BrivGemFarm_LevelUp_ForceBrivShandie()
{
    global
    Gui, ICScriptHub:Submit, NoHide
    g_BrivGemFarm_LevelUp.TempSettings.AddSetting("ForceBrivShandie", BrivGemFarm_LevelUp_ForceBrivShandie)
}

; Maximum number of simultaneous F keys inputs during MinLevel
BrivGemFarm_LevelUp_MaxSimultaneousInputs()
{
    global
    Gui, ICScriptHub:Submit, NoHide
    maxSimultaneousInputs := BrivGemFarm_LevelUp_MaxSimultaneousInputs
    if maxSimultaneousInputs is not integer
    {
        maxSimultaneousInputs := 1
        GuiControl, ICScriptHub:Text, BrivGemFarm_LevelUp_MaxSimultaneousInputs, % maxSimultaneousInputs
    }
    else if (maxSimultaneousInputs < 1)
    {
        maxSimultaneousInputs := 1
        GuiControl, ICScriptHub:Text, BrivGemFarm_LevelUp_MaxSimultaneousInputs, % maxSimultaneousInputs
    }
    g_BrivGemFarm_LevelUp.TempSettings.AddSetting("MaxSimultaneousInputs", maxSimultaneousInputs)
}

; Maximum number of simultaneous F keys inputs during MinLevel
BrivGemFarm_LevelUp_MinLevelTimeout()
{
    global
    Gui, ICScriptHub:Submit, NoHide
    minLevelTimeout := BrivGemFarm_LevelUp_MinLevelTimeout
    if minLevelTimeout is not integer
    {
        minLevelTimeout := !minLevelTimeout ? 0 : 5000
        GuiControl, ICScriptHub:Text, BrivGemFarm_LevelUp_MinLevelTimeout, % minLevelTimeout
    }
    else if (minLevelTimeout < 0)
    {
        minLevelTimeout := 0
        GuiControl, ICScriptHub:Text, BrivGemFarm_LevelUp_MinLevelTimeout, % minLevelTimeout
    }
    g_BrivGemFarm_LevelUp.TempSettings.AddSetting("MinLevelTimeout", minLevelTimeout)
}

; Level champions to soft cap after a failed conversion to reach stack zone faster
BrivGemFarm_LevelUp_LevelToSoftCapFailedConversion()
{
    global
    Gui, ICScriptHub:Submit, NoHide
    g_BrivGemFarm_LevelUp.TempSettings.AddSetting("LevelToSoftCapFailedConversion", BrivGemFarm_LevelUp_LevelToSoftCapFailedConversion)
}

; Level champions to soft cap after a failed conversion to reach stack zone faster (Briv is excluded, desireable for early stacking)
BrivGemFarm_LevelUp_LevelToSoftCapFailedConversionBriv()
{
    global
    Gui, ICScriptHub:Submit, NoHide
    g_BrivGemFarm_LevelUp.TempSettings.AddSetting("LevelToSoftCapFailedConversionBriv", BrivGemFarm_LevelUp_LevelToSoftCapFailedConversionBriv)
}

; Load new definitions
BrivGemFarm_LevelUp_LoadDefinitions()
{
    GuiControl, ICScriptHub:Disable, BrivGemFarm_LevelUp_LoadDefinitions
    g_DefinesLoader.Start(false, true)
}

; Temp settings ListView
Gui, IC_BrivGemFarm_LevelUp_TempSettings:New, -MaximizeBox -Resize
GUIFunctions.LoadTheme("IC_BrivGemFarm_LevelUp_TempSettings")
GUIFunctions.UseThemeBackgroundColor()
GUIFunctions.UseThemeTextColor()
Gui IC_BrivGemFarm_LevelUp_TempSettings:Add, GroupBox, w330 h310, BrivGemFarm LevelUp Settings
Gui IC_BrivGemFarm_LevelUp_TempSettings:Add, ListView, xp+15 yp+24 w300 h270 NoSortHdr vBrivTempSettingsID , Setting|Current|New
GUIFunctions.UseThemeListViewBackgroundColor("BrivTempSettingsID")
GUIFunctions.LoadTheme()