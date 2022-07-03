function ActionButtonDown(id)
    local button, pagedID
    if bongos == nil then
        if (BonusActionBarFrame:IsShown()) then
            local button = getglobal("BonusActionButton" .. id);
            if (button:GetButtonState() == "NORMAL") then
                button:SetButtonState("PUSHED");
                UseAction(ActionButton_GetPagedID(button), 0, ClassicSnowfallSelfCast());
            end
            return;
        end

        button = getglobal("ActionButton" .. id)

        if (button:GetButtonState() == "NORMAL") then
            button:SetButtonState("PUSHED");
            UseAction(ActionButton_GetPagedID(button), 0, ClassicSnowfallSelfCast());
        end
    else
        button = getglobal("BActionButton" .. id)
        pagedID = BActionButton.GetPagedID(id);
        if (button and button:GetButtonState() == "NORMAL") then
            button:SetButtonState("PUSHED");
        end
        UseAction(pagedID, 0);
    end
end

function ActionButtonUp(id, onSelf)
    local button
    if bongos == nil then
        if (BonusActionBarFrame:IsShown()) then
            local button = getglobal("BonusActionButton" .. id);
            if (button:GetButtonState() == "PUSHED") then
                button:SetButtonState("NORMAL");
                if (MacroFrame_SaveMacro) then
                    MacroFrame_SaveMacro();
                end
                if (IsCurrentAction(ActionButton_GetPagedID(button))) then
                    button:SetChecked(1);
                else
                    button:SetChecked(0);
                end
            end
            return;
        end
        button = getglobal("ActionButton" .. id)
        if (button and button:GetButtonState() == "PUSHED") then
            button:SetButtonState("NORMAL");
            if (MacroFrame_SaveMacro) then
                MacroFrame_SaveMacro();
            end
            if (IsCurrentAction(ActionButton_GetPagedID(button))) then
                button:SetChecked(1);
            else
                button:SetChecked(0);
            end
        end
    else
        button = getglobal("BActionButton" .. id)
        if (button and button:GetButtonState() == "PUSHED") then
            button:SetButtonState("NORMAL");
            if (MacroFrame_SaveMacro) then
                MacroFrame_SaveMacro();
            end
            button:SetChecked(IsCurrentAction(BActionButton.GetPagedID(id)));
        end
    end
end

function MultiActionButtonDown(bar, id)
    local button = getglobal(bar .. "Button" .. id);
    if (button:GetButtonState() == "NORMAL") then
        button:SetButtonState("PUSHED");
        UseAction(ActionButton_GetPagedID(button), 0, ClassicSnowfallSelfCast());
    end
end

function MultiActionButtonUp(bar, id, onSelf)
    local button = getglobal(bar .. "Button" .. id);
    if (button:GetButtonState() == "PUSHED") then
        button:SetButtonState("NORMAL");
        if (MacroFrame_SaveMacro) then
            MacroFrame_SaveMacro();
        end

        if (IsCurrentAction(ActionButton_GetPagedID(button))) then
            button:SetChecked(1);
        else
            button:SetChecked(0);
        end
    end
end
