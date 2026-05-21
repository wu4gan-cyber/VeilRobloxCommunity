--!strict

--========================================================
-- VEIL ROBLOX COMMUNITY
-- MOBILE EXECUTOR FRAMEWORK
-- COMPACT ANDROID VERSION
--========================================================

pcall(function()

	if game.CoreGui:FindFirstChild("VeilCommunityHub") then
		game.CoreGui.VeilCommunityHub:Destroy()
	end

end)

--========================================================
-- SERVICES
--========================================================

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

--========================================================
-- PLAYER
--========================================================

local Player = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--========================================================
-- DEVICE DETECTION
--========================================================

local IsMobile = UIS.TouchEnabled

--========================================================
-- FRAMEWORK
--========================================================

local Framework = {

	State = {

		Fly = false,
		Noclip = false,

		ESPLine = false,
		ESPBox = false,
		ESPDistance = false,
		ESPHealth = false,

		Immortal = false,

		UIOpen = true,
	},

	Config = {

		WalkSpeed = 16,
		FlySpeed = 80,

		UITransparency = 0.15
	}
}

--========================================================
-- GUI
--========================================================

local GUI = Instance.new("ScreenGui")
GUI.Name = "VeilCommunityHub"
GUI.ResetOnSpawn = false
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.Parent = game.CoreGui

--========================================================
-- FLOAT BUTTON
--========================================================

local FloatButton = Instance.new("TextButton")
FloatButton.Size = UDim2.new(0,52,0,52)
FloatButton.Position = UDim2.new(0,18,0.5,-26)
FloatButton.BackgroundColor3 = Color3.fromRGB(15,15,15)
FloatButton.Text = "☰"
FloatButton.TextColor3 = Color3.new(1,1,1)
FloatButton.TextSize = 22
FloatButton.Font = Enum.Font.GothamBold
FloatButton.Parent = GUI

Instance.new("UICorner",FloatButton).CornerRadius =
	UDim.new(1,0)

local FloatStroke = Instance.new("UIStroke")
FloatStroke.Color = Color3.fromRGB(0,255,140)
FloatStroke.Thickness = 2
FloatStroke.Parent = FloatButton

--========================================================
-- MAIN WINDOW
--========================================================

local Main = Instance.new("Frame")

if IsMobile then

	Main.Size = UDim2.new(0,720,0,420)
	Main.Position = UDim2.new(0.5,-360,0.5,-210)

else

	Main.Size = UDim2.new(0,1000,0,600)
	Main.Position = UDim2.new(0.5,-500,0.5,-300)
end

Main.BackgroundColor3 = Color3.fromRGB(12,12,12)
Main.BackgroundTransparency = Framework.Config.UITransparency
Main.BorderSizePixel = 0
Main.Parent = GUI

Instance.new("UICorner",Main).CornerRadius =
	UDim.new(0,14)

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(35,35,35)
MainStroke.Parent = Main

--========================================================
-- TOPBAR
--========================================================

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1,0,0,48)
TopBar.BackgroundTransparency = 1
TopBar.Parent = Main

--========================================================
-- TITLE
--========================================================

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,1,0)
Title.Position = UDim2.new(0,16,0,0)
Title.BackgroundTransparency = 1
Title.Text = "● VEIL ROBLOX COMMUNITY"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

--========================================================
-- BUTTON CREATOR
--========================================================

local function CreateTopButton(text,x)

	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(0,38,0,38)
	Button.Position = UDim2.new(1,x,0.5,-19)
	Button.BackgroundColor3 = Color3.fromRGB(20,20,20)
	Button.Text = text
	Button.TextColor3 = Color3.new(1,1,1)
	Button.TextSize = 16
	Button.Font = Enum.Font.GothamBold
	Button.Parent = TopBar

	Instance.new("UICorner",Button).CornerRadius =
		UDim.new(0,10)

	return Button
end

local Minimize = CreateTopButton("—",-92)
local Close = CreateTopButton("✕",-46)

--========================================================
-- LEFT PANEL
--========================================================

local LeftPanel = Instance.new("ScrollingFrame")
LeftPanel.Size = UDim2.new(0,240,1,-65)
LeftPanel.Position = UDim2.new(0,10,0,55)
LeftPanel.BackgroundTransparency = 1
LeftPanel.BorderSizePixel = 0
LeftPanel.ScrollBarThickness = 3
LeftPanel.AutomaticCanvasSize = Enum.AutomaticSize.Y
LeftPanel.CanvasSize = UDim2.new(0,0,0,0)
LeftPanel.Parent = Main

