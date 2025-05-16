local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

local function makeDraggable(guiObject)
    local dragging, dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        guiObject.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                       startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    guiObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = guiObject.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    guiObject.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
            update(input)
        end
    end)
end

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 400, 0, 300)
main.Position = UDim2.new(0.5, -200, 0.5, -150)
main.BackgroundColor3 = Color3.new(0, 0, 0)
main.BorderSizePixel = 0
main.BackgroundTransparency = 0
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Active = true
main.Draggable = false
main.ClipsDescendants = true

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 10)

local border = Instance.new("UIStroke", main)
border.Thickness = 3
border.Color = Color3.fromRGB(255, 0, 0)

local titleBar = Instance.new("Frame", main)
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundTransparency = 1

local label = Instance.new("TextLabel", titleBar)
label.Text = "Lua Hub v3"
label.Size = UDim2.new(0.4, 0, 1, 0)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(255, 0, 0)
label.Font = Enum.Font.SourceSansBold
label.TextScaled = true

local author = Instance.new("TextLabel", titleBar)
author.Text = "By\nnexus14888_4"
author.Size = UDim2.new(0.4, 0, 1, 0)
author.Position = UDim2.new(0.4, 0, 0, 0)
author.BackgroundTransparency = 1
author.TextColor3 = Color3.fromRGB(255, 0, 0)
author.Font = Enum.Font.SourceSans
author.TextScaled = true

local close = Instance.new("TextButton", titleBar)
close.Text = "X"
close.Size = UDim2.new(0.2, 0, 1, 0)
close.Position = UDim2.new(0.8, 0, 0, 0)
close.BackgroundColor3 = Color3.new(0, 0, 0)
close.TextColor3 = Color3.fromRGB(255, 0, 0)
close.Font = Enum.Font.SourceSansBold
close.TextScaled = true

local closeCorner = Instance.new("UICorner", close)
closeCorner.CornerRadius = UDim.new(0, 4)

local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1, -10, 1, -50)
scroll.Position = UDim2.new(0, 5, 0, 45)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundColor3 = Color3.new(0, 0, 0)
scroll.BorderSizePixel = 0
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

local layout = Instance.new("UIGridLayout", scroll)
layout.CellSize = UDim2.new(0.3, -10, 0, 40)
layout.CellPadding = UDim2.new(0, 10, 0, 10)
layout.FillDirectionMaxCells = 3
layout.FillDirection = Enum.FillDirection.Horizontal
layout.SortOrder = Enum.SortOrder.LayoutOrder

local cornerScroll = Instance.new("UICorner", scroll)
cornerScroll.CornerRadius = UDim.new(0, 4)

local scripts = {
    {"Rochips Loader", "loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-rochips-universal-18294'))()"},
    {"Infinite Yield", "loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()"},
    {"Black Hole", "loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-FE-black-hole-18879'))()"},
    {"Brookhaven GUI", "loadstring(game:HttpGet('https://raw.githubusercontent.com/TheDarkoneMarcillisePex/Other-Scripts/main/Brook%20Haven%20Gui'))()"},
    {"GhostHub", "loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()"},
    {"Invisible", "loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-FE-INVISIBLE-20021'))()"},
    {"BH Audio", "loadstring(game:HttpGet('https://raw.githubusercontent.com/nmalka01/nmalka01/refs/heads/main/Brookhaven_audio'))()"},
    {"R6 Anims", "loadstring(game:HttpGet('https://raw.githubusercontent.com/Imagnir/r6_anims_for_r15/main/r6_anims.lua', true))()"},
    {"Brook Bundles", "loadstring(game:HttpGet('https://raw.githubusercontent.com/XtraYsf/Brook-Bundles/refs/heads/main/xtraysf'))()"},
    {"SP Hub", "loadstring(game:HttpGet('https://raw.githubusercontent.com/as6cd0/SP_Hub/refs/heads/main/Brookhaven'))()"},
    {"R4D", "loadstring(game:HttpGet('https://rawscripts.net/raw/Brookhaven-RP-R4D-script-no-key-17562'))()"},
    {"Salvatore", "loadstring(game:HttpGet('https://raw.githubusercontent.com/RFR-R1CH4RD/Loader/main/Salvatore.lua'))()"},
    {"Sunterium", "loadstring(game:HttpGet('https://raw.githubusercontent.com/ProjectSunterium/Project-Sunterium/refs/heads/main/Project%20Sunterium'))()"},
    {"MangoHub", "loadstring(game:HttpGet('https://raw.githubusercontent.com/rogelioajax/lua/main/MangoHub', true))()"},
    {"Sander X", "loadstring(game:HttpGet('https://rawscripts.net/raw/Brookhaven-RP-Sander-x-22769'))()"},
    {"Brook Bundles 2", "loadstring(game:HttpGet('https://raw.githubusercontent.com/XtraYsf/Brook-Bundles/refs/heads/main/xtraysf'))()"},
    {"Speed Wave", "loadstring(game:HttpGet('https://raw.githubusercontent.com/speedwavevip/scriptspeed/refs/heads/main/BrookhavenRP%2520SPEED'))()"}
}

for _, data in ipairs(scripts) do
    local button = Instance.new("TextButton", scroll)
    button.Size = UDim2.new(0, 100, 0, 40)
    button.Text = data[1]
    button.BackgroundColor3 = Color3.new(0, 0, 0)
    button.TextColor3 = Color3.fromRGB(255, 0, 0)
    button.Font = Enum.Font.SourceSans
    button.TextScaled = true

    local bcorner = Instance.new("UICorner", button)
    bcorner.CornerRadius = UDim.new(0, 6)

    button.MouseButton1Click:Connect(function()
        loadstring(data[2])()
    end)
end

local icon = Instance.new("ImageButton", gui)
icon.Image = "rbxassetid://116420301955464"
icon.Size = UDim2.new(0, 60, 0, 60)
icon.Position = UDim2.new(0.5, -30, 0.5, -30)
icon.BackgroundTransparency = 1
icon.Visible = false

icon.MouseButton1Click:Connect(function()
    main.Visible = true
    icon.Visible = false
end)

close.MouseButton1Click:Connect(function()
    main.Visible = false
    icon.Visible = true
end)

makeDraggable(main)
makeDraggable(icon)
