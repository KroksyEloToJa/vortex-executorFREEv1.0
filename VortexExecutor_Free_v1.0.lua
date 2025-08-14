-- Vortex Executor (Premium) v1.0
local player = game.Players.LocalPlayer
local mainGui = Instance.new("ScreenGui")
mainGui.Name = "VortexExecutorPremium"
mainGui.Parent = game:GetService("CoreGui")

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 500, 0, 450)
frame.Position = UDim2.new(0.5, -250, 0.5, -225)
frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = mainGui

-- Draggable
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                   startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,0)
title.Text = "Vortex Executor (Premium) v1.0"
title.BackgroundColor3 = Color3.fromRGB(25,25,25)
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true
title.Parent = frame

-- Function to create buttons
local function createButton(name, yPos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, yPos)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.SourceSans
    btn.TextScaled = true
    btn.Parent = frame
    btn.MouseButton1Click:Connect(callback)
end

-- Close Button
createButton("Close Executor", 390, function()
    mainGui:Destroy()
end)

-- Infinite Yield
createButton("Infinite Yield", 60, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

-- Dex Explorer
createButton("Dex Explorer", 110, function()
    loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Dex%20Explorer.lua"))()
end)

-- Lua Executor
createButton("Lua Executor", 160, function()
    local execFrame = Instance.new("Frame")
    execFrame.Size = UDim2.new(0, 450, 0, 300)
    execFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
    execFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
    execFrame.BorderSizePixel = 0
    execFrame.Active = true
    execFrame.Parent = mainGui

    -- Make draggable
    local dragging, dragInput, dragStart, startPos
    execFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = execFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    execFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            execFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                           startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    local codeBox = Instance.new("TextBox")
    codeBox.Size = UDim2.new(1, -20, 1, -60)
    codeBox.Position = UDim2.new(0, 10, 0, 10)
    codeBox.ClearTextOnFocus = false
    codeBox.MultiLine = true
    codeBox.Text = "-- Write Lua here"
    codeBox.TextWrapped = true
    codeBox.TextColor3 = Color3.new(1,1,1)
    codeBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
    codeBox.Parent = execFrame

    local runBtn = Instance.new("TextButton")
    runBtn.Size = UDim2.new(0, 100, 0, 40)
    runBtn.Position = UDim2.new(0.5, -50, 1, -50)
    runBtn.Text = "Execute"
    runBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    runBtn.TextColor3 = Color3.new(1,1,1)
    runBtn.Parent = execFrame

    runBtn.MouseButton1Click:Connect(function()
        local success, err = pcall(function()
            loadstring(codeBox.Text)()
        end)
        if not success then
            warn("Error: "..err)
        end
    end)
end)


-- Better Fly (WeAreDevs)
createButton("Fly", 210, function()
    loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Fly.lua"))()
end)

-- Noclip
local noclipEnabled = false
createButton("Toggle Noclip", 260, function()
    noclipEnabled = not noclipEnabled
    game:GetService("RunService").Stepped:Connect(function()
        if noclipEnabled and player.Character then
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end)

-- Kick Player
createButton("Kick Player", 310, function()
    local username = game:GetService("Players"):GetPlayers()[1] and game:GetService("Players"):GetPlayers()[1].Name
    username = tostring(username)
    local input = game:GetService("Players"):FindFirstChild(username)
    if input then
        input:Kick("Kicked via Vortex Executor Premium")
    end
end)

-- Ban Player
createButton("Ban Player", 360, function()
    local username = game:GetService("Players"):GetPlayers()[1] and game:GetService("Players"):GetPlayers()[1].Name
    username = tostring(username)
    local target = game:GetService("Players"):FindFirstChild(username)
    if target then
        target:Kick("Banned via Vortex Executor Premium")
    end
end)

-- CoolKid GUI
createButton("Load CoolKid GUI", 410, function()
    loadstring(game:HttpGet("https://obj.wearedevs.net/199083/scripts/C00LKID.lua"))()
end)