local LeftLayout = Instance.new("UIListLayout")
LeftLayout.Padding = UDim.new(0,10)
LeftLayout.Parent = LeftPanel

--========================================================
-- RIGHT PANEL
--========================================================

local RightPanel = Instance.new("Frame")
RightPanel.Size = UDim2.new(1,-260,1,-65)
RightPanel.Position = UDim2.new(0,250,0,55)
RightPanel.BackgroundTransparency = 1
RightPanel.Parent = Main

local RightLayout = Instance.new("UIListLayout")
RightLayout.Padding = UDim.new(0,10)
RightLayout.Parent = RightPanel

--========================================================
-- CATEGORY
--========================================================

local function CreateCategory(parent,title,color)

	local Holder = Instance.new("Frame")
	Holder.Size = UDim2.new(1,0,0,52)
	Holder.BackgroundColor3 = Color3.fromRGB(15,15,15)
	Holder.Parent = parent

	Instance.new("UICorner",Holder).CornerRadius =
		UDim.new(0,12)

	local Stroke = Instance.new("UIStroke")
	Stroke.Color = Color3.fromRGB(35,35,35)
	Stroke.Parent = Holder

	local Header = Instance.new("TextButton")
	Header.Size = UDim2.new(1,0,0,42)
	Header.BackgroundTransparency = 1
	Header.Text = "   "..title
	Header.TextColor3 = color
	Header.TextSize = 16
	Header.Font = Enum.Font.GothamBold
	Header.TextXAlignment = Enum.TextXAlignment.Left
	Header.Parent = Holder

	local Arrow = Instance.new("TextLabel")
	Arrow.Size = UDim2.new(0,25,0,25)
	Arrow.Position = UDim2.new(1,-32,0.5,-12)
	Arrow.BackgroundTransparency = 1
	Arrow.Text = "⌄"
	Arrow.TextColor3 = Color3.new(1,1,1)
	Arrow.TextSize = 16
	Arrow.Font = Enum.Font.GothamBold
	Arrow.Parent = Header

	local Container = Instance.new("Frame")
	Container.Size = UDim2.new(1,-10,0,0)
	Container.Position = UDim2.new(0,5,0,48)
	Container.BackgroundTransparency = 1
	Container.ClipsDescendants = true
	Container.Parent = Holder

	local Layout = Instance.new("UIListLayout")
	Layout.Padding = UDim.new(0,6)
	Layout.Parent = Container

	local Open = false

	local function Update()

		local Size = Layout.AbsoluteContentSize.Y

		TweenService:Create(
			Container,
			TweenInfo.new(0.2),
			{
				Size = Open
					and UDim2.new(1,-10,0,Size)
					or UDim2.new(1,-10,0,0)
			}
		):Play()

		TweenService:Create(
			Holder,
			TweenInfo.new(0.2),
			{
				Size = Open
					and UDim2.new(1,0,0,Size + 60)
					or UDim2.new(1,0,0,52)
			}
		):Play()

		Arrow.Text = Open and "⌃" or "⌄"
	end

	Header.MouseButton1Click:Connect(function()

		Open = not Open
		Update()
	end)

	return Container
end

--========================================================
-- TOGGLE
--========================================================

