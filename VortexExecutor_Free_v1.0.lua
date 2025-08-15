-- Vortex Executor (FREE) v1.0
local player = game.Players.LocalPlayer

-- Main GUI
local mainGui = Instance.new("ScreenGui")
mainGui.Name = "VortexExecutor"
mainGui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 320)
frame.Position = UDim2.new(0.5, -200, 0.5, -160)
frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = mainGui

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,0)
title.Text = "Vortex Executor (FREE) v1.0"
title.BackgroundColor3 = Color3.fromRGB(25,25,25)
title.TextColor3 = Color3.new(1,1,1)
title.Parent = frame

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 50, 0, 40)
closeBtn.Position = UDim2.new(1,-50,0,0)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Parent = frame
closeBtn.MouseButton1Click:Connect(function()
    mainGui:Destroy()
end)

-- Button creation function
local function createButton(name, yPos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, yPos)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Parent = frame
    btn.MouseButton1Click:Connect(callback)
end

-- Infinite Yield
createButton("Infinite Yield", 60, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

-- Dex Explorer
createButton("Dex Explorer", 110, function()
    loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Dex%20Explorer.lua"))()
end)

-- Fly (WeAreDevs)
createButton("Fly", 160, function()
    loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Fly.lua"))()
end)

-- Kick Player
createButton("Kick Player", 210, function()
    local username = player.Name -- default target, can replace with prompt if needed
    local target = game:GetService("Players"):FindFirstChild(username)
    if target then
        target:Kick("Kicked via Vortex Executor")
    end
end)

-- Ban Player
createButton("Ban Player", 260, function()
    local username = player.Name
    local target = game:GetService("Players"):FindFirstChild(username)
    if target then
        target:Kick("Banned via Vortex Executor")
    end
end)
