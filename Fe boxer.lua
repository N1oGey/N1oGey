local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")

if player.PlayerGui:FindFirstChild("FeBoxerGui") then
	player.PlayerGui.FeBoxerGui:Destroy()
end

local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "FeBoxerGui"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
main.BorderColor3 = Color3.fromRGB(255, 140, 0)
main.BorderSizePixel = 4
main.Size = UDim2.new(0, 230, 0, 230)
main.Position = UDim2.new(0.3, 0, 0.3, 0)
main.Active = true
main.Draggable = true

local function createButton(text, posY)
	local btn = Instance.new("TextButton", main)
	btn.Size = UDim2.new(0.8, 0, 0, 50)
	btn.Position = UDim2.new(0.1, 0, 0, posY)
	btn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
	btn.BorderColor3 = Color3.fromRGB(255, 140, 0)
	btn.BorderSizePixel = 3
	btn.Font = Enum.Font.Cartoon
	btn.TextSize = 28
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Text = text
	return btn
end

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
title.BorderSizePixel = 0
title.Font = Enum.Font.Cartoon
title.TextSize = 32
title.TextColor3 = Color3.new(1, 1, 1)
title.Text = "   🥊 Fe Boxer 🥊"

local startBtn = createButton("Start anim", 60)
local stopBtn = createButton("Stop anim", 130)

local boxingAnim = Instance.new("Animation")
boxingAnim.AnimationId = "rbxassetid://243282565"

local punchAnim = Instance.new("Animation")
punchAnim.AnimationId = "rbxassetid://89134792"

local boxingTrack = nil
local punchTrack = nil
local tool = nil

startBtn.MouseButton1Click:Connect(function()
	boxingTrack = humanoid:LoadAnimation(boxingAnim)
	boxingTrack:Play()

	tool = Instance.new("Tool")
	tool.RequiresHandle = true
	tool.Name = "PunchTool"
	tool.TextureId = "rbxassetid://91044480406987"

	local handle = Instance.new("Part")
	handle.Name = "Handle"
	handle.Size = Vector3.new(1,1,1)
	handle.Transparency = 1
	handle.Anchored = false
	handle.CanCollide = false
	handle.Parent = tool

	tool.Activated:Connect(function()
		if boxingTrack then boxingTrack:Stop() end
		punchTrack = humanoid:LoadAnimation(punchAnim)
		punchTrack:Play()
		punchTrack.Stopped:Connect(function()
			if boxingTrack then boxingTrack:Play() end
		end)
	end)

	tool.Parent = player.Backpack
end)

stopBtn.MouseButton1Click:Connect(function()
	if boxingTrack then boxingTrack:Stop() boxingTrack = nil end
	if punchTrack then punchTrack:Stop() punchTrack = nil end
	if tool then tool:Destroy() tool = nil end
end)