local function CreateToggle(parent,name,callback)

	local Enabled = false

	local Holder = Instance.new("Frame")
	Holder.Size = UDim2.new(1,0,0,38)
	Holder.BackgroundTransparency = 1
	Holder.Parent = parent

	local Label = Instance.new("TextLabel")
	Label.Size = UDim2.new(1,-70,1,0)
	Label.BackgroundTransparency = 1
	Label.Text = name
	Label.TextColor3 = Color3.new(1,1,1)
	Label.TextSize = 14
	Label.Font = Enum.Font.Gotham
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.Parent = Holder

	local Toggle = Instance.new("TextButton")
	Toggle.Size = UDim2.new(0,52,0,28)
	Toggle.Position = UDim2.new(1,-55,0.5,-14)
	Toggle.BackgroundColor3 = Color3.fromRGB(45,45,45)
	Toggle.Text = ""
	Toggle.Parent = Holder

	Instance.new("UICorner",Toggle).CornerRadius =
		UDim.new(1,0)

	local Circle = Instance.new("Frame")
	Circle.Size = UDim2.new(0,22,0,22)
	Circle.Position = UDim2.new(0,3,0.5,-11)
	Circle.BackgroundColor3 = Color3.new(1,1,1)
	Circle.Parent = Toggle

	Instance.new("UICorner",Circle).CornerRadius =
		UDim.new(1,0)

	Toggle.MouseButton1Click:Connect(function()

		Enabled = not Enabled

		TweenService:Create(
			Toggle,
			TweenInfo.new(0.2),
			{
				BackgroundColor3 =
					Enabled
					and Color3.fromRGB(0,255,140)
					or Color3.fromRGB(45,45,45)
			}
		):Play()

		TweenService:Create(
			Circle,
			TweenInfo.new(0.2),
			{
				Position =
					Enabled
					and UDim2.new(1,-25,0.5,-11)
					or UDim2.new(0,3,0.5,-11)
			}
		):Play()

		callback(Enabled)
	end)
end

--========================================================
-- BUTTON
--========================================================

local function CreateButton(parent,name,callback)

	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1,0,0,36)
	Button.BackgroundColor3 = Color3.fromRGB(22,22,22)
	Button.Text = name
	Button.TextColor3 = Color3.new(1,1,1)
	Button.TextSize = 13
	Button.Font = Enum.Font.GothamBold
	Button.Parent = parent

	Instance.new("UICorner",Button).CornerRadius =
		UDim.new(0,8)

	Button.MouseButton1Click:Connect(callback)

	return Button
end

--========================================================
-- MOVEMENT CATEGORY
--========================================================

local Movement =
	CreateCategory(
		LeftPanel,
		"MOVEMENT",
		Color3.fromRGB(0,255,140)
	)

CreateToggle(Movement,"Fly V3",function(v)
	Framework.State.Fly = v
end)

CreateToggle(Movement,"NoClip",function(v)
	Framework.State.Noclip = v
end)

--========================================================
-- SPEED CATEGORY
--========================================================

local Speed =
	CreateCategory(
		LeftPanel,
		"SPEED RUN",
		Color3.fromRGB(255,180,0)
	)

CreateButton(Speed,"NORMAL (16)",function()

	local Hum = Player.Character
		and Player.Character:FindFirstChildOfClass("Humanoid")

	if Hum then
		Hum.WalkSpeed = 16
	end
end)

CreateButton(Speed,"MEDIUM (48)",function()

	local Hum = Player.Character
		and Player.Character:FindFirstChildOfClass("Humanoid")

	if Hum then
		Hum.WalkSpeed = 48
	end
end)

CreateButton(Speed,"FAST (64)",function()

	local Hum = Player.Character
		and Player.Character:FindFirstChildOfClass("Humanoid")

	if Hum then
		Hum.WalkSpeed = 64
	end
end)

CreateButton(Speed,"SUPER FAST (128)",function()

	local Hum = Player.Character
		and Player.Character:FindFirstChildOfClass("Humanoid")

	if Hum then
		Hum.WalkSpeed = 128
	end
end)

--========================================================
-- VISUAL CATEGORY
--========================================================

local Visual =
	CreateCategory(
		LeftPanel,
		"VISUAL",
		Color3.fromRGB(0,180,255)
	)

CreateToggle(Visual,"ESP Line",function(v)
	Framework.State.ESPLine = v
end)

CreateToggle(Visual,"ESP Box",function(v)
	Framework.State.ESPBox = v
end)

CreateToggle(Visual,"ESP Distance",function(v)
	Framework.State.ESPDistance = v
end)

CreateToggle(Visual,"ESP Health",function(v)
	Framework.State.ESPHealth = v
end)

--========================================================
-- PLAYER CATEGORY
--========================================================

local PlayerCategory =
	CreateCategory(
		LeftPanel,
		"PLAYER",
		Color3.fromRGB(200,120,255)
	)

CreateToggle(PlayerCategory,"Immortal",function(v)

	Framework.State.Immortal = v
end)

--========================================================
-- INFO PANEL
--========================================================

local InfoPanel = Instance.new("Frame")
InfoPanel.Size = UDim2.new(1,0,0,110)
InfoPanel.BackgroundColor3 = Color3.fromRGB(15,15,15)
InfoPanel.Parent = RightPanel

