-- Checkpoint Rush - basic game logic
-- Runs on the server so checkpoints and finish times cannot be changed by the player.

local Players = game:GetService("Players")
local checkpoints = workspace:WaitForChild("Checkpoints")
local finishPad = workspace:WaitForChild("FinishPad")
local lava = workspace:WaitForChild("Lava")

local positions = {
    [0] = CFrame.new(0, 7, 14),
    [1] = CFrame.new(6, 9, -38),
    [2] = CFrame.new(-3, 10, -69),
}

local function getPlayerFromTouch(hit)
    local character = hit:FindFirstAncestorOfClass("Model")
    if not character then return nil end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return nil end
    return Players:GetPlayerFromCharacter(character), humanoid
end

Players.PlayerAdded:Connect(function(player)
    player:SetAttribute("Checkpoint", 0)
    player:SetAttribute("Finished", false)
    player:SetAttribute("StartTime", workspace:GetServerTimeNow())

    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local wins = Instance.new("IntValue")
    wins.Name = "Wins"
    wins.Value = 0
    wins.Parent = leaderstats

    player.CharacterAdded:Connect(function(character)
        local root = character:WaitForChild("HumanoidRootPart", 10)
        if root then
            local index = player:GetAttribute("Checkpoint") or 0
            root.CFrame = positions[index] or positions[0]
        end
    end)
end)

for _, part in ipairs(checkpoints:GetChildren()) do
    local number = tonumber(part.Name:match("%d+"))
    if number then
        part.Touched:Connect(function(hit)
            local player = getPlayerFromTouch(hit)
            if not player or player:GetAttribute("Finished") then return end
            local current = player:GetAttribute("Checkpoint") or 0
            if number > current then
                player:SetAttribute("Checkpoint", number)
                print(player.Name .. " reached checkpoint " .. number)
            end
        end)
    end
end

local finishDebounce = {}
finishPad.Touched:Connect(function(hit)
    local player = getPlayerFromTouch(hit)
    if not player or finishDebounce[player] or player:GetAttribute("Finished") then return end
    finishDebounce[player] = true
    local elapsed = math.max(0, workspace:GetServerTimeNow() - (player:GetAttribute("StartTime") or workspace:GetServerTimeNow()))
    player:SetAttribute("Finished", true)
    player:SetAttribute("FinishTime", math.floor(elapsed * 10 + 0.5) / 10)
    local wins = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Wins")
    if wins then wins.Value += 1 end
    print(player.Name .. " finished in " .. string.format("%.1f", elapsed) .. " seconds!")
end)

lava.Touched:Connect(function(hit)
    local _, humanoid = getPlayerFromTouch(hit)
    if humanoid then humanoid.Health = 0 end
end)

Players.PlayerRemoving:Connect(function(player)
    finishDebounce[player] = nil
end)

print("Checkpoint Rush loaded - press Play to test the obstacle course")
