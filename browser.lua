local Player = game:GetService("Players").LocalPlayer
local TS, UIS, mouse = game:GetService("TweenService"), game:GetService("UserInputService"), Player:GetMouse()

local Loader = {}

function dragify(Frame)
	dragToggle = nil
	local dragSpeed = 0
	dragInput = nil
	dragStart = nil
	local dragPos = nil
	function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end

local ConfigBrowser = Instance.new("ScreenGui")
local Browser = Instance.new("Frame")
local MainCorner = Instance.new("UICorner")
local ConfigHolder = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local ConfigRound = Instance.new("UICorner")
local ConfigName = Instance.new("TextLabel")
local ConfigDesc = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local Search = Instance.new("Frame")
local SearchCorner = Instance.new("UICorner")
local SearchICON = Instance.new("ImageLabel")
local SearchBox = Instance.new("TextBox")

--Properties:

ConfigBrowser.Name = "ConfigBrowser"
ConfigBrowser.Parent = game.CoreGui
ConfigBrowser.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Browser.Name = "Browser"
Browser.Parent = ConfigBrowser
Browser.AnchorPoint = Vector2.new(0.5, 0.5)
Browser.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Browser.BorderColor3 = Color3.fromRGB(66, 109, 135)
Browser.BorderSizePixel = 0
Browser.Position = UDim2.new(0.855553806, 0, 0.5, 0)
Browser.Size = UDim2.new(0, 313, 0, 398)
dragify(Browser)

MainCorner.CornerRadius = UDim.new(0, 5)
MainCorner.Name = "MainCorner"
MainCorner.Parent = Browser

ConfigHolder.Name = "ConfigHolder"
ConfigHolder.Parent = Browser
ConfigHolder.Active = true
ConfigHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ConfigHolder.BackgroundTransparency = 1.000
ConfigHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
ConfigHolder.BorderSizePixel = 0
ConfigHolder.Position = UDim2.new(0.0191693287, 0, 0.153266326, 0)
ConfigHolder.Size = UDim2.new(0, 300, 0, 331)
ConfigHolder.ScrollBarThickness = 0

UIListLayout.Parent = ConfigHolder
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

TextLabel.Parent = Browser
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 313, 0, 31)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "Evolution Config Browser"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 16.000

Search.Name = "Search"
Search.Parent = Browser
Search.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Search.BorderColor3 = Color3.fromRGB(0, 0, 0)
Search.BorderSizePixel = 0
Search.Position = UDim2.new(0.0191693287, 0, 0.0778894499, 0)
Search.Size = UDim2.new(0.95846647, 0, -0.0171679966, 30)

SearchCorner.CornerRadius = UDim.new(0, 5)
SearchCorner.Name = "SearchCorner"
SearchCorner.Parent = Search

SearchICON.Name = "SearchICON"
SearchICON.Parent = Search
SearchICON.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SearchICON.BackgroundTransparency = 1.000
SearchICON.BorderColor3 = Color3.fromRGB(0, 0, 0)
SearchICON.BorderSizePixel = 0
SearchICON.Position = UDim2.new(0.0266666673, 0, 0.172658369, 0)
SearchICON.Size = UDim2.new(0, 14, 0, 14)
SearchICON.Image = "rbxassetid://10734943674"

SearchBox.Name = "SearchBox"
SearchBox.Parent = Search
SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.BackgroundTransparency = 1.000
SearchBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
SearchBox.BorderSizePixel = 0
SearchBox.Position = UDim2.new(0.0966666639, 0, 0, 0)
SearchBox.Size = UDim2.new(0, 271, 0, 23)
SearchBox.Font = Enum.Font.Gotham
SearchBox.PlaceholderText = "Search Here..."
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.TextSize = 12.000
SearchBox.TextXAlignment = Enum.TextXAlignment.Left

function Loader:Create(info)
	local name = info.Name
	local author = info.Creator
	local desc = info.Description
	local callback = info.Callback 
	
	local Template = Instance.new("Frame")
	Template.Name = name
	Template.Parent = ConfigHolder
	Template.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Template.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Template.BorderSizePixel = 0
	Template.Size = UDim2.new(0, 300,0, 45)

	ConfigRound.CornerRadius = UDim.new(0, 5)
	ConfigRound.Name = "ConfigRound"
	ConfigRound.Parent = Template

	ConfigName.Name = "ConfigName"
	ConfigName.Parent = Template
	ConfigName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ConfigName.BackgroundTransparency = 1.000
	ConfigName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ConfigName.BorderSizePixel = 0
	ConfigName.Position = UDim2.new(0.0266666673, 0, 0, 0)
	ConfigName.Size = UDim2.new(0, 247, 0, 21)
	ConfigName.Font = Enum.Font.GothamBold
	ConfigName.Text = name.." | "..author
	ConfigName.TextColor3 = Color3.fromRGB(255, 255, 255)
	ConfigName.TextSize = 14.000
	ConfigName.TextXAlignment = Enum.TextXAlignment.Left

	ConfigDesc.Name = "ConfigDesc"
	ConfigDesc.Parent = Template
	ConfigDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ConfigDesc.BackgroundTransparency = 1.000
	ConfigDesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ConfigDesc.BorderSizePixel = 0
	ConfigDesc.Position = UDim2.new(0.0266666673, 0, 0.522414744, 0)
	ConfigDesc.Size = UDim2.new(0, 292, 0, 21)
	ConfigDesc.Font = Enum.Font.Gotham
	ConfigDesc.Text = desc
	ConfigDesc.TextColor3 = Color3.fromRGB(145, 145, 145)
	ConfigDesc.TextSize = 14.000
	ConfigDesc.TextXAlignment = Enum.TextXAlignment.Left

	TextButton.Parent = Template
	TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.BackgroundTransparency = 1.000
	TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.BorderSizePixel = 0
	TextButton.Size = UDim2.new(1, 0, 1, 0)
	TextButton.Font = Enum.Font.SourceSans
	TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.TextSize = 14.000
	TextButton.TextTransparency = 1.000
	
	TextButton.MouseButton1Click:Connect(function()
		task.spawn(callback)
	end)
end

function Loader:ToggleBrowser(Value)
	ConfigBrowser.Enabled = Value
end

SearchBox.Changed:Connect(function()
	local search = string.lower(SearchBox.Text)
	for i, v in	 pairs(ConfigHolder:GetChildren()) do
		if v:IsA("Frame") then
			if search ~= "" then
				local item = string.lower(v.Name)
				if string.find(item, search) then
					v.Visible = true
				else
					v.Visible = false
				end
			else
				v.Visible = true
			end
		end
	end
end)


return Loader
