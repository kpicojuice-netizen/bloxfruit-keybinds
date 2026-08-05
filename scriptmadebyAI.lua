-- Configuration des touches (Modifiable)
local Keybinds = {
    Dash = "Q",
    Attack = "E", -- Remplacez par la touche souhaitée
    Block = "R"   -- Remplacez par la touche souhaitée
}

local UIS = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- Fonction pour simuler une vraie touche du clavier dans le jeu
local function simulateKeyPress(keyName)
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode[keyName], false, game)
    task.wait(0.05)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode[keyName], false, game)
end

-- Moteur de détection
UIS.InputBegan:Connect(function(input, gameProcessed)
    -- Si vous êtes en train d'écrire dans le chat, le script s'ignore
    if gameProcessed then return end 

    -- Vérification des touches pressées
    if input.KeyCode == Enum.KeyCode.Q then
        -- Force le déclenchement de la touche Dash par défaut
        simulateKeyPress(Keybinds.Dash)
    elseif input.KeyCode == Enum.KeyCode.E then
        simulateKeyPress(Keybinds.Attack)
    elseif input.KeyCode == Enum.KeyCode.R then
        simulateKeyPress(Keybinds.Block)
    end
end)

print("Script de Keybinds chargé avec succès !")
