-- Vortex Executor (FREE) v1.0

local player = game.Players.LocalPlayer
local mainGui = Instance.new("ScreenGui")
mainGui.Name = "VortexExecutor"
mainGui.Parent = game:GetService("CoreGui")

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 400)
frame.Position = UDim2.new(0.5, -200, 0.5, -200)
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
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = frame

-- Username Box
local userBox = Instance.new("TextBox")
userBox.Size = UDim2.new(1, -20, 0, 30)
userBox.Position = UDim2.new(0, 10, 0, 45)
userBox.Text = "Enter username here"
userBox.TextColor3 = Color3.new(1,1,1)
userBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
userBox.ClearTextOnFocus = true
userBox.Font = Enum.Font.SourceSans
userBox.TextSize = 18
userBox.Parent = frame

-- Function to create buttons
local function createButton(name, yPos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, yPos)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.Parent = frame
    btn.MouseButton1Click:Connect(callback)
end

-- Infinite Yield
createButton("Infinite Yield", 90, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

-- Dex Explorer
createButton("Dex Explorer", 140, function()
    loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Dex%20Explorer.lua"))()
end)

-- Fly (WeAreDevs version)
createButton("Fly", 190, function()
    loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Fly.lua"))()
end)

-- Kick
createButton("Kick Player", 240, function()
    local target = game:GetService("Players"):FindFirstChild(userBox.Text)
    if target then
        target:Kick("Kicked via Vortex Executor (FREE)")
    else
        warn("Player not found: " .. userBox.Text)
    end
end)

-- Ban
createButton("Ban Player", 290, function()
    local target = game:GetService("Players"):FindFirstChild(userBox.Text)
    if target then
        target:Kick("Banned via Vortex Executor (FREE)")
        -- In premium: save banlist
    else
        warn("Player not found: " .. userBox.Text)
    end
end)

-- Close Button
createButton("Close Executor", 340, function()
    mainGui:Destroy()
end)

-- === Resizer Handle ===
local resizer = Instance.new("Frame")
resizer.Size = UDim2.new(0,20,0,20)
resizer.Position = UDim2.new(1,-20,1,-20)
resizer.BackgroundColor3 = Color3.fromRGB(60,60,60)
resizer.BorderSizePixel = 0
resizer.Parent = frame
resizer.Active = true
resizer.Draggable = true

-- Resize logic
local UIS = game:GetService("UserInputService")
local resizing = false

resizer.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        resizing = true
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        resizing = false
    end
end)

UIS.InputChanged:Connect(function(input)
    if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mousePos = UIS:GetMouseLocation()
        local absPos = frame.AbsolutePosition
        local newWidth = math.max(300, mousePos.X - absPos.X)
        local newHeight = math.max(300, mousePos.Y - absPos.Y)
        frame.Size = UDim2.new(0, newWidth, 0, newHeight)
        resizer.Position = UDim2.new(1,-20,1,-20)
    end
end)
