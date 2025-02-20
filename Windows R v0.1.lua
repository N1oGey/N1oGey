local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = playerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 250)
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderSizePixel = 2
Frame.Parent = ScreenGui

local TitleBar = Instance.new("TextLabel")
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(190, 190, 150)
TitleBar.Text = "Windows R"
TitleBar.TextColor3 = Color3.fromRGB(0, 0, 0)
TitleBar.Font = Enum.Font.Code
TitleBar.TextSize = 20
TitleBar.Parent = Frame

local MainImage = Instance.new("ImageLabel")
MainImage.Size = UDim2.new(1, 0, 1, -30)
MainImage.Position = UDim2.new(0, 0, 0, 30)
MainImage.Image = "rbxassetid://101226523811605"
MainImage.Parent = Frame

local ImageButton = Instance.new("ImageButton")
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Position = UDim2.new(0, 10, 0, 40)
ImageButton.Image = "rbxassetid://101625717762551"
ImageButton.Parent = Frame

local DexText = Instance.new("TextLabel")
DexText.Size = UDim2.new(0, 50, 0, 20)
DexText.Position = UDim2.new(0, 10, 0, 95)
DexText.Text = "Dex"
DexText.TextColor3 = Color3.fromRGB(0, 0, 0)
DexText.Font = Enum.Font.Code
DexText.TextSize = 14
DexText.BackgroundTransparency = 1
DexText.Parent = Frame

local CloseButton = Instance.new("ImageButton")
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -25, 0, 5)
CloseButton.Image = "rbxassetid://114249762793987"
CloseButton.Parent = Frame
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local dragging, dragStart, startPos

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

ImageButton.MouseButton1Click:Connect(function()
    local ScriptFrame = Instance.new("Frame")
    ScriptFrame.Size = UDim2.new(0, 400, 0, 250)
    ScriptFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
    ScriptFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScriptFrame.BorderSizePixel = 2
    ScriptFrame.Parent = ScreenGui

    local TitleBar = Instance.new("TextLabel")
    TitleBar.Size = UDim2.new(1, 0, 0, 30)
    TitleBar.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    TitleBar.Text = "Explorer"
    TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleBar.Font = Enum.Font.SourceSansBold
    TitleBar.TextSize = 20
    TitleBar.Parent = ScriptFrame

    local ScriptBox = Instance.new("TextBox")
    ScriptBox.Size = UDim2.new(1, -10, 0.6, 0)
    ScriptBox.Position = UDim2.new(0, 5, 0, 40)
    ScriptBox.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    ScriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    ScriptBox.TextWrapped = true
    ScriptBox.MultiLine = true
    ScriptBox.TextXAlignment = Enum.TextXAlignment.Left
    ScriptBox.TextYAlignment = Enum.TextYAlignment.Top
    ScriptBox.Font = Enum.Font.Code
    ScriptBox.TextSize = 14
    ScriptBox.ClearTextOnFocus = false
    ScriptBox.Parent = ScriptFrame

    local function CreateButton(name, text, pos, callback)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0.3, -5, 0, 30)
        Button.Position = pos
        Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Text = text
        Button.Font = Enum.Font.SourceSansBold
        Button.TextSize = 18
        Button.Parent = ScriptFrame
        Button.MouseButton1Click:Connect(callback)
    end

    CreateButton("Use", "Use", UDim2.new(0, 5, 1, -35), function()
        local scriptText = ScriptBox.Text
        local success, err = pcall(function()
            loadstring(scriptText)()
        end)
        if not success then
            warn("Ошибка в скрипте: " .. err)
        end
    end)

    CreateButton("Copy", "Copy", UDim2.new(0.35, 0, 1, -35), function()
        setclipboard(ScriptBox.Text)
    end)

    CreateButton("Clear", "Clear", UDim2.new(0.7, 0, 1, -35), function()
        ScriptBox.Text = ""
    end)

    local dragging, dragStart, startPos

    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = ScriptFrame.Position
        end
    end)

    TitleBar.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
            local delta = input.Position - dragStart
            ScriptFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    TitleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end)
