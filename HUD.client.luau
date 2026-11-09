-- Checkpoint Rush - simple on-screen timer and instructions
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local screen = Instance.new("ScreenGui")
screen.Name = "CheckpointRushHUD"
screen.ResetOnSpawn = false
screen.IgnoreGuiInset = true
screen.Parent = player:WaitForChild("PlayerGui")

local title = Instance.new("TextLabel")
title.Name = "GameTitle"
title.AnchorPoint = Vector2.new(0.5, 0)
title.Position = UDim2.new(0.5, 0, 0, 14)
title.Size = UDim2.new(0.9, 0, 0, 48)
title.BackgroundColor3 = Color3.fromRGB(22, 29, 54)
title.BackgroundTransparency = 0.1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Text = "CHECKPOINT RUSH"
title.Parent = screen

local info = Instance.new("TextLabel")
info.Name = "GameInfo"
info.AnchorPoint = Vector2.new(0.5, 0)
info.Position = UDim2.new(0.5, 0, 0, 65)
info.Size = UDim2.new(0.9, 0, 0, 35)
info.BackgroundColor3 = Color3.fromRGB(34, 47, 83)
info.BackgroundTransparency = 0.15
info.TextColor3 = Color3.fromRGB(230, 246, 255)
info.Font = Enum.Font.Gotham
info.TextScaled = true
info.Text = "Reach the green finish!"
info.Parent = screen

local hint = Instance.new("TextLabel")
hint.AnchorPoint = Vector2.new(0.5, 1)
hint.Position = UDim2.new(0.5, 0, 1, -15)
hint.Size = UDim2.new(0.9, 0, 0, 28)
hint.BackgroundTransparency = 1
hint.TextColor3 = Color3.fromRGB(255, 255, 255)
hint.TextStrokeTransparency = 0.25
hint.Font = Enum.Font.GothamMedium
hint.TextScaled = true
hint.Text = "Jump across the platforms. Green pads save your checkpoint."
hint.Parent = screen

while screen.Parent do
    local cp = player:GetAttribute("Checkpoint") or 0
    if player:GetAttribute("Finished") then
        info.Text = "FINISHED! Time: " .. tostring(player:GetAttribute("FinishTime") or 0) .. "s | Checkpoints: " .. cp .. "/2"
    else
        local start = player:GetAttribute("StartTime") or workspace:GetServerTimeNow()
        local seconds = math.max(0, workspace:GetServerTimeNow() - start)
        info.Text = string.format("Time: %.1fs  |  Checkpoint: %d/2", seconds, cp)
    end
    task.wait(0.1)
end
