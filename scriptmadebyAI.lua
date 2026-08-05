-- Keybind System (Xeno Compatible)
local UIS = game:GetService("UserInputService")

local Keybinds = {
    Dash = "Q",
    Attack = "E",
    Block = "F"
}

local Actions = {}

function Actions.Bind(name, func)
    Actions[name] = func
end

function Actions.Rebind(name, newKey)
    Keybinds[name] = newKey
end

-- Example actions
Actions.Bind("Dash", function()
    print("DASH!")
end)

Actions.Bind("Attack", function()
    print("ATTACK!")
end)

Actions.Bind("Block", function()
    print("BLOCK!")
end)

-- Input listener
UIS.InputBegan:Connect(function(input, gp)
    if gp then return end

    local key = input.KeyCode.Name
    for actionName, bind in pairs(Keybinds) do
        if key == bind then
            Actions[actionName]()
        end
    end
end)

print("Keybind system loaded.")
