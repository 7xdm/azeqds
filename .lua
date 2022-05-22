-- Settings
local distance = 7
local on = true

-- Variables
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Script
game:GetService('RunService').Heartbeat:connect(function()
    _G.RightArm = nil
    local Character = LocalPlayer.Character
    if Character then
        local RightArm = Character:WaitForChild("Right Arm")
        if RightArm then
            _G.RightArm = RightArm
        end
    end

    if on == true then
        for _,v in pairs(Workspace:GetChildren()) do
            local v = workspace:FindFirstChild("TPS")
            -- v.Design.TextureId = 0
            if v and _G.RightArm and (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= distance then
                firetouchinterest(v, _G.RightArm, 0)
                firetouchinterest(v, _G.RightArm, 1)
            end
        end
    end
end)

local is_on = function()
    return on and 'on' or 'off'
end

local mouse = LocalPlayer:GetMouse()
mouse.KeyDown:connect(function(key)
    if key == '7' then
        on = not on
        end
    end)