Instance.new("UICorner",InfoPanel).CornerRadius =
	UDim.new(0,12)

local InfoStroke = Instance.new("UIStroke")
InfoStroke.Color = Color3.fromRGB(35,35,35)
InfoStroke.Parent = InfoPanel

local InfoTitle = Instance.new("TextLabel")
InfoTitle.Size = UDim2.new(1,0,0,40)
InfoTitle.Position = UDim2.new(0,12,0,0)
InfoTitle.BackgroundTransparency = 1
InfoTitle.Text = "ⓘ SYSTEM INFORMATION"
InfoTitle.TextColor3 = Color3.fromRGB(80,140,255)
InfoTitle.TextSize = 16
InfoTitle.Font = Enum.Font.GothamBold
InfoTitle.TextXAlignment = Enum.TextXAlignment.Left
InfoTitle.Parent = InfoPanel

local FPSLabel = Instance.new("TextLabel")
FPSLabel.Size = UDim2.new(0,120,0,50)
FPSLabel.Position = UDim2.new(0,15,0.5,-10)
FPSLabel.BackgroundTransparency = 1
FPSLabel.Text = "FPS : 60"
FPSLabel.TextColor3 = Color3.fromRGB(0,255,140)
FPSLabel.TextSize = 18
FPSLabel.Font = Enum.Font.GothamBold
FPSLabel.TextXAlignment = Enum.TextXAlignment.Left
FPSLabel.Parent = InfoPanel

--========================================================
-- UPDATE LOOP
--========================================================

RunService.RenderStepped:Connect(function()

	local Char = Player.Character

	if not Char then
		return
	end

	local Hum = Char:FindFirstChildOfClass("Humanoid")

	if not Hum then
		return
	end

	-- IMMORTAL

	if Framework.State.Immortal then

		if Hum.Health < Hum.MaxHealth then
			Hum.Health = Hum.MaxHealth
		end
	end

	-- NOCLIP

	if Framework.State.Noclip then

		for _,Part in ipairs(Char:GetChildren()) do

			if Part:IsA("BasePart") then
				Part.CanCollide = false
			end
		end
	end
end)

--========================================================
-- MINIMIZE
--========================================================

local Minimized = false

Minimize.MouseButton1Click:Connect(function()

	Minimized = not Minimized

	TweenService:Create(
		Main,
		TweenInfo.new(0.2),
		{
			Size =
				Minimized
				and UDim2.new(Main.Size.X.Scale,Main.Size.X.Offset,0,48)
				or (
					IsMobile
					and UDim2.new(0,720,0,420)
					or UDim2.new(0,1000,0,600)
				)
		}
	):Play()

	LeftPanel.Visible = not Minimized
	RightPanel.Visible = not Minimized
end)

--========================================================
-- CLOSE
--========================================================

Close.MouseButton1Click:Connect(function()

	GUI:Destroy()
end)

--========================================================
-- FLOAT BUTTON
--========================================================

FloatButton.MouseButton1Click:Connect(function()

	Framework.State.UIOpen =
		not Framework.State.UIOpen

	Main.Visible = Framework.State.UIOpen
end)

--========================================================
-- DRAG SYSTEM
--========================================================

do

	local Dragging = false
	local DragStart
	local StartPos

	local function Update(input)

		local Delta =
			input.Position - DragStart

		Main.Position = UDim2.new(
			StartPos.X.Scale,
			StartPos.X.Offset + Delta.X,
			StartPos.Y.Scale,
			StartPos.Y.Offset + Delta.Y
		)
	end

	TopBar.InputBegan:Connect(function(input)

		if input.UserInputType ==
			Enum.UserInputType.MouseButton1
			or
			input.UserInputType ==
			Enum.UserInputType.Touch
		then

			Dragging = true
			DragStart = input.Position
			StartPos = Main.Position

			input.Changed:Connect(function()

				if input.UserInputState ==
					Enum.UserInputState.End
				then

					Dragging = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)

		if Dragging and (
			input.UserInputType ==
			Enum.UserInputType.MouseMovement
			or
			input.UserInputType ==
			Enum.UserInputType.Touch
		) then

			Update(input)
		end
	end)
end

--========================================================
-- NOTIFICATION
--========================================================

pcall(function()

	StarterGui:SetCore("SendNotification",{

		Title = "Loaded",
		Text = "Veil Roblox Community Initialized",
		Duration = 5
	})

end)
