local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 30, 60)
mainFrame.BorderSizePixel = 3
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

local dragging = false
local dragStart = nil
local startPos = nil

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.Touch then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

mainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

local explorerLabel = Instance.new("TextLabel")
explorerLabel.Size = UDim2.new(1, 0, 0, 30)
explorerLabel.BackgroundColor3 = Color3.fromRGB(30, 50, 100)
explorerLabel.Text = "Explorer"
explorerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
explorerLabel.Font = Enum.Font.SourceSansBold
explorerLabel.TextSize = 20
explorerLabel.Parent = mainFrame

local scriptInputPanel = Instance.new("Frame")
scriptInputPanel.Size = UDim2.new(1, -20, 0, 150)
scriptInputPanel.Position = UDim2.new(0, 10, 0, 40)
scriptInputPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scriptInputPanel.BorderSizePixel = 2
scriptInputPanel.Parent = mainFrame

local scriptTextBox = Instance.new("TextBox")
scriptTextBox.Size = UDim2.new(1, -20, 1, -20)
scriptTextBox.Position = UDim2.new(0, 10, 0, 10)
scriptTextBox.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
scriptTextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
scriptTextBox.Font = Enum.Font.SourceSans
scriptTextBox.TextSize = 14
scriptTextBox.ClearTextOnFocus = true
scriptTextBox.MultiLine = true
scriptTextBox.Text = "Введите ваш скрипт здесь..."
scriptTextBox.Parent = scriptInputPanel

local function executeScript()
    local scriptToExecute = scriptTextBox.Text
    if scriptToExecute and scriptToExecute ~= "" then
        loadstring(scriptToExecute)()
    else
        warn("Скрипт пуст!")
    end
end

local function copyScript()
    local scriptToCopy = scriptTextBox.Text
    if scriptToCopy and scriptToCopy ~= "" then
        setclipboard(scriptToCopy)
    else
        warn("Нечего копировать!")
    end
end

local function clearScript()
    scriptTextBox.Text = ""
end

local buttonPanel = Instance.new("Frame")
buttonPanel.Size = UDim2.new(1, -20, 0, 50)
buttonPanel.Position = UDim2.new(0, 10, 1, -60)
buttonPanel.BackgroundColor3 = Color3.fromRGB(30, 50, 100)
buttonPanel.Parent = mainFrame

local useButton = Instance.new("TextButton")
useButton.Size = UDim2.new(0, 120, 1, 0)
useButton.Position = UDim2.new(0, 0, 0, 0)
useButton.Text = "Use"
useButton.TextColor3 = Color3.fromRGB(255, 255, 255)
useButton.BackgroundColor3 = Color3.fromRGB(50, 80, 150)
useButton.BorderSizePixel = 2
useButton.Font = Enum.Font.SourceSansBold
useButton.TextSize = 16
useButton.Parent = buttonPanel
useButton.MouseButton1Click:Connect(executeScript)

local clearButton = Instance.new("TextButton")
clearButton.Size = UDim2.new(0, 120, 1, 0)
clearButton.Position = UDim2.new(1, -240, 0, 0)
clearButton.Text = "Clear"
clearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
clearButton.BackgroundColor3 = Color3.fromRGB(50, 80, 150)
clearButton.BorderSizePixel = 2
clearButton.Font = Enum.Font.SourceSansBold
clearButton.TextSize = 16
clearButton.Parent = buttonPanel
clearButton.MouseButton1Click:Connect(clearScript)

local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.new(0, 120, 1, 0)
copyButton.Position = UDim2.new(1, -120, 0, 0)
copyButton.Text = "Copy"
copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyButton.BackgroundColor3 = Color3.fromRGB(50, 80, 150)
copyButton.BorderSizePixel = 2
copyButton.Font = Enum.Font.SourceSansBold
copyButton.TextSize = 16
copyButton.Parent = buttonPanel
copyButton.MouseButton1Click:Connect(copyScript)
