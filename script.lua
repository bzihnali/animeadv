getgenv().hidename = true

---### Loading Section ###---
task.wait(2)
repeat task.wait() until game:IsLoaded()
if game.PlaceId == 8304191830 then
    repeat task.wait() until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
    repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("collection"):FindFirstChild("grid"):FindFirstChild("List"):FindFirstChild("Outer"):FindFirstChild("UnitFrames")
else
    repeat task.wait() until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
    game:GetService("ReplicatedStorage").endpoints.client_to_server.vote_start:InvokeServer()
    repeat task.wait() until game:GetService("Workspace")["_waves_started"].Value == true
end
	
---### Loading Section End ###---

--[[

Rayfield Interface Suite
by Sirius

shlex | Designing + Programming
iRay  | Programming

]]

-- DO NOT MODIFY UNLESS YOU KNOW WHAT YOU ARE DOING - Defrag

local Release = "Beta 7R"
local NotificationDuration = 6.5
local RayfieldFolder = "Rayfield"
local ConfigurationFolder = RayfieldFolder.."/Configurations"
local ConfigurationExtension = ".rfld"

local RayfieldLibrary = {
	Flags = {},
	Theme = {
		Default = {
			TextFont = "Default", -- Default will use the various font faces used across Rayfield
			TextColor = Color3.fromRGB(240, 240, 240),
			
			Background = Color3.fromRGB(25, 25, 25),
			Topbar = Color3.fromRGB(34, 34, 34),
			Shadow = Color3.fromRGB(20, 20, 20),
			
			NotificationBackground = Color3.fromRGB(20, 20, 20),
			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
			
			TabBackground = Color3.fromRGB(80, 80, 80),
			TabStroke = Color3.fromRGB(85, 85, 85),
			TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(50, 50, 50),
			
			ElementBackground = Color3.fromRGB(35, 35, 35),
			ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
			SecondaryElementBackground = Color3.fromRGB(25, 25, 25), -- For labels and paragraphs
			ElementStroke = Color3.fromRGB(50, 50, 50),
			SecondaryElementStroke = Color3.fromRGB(40, 40, 40), -- For labels and paragraphs
			
			SliderBackground = Color3.fromRGB(43, 105, 159),
			SliderProgress = Color3.fromRGB(43, 105, 159),
			SliderStroke = Color3.fromRGB(48, 119, 177),
			
			ToggleBackground = Color3.fromRGB(30, 30, 30),
			ToggleEnabled = Color3.fromRGB(0, 146, 214),
			ToggleDisabled = Color3.fromRGB(100, 100, 100),
			ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
			ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
			ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
			ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),
			
			InputBackground = Color3.fromRGB(30, 30, 30),
			InputStroke = Color3.fromRGB(65, 65, 65),
			PlaceholderColor = Color3.fromRGB(178, 178, 178)
		},
		Light = {
			TextFont = "Gotham", -- Default will use the various font faces used across Rayfield
			TextColor = Color3.fromRGB(50, 50, 50), -- i need to make all text 240, 240, 240 and base gray on transparency not color to do this
			
			Background = Color3.fromRGB(255, 255, 255),
			Topbar = Color3.fromRGB(217, 217, 217),
			Shadow = Color3.fromRGB(223, 223, 223),

			NotificationBackground = Color3.fromRGB(20, 20, 20),
			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),

			TabBackground = Color3.fromRGB(220, 220, 220),
			TabStroke = Color3.fromRGB(112, 112, 112),
			TabBackgroundSelected = Color3.fromRGB(0, 142, 208),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(50, 50, 50),
		
			ElementBackground = Color3.fromRGB(198, 198, 198),
			ElementBackgroundHover = Color3.fromRGB(230, 230, 230),
			SecondaryElementBackground = Color3.fromRGB(136, 136, 136), -- For labels and paragraphs
			ElementStroke = Color3.fromRGB(180, 199, 97),
			SecondaryElementStroke = Color3.fromRGB(40, 40, 40), -- For labels and paragraphs

			SliderBackground = Color3.fromRGB(31, 159, 71),
			SliderProgress = Color3.fromRGB(31, 159, 71),
			SliderStroke = Color3.fromRGB(42, 216, 94),

			ToggleBackground = Color3.fromRGB(170, 203, 60),
			ToggleEnabled = Color3.fromRGB(32, 214, 29),
			ToggleDisabled = Color3.fromRGB(100, 22, 23),
			ToggleEnabledStroke = Color3.fromRGB(17, 255, 0),
			ToggleDisabledStroke = Color3.fromRGB(65, 8, 8),
			ToggleEnabledOuterStroke = Color3.fromRGB(0, 170, 0),
			ToggleDisabledOuterStroke = Color3.fromRGB(170, 0, 0),

			InputBackground = Color3.fromRGB(31, 159, 71),
			InputStroke = Color3.fromRGB(19, 65, 31),
			PlaceholderColor = Color3.fromRGB(178, 178, 178)
		}
	}
}

-- Services
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

-- Interface Management
local Rayfield = game:GetObjects("rbxassetid://10804731440")[1]

if gethui then
	Rayfield.Parent = gethui()
elseif syn.protect_gui then 
	syn.protect_gui(Rayfield)
	Rayfield.Parent = CoreGui
elseif CoreGui:FindFirstChild("RobloxGui") then
	Rayfield.Parent = CoreGui:FindFirstChild("RobloxGui")
else
	Rayfield.Parent = CoreGui
end

if gethui then
	for _, Interface in ipairs(gethui():GetChildren()) do
		if Interface.Name == Rayfield.Name and Interface ~= Rayfield then
			Interface.Enabled = false
			Interface.Name = "Rayfield-Old"
		end
	end
else
	for _, Interface in ipairs(CoreGui:GetChildren()) do
		if Interface.Name == Rayfield.Name and Interface ~= Rayfield then
			Interface.Enabled = false
			Interface.Name = "Rayfield-Old"
		end
	end
end

-- Object Variables

local Camera = workspace.CurrentCamera
local Main = Rayfield.Main
local Topbar = Main.Topbar
local Elements = Main.Elements
local LoadingFrame = Main.LoadingFrame
local TabList = Main.TabList

Rayfield.DisplayOrder = 100
LoadingFrame.Version.Text = Release


-- Variables

local request = (syn and syn.request) or (http and http.request) or http_request
local CFileName = nil
local CEnabled = false
local Minimised = false
local Hidden = false
local Debounce = false
local Notifications = Rayfield.Notifications

local SelectedTheme = RayfieldLibrary.Theme.Default

function ChangeTheme(ThemeName)
	SelectedTheme = RayfieldLibrary.Theme[ThemeName]
	for _, obj in ipairs(Rayfield:GetDescendants()) do
		if obj.ClassName == "TextLabel" or obj.ClassName == "TextBox" or obj.ClassName == "TextButton" then
			if SelectedTheme.TextFont ~= "Default" then 
				obj.TextColor3 = SelectedTheme.TextColor
				obj.Font = SelectedTheme.TextFont
			end
		end
	end
	
	Rayfield.Main.BackgroundColor3 = SelectedTheme.Background
	Rayfield.Main.Topbar.BackgroundColor3 = SelectedTheme.Topbar
	Rayfield.Main.Topbar.CornerRepair.BackgroundColor3 = SelectedTheme.Topbar
	Rayfield.Main.Shadow.Image.ImageColor3 = SelectedTheme.Shadow
	
	Rayfield.Main.Topbar.ChangeSize.ImageColor3 = SelectedTheme.TextColor
	Rayfield.Main.Topbar.Hide.ImageColor3 = SelectedTheme.TextColor
	Rayfield.Main.Topbar.Theme.ImageColor3 = SelectedTheme.TextColor
	
	for _, TabPage in ipairs(Elements:GetChildren()) do
		for _, Element in ipairs(TabPage:GetChildren()) do
			if Element.ClassName == "Frame" and Element.Name ~= "Placeholder" and Element.Name ~= "SectionSpacing" and Element.Name ~= "SectionTitle"  then
				Element.BackgroundColor3 = SelectedTheme.ElementBackground
				Element.UIStroke.Color = SelectedTheme.ElementStroke
			end
		end
	end
	
end

local function AddDraggingFunctionality(DragPoint, Main)
	pcall(function()
		local Dragging, DragInput, MousePos, FramePos = false
		DragPoint.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Dragging = true
				MousePos = Input.Position
				FramePos = Main.Position

				Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)
		DragPoint.InputChanged:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseMovement then
				DragInput = Input
			end
		end)
		UserInputService.InputChanged:Connect(function(Input)
			if Input == DragInput and Dragging then
				local Delta = Input.Position - MousePos
				TweenService:Create(Main, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position  = UDim2.new(FramePos.X.Scale,FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)}):Play()
			end
		end)
	end)
end   

local function PackColor(Color)
	return {R = Color.R * 255, G = Color.G * 255, B = Color.B * 255}
end    

local function UnpackColor(Color)
	return Color3.fromRGB(Color.R, Color.G, Color.B)
end

local function LoadConfiguration(Configuration)
	local Data = HttpService:JSONDecode(Configuration)
	table.foreach(Data, function(FlagName, FlagValue)
		if RayfieldLibrary.Flags[FlagName] then
			spawn(function() 
				if RayfieldLibrary.Flags[FlagName].Type == "ColorPicker" then
					RayfieldLibrary.Flags[FlagName]:Set(UnpackColor(FlagValue))
				else
					if RayfieldLibrary.Flags[FlagName].CurrentValue or RayfieldLibrary.Flags[FlagName].CurrentKeybind or RayfieldLibrary.Flags[FlagName].CurrentOption or RayfieldLibrary.Flags[FlagName].Color ~= FlagValue then RayfieldLibrary.Flags[FlagName]:Set(FlagValue) end
				end    
			end)
		else
			RayfieldLibrary:Notify({Title = "Flag Error", Content = "Rayfield was unable to find '"..FlagName.. "'' in the current script"})
		end
	end)
end

local function SaveConfiguration()
	if not CEnabled then return end
	local Data = {}
	for i,v in pairs(RayfieldLibrary.Flags) do
		if v.Type == "ColorPicker" then
			Data[i] = PackColor(v.Color)
		else
			Data[i] = v.CurrentValue or v.CurrentKeybind or v.CurrentOption or v.Color
		end
	end	
	writefile(ConfigurationFolder .. "\\" .. CFileName .. ConfigurationExtension, tostring(HttpService:JSONEncode(Data)))
end

local neon = (function() -- Open sourced neon module
	local module = {}

	do
		local function IsNotNaN(x)
			return x == x
		end
		local continued = IsNotNaN(Camera:ScreenPointToRay(0,0).Origin.x)
		while not continued do
			RunService.RenderStepped:wait()
			continued = IsNotNaN(Camera:ScreenPointToRay(0,0).Origin.x)
		end
	end
	local RootParent = Camera
	if getgenv().SecureMode == nil then
		RootParent = Camera
	else
		if not getgenv().SecureMode then
			RootParent = Camera
		else 
			RootParent = nil
		end
	end


	local binds = {}
	local root = Instance.new('Folder', RootParent)
	root.Name = 'neon'


	local GenUid; do
		local id = 0
		function GenUid()
			id = id + 1
			return 'neon::'..tostring(id)
		end
	end

	local DrawQuad; do
		local acos, max, pi, sqrt = math.acos, math.max, math.pi, math.sqrt
		local sz = 0.2

		function DrawTriangle(v1, v2, v3, p0, p1)
			local s1 = (v1 - v2).magnitude
			local s2 = (v2 - v3).magnitude
			local s3 = (v3 - v1).magnitude
			local smax = max(s1, s2, s3)
			local A, B, C
			if s1 == smax then
				A, B, C = v1, v2, v3
			elseif s2 == smax then
				A, B, C = v2, v3, v1
			elseif s3 == smax then
				A, B, C = v3, v1, v2
			end

			local para = ( (B-A).x*(C-A).x + (B-A).y*(C-A).y + (B-A).z*(C-A).z ) / (A-B).magnitude
			local perp = sqrt((C-A).magnitude^2 - para*para)
			local dif_para = (A - B).magnitude - para

			local st = CFrame.new(B, A)
			local za = CFrame.Angles(pi/2,0,0)

			local cf0 = st

			local Top_Look = (cf0 * za).lookVector
			local Mid_Point = A + CFrame.new(A, B).LookVector * para
			local Needed_Look = CFrame.new(Mid_Point, C).LookVector
			local dot = Top_Look.x*Needed_Look.x + Top_Look.y*Needed_Look.y + Top_Look.z*Needed_Look.z

			local ac = CFrame.Angles(0, 0, acos(dot))

			cf0 = cf0 * ac
			if ((cf0 * za).lookVector - Needed_Look).magnitude > 0.01 then
				cf0 = cf0 * CFrame.Angles(0, 0, -2*acos(dot))
			end
			cf0 = cf0 * CFrame.new(0, perp/2, -(dif_para + para/2))

			local cf1 = st * ac * CFrame.Angles(0, pi, 0)
			if ((cf1 * za).lookVector - Needed_Look).magnitude > 0.01 then
				cf1 = cf1 * CFrame.Angles(0, 0, 2*acos(dot))
			end
			cf1 = cf1 * CFrame.new(0, perp/2, dif_para/2)

			if not p0 then
				p0 = Instance.new('Part')
				p0.FormFactor = 'Custom'
				p0.TopSurface = 0
				p0.BottomSurface = 0
				p0.Anchored = true
				p0.CanCollide = false
				p0.Material = 'Glass'
				p0.Size = Vector3.new(sz, sz, sz)
				local mesh = Instance.new('SpecialMesh', p0)
				mesh.MeshType = 2
				mesh.Name = 'WedgeMesh'
			end
			p0.WedgeMesh.Scale = Vector3.new(0, perp/sz, para/sz)
			p0.CFrame = cf0

			if not p1 then
				p1 = p0:clone()
			end
			p1.WedgeMesh.Scale = Vector3.new(0, perp/sz, dif_para/sz)
			p1.CFrame = cf1

			return p0, p1
		end

		function DrawQuad(v1, v2, v3, v4, parts)
			parts[1], parts[2] = DrawTriangle(v1, v2, v3, parts[1], parts[2])
			parts[3], parts[4] = DrawTriangle(v3, v2, v4, parts[3], parts[4])
		end
	end

	function module:BindFrame(frame, properties)
		if RootParent == nil then return end
		if binds[frame] then
			return binds[frame].parts
		end

		local uid = GenUid()
		local parts = {}
		local f = Instance.new('Folder', root)
		f.Name = frame.Name

		local parents = {}
		do
			local function add(child)
				if child:IsA'GuiObject' then
					parents[#parents + 1] = child
					add(child.Parent)
				end
			end
			add(frame)
		end

		local function UpdateOrientation(fetchProps)
			local zIndex = 1 - 0.05*frame.ZIndex
			local tl, br = frame.AbsolutePosition, frame.AbsolutePosition + frame.AbsoluteSize
			local tr, bl = Vector2.new(br.x, tl.y), Vector2.new(tl.x, br.y)
			do
				local rot = 0;
				for _, v in ipairs(parents) do
					rot = rot + v.Rotation
				end
				if rot ~= 0 and rot%180 ~= 0 then
					local mid = tl:lerp(br, 0.5)
					local s, c = math.sin(math.rad(rot)), math.cos(math.rad(rot))
					local vec = tl
					tl = Vector2.new(c*(tl.x - mid.x) - s*(tl.y - mid.y), s*(tl.x - mid.x) + c*(tl.y - mid.y)) + mid
					tr = Vector2.new(c*(tr.x - mid.x) - s*(tr.y - mid.y), s*(tr.x - mid.x) + c*(tr.y - mid.y)) + mid
					bl = Vector2.new(c*(bl.x - mid.x) - s*(bl.y - mid.y), s*(bl.x - mid.x) + c*(bl.y - mid.y)) + mid
					br = Vector2.new(c*(br.x - mid.x) - s*(br.y - mid.y), s*(br.x - mid.x) + c*(br.y - mid.y)) + mid
				end
			end
			DrawQuad(
				Camera:ScreenPointToRay(tl.x, tl.y, zIndex).Origin, 
				Camera:ScreenPointToRay(tr.x, tr.y, zIndex).Origin, 
				Camera:ScreenPointToRay(bl.x, bl.y, zIndex).Origin, 
				Camera:ScreenPointToRay(br.x, br.y, zIndex).Origin, 
				parts
			)
			if fetchProps then
				for _, pt in pairs(parts) do
					pt.Parent = f
				end
				for propName, propValue in pairs(properties) do
					for _, pt in pairs(parts) do
						pt[propName] = propValue
					end
				end
			end
		end

		UpdateOrientation(true)
		RunService:BindToRenderStep(uid, 2000, UpdateOrientation)

		binds[frame] = {
			uid = uid;
			parts = parts;
		}
		return binds[frame].parts
	end

	function module:Modify(frame, properties)
		local parts = module:GetBoundParts(frame)
		if parts then
			for propName, propValue in pairs(properties) do
				for _, pt in pairs(parts) do
					pt[propName] = propValue
				end
			end
		end
	end

	function module:UnbindFrame(frame)
		if RootParent == nil then return end
		local cb = binds[frame]
		if cb then
			RunService:UnbindFromRenderStep(cb.uid)
			for _, v in pairs(cb.parts) do
				v:Destroy()
			end
			binds[frame] = nil
		end
	end

	function module:HasBinding(frame)
		return binds[frame] ~= nil
	end

	function module:GetBoundParts(frame)
		return binds[frame] and binds[frame].parts
	end


	return module

end)()

function RayfieldLibrary:Notify(NotificationSettings)
	spawn(function()
		local ActionCompleted = true
		local Notification = Notifications.Template:Clone()
		Notification.Parent = Notifications
		Notification.Name = NotificationSettings.Title or "Unknown Title"
		Notification.Visible = true

		local blurlight = nil
		if not getgenv().SecureMode then
			blurlight = Instance.new("DepthOfFieldEffect",game:GetService("Lighting"))
			blurlight.Enabled = true
			blurlight.FarIntensity = 0
			blurlight.FocusDistance = 51.6
			blurlight.InFocusRadius = 50
			blurlight.NearIntensity = 1
			game:GetService("Debris"):AddItem(script,0)
		end
		
		Notification.Actions.Template.Visible = false
		
		if NotificationSettings.Actions then
			for _, Action in pairs(NotificationSettings.Actions) do
				ActionCompleted = false
				local NewAction = Notification.Actions.Template:Clone()
				NewAction.BackgroundColor3 = SelectedTheme.NotificationActionsBackground
				if SelectedTheme ~= RayfieldLibrary.Theme.Default then
					NewAction.TextColor3 = SelectedTheme.TextColor
				end
				NewAction.Name = Action.Name
				NewAction.Visible = true
				NewAction.Parent = Notification.Actions
				NewAction.Text = Action.Name
				NewAction.BackgroundTransparency = 1
				NewAction.TextTransparency = 1
				NewAction.Size = UDim2.new(0, NewAction.TextBounds.X + 27, 0, 36)
				
				NewAction.MouseButton1Click:Connect(function()
					local Success, Response = pcall(Action.Callback)
					if not Success then
						print("Rayfield | Action: "..Action.Name.." Callback Error " ..tostring(Response))
					end
					ActionCompleted = true
				end)
			end
		end
		Notification.BackgroundColor3 = SelectedTheme.Background
		Notification.Title.Text = NotificationSettings.Title or "Unknown"
		Notification.Title.TextTransparency = 1
		Notification.Title.TextColor3 = SelectedTheme.TextColor
		Notification.Description.Text = NotificationSettings.Content or "Unknown"
		Notification.Description.TextTransparency = 1
		Notification.Description.TextColor3 = SelectedTheme.TextColor
		Notification.Icon.ImageColor3 = SelectedTheme.TextColor
		if NotificationSettings.Image then
			Notification.Icon.Image = "rbxassetid://"..tostring(NotificationSettings.Image) 
		else
			Notification.Icon.Image = "rbxassetid://3944680095"
		end

		Notification.Icon.ImageTransparency = 1

		Notification.Parent = Notifications
		Notification.Size = UDim2.new(0, 260, 0, 80)
		Notification.BackgroundTransparency = 1
		
		TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 295, 0, 91)}):Play()
		TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.1}):Play()
		Notification:TweenPosition(UDim2.new(0.5,0,0.915,0),'Out','Quint',0.8,true)

		wait(0.3)
		TweenService:Create(Notification.Icon, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
		TweenService:Create(Notification.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
		TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
		wait(0.2)



		-- Requires Graphics Level 8-10
		if getgenv().SecureMode == nil then
			TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.4}):Play()
		else
			if not getgenv().SecureMode then
				TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.4}):Play()
			else 
				TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			end
		end

		if Rayfield.Name == "Rayfield" then
			neon:BindFrame(Notification.BlurModule, {
				Transparency = 0.98;
				BrickColor = BrickColor.new("Institutional white");
			})
		end
		
		if not NotificationSettings.Actions then
			wait(NotificationSettings.Duration or NotificationDuration - 0.5)
		else
			wait(0.8)
			TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 295, 0, 132)}):Play()
			wait(0.3)
			for _, Action in ipairs(Notification.Actions:GetChildren()) do
				if Action.ClassName == "TextButton" and Action.Name ~= "Template" then
					TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.2}):Play()
					TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
					wait(0.05)
				end
			end
		end
		
		repeat wait(0.001) until ActionCompleted

		for _, Action in ipairs(Notification.Actions:GetChildren()) do
			if Action.ClassName == "TextButton" and Action.Name ~= "Template" then
				TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			end
		end

		TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0.47, 0,0.234, 0)}):Play()
		TweenService:Create(Notification.Description, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {Position = UDim2.new(0.528, 0,0.637, 0)}):Play()
		TweenService:Create(Notification, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 280, 0, 83)}):Play()
		TweenService:Create(Notification.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
		TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.6}):Play()

		wait(0.3)
		TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.4}):Play()
		TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.5}):Play()
		wait(0.4)
		TweenService:Create(Notification, TweenInfo.new(0.9, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 260, 0, 0)}):Play()
		TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
		TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
		TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
		wait(0.2)
		if not getgenv().SecureMode then
			neon:UnbindFrame(Notification.BlurModule)
			blurlight:Destroy()
		end
		wait(0.9)
		Notification:Destroy()
	end)
end

function Hide()
	Debounce = true
	RayfieldLibrary:Notify({Title = "Interface Hidden", Content = "The interface has been hidden, you can unhide the interface by tapping RightShift", Duration = 7})
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 470, 0, 400)}):Play()
	TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 470, 0, 45)}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main.Topbar.CornerRepair, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	for _, TopbarButton in ipairs(Topbar:GetChildren()) do
		if TopbarButton.ClassName == "ImageButton" then
			TweenService:Create(TopbarButton, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
		end
	end
	for _, tabbtn in ipairs(TabList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
			TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
			TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
			TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
		end
	end
	for _, tab in ipairs(Elements:GetChildren()) do
		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
			for _, element in ipairs(tab:GetChildren()) do
				if element.ClassName == "Frame" then
					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
						if element.Name == "SectionTitle" then
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						else
							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
							TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						end
						for _, child in ipairs(element:GetChildren()) do
							if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
								child.Visible = false
							end
						end
					end
				end
			end
		end
	end
	wait(0.5)
	Main.Visible = false
	Debounce = false
end

function Unhide()
	Debounce = true
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Visible = true
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 475)}):Play()
	TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 45)}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main.Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	if Minimised then
		spawn(Maximise)
	end
	for _, TopbarButton in ipairs(Topbar:GetChildren()) do
		if TopbarButton.ClassName == "ImageButton" then
			TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
		end
	end
	for _, tabbtn in ipairs(TabList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			if tostring(Elements.UIPageLayout.CurrentPage) == tabbtn.Title.Text then
				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
				TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()
				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
			else
				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.2}):Play()
				TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()
				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			end
			
		end
	end
	for _, tab in ipairs(Elements:GetChildren()) do
		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
			for _, element in ipairs(tab:GetChildren()) do
				if element.ClassName == "Frame" then
					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
						if element.Name == "SectionTitle" then
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						else
							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
							TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						end
						for _, child in ipairs(element:GetChildren()) do
							if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
								child.Visible = true
							end
						end
					end
				end
			end
		end
	end
	wait(0.5)
	Minimised = false
	Debounce = false
end

function Maximise()
	Debounce = true
	Topbar.ChangeSize.Image = "rbxassetid://"..10137941941


	TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()
	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 475)}):Play()
	TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 45)}):Play()
	TabList.Visible = true
	wait(0.2)

	Elements.Visible = true

	for _, tab in ipairs(Elements:GetChildren()) do
		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
			for _, element in ipairs(tab:GetChildren()) do
				if element.ClassName == "Frame" then
					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
						if element.Name == "SectionTitle" then
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						else
							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
							TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						end
						for _, child in ipairs(element:GetChildren()) do
							if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
								child.Visible = true
							end
						end
					end
				end
			end
		end
	end


	wait(0.1)

	for _, tabbtn in ipairs(TabList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			if tostring(Elements.UIPageLayout.CurrentPage) == tabbtn.Title.Text then
				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()
			else
				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
				TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()
				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.2}):Play()
				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			end
			
		end
	end


	wait(0.5)
	Debounce = false
end

function Minimise()
	Debounce = true
	Topbar.ChangeSize.Image = "rbxassetid://"..11036884234

	for _, tabbtn in ipairs(TabList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
			TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
			TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
			TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
		end
	end

	for _, tab in ipairs(Elements:GetChildren()) do
		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
			for _, element in ipairs(tab:GetChildren()) do
				if element.ClassName == "Frame" then
					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
						if element.Name == "SectionTitle" then
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						else
							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
							TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						end
						for _, child in ipairs(element:GetChildren()) do
							if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
								child.Visible = false
							end
						end
					end
				end
			end
		end
	end

	TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 495, 0, 45)}):Play()
	TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 495, 0, 45)}):Play()

	wait(0.3)

	Elements.Visible = false
	TabList.Visible = false

	wait(0.2)
	Debounce = false
end

function RayfieldLibrary:CreateWindow(Settings)
	local Passthrough = false
	Topbar.Title.Text = Settings.Name
	Main.Size = UDim2.new(0, 450, 0, 260)
	Main.Visible = true
	Main.BackgroundTransparency = 1
	LoadingFrame.Title.TextTransparency = 1
	LoadingFrame.Subtitle.TextTransparency = 1
	Main.Shadow.Image.ImageTransparency = 1
	LoadingFrame.Version.TextTransparency = 1
	LoadingFrame.Title.Text = Settings.LoadingTitle or "Rayfield Interface Suite"
	LoadingFrame.Subtitle.Text = Settings.LoadingSubtitle or "by Sirius"
	if Settings.LoadingTitle ~= "Rayfield Interface Suite" then
		LoadingFrame.Version.Text = "Rayfield UI"
	end
	Topbar.Visible = false
	Elements.Visible = false
	LoadingFrame.Visible = true
	
	
	pcall(function()
		if not Settings.ConfigurationSaving.FileName then
			Settings.ConfigurationSaving.FileName = tostring(game.PlaceId)
		end
		if not isfolder(RayfieldFolder.."/".."Configuration Folders") then
			
		end
		if Settings.ConfigurationSaving.Enabled == nil then
			Settings.ConfigurationSaving.Enabled = false
		end
		CFileName = Settings.ConfigurationSaving.FileName
		ConfigurationFolder = Settings.ConfigurationSaving.FolderName or ConfigurationFolder
		CEnabled = Settings.ConfigurationSaving.Enabled

		if Settings.ConfigurationSaving.Enabled then
			if not isfolder(ConfigurationFolder) then
				makefolder(ConfigurationFolder)
			end	
		end
	end)

	AddDraggingFunctionality(Topbar,Main)

	for _, TabButton in ipairs(TabList:GetChildren()) do
		if TabButton.ClassName == "Frame" and TabButton.Name ~= "Placeholder" then
			TabButton.BackgroundTransparency = 1
			TabButton.Title.TextTransparency = 1
			TabButton.Shadow.ImageTransparency = 1
			TabButton.Image.ImageTransparency = 1
			TabButton.UIStroke.Transparency = 1
		end
	end
	
	if Settings.Discord then
		if not isfolder(RayfieldFolder.."/Discord Invites") then
			makefolder(RayfieldFolder.."/Discord Invites")
		end
		if not isfile(RayfieldFolder.."/Discord Invites".."/"..Settings.Discord.Invite..ConfigurationExtension) then
			if request then
				request({
					Url = 'http://127.0.0.1:6463/rpc?v=1',
					Method = 'POST',
					Headers = {
						['Content-Type'] = 'application/json',
						Origin = 'https://discord.com'
					},
					Body = HttpService:JSONEncode({
						cmd = 'INVITE_BROWSER',
						nonce = HttpService:GenerateGUID(false),
						args = {code = Settings.Discord.Invite}
					})
				})
			end
			
			if Settings.Discord.RememberJoins then -- We do logic this way so if the developer changes this setting, the user still won't be prompted, only new users
				writefile(RayfieldFolder.."/Discord Invites".."/"..Settings.Discord.Invite..ConfigurationExtension,"Rayfield RememberJoins is true for this invite, this invite will not ask you to join again")
			end
		else
			
		end
	end

	if Settings.KeySystem then
		if not Settings.KeySettings then
			Passthrough = true
			return
		end
		
		if not isfolder(RayfieldFolder.."/Key System") then
			makefolder(RayfieldFolder.."/Key System")
		end
		
		if Settings.KeySettings.GrabKeyFromSite then
			local Success, Response = pcall(function()
				Settings.KeySettings.Key = game:HttpGet(Settings.KeySettings.Key)
			end)
			if not Success then
				print("Rayfield | "..Settings.KeySettings.Key.." Error " ..tostring(Response))
			end
		end
		
		if not Settings.KeySettings.FileName then
			Settings.KeySettings.FileName = "No file name specified"
		end

		if isfile(RayfieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension) then
			if readfile(RayfieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension) == Settings.KeySettings.Key then
				Passthrough = true
			end
		end
		
		if not Passthrough then
			local AttemptsRemaining = math.random(2,6)
			Rayfield.Enabled = false
			local KeyUI = game:GetObjects("rbxassetid://11380036235")[1]

			if gethui then
				KeyUI.Parent = gethui()
			elseif syn.protect_gui then
				syn.protect_gui(Rayfield)
				KeyUI.Parent = CoreGui
			else
				KeyUI.Parent = CoreGui
			end

			if gethui then
				for _, Interface in ipairs(gethui():GetChildren()) do
					if Interface.Name == KeyUI.Name and Interface ~= KeyUI then
						Interface.Enabled = false
						Interface.Name = "KeyUI-Old"
					end
				end
			else
				for _, Interface in ipairs(CoreGui:GetChildren()) do
					if Interface.Name == KeyUI.Name and Interface ~= KeyUI then
						Interface.Enabled = false
						Interface.Name = "KeyUI-Old"
					end
				end
			end

			local KeyMain = KeyUI.Main
			KeyMain.Title.Text = Settings.KeySettings.Title or Settings.Name
			KeyMain.Subtitle.Text = Settings.KeySettings.Subtitle or "Key System"
			KeyMain.NoteMessage.Text = Settings.KeySettings.Note or "No instructions"

			KeyMain.Size = UDim2.new(0, 467, 0, 175)
			KeyMain.BackgroundTransparency = 1
			KeyMain.Shadow.Image.ImageTransparency = 1
			KeyMain.Title.TextTransparency = 1
			KeyMain.Subtitle.TextTransparency = 1
			KeyMain.KeyNote.TextTransparency = 1
			KeyMain.Input.BackgroundTransparency = 1
			KeyMain.Input.UIStroke.Transparency = 1
			KeyMain.Input.InputBox.TextTransparency = 1
			KeyMain.NoteTitle.TextTransparency = 1
			KeyMain.NoteMessage.TextTransparency = 1
			KeyMain.Hide.ImageTransparency = 1

			TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 187)}):Play()
			TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 0.5}):Play()
			wait(0.05)
			TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			wait(0.05)
			TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			wait(0.05)
			TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			wait(0.15)
			TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.3}):Play()


			KeyUI.Main.Input.InputBox.FocusLost:Connect(function()
				if KeyMain.Input.InputBox.Text == Settings.KeySettings.Key then
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
					TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
					TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
					TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
					wait(0.51)
					Passthrough = true
					if Settings.KeySettings.SaveKey then
						if writefile then
							writefile(RayfieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension, Settings.KeySettings.Key)
						end
						RayfieldLibrary:Notify({Title = "Key System", Content = "The key for this script has been saved successfully"})
					end
				else
					if AttemptsRemaining == 0 then
						TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
						TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
						TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
						TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
						TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
						TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
						wait(0.45)
						game.Players.LocalPlayer:Kick("No Attempts Remaining")
						game:Shutdown()
					end
					KeyMain.Input.InputBox.Text = ""
					AttemptsRemaining = AttemptsRemaining - 1
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {Position = UDim2.new(0.495,0,0.5,0)}):Play()
					wait(0.1)
					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {Position = UDim2.new(0.505,0,0.5,0)}):Play()
					wait(0.1)
					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(0.5,0,0.5,0)}):Play()
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 187)}):Play()
				end
			end)

			KeyMain.Hide.MouseButton1Click:Connect(function()
				TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
				TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				wait(0.51)
				RayfieldLibrary:Destroy()
				KeyUI:Destroy()
			end)
		else
			Passthrough = true
		end
	end
	if Settings.KeySystem then
		repeat wait() until Passthrough
	end
	
	Notifications.Template.Visible = false
	Notifications.Visible = true
	Rayfield.Enabled = true
	wait(0.5)
	TweenService:Create(Main, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.55}):Play()
	wait(0.1)
	TweenService:Create(LoadingFrame.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	wait(0.05)
	TweenService:Create(LoadingFrame.Subtitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	wait(0.05)
	TweenService:Create(LoadingFrame.Version, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

	Elements.Template.LayoutOrder = 100000
	Elements.Template.Visible = false

	Elements.UIPageLayout.FillDirection = Enum.FillDirection.Horizontal
	TabList.Template.Visible = false

	-- Tab
	local FirstTab = false
	local Window = {}
	function Window:CreateTab(Name,Image)
		local SDone = false
		local TabButton = TabList.Template:Clone()
		TabButton.Name = Name
		TabButton.Title.Text = Name
		TabButton.Parent = TabList
		TabButton.Title.TextWrapped = false
		TabButton.Size = UDim2.new(0, TabButton.Title.TextBounds.X + 30, 0, 30)
		
		if Image then
			TabButton.Title.AnchorPoint = Vector2.new(0, 0.5)
			TabButton.Title.Position = UDim2.new(0, 37, 0.5, 0)
			TabButton.Image.Image = "rbxassetid://"..Image
			TabButton.Image.Visible = true
			TabButton.Title.TextXAlignment = Enum.TextXAlignment.Left
			TabButton.Size = UDim2.new(0, TabButton.Title.TextBounds.X + 46, 0, 30)
		end

		TabButton.BackgroundTransparency = 1
		TabButton.Title.TextTransparency = 1
		TabButton.Shadow.ImageTransparency = 1
		TabButton.Image.ImageTransparency = 1
		TabButton.UIStroke.Transparency = 1

		TabButton.Visible = true

		-- Create Elements Page
		local TabPage = Elements.Template:Clone()
		TabPage.Name = Name
		TabPage.Visible = true

		TabPage.LayoutOrder = #Elements:GetChildren()

		for _, TemplateElement in ipairs(TabPage:GetChildren()) do
			if TemplateElement.ClassName == "Frame" and TemplateElement.Name ~= "Placeholder" then
				TemplateElement:Destroy()
			end
		end

		TabPage.Parent = Elements
		if not FirstTab then
			Elements.UIPageLayout.Animated = false
			Elements.UIPageLayout:JumpTo(TabPage)
			Elements.UIPageLayout.Animated = true
		end
		
		if SelectedTheme ~= RayfieldLibrary.Theme.Default then
			TabButton.Shadow.Visible = false
		end
		TabButton.UIStroke.Color = SelectedTheme.TabStroke
		-- Animate
		wait(0.1)
		if FirstTab then
			TabButton.BackgroundColor3 = SelectedTheme.TabBackground
			TabButton.Image.ImageColor3 = SelectedTheme.TabTextColor
			TabButton.Title.TextColor3 = SelectedTheme.TabTextColor
			TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
			TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
			TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.2}):Play()
			TweenService:Create(TabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			
			TweenService:Create(TabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()
		else
			FirstTab = Name
			TabButton.BackgroundColor3 = SelectedTheme.TabBackgroundSelected
			TabButton.Image.ImageColor3 = SelectedTheme.SelectedTabTextColor
			TabButton.Title.TextColor3 = SelectedTheme.SelectedTabTextColor
			TweenService:Create(TabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()
			TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
			TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
		end
		

		TabButton.Interact.MouseButton1Click:Connect(function()
			if Minimised then return end
			TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(TabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
			TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
			TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.TabBackgroundSelected}):Play()
			TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextColor3 = SelectedTheme.SelectedTabTextColor}):Play()
			TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageColor3 = SelectedTheme.SelectedTabTextColor}):Play()
			TweenService:Create(TabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()

			for _, OtherTabButton in ipairs(TabList:GetChildren()) do
				if OtherTabButton.Name ~= "Template" and OtherTabButton.ClassName == "Frame" and OtherTabButton ~= TabButton and OtherTabButton.Name ~= "Placeholder" then
					TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.TabBackground}):Play()
					TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextColor3 = SelectedTheme.TabTextColor}):Play()
					TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageColor3 = SelectedTheme.TabTextColor}):Play()
					TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
					TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
					TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.2}):Play()
					TweenService:Create(OtherTabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()
					TweenService:Create(OtherTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end
			end
			if Elements.UIPageLayout.CurrentPage ~= TabPage then
				TweenService:Create(Elements, TweenInfo.new(1, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 460,0, 330)}):Play()
				Elements.UIPageLayout:JumpTo(TabPage)
				wait(0.2)
				TweenService:Create(Elements, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 475,0, 366)}):Play()
			end

		end)

		local Tab = {}
		
		-- Self-Destruct
		function Tab:SelfDestruct()
		    TabButton:Destroy()
		    TabPage:Destroy()
		    Tab:Destroy()
		end

		-- Button
		function Tab:CreateButton(ButtonSettings)
			local ButtonValue = {}

			local Button = Elements.Template.Button:Clone()
			Button.Name = ButtonSettings.Name
			Button.Title.Text = ButtonSettings.Name
			Button.Visible = true
			Button.Parent = TabPage

			Button.BackgroundTransparency = 1
			Button.UIStroke.Transparency = 1
			Button.Title.TextTransparency = 1

			TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Button.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Button.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	


			Button.Interact.MouseButton1Click:Connect(function()
				local Success, Response = pcall(ButtonSettings.Callback)
				if not Success then
					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					Button.Title.Text = "Callback Error"
					print("Rayfield | "..ButtonSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Button.Title.Text = ButtonSettings.Name
					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
					TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				else
					SaveConfiguration()
					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					wait(0.2)
					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
					TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end
			end)

			Button.MouseEnter:Connect(function()
				TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
				TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.7}):Play()
			end)

			Button.MouseLeave:Connect(function()
				TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
				TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
			end)

			function ButtonValue:Set(NewButton)
				Button.Title.Text = NewButton
				Button.Name = NewButton
			end

			return ButtonValue
		end
		
		-- ColorPicker
		function Tab:CreateColorPicker(ColorPickerSettings) -- by Throit
			ColorPickerSettings.Type = "ColorPicker"
			local ColorPicker = Elements.Template.ColorPicker:Clone()
			local Background = ColorPicker.CPBackground
			local Display = Background.Display
			local Main = Background.MainCP
			local Slider = ColorPicker.ColorSlider
			ColorPicker.ClipsDescendants = true
			ColorPicker.Name = ColorPickerSettings.Name
			ColorPicker.Title.Text = ColorPickerSettings.Name
			ColorPicker.Visible = true
			ColorPicker.Parent = TabPage
			ColorPicker.Size = UDim2.new(1, -10, 0.028, 35)
			Background.Size = UDim2.new(0, 39, 0, 22)
			Display.BackgroundTransparency = 0
			Main.MainPoint.ImageTransparency = 1
			ColorPicker.Interact.Size = UDim2.new(1, 0, 1, 0)
			ColorPicker.Interact.Position = UDim2.new(0.5, 0, 0.5, 0)
			ColorPicker.RGB.Position = UDim2.new(0, 17, 0, 70)
			ColorPicker.HexInput.Position = UDim2.new(0, 17, 0, 90)
			Main.ImageTransparency = 1
			Background.BackgroundTransparency = 1
			
			
			
			local opened = false 
			local mouse = game.Players.LocalPlayer:GetMouse()
			Main.Image = "http://www.roblox.com/asset/?id=11415645739"
			local mainDragging = false 
			local sliderDragging = false 
			ColorPicker.Interact.MouseButton1Down:Connect(function()
				if not opened then
					opened = true 
					TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(1, -10, 0.224, 40)}):Play()
					TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 173, 0, 86)}):Play()
					TweenService:Create(Display, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
					TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0.289, 0, 0.5, 0)}):Play()
					TweenService:Create(ColorPicker.RGB, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 17, 0, 40)}):Play()
					TweenService:Create(ColorPicker.HexInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 17, 0, 73)}):Play()
					TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0.574, 0, 1, 0)}):Play()
					TweenService:Create(Main.MainPoint, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
					TweenService:Create(Main, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {ImageTransparency = 0.1}):Play()
					TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
				else
					opened = false
					TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(1, -10, 0.028, 35)}):Play()
					TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 39, 0, 22)}):Play()
					TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(1, 0, 1, 0)}):Play()
					TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
					TweenService:Create(ColorPicker.RGB, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 17, 0, 70)}):Play()
					TweenService:Create(ColorPicker.HexInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 17, 0, 90)}):Play()
					TweenService:Create(Display, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
					TweenService:Create(Main.MainPoint, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
					TweenService:Create(Main, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
					TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				end
			end)
			
			game:GetService("UserInputService").InputEnded:Connect(function(input, gameProcessed) if input.UserInputType == Enum.UserInputType.MouseButton1 then 
					mainDragging = false
					sliderDragging = false
			end end)
			Main.MouseButton1Down:Connect(function()
				if opened then
					mainDragging = true 
				end
			end)
			Main.MainPoint.MouseButton1Down:Connect(function()
				if opened then
					mainDragging = true 
				end
			end)
			Slider.MouseButton1Down:Connect(function()
				sliderDragging = true 
			end)
			Slider.SliderPoint.MouseButton1Down:Connect(function()
				sliderDragging = true 
			end)
			local h,s,v = ColorPickerSettings.Color:ToHSV()
			local color = Color3.fromHSV(h,s,v) 
			local hex = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
			ColorPicker.HexInput.InputBox.Text = hex
			local function setDisplay()
				--Main
				Main.MainPoint.Position = UDim2.new(s,-Main.MainPoint.AbsoluteSize.X/2,1-v,-Main.MainPoint.AbsoluteSize.Y/2)
				Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
				Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
				Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
				--Slider 
				local x = h * Slider.AbsoluteSize.X
				Slider.SliderPoint.Position = UDim2.new(0,x-Slider.SliderPoint.AbsoluteSize.X/2,0.5,0)
				Slider.SliderPoint.ImageColor3 = Color3.fromHSV(h,1,1)
				local color = Color3.fromHSV(h,s,v) 
				local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
				ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
				ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
				ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
				hex = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
				ColorPicker.HexInput.InputBox.Text = hex
			end
			setDisplay()
			ColorPicker.HexInput.InputBox.FocusLost:Connect(function()
				if not pcall(function()
						local r, g, b = string.match(ColorPicker.HexInput.InputBox.Text, "^#?(%w%w)(%w%w)(%w%w)$")
						local rgbColor = Color3.fromRGB(tonumber(r, 16),tonumber(g, 16), tonumber(b, 16))
						h,s,v = rgbColor:ToHSV()
						hex = ColorPicker.HexInput.InputBox.Text
						setDisplay()
						ColorPickerSettings.Color = rgbColor
					end) 
				then 
					ColorPicker.HexInput.InputBox.Text = hex 
				end
				pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
				local r,g,b = math.floor((h*255)+0.5),math.floor((s*255)+0.5),math.floor((v*255)+0.5)
				ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
				SaveConfiguration()
			end)
			--RGB
			local function rgbBoxes(box,toChange)
				local value = tonumber(box.Text) 
				local color = Color3.fromHSV(h,s,v) 
				local oldR,oldG,oldB = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
				local save 
				if toChange == "R" then save = oldR;oldR = value elseif toChange == "G" then save = oldG;oldG = value else save = oldB;oldB = value end
				if value then 
					value = math.clamp(value,0,255)
					h,s,v = Color3.fromRGB(oldR,oldG,oldB):ToHSV()
					
					setDisplay()
				else 
					box.Text = tostring(save)
				end
				local r,g,b = math.floor((h*255)+0.5),math.floor((s*255)+0.5),math.floor((v*255)+0.5)
				ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
				SaveConfiguration()
			end
			ColorPicker.RGB.RInput.InputBox.FocusLost:connect(function()
				rgbBoxes(ColorPicker.RGB.RInput.InputBox,"R")
				pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
			end)
			ColorPicker.RGB.GInput.InputBox.FocusLost:connect(function()
				rgbBoxes(ColorPicker.RGB.GInput.InputBox,"G")
				pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
			end)
			ColorPicker.RGB.BInput.InputBox.FocusLost:connect(function()
				rgbBoxes(ColorPicker.RGB.BInput.InputBox,"B")
				pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
			end)

			game:GetService("RunService").RenderStepped:connect(function()
				if mainDragging then 
					local localX = math.clamp(mouse.X-Main.AbsolutePosition.X,0,Main.AbsoluteSize.X)
					local localY = math.clamp(mouse.Y-Main.AbsolutePosition.Y,0,Main.AbsoluteSize.Y)
					Main.MainPoint.Position = UDim2.new(0,localX-Main.MainPoint.AbsoluteSize.X/2,0,localY-Main.MainPoint.AbsoluteSize.Y/2)
					s = localX / Main.AbsoluteSize.X
					v = 1 - (localY / Main.AbsoluteSize.Y)
					Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
					Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
					Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
					local color = Color3.fromHSV(h,s,v) 
					local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
					ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
					ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
					ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
					ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
					pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
					ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
					SaveConfiguration()
				end
				if sliderDragging then 
					local localX = math.clamp(mouse.X-Slider.AbsolutePosition.X,0,Slider.AbsoluteSize.X)
					h = localX / Slider.AbsoluteSize.X
					Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
					Slider.SliderPoint.Position = UDim2.new(0,localX-Slider.SliderPoint.AbsoluteSize.X/2,0.5,0)
					Slider.SliderPoint.ImageColor3 = Color3.fromHSV(h,1,1)
					Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
					Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
					local color = Color3.fromHSV(h,s,v) 
					local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
					ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
					ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
					ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
					ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
					pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
					ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
					SaveConfiguration()
				end
			end)
			
			if Settings.ConfigurationSaving then
				if Settings.ConfigurationSaving.Enabled and ColorPickerSettings.Flag then
					RayfieldLibrary.Flags[ColorPickerSettings.Flag] = ColorPickerSettings
				end
			end
			
			function ColorPickerSettings:Set(RGBColor)
				ColorPickerSettings.Color = RGBColor
				h,s,v = ColorPickerSettings.Color:ToHSV()
				color = Color3.fromHSV(h,s,v)
				setDisplay()
			end
			
			return ColorPickerSettings
		end
		
		-- Section
		function Tab:CreateSection(SectionName)

			local SectionValue = {}

			if SDone then
				local SectionSpace = Elements.Template.SectionSpacing:Clone()
				SectionSpace.Visible = true
				SectionSpace.Parent = TabPage
			end

			local Section = Elements.Template.SectionTitle:Clone()
			Section.Title.Text = SectionName
			Section.Visible = true
			Section.Parent = TabPage

			Section.Title.TextTransparency = 1
			TweenService:Create(Section.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

			function SectionValue:Set(NewSection)
				Section.Title.Text = NewSection
			end

			SDone = true

            function SectionValue:SelfDestruct()
                SectionValue = {}
                Section.Visible = false
                Section:Destroy()
            end

			return SectionValue
		end

		-- Label
		function Tab:CreateLabel(LabelText)
			local LabelValue = {}

			local Label = Elements.Template.Label:Clone()
			Label.Title.Text = LabelText
			Label.Visible = true
			Label.Parent = TabPage

			Label.BackgroundTransparency = 1
			Label.UIStroke.Transparency = 1
			Label.Title.TextTransparency = 1
			
			Label.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
			Label.UIStroke.Color = SelectedTheme.SecondaryElementStroke

			TweenService:Create(Label, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Label.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Label.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			function LabelValue:Set(NewLabel)
				Label.Title.Text = NewLabel
			end

			return LabelValue
		end

		-- Paragraph
		function Tab:CreateParagraph(ParagraphSettings)
			local ParagraphValue = {}

			local Paragraph = Elements.Template.Paragraph:Clone()
			Paragraph.Title.Text = ParagraphSettings.Title
			Paragraph.Content.Text = ParagraphSettings.Content
			Paragraph.Visible = true
			Paragraph.Parent = TabPage

			Paragraph.Content.Size = UDim2.new(0, 438, 0, Paragraph.Content.TextBounds.Y)
			Paragraph.Content.Position = UDim2.new(1, -10, 0.575,0 )
			Paragraph.Size = UDim2.new(1, -10, 0, Paragraph.Content.TextBounds.Y + 40)

			Paragraph.BackgroundTransparency = 1
			Paragraph.UIStroke.Transparency = 1
			Paragraph.Title.TextTransparency = 1
			Paragraph.Content.TextTransparency = 1
			
			Paragraph.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
			Paragraph.UIStroke.Color = SelectedTheme.SecondaryElementStroke
			
			TweenService:Create(Paragraph, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Paragraph.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Paragraph.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	
			TweenService:Create(Paragraph.Content, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			function ParagraphValue:Set(NewParagraphSettings)
				Paragraph.Title.Text = NewParagraphSettings.Title
				Paragraph.Content.Text = NewParagraphSettings.Content
			end

			return ParagraphValue
		end

		-- Input
		function Tab:CreateInput(InputSettings)
			local Input = Elements.Template.Input:Clone()
			Input.Name = InputSettings.Name
			Input.Title.Text = InputSettings.Name
			Input.Visible = true
			Input.Parent = TabPage

			Input.BackgroundTransparency = 1
			Input.UIStroke.Transparency = 1
			Input.Title.TextTransparency = 1
			
			Input.InputFrame.BackgroundColor3 = SelectedTheme.InputBackground
			Input.InputFrame.UIStroke.Color = SelectedTheme.InputStroke

			TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Input.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			Input.InputFrame.InputBox.PlaceholderText = InputSettings.PlaceholderText
			Input.InputFrame.Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 24, 0, 30)

			Input.InputFrame.InputBox.FocusLost:Connect(function()
				
				
				local Success, Response = pcall(function()
					InputSettings.Callback(Input.InputFrame.InputBox.Text)
				end)
				if not Success then
					TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					Input.Title.Text = "Callback Error"
					print("Rayfield | "..InputSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Input.Title.Text = InputSettings.Name
					TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end
				
				if InputSettings.RemoveTextAfterFocusLost then
					Input.InputFrame.InputBox.Text = ""
				end
				SaveConfiguration()
			end)

			Input.MouseEnter:Connect(function()
				TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
			end)

			Input.MouseLeave:Connect(function()
				TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
			end)

			Input.InputFrame.InputBox:GetPropertyChangedSignal("Text"):Connect(function()
				TweenService:Create(Input.InputFrame, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 24, 0, 30)}):Play()
			end)
		end

		-- Dropdown
		function Tab:CreateDropdown(DropdownSettings)
			local Dropdown = Elements.Template.Dropdown:Clone()
			if string.find(DropdownSettings.Name,"closed") then
				Dropdown.Name = "Dropdown"
			else
				Dropdown.Name = DropdownSettings.Name
			end
			Dropdown.Title.Text = DropdownSettings.Name
			Dropdown.Visible = true
			Dropdown.Parent = TabPage

			Dropdown.List.Visible = false

			Dropdown.Selected.Text = DropdownSettings.CurrentOption

			Dropdown.BackgroundTransparency = 1
			Dropdown.UIStroke.Transparency = 1
			Dropdown.Title.TextTransparency = 1

			Dropdown.Size = UDim2.new(1, -10, 0, 45)

			TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Dropdown.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			for _, ununusedoption in ipairs(Dropdown.List:GetChildren()) do
				if ununusedoption.ClassName == "Frame" and ununusedoption.Name ~= "Placeholder" then
					ununusedoption:Destroy()
				end
			end

			Dropdown.Toggle.Rotation = 180

			Dropdown.Interact.MouseButton1Click:Connect(function()
				TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
				TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				wait(0.1)
				TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
				TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				if Debounce then return end
				if Dropdown.List.Visible then
					Debounce = true
					TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(1, -10, 0, 45)}):Play()
					for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
						if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "Placeholder" then
							TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
							TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
							TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						end
					end
					TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
					TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()	
					wait(0.35)
					Dropdown.List.Visible = false
					Debounce = false
				else
					TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(1, -10, 0, 180)}):Play()
					Dropdown.List.Visible = true
					TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 0.7}):Play()
					TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 0}):Play()	
					for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
						if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "Placeholder" then
							TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
							TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
							TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						end
					end
				end
			end)

			Dropdown.MouseEnter:Connect(function()
				if not Dropdown.List.Visible then
					TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
				end
			end)

			Dropdown.MouseLeave:Connect(function()
				TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
			end)

			for _, Option in ipairs(DropdownSettings.Options) do
				local DropdownOption = Elements.Template.Dropdown.List.Template:Clone()
				DropdownOption.Name = Option
				DropdownOption.Title.Text = Option
				DropdownOption.Parent = Dropdown.List
				DropdownOption.Visible = true

				if DropdownSettings.CurrentOption == Option then
					DropdownOption.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				end

				DropdownOption.BackgroundTransparency = 1
				DropdownOption.UIStroke.Transparency = 1
				DropdownOption.Title.TextTransparency = 1

				DropdownOption.Interact.ZIndex = 50
				DropdownOption.Interact.MouseButton1Click:Connect(function()
					if Dropdown.Selected.Text ~= Option then
						Dropdown.Selected.Text = Option
						
						local Success, Response = pcall(function()
							DropdownSettings.Callback(Option)
						end)
						if not Success then
							TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
							TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
							Dropdown.Title.Text = "Callback Error"
							print("Rayfield | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
							wait(0.5)
							Dropdown.Title.Text = DropdownSettings.Name
							TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
							TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
						end
						DropdownSettings.CurrentOption = Option
						for _, droption in ipairs(Dropdown.List:GetChildren()) do
							if droption.ClassName == "Frame" and droption.Name ~= "Placeholder" and droption.Name ~= DropdownSettings.CurrentOption then
								TweenService:Create(droption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
							end
						end
						TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
						TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
						Debounce = true
						wait(0.2)
						TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
						wait(0.1)
						TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(1, -10, 0, 45)}):Play()
						for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
							if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "Placeholder" then
								TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
								TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
								TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
							end
						end
						TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
						TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()	
						wait(0.35)
						Dropdown.List.Visible = false
						Debounce = false	
						SaveConfiguration()
					end
				end)
			end


			function DropdownSettings:Set(NewOption)
				Dropdown.Selected.Text = NewOption
				DropdownSettings.CurrentOption = NewOption
				local Success, Response = pcall(function()
					DropdownSettings.Callback(NewOption)
				end)
				if not Success then
					TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					Dropdown.Title.Text = "Callback Error"
					print("Rayfield | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Dropdown.Title.Text = DropdownSettings.Name
					TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end

				for _, droption in ipairs(Dropdown.List:GetChildren()) do
					if droption.Name ~= NewOption then
						if droption.ClassName == "Frame" and droption.Name ~= "Placeholder" then
							droption.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
						end
					else
						droption.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					end

				end
			end

			if Settings.ConfigurationSaving then
				if Settings.ConfigurationSaving.Enabled and DropdownSettings.Flag then
					RayfieldLibrary.Flags[DropdownSettings.Flag] = DropdownSettings
				end
			end

            
			function DropdownSettings:Clear() 
				for _, ununusedoption in ipairs(Dropdown.List:GetChildren()) do
					if ununusedoption.ClassName == "Frame" then
						ununusedoption:Destroy()
					end
				end
			end

			function DropdownSettings:Add(Option)
				local DropdownOption = Elements.Template.Dropdown.List.Template:Clone()
				DropdownOption.Name = Option
				DropdownOption.Title.Text = Option
				DropdownOption.Parent = Dropdown.List
				DropdownOption.Visible = true

				if DropdownSettings.CurrentOption == Option then
					DropdownOption.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				end

				DropdownOption.BackgroundTransparency = 1
				DropdownOption.UIStroke.Transparency = 1
				DropdownOption.Title.TextTransparency = 1

				DropdownOption.Interact.ZIndex = 50
				DropdownOption.Interact.MouseButton1Click:Connect(function()
					if Dropdown.Selected.Text ~= Option then
						Dropdown.Selected.Text = Option
						
						local Success, Response = pcall(function()
							DropdownSettings.Callback(Option)
						end)

						if not Success then
							TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
							TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
							Dropdown.Title.Text = "Callback Error"
							print("Rayfield | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
							wait(0.5)
							Dropdown.Title.Text = DropdownSettings.Name
							TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
							TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
						end

						for _, droption in ipairs(Dropdown.List:GetChildren()) do
							if droption.ClassName == "Frame" and droption.Name ~= "Placeholder" and droption.Name ~= DropdownSettings.CurrentOption then
								TweenService:Create(droption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
							end
						end

						TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
						TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
						Debounce = true

						wait(0.2)

						TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
						wait(0.1)

						TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(1, -10, 0, 45)}):Play()

						for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
							if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "Placeholder" then
								TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
								TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
								TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
							end
						end

						TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
						TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()	

						wait(0.35)

						Dropdown.List.Visible = false
						Debounce = false	
						SaveConfiguration()
					end
				end)
			end

			return DropdownSettings
		end

		-- Keybind
		function Tab:CreateKeybind(KeybindSettings)
			local CheckingForKey = false
			local Keybind = Elements.Template.Keybind:Clone()
			Keybind.Name = KeybindSettings.Name
			Keybind.Title.Text = KeybindSettings.Name
			Keybind.Visible = true
			Keybind.Parent = TabPage

			Keybind.BackgroundTransparency = 1
			Keybind.UIStroke.Transparency = 1
			Keybind.Title.TextTransparency = 1
			
			Keybind.KeybindFrame.BackgroundColor3 = SelectedTheme.InputBackground
			Keybind.KeybindFrame.UIStroke.Color = SelectedTheme.InputStroke

			TweenService:Create(Keybind, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Keybind.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			Keybind.KeybindFrame.KeybindBox.Text = KeybindSettings.CurrentKeybind
			Keybind.KeybindFrame.Size = UDim2.new(0, Keybind.KeybindFrame.KeybindBox.TextBounds.X + 24, 0, 30)

			Keybind.KeybindFrame.KeybindBox.Focused:Connect(function()
				CheckingForKey = true
				Keybind.KeybindFrame.KeybindBox.Text = ""
			end)
			Keybind.KeybindFrame.KeybindBox.FocusLost:Connect(function()
				CheckingForKey = false
				if Keybind.KeybindFrame.KeybindBox.Text == nil or "" then
					Keybind.KeybindFrame.KeybindBox.Text = KeybindSettings.CurrentKeybind
					SaveConfiguration()
				end
			end)

			Keybind.MouseEnter:Connect(function()
				TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
			end)

			Keybind.MouseLeave:Connect(function()
				TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
			end)

			UserInputService.InputBegan:Connect(function(input, processed)

				if CheckingForKey then
					if input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode ~= Enum.KeyCode.RightShift then
						local SplitMessage = string.split(tostring(input.KeyCode), ".")
						local NewKeyNoEnum = SplitMessage[3]
						Keybind.KeybindFrame.KeybindBox.Text = tostring(NewKeyNoEnum)
						KeybindSettings.CurrentKeybind = tostring(NewKeyNoEnum)
						Keybind.KeybindFrame.KeybindBox:ReleaseFocus()
						SaveConfiguration()
					end
				elseif KeybindSettings.CurrentKeybind ~= nil and (input.KeyCode == Enum.KeyCode[KeybindSettings.CurrentKeybind] and not processed) then -- Test
					local Held = true
					local Connection
					Connection = input.Changed:Connect(function(prop)
						if prop == "UserInputState" then
							Connection:Disconnect()
							Held = false
						end
					end)

					if not KeybindSettings.HoldToInteract then
						local Success, Response = pcall(KeybindSettings.Callback)
						if not Success then
							TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
							TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
							Keybind.Title.Text = "Callback Error"
							print("Rayfield | "..KeybindSettings.Name.." Callback Error " ..tostring(Response))
							wait(0.5)
							Keybind.Title.Text = KeybindSettings.Name
							TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
							TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
						end
					else
						wait(0.25)
						if Held then
							local Loop; Loop = RunService.Stepped:Connect(function()
								if not Held then
									KeybindSettings.Callback(false) -- maybe pcall this
									Loop:Disconnect()
								else
									KeybindSettings.Callback(true) -- maybe pcall this
								end
							end)	
						end
					end
				end
			end)

			Keybind.KeybindFrame.KeybindBox:GetPropertyChangedSignal("Text"):Connect(function()
				TweenService:Create(Keybind.KeybindFrame, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, Keybind.KeybindFrame.KeybindBox.TextBounds.X + 24, 0, 30)}):Play()
			end)

			function KeybindSettings:Set(NewKeybind)
				Keybind.KeybindFrame.KeybindBox.Text = tostring(NewKeybind)
				KeybindSettings.CurrentKeybind = tostring(NewKeybind)
				Keybind.KeybindFrame.KeybindBox:ReleaseFocus()
				SaveConfiguration()
			end
			if Settings.ConfigurationSaving then
				if Settings.ConfigurationSaving.Enabled and KeybindSettings.Flag then
					RayfieldLibrary.Flags[KeybindSettings.Flag] = KeybindSettings
				end
			end
			return KeybindSettings
		end

		-- Toggle
		function Tab:CreateToggle(ToggleSettings)
			local ToggleValue = {}

			local Toggle = Elements.Template.Toggle:Clone()
			Toggle.Name = ToggleSettings.Name
			Toggle.Title.Text = ToggleSettings.Name
			Toggle.Visible = true
			Toggle.Parent = TabPage

			Toggle.BackgroundTransparency = 1
			Toggle.UIStroke.Transparency = 1
			Toggle.Title.TextTransparency = 1
			Toggle.Switch.BackgroundColor3 = SelectedTheme.ToggleBackground
			
			if SelectedTheme ~= RayfieldLibrary.Theme.Default then
				Toggle.Switch.Shadow.Visible = false
			end

			TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Toggle.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			if not ToggleSettings.CurrentValue then
				Toggle.Switch.Indicator.Position = UDim2.new(1, -40, 0.5, 0)
				Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleDisabledStroke
				Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleDisabled
				Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleDisabledOuterStroke
			else
				Toggle.Switch.Indicator.Position = UDim2.new(1, -20, 0.5, 0)
				Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleEnabledStroke
				Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleEnabled
				Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleEnabledOuterStroke
			end

			Toggle.MouseEnter:Connect(function()
				TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
			end)

			Toggle.MouseLeave:Connect(function()
				TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
			end)

			Toggle.Interact.MouseButton1Click:Connect(function()
				if ToggleSettings.CurrentValue then
					ToggleSettings.CurrentValue = false
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,12,0,12)}):Play()
					TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
					TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledOuterStroke}):Play()
					wait(0.05)
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)}):Play()
					wait(0.15)
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()	
				else
					ToggleSettings.CurrentValue = true
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,12,0,12)}):Play()
					TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
					TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledOuterStroke}):Play()
					wait(0.05)
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)}):Play()	
					wait(0.15)
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()		
				end
				
				local Success, Response = pcall(function()
					ToggleSettings.Callback(ToggleSettings.CurrentValue)
				end)
				if not Success then
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					Toggle.Title.Text = "Callback Error"
					print("Rayfield | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Toggle.Title.Text = ToggleSettings.Name
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end
				
				SaveConfiguration()
			end)

			function ToggleSettings:Set(NewToggleValue)
				if NewToggleValue then
					ToggleSettings.CurrentValue = true
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,12,0,12)}):Play()
					TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
					TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = Color3.fromRGB(100,100,100)}):Play()
					wait(0.05)
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)}):Play()	
					wait(0.15)
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()	
				else
					ToggleSettings.CurrentValue = false
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,12,0,12)}):Play()
					TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
					TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = Color3.fromRGB(65,65,65)}):Play()
					wait(0.05)
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)}):Play()
					wait(0.15)
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()	
				end
				local Success, Response = pcall(function()
					ToggleSettings.Callback(ToggleSettings.CurrentValue)
				end)
				if not Success then
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					Toggle.Title.Text = "Callback Error"
					print("Rayfield | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Toggle.Title.Text = ToggleSettings.Name
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end
				SaveConfiguration()
			end

			if Settings.ConfigurationSaving then
				if Settings.ConfigurationSaving.Enabled and ToggleSettings.Flag then
					RayfieldLibrary.Flags[ToggleSettings.Flag] = ToggleSettings
				end
			end

			return ToggleSettings
		end

		-- Slider
		function Tab:CreateSlider(SliderSettings)
			local Dragging = false
			local Slider = Elements.Template.Slider:Clone()
			Slider.Name = SliderSettings.Name
			Slider.Title.Text = SliderSettings.Name
			Slider.Visible = true
			Slider.Parent = TabPage

			Slider.BackgroundTransparency = 1
			Slider.UIStroke.Transparency = 1
			Slider.Title.TextTransparency = 1
			
			if SelectedTheme ~= RayfieldLibrary.Theme.Default then
				Slider.Main.Shadow.Visible = false
			end
			
			Slider.Main.BackgroundColor3 = SelectedTheme.SliderBackground
			Slider.Main.UIStroke.Color = SelectedTheme.SliderStroke
			Slider.Main.Progress.BackgroundColor3 = SelectedTheme.SliderProgress

			TweenService:Create(Slider, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Slider.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Slider.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			Slider.Main.Progress.Size =	UDim2.new(0, Slider.Main.AbsoluteSize.X * ((SliderSettings.CurrentValue + SliderSettings.Range[1]) / (SliderSettings.Range[2] - SliderSettings.Range[1])) > 5 and Slider.Main.AbsoluteSize.X * (SliderSettings.CurrentValue / (SliderSettings.Range[2] - SliderSettings.Range[1])) or 5, 1, 0)

			if not SliderSettings.Suffix then
				Slider.Main.Information.Text = tostring(SliderSettings.CurrentValue)
			else
				Slider.Main.Information.Text = tostring(SliderSettings.CurrentValue) .. " " .. SliderSettings.Suffix
			end


			Slider.MouseEnter:Connect(function()
				TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
			end)

			Slider.MouseLeave:Connect(function()
				TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
			end)
			
			Slider.Main.Interact.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
					Dragging = true 
				end 
			end)
			Slider.Main.Interact.InputEnded:Connect(function(Input) 
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
					Dragging = false 
				end 
			end)

			Slider.Main.Interact.MouseButton1Down:Connect(function(X)
				local Current = Slider.Main.Progress.AbsolutePosition.X + Slider.Main.Progress.AbsoluteSize.X
				local Start = Current
				local Location = X
				local Loop; Loop = RunService.Stepped:Connect(function()
					if Dragging then
						Location = UserInputService:GetMouseLocation().X
						Current = Current + 0.025 * (Location - Start)

						if Location < Slider.Main.AbsolutePosition.X then
							Location = Slider.Main.AbsolutePosition.X
						elseif Location > Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X then
							Location = Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X
						end

						if Current < Slider.Main.AbsolutePosition.X + 5 then
							Current = Slider.Main.AbsolutePosition.X + 5
						elseif Current > Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X then
							Current = Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X
						end

						if Current <= Location and (Location - Start) < 0 then
							Start = Location
						elseif Current >= Location and (Location - Start) > 0 then
							Start = Location
						end
						TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, Current - Slider.Main.AbsolutePosition.X, 1, 0)}):Play()
						local NewValue = SliderSettings.Range[1] + (Location - Slider.Main.AbsolutePosition.X) / Slider.Main.AbsoluteSize.X * (SliderSettings.Range[2] - SliderSettings.Range[1])

						NewValue = math.floor(NewValue / SliderSettings.Increment + 0.5) * (SliderSettings.Increment * 10000000) / 10000000
						if not SliderSettings.Suffix then
							Slider.Main.Information.Text = tostring(NewValue)
						else
							Slider.Main.Information.Text = tostring(NewValue) .. " " .. SliderSettings.Suffix
						end

						if SliderSettings.CurrentValue ~= NewValue then
							local Success, Response = pcall(function()
								SliderSettings.Callback(NewValue)
							end)
							if not Success then
								TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
								TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
								Slider.Title.Text = "Callback Error"
								print("Rayfield | "..SliderSettings.Name.." Callback Error " ..tostring(Response))
								wait(0.5)
								Slider.Title.Text = SliderSettings.Name
								TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
								TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
							end
							
							SliderSettings.CurrentValue = NewValue
							SaveConfiguration()
						end
					else
						TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, Location - Slider.Main.AbsolutePosition.X > 5 and Location - Slider.Main.AbsolutePosition.X or 5, 1, 0)}):Play()
						Loop:Disconnect()
					end
				end)
			end)

			function SliderSettings:Set(NewVal)
				TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, Slider.Main.AbsoluteSize.X * ((NewVal + SliderSettings.Range[1]) / (SliderSettings.Range[2] - SliderSettings.Range[1])) > 5 and Slider.Main.AbsoluteSize.X * (NewVal / (SliderSettings.Range[2] - SliderSettings.Range[1])) or 5, 1, 0)}):Play()
				Slider.Main.Information.Text = tostring(NewVal) .. " " .. SliderSettings.Suffix
				local Success, Response = pcall(function()
					SliderSettings.Callback(NewVal)
				end)
				if not Success then
					TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					Slider.Title.Text = "Callback Error"
					print("Rayfield | "..SliderSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Slider.Title.Text = SliderSettings.Name
					TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end
				SliderSettings.CurrentValue = NewVal
				SaveConfiguration()
			end
			if Settings.ConfigurationSaving then
				if Settings.ConfigurationSaving.Enabled and SliderSettings.Flag then
					RayfieldLibrary.Flags[SliderSettings.Flag] = SliderSettings
				end
			end
			return SliderSettings
		end
        
        function Tab:Clear()
            for _, Element in ipairs(TabPage:GetChildren()) do
                if Element.ClassName == "Frame" and Element.Name ~= "Placeholder"  then
                    Element:Destroy()
                end
            end
        end

		return Tab
	end

	Elements.Visible = true

	wait(1.2)
	TweenService:Create(LoadingFrame.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(LoadingFrame.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(LoadingFrame.Version, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	wait(0.2)
	TweenService:Create(Main, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 475)}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()

	Topbar.BackgroundTransparency = 1
	Topbar.Divider.Size = UDim2.new(0, 0, 0, 1)
	Topbar.CornerRepair.BackgroundTransparency = 1
	Topbar.Title.TextTransparency = 1
	Topbar.Theme.ImageTransparency = 1
	Topbar.ChangeSize.ImageTransparency = 1
	Topbar.Hide.ImageTransparency = 1

	wait(0.8)
	Topbar.Visible = true
	TweenService:Create(Topbar, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	wait(0.1)
	TweenService:Create(Topbar.Divider, TweenInfo.new(1, Enum.EasingStyle.Quint), {Size = UDim2.new(1, 0, 0, 1)}):Play()
	wait(0.1)
	TweenService:Create(Topbar.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	wait(0.1)
	TweenService:Create(Topbar.Theme, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
	wait(0.1)
	TweenService:Create(Topbar.ChangeSize, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
	wait(0.1)
	TweenService:Create(Topbar.Hide, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
	wait(0.3)
	
	return Window
end

function RayfieldLibrary:Destroy()
	Rayfield:Destroy()
end

Topbar.ChangeSize.MouseButton1Click:Connect(function()
	if Debounce then return end
	if Minimised then
		Minimised = false
		Maximise()
	else
		Minimised = true
		Minimise()
	end
end)

Topbar.Hide.MouseButton1Click:Connect(function()
	if Debounce then return end
	if Hidden then
		Hidden = false
		Minimised = false
		Unhide()
	else
		Hidden = true
		Hide()
	end
end)

UserInputService.InputBegan:Connect(function(input, processed)
	if (input.KeyCode == Enum.KeyCode.RightShift and not processed) then
		if Debounce then return end
		if Hidden then
			Hidden = false
			Unhide()
		else
			Hidden = true
			Hide()
		end
	end
end)

for _, TopbarButton in ipairs(Topbar:GetChildren()) do
	if TopbarButton.ClassName == "ImageButton" then
		TopbarButton.MouseEnter:Connect(function()
			TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
		end)

		TopbarButton.MouseLeave:Connect(function()
			TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
		end)

		TopbarButton.MouseButton1Click:Connect(function()
			TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
		end)
	end
end

function RayfieldLibrary:LoadConfiguration()
	if CEnabled then
		pcall(function()
			if isfile(ConfigurationFolder .. "\\" .. CFileName .. ConfigurationExtension) then
				LoadConfiguration(readfile(ConfigurationFolder .. "\\" .. CFileName .. ConfigurationExtension))
				RayfieldLibrary:Notify({Title = "Configuration Loaded", Content = "The configuration file for this script has been loaded from a previous session"})
			end
		end)
	end
end

---############################################---
---############### ACTUAL CODE ################---
---############################################---

local scriptVersion = "1.6.8h3"

if not isfolder("AAMacros" .. scriptVersion) then
	makefolder("AAMacros" .. scriptVersion)
end

local HttpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace") 
local player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local mouse = game.Players.LocalPlayer:GetMouse()
local UserInputService = game:GetService("UserInputService")

getgenv().saveFileName = "Anime-Adventures_UPD10"..game.Players.LocalPlayer.Name.."-"..scriptVersion..".json"
getgenv().door = "_lobbytemplategreen1"
getgenv().raiddoor = "_lobbytemplate211"
getgenv().selectedMacroFile = "nil"

if getgenv().lowCpuMode == nil then
	getgenv().lowCpuMode = true
end

local startTime = os.time(os.date("!*t"))
local startGems = game.Players.LocalPlayer._stats.gem_amount.Value

function getBorosPortals()
    local reg = getreg() --> returns Roblox's registry in a table

    for i,v in next, reg do
        if type(v) == 'function' then --> Checks if the current iteration is a function
            if getfenv(v).script then --> Checks if the function's environment is in a script
                --if getfenv(v).script:GetFullName() == "ReplicatedStorage.src.client.Services.DropService" or getfenv(v).script:GetFullName() == "ReplicatedStorage.src.client.Services.NPCServiceClient" then
                    for _, v in pairs(debug.getupvalues(v)) do --> Basically a for loop that prints everything, but in one line
                        if type(v) == 'table' then
                            if v["session"] then
                                local portals = {}
                                for _, item in pairs(v["session"]["inventory"]['inventory_profile_data']['unique_items']) do
                                  if item["item_id"] == "portal_boros_g" then
                                    table.insert(portals, item)
                                  end
                                end
                                return portals
                            end
                        end
                    end
                --end
            end
        end
    end
end

function getCSMPortals()
    local reg = getreg() --> returns Roblox's registry in a table

    for i,v in next, reg do
        if type(v) == 'function' then --> Checks if the current iteration is a function
            if getfenv(v).script then --> Checks if the function's environment is in a script
                --if getfenv(v).script:GetFullName() == "ReplicatedStorage.src.client.Services.DropService" or getfenv(v).script:GetFullName() == "ReplicatedStorage.src.client.Services.NPCServiceClient" then
                    for _, v in pairs(debug.getupvalues(v)) do --> Basically a for loop that prints everything, but in one line
                        if type(v) == 'table' then
                            if v["session"] then
                                local portals = {}
                                for _, item in pairs(v["session"]["inventory"]['inventory_profile_data']['unique_items']) do
                                  if item["item_id"] == "portal_csm" then
                                    table.insert(portals, item)
                                  end
                                end
                                return portals
                            end
                        end
                    end
                --end
            end
        end
    end
end

function tprint (tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      tprint(v, indent+1)
    elseif type(v) == 'boolean' then
      print(formatting .. tostring(v))      
    else
      print(formatting .. v)
    end
  end
end

function getNormalItems()
    local reg = getreg() --> returns Roblox's registry in a table

    for i,v in next, reg do
        if type(v) == 'function' then --> Checks if the current iteration is a function
            if getfenv(v).script then --> Checks if the function's environment is in a script
                --if getfenv(v).script:GetFullName() == "ReplicatedStorage.src.client.Services.DropService" or getfenv(v).script:GetFullName() == "ReplicatedStorage.src.client.Services.NPCServiceClient" then
                    for _, v in pairs(debug.getupvalues(v)) do --> Basically a for loop that prints everything, but in one line
                        if type(v) == 'table' then
                            if v["session"] then
                                return v["session"]["inventory"]['inventory_profile_data']['normal_items']
                            end
                        end
                    end
                --end
            end
        end
    end
end

function getItemChangesNormal(preGameTable, currentTable)
    local itemChanges = {}
    
    for item, amount in pairs(currentTable) do
        if preGameTable[item] == nil then
            print(item .. ": +" .. amount)
            itemChanges[item] = "+" .. amount
        else
            if preGameTable[item] > amount then
                print(item .. ": -" .. preGameTable[item] - amount)
                itemChanges[item] = "-" .. preGameTable[item] - amount
            elseif preGameTable[item] < amount then
                print(item .. "+" .. amount - preGameTable[item])
                itemChanges[item] = "+" .. amount - preGameTable[item]
            end
        end
        
    end
	return itemChanges
end

function getUniqueItems()
    local reg = getreg() --> returns Roblox's registry in a table

    for i,v in next, reg do
        if type(v) == 'function' then --> Checks if the current iteration is a function
            if getfenv(v).script then --> Checks if the function's environment is in a script
                --if getfenv(v).script:GetFullName() == "ReplicatedStorage.src.client.Services.DropService" or getfenv(v).script:GetFullName() == "ReplicatedStorage.src.client.Services.NPCServiceClient" then
                    for _, v in pairs(debug.getupvalues(v)) do --> Basically a for loop that prints everything, but in one line
                        if type(v) == 'table' then
                            if v["session"] then
                                return v["session"]["inventory"]['inventory_profile_data']['unique_items']
                            end
                        end
                    end
                --end
            end
        end
    end
end

function getItemChangesUnique(preGameTable, postGameTable)
    local itemAdditions = {}
    
    for _, item in pairs(postGameTable) do
        local currentItemUUID = item['uuid']
        local currentItemIsNew = true
        for i, itemToCompare in pairs(preGameTable) do
            if itemToCompare['uuid'] == currentItemUUID then
                currentItemIsNew = false
            end
        end
        if currentItemIsNew then
            print("New Unique Item: " .. item["item_id"])
            table.insert(itemAdditions, item["item_id"])
        end
    end

	return itemAdditions
end

function shallowCopy(original)
    local copy = {}
    for key, value in pairs(original) do
        copy[key] = value
    end
    return copy
end

repeat
	local testItemGet = getNormalItems()
until testItemGet ~= nil

getgenv().startingInventoryNormalItems = shallowCopy(getNormalItems())
getgenv().startingInventoryUniqueItems = shallowCopy(getUniqueItems())


local function writeMacroToFile(filename)
	getgenv().newMacroFile = {}
	getgenv().instructionIncrement = 1

	local function writeMacroToTable()
		local mt = getrawmetatable(game)
		local old = mt.__namecall
		getgenv().timeOfLastCommand = os.clock()
		getgenv().macroStartTime = os.clock()
		setreadonly(mt,false)

		mt.__namecall = newcclosure(function(remote,...)
			local arguments = {...}
			method = tostring(getnamecallmethod())
			
			if method == "InvokeServer" or method == "FireServer" then
				if tostring(remote) == "spawn_unit" then
					function getEquippedUnits()
						equippedUnits = {}
						local reg = getreg() --> returns Roblox's registry in a table
					
						for i,v in next, reg do
							if type(v) == 'function' then --> Checks if the current iteration is a function
								if getfenv(v).script then --> Checks if the function's environment is in a script
									--if getfenv(v).script:GetFullName() == "ReplicatedStorage.src.client.Services.DropService" or getfenv(v).script:GetFullName() == "ReplicatedStorage.src.client.Services.NPCServiceClient" then
										for _, v in pairs(debug.getupvalues(v)) do --> Basically a for loop that prints everything, but in one line
											if type(v) == 'table' then
												if v["session"] then
													for sus, bak in pairs(v["session"]["profile_data"]['collection']['equipped_units']) do
														table.insert(equippedUnits, {bak, v["session"]["profile_data"]['collection']['owned_units'][bak]['unit_id']})
													end
													return equippedUnits
												end
											end
										end
									--end
								end
							end
						end
					end

					function getUnitsData()
						local v1 = {};
						for x, y in pairs(require(game.ReplicatedStorage.src.Data.Units)) do
							v1[x] = y          
						end
						return v1;
					end

					function getUpgradeCost(unitID, upgradeTo)
						if upgradeTo ~= 0 then
							return getUnitsData()[unitID]["upgrade"][upgradeTo]['cost']
						else
							return getUnitsData()[unitID]["cost"]
						end               
					end
					
					local unitUUID = tostring(arguments[1])
					local unitPosition = arguments[2]
					local unitID

					for _, unitDetails in pairs(getEquippedUnits()) do
						if unitUUID == unitDetails[1] then
							unitID = unitDetails[2]
						end
					end

					getgenv().newMacroFile[tostring(instructionIncrement)] = {
						['type'] = 'spawn_unit',
						['unit'] = unitID,
						['money'] = getUpgradeCost(unitID, 0),
						['cframe'] = arguments[2].X .. ", " .. arguments[2].Y .. ", " .. arguments[2].Z .. ", 1, 0, -0, -0, 1, -0, 0, 0, 1"
					}
					instructionIncrement += 1
				end

				if tostring(remote) == "upgrade_unit_ingame" then
					function getEquippedUnits()
						equippedUnits = {}
						local reg = getreg() --> returns Roblox's registry in a table
					
						for i,v in next, reg do
							if type(v) == 'function' then --> Checks if the current iteration is a function
								if getfenv(v).script then --> Checks if the function's environment is in a script
									--if getfenv(v).script:GetFullName() == "ReplicatedStorage.src.client.Services.DropService" or getfenv(v).script:GetFullName() == "ReplicatedStorage.src.client.Services.NPCServiceClient" then
										for _, v in pairs(debug.getupvalues(v)) do --> Basically a for loop that prints everything, but in one line
											if type(v) == 'table' then
												if v["session"] then
													for sus, bak in pairs(v["session"]["profile_data"]['collection']['equipped_units']) do
														table.insert(equippedUnits, {bak, v["session"]["profile_data"]['collection']['owned_units'][bak]['unit_id']})
													end
													return equippedUnits
												end
											end
										end
									--end
								end
							end
						end
					end

					function getUnitsData()
						local v1 = {};
						for x, y in pairs(require(game.ReplicatedStorage.src.Data.Units)) do
							v1[x] = y          
						end
						return v1;
					end

					function getUpgradeCost(unitID, upgradeTo)
						print(unitID)
						if upgradeTo ~= 0 then
							return getUnitsData()[unitID]["upgrade"][upgradeTo]['cost']
						else
							return getUnitsData()[unitID]["cost"]
						end               
					end

					local hitboxPosition = arguments[1]._hitbox.CFrame
					
					local unitID

					for _, unitDetails in pairs(getEquippedUnits()) do
						print(unitDetails[1])
						print(arguments[1]['_stats']['uuid'].Value)
						if arguments[1]['_stats']['uuid'].Value == unitDetails[1] then
							unitID = unitDetails[2]
						end
					end

					if game.Players.LocalPlayer._stats.resource.Value >= getUpgradeCost(unitID, arguments[1]["_stats"]["upgrade"].Value + 1) then
						getgenv().newMacroFile[tostring(instructionIncrement)]  =  {
												['type'] = 'upgrade_unit_ingame',
												['money'] = getUpgradeCost(unitID, arguments[1]["_stats"]["upgrade"].Value + 1),
												['pos'] = hitboxPosition.X .. ", " .. hitboxPosition.Y .. ", " .. hitboxPosition.Z
											}
						instructionIncrement += 1
					end
				end

				if tostring(remote) == "sell_unit_ingame" then
					function getEquippedUnits()
						equippedUnits = {}
						local reg = getreg() --> returns Roblox's registry in a table
					
						for i,v in next, reg do
							if type(v) == 'function' then --> Checks if the current iteration is a function
								if getfenv(v).script then --> Checks if the function's environment is in a script
									--if getfenv(v).script:GetFullName() == "ReplicatedStorage.src.client.Services.DropService" or getfenv(v).script:GetFullName() == "ReplicatedStorage.src.client.Services.NPCServiceClient" then
										for _, v in pairs(debug.getupvalues(v)) do --> Basically a for loop that prints everything, but in one line
											if type(v) == 'table' then
												if v["session"] then
													for sus, bak in pairs(v["session"]["profile_data"]['collection']['equipped_units']) do
														table.insert(equippedUnits, {bak, v["session"]["profile_data"]['collection']['owned_units'][bak]['unit_id']})
													end
													return equippedUnits
												end
											end
										end
									--end
								end
							end
						end
					end

					function getUnitsData()
						local v1 = {};
						for x, y in pairs(require(game.ReplicatedStorage.src.Data.Units)) do
							v1[x] = y          
						end
						return v1;
					end

					function getUpgradeCost(unitId, upgradeTo)
						if upgradeTo ~= 0 then
							return getUnitsData()[unitId]["upgrade"][upgradeTo]['cost']
						else
							return getUnitsData()[unitId]["cost"]
						end               
					end

					local hitboxPosition = arguments[1]._hitbox.CFrame
					local unitID

					for _, unitDetails in pairs(getEquippedUnits()) do
						if unitUUID == unitDetails[1] then
							unitID = unitDetails[2]
						end
					end

					getgenv().newMacroFile[tostring(instructionIncrement)]  =  {
											['type'] = 'sell_unit_ingame',
											['money'] = 0,
											['pos'] = hitboxPosition.X .. ", " .. hitboxPosition.Y .. ", " .. hitboxPosition.Z .. ", 1, 0, -0, -0, 1, -0, 0, 0, 1"
										}
					instructionIncrement += 1
				end
			end

			local true_args = {...}
			return old(remote, unpack(true_args))
		end)

		setreadonly(mt,true)
	end

	writeMacroToTable()

	local GameFinished = game:GetService("Workspace"):WaitForChild("_DATA"):WaitForChild("GameFinished")

	GameFinished:GetPropertyChangedSignal("Value"):Connect(function()
		print("Changed", GameFinished.Value == true)
		if GameFinished.Value == true then
			writefile("AAMacros" .. scriptVersion .. "\\" .. tostring(workspace._MAP_CONFIG.GetLevelData:InvokeServer()["id"]).."-"..tostring(os.date('%Y%m%d-%H%M%S')).."-"..game.Players.LocalPlayer.Name..".json", game:GetService("HttpService"):JSONEncode(getgenv().newMacroFile)) 
		end
	end)
end

local storyLevels = {
    ["1"] = {
		name = "Planet Namak", 
		map = "namek_cartoon", 
		levels = {
			["1"] = {
				id = "namek_level_1"
			}, 
			["2"] = {
				id = "namek_level_2"
			}, 
			["3"] = {
				id = "namek_level_3"
			}, 
			["4"] = {
				id = "namek_level_4"
			}, 
			["5"] = {
				id = "namek_level_5"
			}, 
			["6"] = {
				id = "namek_level_6"
			},
            ["inf"] = {
				id = "namek_infinite"
			}
		}
	}, 
	["2"] = {
		name = "Shiganshinu District", 
		map = "aot", 
		levels = {
			["1"] = {
				id = "aot_level_1"
			}, 
			["2"] = {
				id = "aot_level_2"
			}, 
			["3"] = {
				id = "aot_level_3"
			}, 
			["4"] = {
				id = "aot_level_4"
			}, 
			["5"] = {
				id = "aot_level_5"
			}, 
			["6"] = {
				id = "aot_level_6"
			},
            ["inf"] = {
				id = "aot_infinite"
			}
		}
	},
	["3"] = {
		name = "Snowy Town", 
		map = "demonslayer", 
		levels = {
			["1"] = {
				id = "demonslayer_level_1"
			}, 
			["2"] = {
				id = "demonslayer_level_2"
			}, 
			["3"] = {
				id = "demonslayer_level_3"
			}, 
			["4"] = {
				id = "demonslayer_level_4"
			}, 
			["5"] = {
				id = "demonslayer_level_5"
			}, 
			["6"] = {
				id = "demonslayer_level_6"
			},
            ["inf"] = {
				id = "demonslayer_infinite"
			}
		}
	}, 
	["4"] = {
		name = "Hidden Sand Village", 
		map = "naruto", 
		levels = {
			["1"] = {
				id = "naruto_level_1"
			}, 
			["2"] = {
				id = "naruto_level_2"
			}, 
			["3"] = {
				id = "naruto_level_3"
			}, 
			["4"] = {
				id = "naruto_level_4"
			}, 
			["5"] = {
				id = "naruto_level_5"
			}, 
			["6"] = {
				id = "naruto_level_6"
			},
            ["inf"] = {
				id = "naruto_infinite"
			}
		}
	},
    ["5"] = {
		name = "Marine's Ford", 
		map = "marineford", 
		levels = {
			["1"] = {
				id = "marineford_level_1"
			}, 
			["2"] = {
				id = "marineford_level_2"
			}, 
			["3"] = {
				id = "marineford_level_3"
			}, 
			["4"] = {
				id = "marineford_level_4"
			}, 
			["5"] = {
				id = "marineford_level_5"
			}, 
			["6"] = {
				id = "marineford_level_6"
			},
            ["inf"] = {
				id = "marineford_infinite"
			}
		}
    },
	["6"] = {
		name = "Ghoul City", 
		map = "tokyo_ghoul", 
		levels = {
			["1"] = {
				id = "tokyoghoul_level_1"
			}, 
			["2"] = {
				id = "tokyoghoul_level_2"
			}, 
			["3"] = {
				id = "tokyoghoul_level_3"
			}, 
			["4"] = {
				id = "tokyoghoul_level_4"
			}, 
			["5"] = {
				id = "tokyoghoul_level_5"
			}, 
			["6"] = {
				id = "tokyoghoul_level_6"
			},
            ["inf"] = {
				id = "tokyoghoul_infinite"
			}
		}
	},
	["7"] = {
		name = "Hollow World", 
		map = "hueco", 
		levels = {
			["1"] = {
				id = "hueco_level_1"
			}, 
			["2"] = {
				id = "hueco_level_2"
			}, 
			["3"] = {
				id = "hueco_level_3"
			}, 
			["4"] = {
				id = "hueco_level_4"
			}, 
			["5"] = {
				id = "hueco_level_5"
			}, 
			["6"] = {
				id = "hueco_level_6"
			},
            ["inf"] = {
				id = "hueco_infinite"
			}
		}
	},
	["8"] = {
		name = "Ant Kingdom", 
		map = "hxhant", 
		levels = {
			["1"] = {
				id = "hxhant_level_1"
			}, 
			["2"] = {
				id = "hxhant_level_2"
			}, 
			["3"] = {
				id = "hxhant_level_3"
			}, 
			["4"] = {
				id = "hxhant_level_4"
			}, 
			["5"] = {
				id = "hxhant_level_5"
			}, 
			["6"] = {
				id = "hxhant_level_6"
			},
            ["inf"] = {
				id = "hxhant_infinite"
			}
		}
	},
    ["9"] = {
		name = "Magic Town", 
		map = "magnolia", 
		levels = {
			["1"] = {
				id = "magnolia_level_1"
			}, 
			["2"] = {
				id = "magnolia_level_2"
			}, 
			["3"] = {
				id = "magnolia_level_3"
			}, 
			["4"] = {
				id = "magnolia_level_4"
			}, 
			["5"] = {
				id = "magnolia_level_5"
			}, 
			["6"] = {
				id = "magnolia_level_6"
			},
            ["inf"] = {
				id = "magnolia_infinite"
			}
		}
	},
    ["10"] = {
		name = "Cursed Academy", 
		map = "jjk", 
		levels = {
			["1"] = {
				id = "jjk_level_1"
			}, 
			["2"] = {
				id = "jjk_level_2"
			}, 
			["3"] = {
				id = "jjk_level_3"
			}, 
			["4"] = {
				id = "jjk_level_4"
			}, 
			["5"] = {
				id = "jjk_level_5"
			}, 
			["6"] = {
				id = "jjk_level_6"
			},
            ["inf"] = {
				id = "jjk_infinite"
			}
		}
	},
	["11"] = {
		name = "Clover Kingdom", 
		map = "hage", 
		levels = {
			["1"] = {
				id = "clover_level_1"
			}, 
			["2"] = {
				id = "clover_level_2"
			}, 
			["3"] = {
				id = "clover_level_3"
			}, 
			["4"] = {
				id = "clover_level_4"
			}, 
			["5"] = {
				id = "clover_level_5"
			}, 
			["6"] = {
				id = "clover_level_6"
			},
            ["inf"] = {
				id = "clover_infinite"
			}
		}
	},
	["12"] = {
		name = "Cape Canaveral", 
		map = "space_center", 
		levels = {
			["1"] = {
				id = "jojo_level_1"
			}, 
			["2"] = {
				id = "jojo_level_2"
			}, 
			["3"] = {
				id = "jojo_level_3"
			}, 
			["4"] = {
				id = "jojo_level_4"
			}, 
			["5"] = {
				id = "jojo_level_5"
			}, 
			["6"] = {
				id = "jojo_level_6"
			},
            ["inf"] = {
				id = "jojo_infinite"
			}
		}
	},
	["13"] = {
		name = "Alien Ship", 
		map = "alien_ship", 
		levels = {
			["1"] = {
				id = "opm_level_1"
			}, 
			["2"] = {
				id = "opm_level_2"
			}, 
			["3"] = {
				id = "opm_level_3"
			}, 
			["4"] = {
				id = "opm_level_4"
			}, 
			["5"] = {
				id = "opm_level_5"
			}, 
			["6"] = {
				id = "opm_level_6"
			},
            ["inf"] = {
				id = "opm_infinite"
			}
		}
	}
}

local function GetNextLevel(currentLevel)
    for i, v in pairs(storyLevels) do
        for j, u in pairs(v.levels) do
            if currentLevel == u["id"] then
                if j ~= "6" then --assuming 6 levels per map
                    return v.levels[tostring(tonumber(j) + 1)]["id"]
                else
                    if storyLevels[tostring(i + 1)] then
                        return storyLevels[tostring(i + 1)]["levels"][tostring(1)]["id"]
                    else
                        return currentLevel
                    end
                end
            end
        end
    end
end

local function GetCurrentLevelId()
    if game.Workspace._MAP_CONFIG then
        return game:GetService("Workspace")._MAP_CONFIG.GetLevelData:InvokeServer()["id"]
    end
end

local function GetCurrentLevelName()
    if game.Workspace._MAP_CONFIG then
        return game:GetService("Workspace")._MAP_CONFIG.GetLevelData:InvokeServer()["name"]
    end
end

local function Webhook()
	pcall(function()
		local url = tostring(getgenv().webUrl) --webhook
		print("Webhook Check")
		if url == "" then
            print("No Webhook URL")
			return
		end 
			
    	experience = tostring(game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.LevelRewards.ScrollingFrame.XPReward.Main.Amount.Text)
		gems = tostring(game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.LevelRewards.ScrollingFrame.GemReward.Main.Amount.Text)
		completedWaves = game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.Middle.WavesCompleted.Text
		completionTime = game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.Middle.Timer.Text
		waveNumber = completedWaves:split(": ")
		timeNumber = completionTime:split(": ")

		local data = {
			["content"] = "",
			["username"] = "Anime Adventures",
			["avatar_url"] = "https://tr.rbxcdn.com/e5b5844fb26df605986b94d87384f5fb/150/150/Image/Jpeg",
			["embeds"] = {
				{
					["author"] = {
						["name"] = "Level Name: " .. GetCurrentLevelName() .. " | Result",
						["icon_url"] = "https://cdn.discordapp.com/emojis/997123585476927558.webp?size=96&quality=lossless"
					},
					["color"] = 0x00ff00,

					["thumbnail"] = {
						['url'] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.userId .. "&width=420&height=420&format=png"
					},

					["fields"] = {
						{
							["name"] = "Total Waves:",
							["value"] = tostring(waveNumber[2]) ..
								" <:wave:997136622363627530>",
							["inline"] = true
						}, {
							["name"] = "Recieved Gems:",
							["value"] = gems .. " 💎",
							["inline"] = true
						}, {
                            ["name"] = "Recieved XP:",
                            ["value"] = experience .. " 🧪",
                            ["inline"] = true
                        }, {
                            ["name"] = "Total Time:",
                            ["value"] = tostring(timeNumber[2]) .. " ⏳",
                            ["inline"] = true
                        }, {
                            ["name"] = "Current Gems:",
                            ["value"] = tostring(game.Players.LocalPlayer._stats.gem_amount.Value).." 💎",
                            ["inline"] = true
                        }, {
                            ["name"] = "Current Level:",
                            ["value"] = tostring(game.Players.LocalPlayer.PlayerGui.spawn_units.Lives.Main.Desc.Level.Text).. " ✨",
                            ["inline"] = true
                        }
					}
				}
			}
		}

		local discordMessageBody = game:GetService("HttpService"):JSONEncode(data)

		local headers = {["content-type"] = "application/json"}
		request = http_request or request or HttpPost or syn.request or http.request
		local discordMessageData = {Url = url, Body = discordMessageBody, Method = "POST", Headers = headers}
		warn("Sending webhook notification...")
		request(discordMessageData)
	end)
end

local function BabyWebhook()
	pcall(function()
		local url = tostring(getgenv().webUrl) --webhook
		print("Wave Webhook?")
		if url == "" then
            print("No Webhook Found!")
			return
		end 
		
        current_wave = tostring(game:GetService("Workspace")["_wave_num"].Value)
    	XP = tostring(game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.LevelRewards.ScrollingFrame.XPReward.Main.Amount.Text)
		gems = tostring(game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.LevelRewards.ScrollingFrame.GemReward.Main.Amount.Text)
        
        timeSinceStart = os.time(os.date("!*t")) - startTime
        gemsSinceStart = game.Players.LocalPlayer._stats.gem_amount.Value - startGems

		local data = {
			["content"] = "",
			["username"] = "Professional Gamer",
			["avatar_url"] = "https://i.pinimg.com/originals/1c/6c/55/1c6c55a47126ddf97931d9463876594c.jpg",
			["embeds"] = {
				{
					["author"] = {
						["name"] = "Current Level: " .. GetCurrentLevelName() .. " | " .. "Current Wave: " .. current_wave .. " - " .. tostring(game.Players.LocalPlayer.Name),
						["icon_url"] = "https://cdn.discordapp.com/emojis/997123585476927558.webp?size=96&quality=lossless"
					},
					["color"] = 0x00FFFF,

					["thumbnail"] = {
						['url'] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.userId .. "&width=420&height=420&format=png"
					},
					["fields"] = {
						{
                            ["name"] = "Current Gems:",
                            ["value"] = tostring(game.Players.LocalPlayer._stats.gem_amount.Value).." 💎",
                            ["inline"] = true
                        }, {
                            ["name"] = "Current Level:",
                            ["value"] = tostring(game.Players.LocalPlayer.PlayerGui.spawn_units.Lives.Main.Desc.Level.Text).. " ✨",
                            ["inline"] = true
                        },
                        {
                            ["name"] = "Estimated Gems per Hour:",
                            ["value"] = tostring(math.floor(gemsSinceStart / ((timeSinceStart + 82) / (60 * 60)))).." 💎",
                            ["inline"] = true
                        }
					}
				}
			}
		}

		local discordMessageBody = game:GetService("HttpService"):JSONEncode(data)

		local headers = {["content-type"] = "application/json"}
		request = http_request or request or HttpPost or syn.request or http.request
		local discordMessageData = {Url = url, Body = discordMessageBody, Method = "POST", Headers = headers}
		warn("Sending baby webhook notification...")
		print(request(discordMessageData).Success)
	end)
end

local function ShopSniperWebhook(test)
    test = test or false
	pcall(function()
		local url = tostring(getgenv().sniperUrl) --webhook
		print("Shop Sniper Webhook?")
		if url == "" then
            print("No Webhook Found!")
			return
		end
		
		print(game:GetService("ReplicatedStorage").src.client.Services.TravellingMerchantServiceClient)

        shop_items = require(game:GetService("ReplicatedStorage").src.client.Services["TravellingMerchantServiceClient"]).SELLING_ITEMS
        local shop_item_ids = {}
        
        print("exechere9")

		local data = {
			["content"] = "",
			["username"] = "Professional Gamer",
			["avatar_url"] = "https://i.pinimg.com/originals/1c/6c/55/1c6c55a47126ddf97931d9463876594c.jpg",
			["embeds"] = {
				{
					["author"] = {
						["name"] = "Bulma's Shop",
						["icon_url"] = "https://cdn.discordapp.com/emojis/997123585476927558.webp?size=96&quality=lossless"
					},
					["color"] = 0x00FFFF,

					["thumbnail"] = {
						['url'] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.userId .. "&width=420&height=420&format=png"
					},
					["fields"] = {}
				}
			}
		}
		
		print("exechere4")
		
		for i, item in pairs(shop_items) do
            table.insert(shop_item_ids, item["id"])
            if item["gem_cost"] then
                table.insert(data["embeds"][1]["fields"], {
                    ["name"] = item["id"],
                    ["value"] = item["gem_cost"] .. " 💎",
                    ["inline"] = true
                })
            else
                table.insert(data["embeds"][1]["fields"], {
                    ["name"] = item["id"],
                    ["value"] = item["gold_cost"] .. " 🪙",
                    ["inline"] = true
                })
            end
		end
    
        print(dump(data["embeds"][1]["fields"]))

        if not game:GetService("Workspace")["travelling_merchant"]["is_open"].Value then
            table.insert(data["embeds"][1]["fields"], {
                    ["name"] = "SHOP CLOSED",
                    ["value"] = "SHOP CLOSED",
                    ["inline"] = true
                })
        end
        print("exec1")
		local discordMessageBody = game:GetService("HttpService"):JSONEncode(data)

		local headers = {["content-type"] = "application/json"}
		request = http_request or request or HttpPost or syn.request or http.request
		local discordMessageData = {Url = url, Body = discordMessageBody, Method = "POST", Headers = headers}
        if getgenv().currentMerchantItems ~= shop_item_ids or test then
            getgenv().currentMerchantItems = shop_item_ids
            updatejson()
            warn("Sending sniper webhook notification...")
            request(discordMessageData)
        end
	end)
end

local function SpecialSummonSniperWebhook(test)
    test = test or false
	pcall(function()
		local url = tostring(getgenv().sniperUrl) --webhook
		print("Special Summon Sniper Webhook?")
		if url == "" then
            print("No Webhook Found!")
			return
		end
		
		local special_banner = game:GetService("Players").LocalPlayer.PlayerGui.HatchGuiNew.BannerFrames.EventClover.Main
        local units = {
            special_banner["Featured_One"],
            special_banner["Featured_Two"],
            special_banner["Featured_Three"]
        }

        local unitNamesForJson = {
            special_banner["Featured_One"].name.Text,
            special_banner["Featured_Two"].name.Text,
            special_banner["Featured_Three"].name.Text
        }

		local data = {
			["content"] = "",
			["username"] = "Professional Gamer",
			["avatar_url"] = "https://i.pinimg.com/originals/1c/6c/55/1c6c55a47126ddf97931d9463876594c.jpg",
			["embeds"] = {
				{
					["author"] = {
						["name"] = "Current Special Banner",
						["icon_url"] = "https://cdn.discordapp.com/emojis/997123585476927558.webp?size=96&quality=lossless"
					},
					["color"] = 0xFF00FF,

					["thumbnail"] = {
						['url'] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.userId .. "&width=420&height=420&format=png"
					}, 
                    ["fields"] = {
                        {
                            ["name"] = units[1].name.Text,
                            ["value"] = "(" .. units[1].Rarity.Text .. ") [Featured]",
                            ["inline"] = false
                        },
                        {
                            ["name"] = units[2].name.Text,
                            ["value"] = "(" .. units[2].Rarity.Text .. ")",
                            ["inline"] = false
                        },
                        {
                            ["name"] = units[3].name.Text,
                            ["value"] = "(" .. units[3].Rarity.Text .. ")",
                            ["inline"] = false
                        }
                    }
				}
			}
		}
		
		local discordMessageBody = game:GetService("HttpService"):JSONEncode(data)

		local headers = {["content-type"] = "application/json"}
		request = http_request or request or HttpPost or syn.request or http.request
		local discordMessageData = {Url = url, Body = discordMessageBody, Method = "POST", Headers = headers}
        if getgenv().currentSpecialBannerUnits ~= unitNamesForJson or test then
            getgenv().currentSpecialBannerUnits = unitNamesForJson
            updatejson()
            warn("Sending special sniper webhook notification...")
            request(discordMessageData)
        end
	end)
end

local function StandardSummonSniperWebhook(test)
    test = test or false
	pcall(function()
		local url = tostring(getgenv().sniperUrl) --webhook
		print("Standard Summon Sniper Webhook?")
		if url == "" then
            print("No Webhook Found!")
			return
		end

        local units = {
            game:GetService("Players").LocalPlayer.PlayerGui.HatchGuiNew.BannerFrames.Standard.Main.Scroll["1"].Main,
            game:GetService("Players").LocalPlayer.PlayerGui.HatchGuiNew.BannerFrames.Standard.Main.Scroll["2"].Main,
            game:GetService("Players").LocalPlayer.PlayerGui.HatchGuiNew.BannerFrames.Standard.Main.Scroll["3"].Main,
            game:GetService("Players").LocalPlayer.PlayerGui.HatchGuiNew.BannerFrames.Standard.Main.Scroll["4"].Main,
            game:GetService("Players").LocalPlayer.PlayerGui.HatchGuiNew.BannerFrames.Standard.Main.Scroll["5"].Main,
            game:GetService("Players").LocalPlayer.PlayerGui.HatchGuiNew.BannerFrames.Standard.Main.Scroll["6"].Main
        }

        local unitIdsForJson = {
            units[1].petimage.WorldModel:GetChildren()[1].Name,
            units[2].petimage.WorldModel:GetChildren()[1].Name,
            units[3].petimage.WorldModel:GetChildren()[1].Name,
            units[4].petimage.WorldModel:GetChildren()[1].Name,
            units[5].petimage.WorldModel:GetChildren()[1].Name,
            units[6].petimage.WorldModel:GetChildren()[1].Name
        }
        
		local data = {
			["content"] = "",
			["username"] = "Professional Gamer",
			["avatar_url"] = "https://i.pinimg.com/originals/1c/6c/55/1c6c55a47126ddf97931d9463876594c.jpg",
			["embeds"] = {
				{
					["author"] = {
						["name"] = "Current Standard Banner",
						["icon_url"] = "https://cdn.discordapp.com/emojis/997123585476927558.webp?size=96&quality=lossless"
					},
					["color"] = 0xFF00FF,
					["thumbnail"] = {
						['url'] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.userId .. "&width=420&height=420&format=png"
					}, 
                    ["fields"] = {}
				}
			}
		}


        for i, unit in pairs(units) do
            unit_stats = {
                ["name"] = unit.petimage.WorldModel:GetChildren()[1].Name,
                ["value"] = unit.Rarity.Text,
                ["inline"] = true
            }
            table.insert(data["embeds"][1]["fields"], unit_stats)
        end
        
		local discordMessageBody = game:GetService("HttpService"):JSONEncode(data)
		local headers = {["content-type"] = "application/json"}
		request = http_request or request or HttpPost or syn.request or http.request
		local discordMessageData = {Url = url, Body = discordMessageBody, Method = "POST", Headers = headers}
        if getgenv().currentStandardBannerUnits ~= unitIdsForJson or test then
            getgenv().currentStandardBannerUnits = unitIdsForJson
            updatejson()
            warn("Sending standard sniper webhook notification...")
            request(discordMessageData)
        end
	end)
end

local function NormalItemWebhook(test)
    test = test or false
	pcall(function()
		local url = tostring(getgenv().webUrl) --webhook
		print("Normal Item Webhook?")
		if url == "" then
            print("No Webhook Found!")
			return
		end
		
        local itemDifference = getItemChangesNormal(getgenv().startingInventoryNormalItems, getNormalItems())
        
		local data = {
			["content"] = "",
			["username"] = "Professional Gamer",
			["avatar_url"] = "https://i.pinimg.com/originals/1c/6c/55/1c6c55a47126ddf97931d9463876594c.jpg",
			["embeds"] = {
				{
					["author"] = {
						["name"] = "New Normal Items Acquired!",
						["icon_url"] = "https://cdn.discordapp.com/emojis/997123585476927558.webp?size=96&quality=lossless"
					},
					["color"] = 0xFF00FF,
					["thumbnail"] = {
						['url'] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.userId .. "&width=420&height=420&format=png"
					}
				}
			}
		}

		if itemDifference ~= nil and itemDifference ~= {} then
			
			for name, amount in pairs(itemDifference) do
				if data["embeds"][1]["fields"] == nil then
					data["embeds"][1]["fields"] = {}
				end
				item_stats = {
					["name"] = name,
					["value"] = amount,
					["inline"] = true
				}
				table.insert(data["embeds"][1]["fields"], item_stats)
			end
		end
        
		local discordMessageBody = game:GetService("HttpService"):JSONEncode(data)
		local headers = {["content-type"] = "application/json"}
		request = http_request or request or HttpPost or syn.request or http.request
		local discordMessageData = {Url = url, Body = discordMessageBody, Method = "POST", Headers = headers}
        
        warn("Sending normal item webhook notification...")
        request(discordMessageData)
	end)
end

local function UniqueItemWebhook(test)
    test = test or false
	pcall(function()
		local url = tostring(getgenv().webUrl) --webhook
		print("Unique Item Webhook?")
		if url == "" then
            print("No Webhook Found!")
			return
		end

        local itemDifference = getItemChangesUnique(getgenv().startingInventoryUniqueItems, getUniqueItems())
        
		local data = {
			["content"] = "",
			["username"] = "Professional Gamer",
			["avatar_url"] = "https://i.pinimg.com/originals/1c/6c/55/1c6c55a47126ddf97931d9463876594c.jpg",
			["embeds"] = {
				{
					["author"] = {
						["name"] = "New Unique Items Acquired!",
						["icon_url"] = "https://cdn.discordapp.com/emojis/997123585476927558.webp?size=96&quality=lossless"
					},
					["color"] = 0xFF00FF,
					["thumbnail"] = {
						['url'] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.userId .. "&width=420&height=420&format=png"
					}
				}
			}
		}

		if itemDifference ~= nil and itemDifference ~= {} then
			if data["embeds"][1]["fields"] == nil then
				data["embeds"][1]["fields"] = {}
			end
			for _, item in pairs(itemDifference) do
				item_stats = {
					["name"] = tostring(item),
					["value"] = "+1",
					["inline"] = true
				}
				table.insert(data["embeds"][1]["fields"], item_stats)
			end
		end
        
		local discordMessageBody = game:GetService("HttpService"):JSONEncode(data)
		local headers = {["content-type"] = "application/json"}
		request = http_request or request or HttpPost or syn.request or http.request
		local discordMessageData = {Url = url, Body = discordMessageBody, Method = "POST", Headers = headers}
        
		warn("Sending unique item webhook notification...")
        request(discordMessageData)
	end)
end

getgenv().UnitCache = {}

for _, Module in next, game:GetService("ReplicatedStorage"):WaitForChild("src"):WaitForChild("Data"):WaitForChild("Units"):GetDescendants() do
    if Module:IsA("ModuleScript") and Module.Name ~= "UnitPresets" then
        for UnitName, UnitStats in next, require(Module) do
            getgenv().UnitCache[UnitName] = UnitStats
        end
    end
end

--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--

function MainModule()
    local jsonData = readfile(saveFileName)
    local data = HttpService:JSONDecode(jsonData)

	getgenv().altCount = data.altcount
	getgenv().lowCpuMode = data.lowcpumode

    getgenv().AutoLeave = data.AutoLeave
    getgenv().AutoReplay = data.AutoReplay
    getgenv().AutoChallenge = data.AutoChallenge  
	getgenv().autoRaid = data.autoraid
	getgenv().autoPortal = data.autoportal
	getgenv().autoPortalCSM = data.autoportalcsm
    getgenv().selectedreward = data.selectedreward
    getgenv().AutoChallengeAll = data.AutoChallengeAll
    getgenv().disableAutoFarm = false
    getgenv().sellatwave = data.sellatwave 
    getgenv().quitAtWave = data.quitAtWave
    getgenv().autoSell = data.autoSell
    getgenv().autoQuit = data.autoQuit
    getgenv().AutoFarm = data.autofarm
    getgenv().AutoFarmIC = data.autofarmic
    getgenv().AutoFarmTP = data.autofarmtp
    getgenv().AutoLoadTP = data.autoloadtp
    getgenv().webUrl = data.webhook
    getgenv().sniperUrl = data.sniperwebhook
    getgenv().autoStart = data.autoStart
    getgenv().autoUpgrade = data.autoUpgrade
    getgenv().difficulty = data.difficulty
    getgenv().world = data.world
	getgenv().macroWorld = data.macroworld
	getgenv().raidWorld = data.raidworld
    getgenv().level = data.level
	getgenv().raidLevel = data.raidlevel
	getgenv().macroLevel = data.macrolevel
    getgenv().AutoContinue = data.autocontinue
    getgenv().nextLevel = data.nextlevel
    getgenv().currentMerchantItems = data.currentmerchantitems
    getgenv().currentSpecialBannerUnits = data.currentspecialbannerunits
    getgenv().currentStandardBannerUnits = data.currentstandardbannerunits

	getgenv().lockAutoFunctions = data.lockautofunctions

    getgenv().SpawnUnitPos = data.xspawnUnitPos
    getgenv().SelectedUnits = data.xselectedUnits
    getgenv().autoabilities = data.autoabilities

	getgenv().recordingMacro = data.recordingmacro
	getgenv().recordMacroOnTeleport = data.recordmacroonteleport
	getgenv().replayMacroOnTeleport = data.replaymacroonteleport
	getgenv().macroToReplay = data.macrotoreplay
	getgenv().levelMacros = data.levelmacros

	getgenv().altList = data.altlist
	getgenv().mainAccount = data.mainaccount
	getgenv().altMode = data.altmode

	getgenv().unitPlacementSettings = data.unitplacementsettings

    function updatejson()
        local xdata = {
			altcount = getgenv().altCount,
			lowcpumode = getgenv().lowCpuMode,

            autoloadtp = getgenv().AutoLoadTP,
            AutoLeave = getgenv().AutoLeave,
            AutoReplay = getgenv().AutoReplay,
            AutoChallenge = getgenv().AutoChallenge, 
			autoraid = getgenv().autoRaid,
			autoportal = getgenv().autoPortal,
			autoportalcsm = getgenv().autoPortalCSM,
            selectedreward = getgenv().selectedreward,
            AutoChallengeAll = getgenv().AutoChallengeAll, 
            sellatwave = getgenv().sellatwave,
            quitAtWave = getgenv().quitAtWave,
            autoSell = getgenv().autoSell,
            autoQuit = getgenv().autoQuit,
            webhook = getgenv().webUrl,
            sniperwebhook = getgenv().sniperUrl,
            autofarm = getgenv().AutoFarm,
            autofarmic = getgenv().AutoFarmIC,
            autofarmtp = getgenv().AutoFarmTP,
            autoStart = getgenv().autoStart,
            autoUpgrade = getgenv().autoUpgrade,
            difficulty = getgenv().difficulty,
            world = getgenv().world,
			macroworld = getgenv().macroWorld,
			raidworld = getgenv().raidWorld,
            level = getgenv().level,
			raidlevel = getgenv().raidLevel,
			macrolevel = getgenv().macroLevel,
            autocontinue = getgenv().AutoContinue,
            nextlevel = getgenv().nextLevel,
            currentmerchantitems = getgenv().currentMerchantItems,
            currentspecialbannerunits = getgenv().currentSpecialBannerUnits,
            currentstandardbannerunits = getgenv().currentStandardBannerUnits,
            --door = getgenv().door,

			lockautofunctions = getgenv().lockAutoFunctions,

            xspawnUnitPos = getgenv().SpawnUnitPos,
            xselectedUnits = getgenv().SelectedUnits,
            autoabilities = getgenv().autoabilities,

			recordingmacro = getgenv().recordingMacro,
			recordmacroonteleport = getgenv().recordMacroOnTeleport,
			replaymacroonteleport = getgenv().replayMacroOnTeleport,
			macrotoreplay = getgenv().macroToReplay,
			levelmacros = getgenv().levelMacros,

			altlist = getgenv().altList,
			mainaccount = getgenv().mainAccount,
			altmode = getgenv().altMode,

			unitplacementsettings = getgenv().unitPlacementSettings
        }

        local json = HttpService:JSONEncode(xdata)
        writefile(saveFileName, json)
    end

    --\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--
    --\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--
	if (getgenv().mainAccount == "nil") then
		getgenv().mainAccount = game.Players.LocalPlayer.Name
	end

	if (getgenv().altCount == nil) then
		getgenv().altCount = 1
	end

	if getgenv().autoPortal == nil then
		getgenv().autoPortal = false
	end

	if getgenv().autoPortalCSM == nil then
		getgenv().autoPortalCSM = false
	end

    local exec = tostring(identifyexecutor())
    RayfieldLib = RayfieldLibrary

	getgenv().isAlt = false

	print(tostring(game.Players.LocalPlayer.Name))
	print(getgenv().mainAccount)

	if tostring(game.Players.LocalPlayer.Name) ~= getgenv().mainAccount then
		print(tostring(game.Players.LocalPlayer.Name) .. " IS ALT")
		getgenv().isAlt = true
	end

	print(getgenv().isAlt)

	coroutine.resume(coroutine.create(function()
		while task.wait(0.1) do
			if isrbxactive() ~= true and getgenv().lowCpuMode then
				setfpscap(3)
				game:GetService("RunService"):Set3dRenderingEnabled(false)
			else
				setfpscap(100)
				game:GetService("RunService"):Set3dRenderingEnabled(true)
			end
		end
	end))


    mainWindow = RayfieldLibrary:CreateWindow({
        Name = "Anime Adventures " .. scriptVersion .. " - " .. exec .. " (ALT: " .. tostring(getgenv().isAlt) .. ")",
        LoadingTitle = "Anime Adventures " .. scriptVersion,
        LoadingSubtitle = "rewritten by Defrag"
    })

    local autoFarmTab = mainWindow:CreateTab("Auto Farm")
	local autoMacroTab = mainWindow:CreateTab("Auto Macro [BETA]")
    local webhookTab = mainWindow:CreateTab("Webhooks")

	local lowCpuToggle = autoFarmTab:CreateToggle({
			Name = "Turn on Low CPU Mode",
			CurrentValue = getgenv().lowCpuMode,
			Callback = function(bool)
				getgenv().lowCpuMode = bool
				updatejson()
			end})

    if game.PlaceId == 8304191830 then
		updatejson()
		local altsInGame = false
		if getgenv().altMode and not getgenv().isAlt then
			repeat 
				task.wait(1)
				local altsInGame = 0
				for _, val in pairs(game.Players:GetPlayers()) do
					for i, alt in pairs(getgenv().altList) do
						if tostring(val.Name) == tostring(alt) then
							print(val.Name)
							altsInGame += 1
							break
						end
					end
				end
			until altsInGame >= getgenv().altCount
		end

		if getgenv().altMode and getgenv().isAlt then
			local timer = 0
			local mainAccountFound = false
			repeat
				task.wait(1)
				timer += 1
				mainAccountFound = false
				for _, v in pairs(game.Players:GetPlayers()) do
					if tostring(v) == getgenv().mainAccount then
						mainAccountFound = true
						print("FOUND")
					end
				end
			until mainAccountFound

			if mainAccountFound ~= true then
				loadfile("TeleportTo.lua")()
			end
		end

		getgenv().recordingMacro = false
		autoMacroTab:CreateToggle({
			Name = "Record Macro on Map Join",
			CurrentValue = getgenv().recordMacroOnTeleport,
			Callback = function(bool)
				getgenv().recordMacroOnTeleport = bool
				updatejson()
			end})

		autoMacroTab:CreateToggle({
			Name = "Replay Macro on Map Join (TURN OFF RECORD MACRO)",
			CurrentValue = getgenv().replayMacroOnTeleport,
			Callback = function(bool)
				getgenv().replayMacroOnTeleport = bool
				updatejson()
			end})
		
		
		getgenv().macroLevels = {"nil"}

		--Level dropdown here
		local macroWorldDrop = autoMacroTab:CreateDropdown({
            Name = "Select Macro World", 
            Options = {"Planet Namak", "Shiganshinu District", "Snowy Town","Hidden Sand Village", "Marine's Ford",
        				"Ghoul City", "Hollow World", "Ant Kingdom", "Magic Town", "Cursed Academy","Clover Kingdom", 
						"Cape Canaveral", "Alien Ship", "Clover Kingdom [Elf Invasion]", "Hollow Invasion", "Cape Canaveral [Legend]", "Chainsaw Man Contract", "Storm Hideout"},
        CurrentOption = getgenv().macroWorld, 
        Callback = function(world)
            getgenv().macroWorld = world
            updatejson()

            if world == "Planet Namak" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"namek_infinite", "namek_level_1", "namek_level_2", "namek_level_3",
                                    	 "namek_level_4", "namek_level_5", "namek_level_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Shiganshinu District" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"aot_infinite", "aot_level_1", "aot_level_2", "aot_level_3", "aot_level_4",
                                    "aot_level_5", "aot_level_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Snowy Town" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"demonslayer_infinite", "demonslayer_level_1", "demonslayer_level_2",
                                    "demonslayer_level_3", "demonslayer_level_4", "demonslayer_level_5",
                                    "demonslayer_level_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Hidden Sand Village" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"naruto_infinite", "naruto_level_1", "naruto_level_2", "naruto_level_3",
                                    "naruto_level_4", "naruto_level_5", "naruto_level_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Marine's Ford" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"marineford_infinite","marineford_level_1","marineford_level_2","marineford_level_3",
                						 "marineford_level_4","marineford_level_5","marineford_level_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Ghoul City" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"tokyoghoul_infinite","tokyoghoul_level_1","tokyoghoul_level_2","tokyoghoul_level_3",
                                    "tokyoghoul_level_4","tokyoghoul_level_5","tokyoghoul_level_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Hollow World" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"hueco_infinite","hueco_level_1","hueco_level_2","hueco_level_3",
                                    "hueco_level_4","hueco_level_5","hueco_level_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Ant Kingdom" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"hxhant_infinite","hxhant_level_1","hxhant_level_2","hxhant_level_3",
                                    "hxhant_level_4","hxhant_level_5","hxhant_level_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
				end
            elseif world == "Magic Town" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"magnolia_infinite","magnolia_level_1","magnolia_level_2","magnolia_level_3",
                                    "magnolia_level_4","magnolia_level_5","magnolia_level_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Cursed Academy" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"jjk_infinite","jjk_level_1","jjk_level_2","jjk_level_3",
                                    "jjk_level_4","jjk_level_5","jjk_level_6","jjk_finger"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Clover Kingdom" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"clover_infinite","clover_level_1","clover_level_2","clover_level_3",
                                    	 "clover_level_4","clover_level_5","clover_level_6",}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
			elseif world == "Cape Canaveral" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"jojo_infinite","jojo_level_1","jojo_level_2","jojo_level_3","jojo_level_4","jojo_level_5","jojo_level_6",}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
			elseif world == "Alien Ship" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"opm_infinite","opm_level_1","opm_level_2","opm_level_3","opm_level_4","opm_level_5","opm_level_6","opm_portal_g"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Clover Kingdom [Elf Invasion]" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"clover_legend_1","clover_legend_2","clover_legend_3",}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Hollow Invasion" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"bleach_legend_1","bleach_legend_2","bleach_legend_3","bleach_legend_4","bleach_legend_5","bleach_legend_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Cape Canaveral [Legend]" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"jojo_legend_1","jojo_legend_2","jojo_legend_3","jojo_portal_pucci"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
			elseif world == "Planet Namak - Frozen" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"namek_winter_1", "namek_winter_2", "namek_winter_3",
                                    	 "namek_winter_4", "namek_winter_5", "namek_winter_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Shiganshinu District - Frozen" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = { "aot_winter_1", "aot_winter_2", "aot_winter_3", "aot_winter_4",
                                    "aot_winter_5", "aot_winter_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Snowy Town - Frozen" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = { "demonslayer_winter_1", "demonslayer_winter_2",
                                    "demonslayer_winter_3", "demonslayer_winter_4", "demonslayer_winter_5",
                                    "demonslayer_winter_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Hidden Sand Village - Frozen" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"naruto_winter_1", "naruto_winter_2", "naruto_winter_3",
                                    "naruto_winter_4", "naruto_winter_5", "naruto_winter_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Marine's Ford - Frozen" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"marineford_winter_1","marineford_winter_2","marineford_winter_3",
                						 "marineford_winter_4","marineford_winter_5","marineford_winter_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Ghoul City - Frozen" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"tokyoghoul_winter_1","tokyoghoul_winter_2","tokyoghoul_winter_3",
                                    "tokyoghoul_winter_4","tokyoghoul_winter_5","tokyoghoul_winter_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Hollow World - Frozen" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"hueco_winter_1","hueco_winter_2","hueco_winter_3",
                                    "hueco_winter_4","hueco_winter_5","hueco_winter_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Ant Kingdom - Frozen" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"hxhant_winter_1","hxhant_winter_2","hxhant_winter_3",
                                    "hxhant_winter_4","hxhant_winter_5","hxhant_winter_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
				end
            elseif world == "Magic Town - Frozen" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"magnolia_winter_1","magnolia_winter_2","magnolia_winter_3",
                                    "magnolia_winter_4","magnolia_winter_5","magnolia_winter_6"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Cursed Academy - Frozen" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"jjk_winter_1","jjk_winter_2","jjk_winter_3",
                                    "jjk_winter_4","jjk_winter_5","jjk_winter_6",}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Clover Kingdom - Frozen" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"clover_winter_1","clover_winter_2","clover_winter_3",
                                    	 "clover_winter_4","clover_winter_5","clover_winter_6",}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
			elseif world == "Cape Canaveral - Frozen" then
                getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"jojo_winter_1","jojo_winter_2","jojo_winter_3","jojo_winter_4","jojo_winter_5","jojo_winter_6",}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
            elseif world == "Chainsaw Man Contract" then
				getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"csm_portal_1","csm_portal_2","csm_portal_3","csm_portal_4","csm_portal_5","csm_portal_6","csm_portal_secret"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
			elseif world == "Storm Hideout" then
				getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"uchiha_level_1","uchiha_level_2","uchiha_level_3","uchiha_level_4","uchiha_level_5"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
			elseif world == "West City" then
				getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"west_city_raid"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
			elseif world == "Infinity Train" then
				getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"demonslayer_raid_1"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
			elseif world == "Shiganshinu District [Raid]" then
				getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"aot_raid_1"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
			elseif world == "Hidden Sand Village [Raid]" then
				getgenv().macroLevelDrop:Clear()
                table.clear(macroLevels)
                getgenv().macroLevels = {"naruto_raid_1"}
                for i, v in ipairs(macroLevels) do
                    getgenv().macroLevelDrop:Add(v)
                end
			end
        end})
        
        getgenv().macroLevelDrop = autoMacroTab:CreateDropdown({
            Name = "Select Macro Level", 
            Options = getgenv().macroLevels, 
            CurrentOption = getgenv().macroLevel, 
            Callback = function(level)
                getgenv().macroLevel = level
                updatejson()
            end})

		--macro bound to level dropdown here
		autoMacroTab:CreateDropdown({
			Name = "Macro to Run on Above Level",
			Options = listfiles("AAMacros" .. scriptVersion),
			CurrentOption = "nil",
			Callback = function(selectedFile)
				getgenv().selectedMacroFile = tostring(selectedFile)
				updatejson()
			end})

		--confirmation button here
		autoMacroTab:CreateButton({
			Name = "Confirm Selection",
			Callback = function()
				getgenv().levelMacros[getgenv().macroLevel] = tostring(getgenv().selectedMacroFile):gsub("\\", [[/]])
				updatejson()
			end})

        --------------------------------------------------
        --------------- Select Units Tab -----------------
        --------------------------------------------------
		local unitSelectSection = autoFarmTab:CreateSection("Select Units")

		local Units = {}

        local function LoadUnits()
			local reg = getreg() --> returns Roblox's registry in a table
            repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("collection"):FindFirstChild("grid"):FindFirstChild("List"):FindFirstChild("Outer"):FindFirstChild("UnitFrames")
            task.wait(2)
            table.clear(Units)
            for i,v in next, reg do
				if type(v) == 'function' then --> Checks if the current iteration is a function
					if getfenv(v).script then --> Checks if the function's environment is in a script
						for _, v in pairs(debug.getupvalues(v)) do --> Basically a for loop that prints everything, but in one line
							if type(v) == 'table' then
								if v["session"] then
									for sus, bak in pairs(v["session"]["profile_data"]['collection']['equipped_units']) do
										table.insert(Units, v["session"]["profile_data"]['collection']['owned_units'][bak]['unit_id'].." #"..bak)
									end
									return(1)
								end
							end
						end
					end
				end
			end
        end

        LoadUnits()

        local function Check(x, y)
			
            for i, v in ipairs(game:GetService("Players").LocalPlayer.PlayerGui.collection.grid.List.Outer.UnitFrames:GetChildren()) do
                if v:IsA("ImageButton") then
                    if v.EquippedList.Equipped.Visible == true then
                        if v.Main.petimage:GetChildren()[2].Name == x then
                            getgenv().SelectedUnits["U"..tostring(y)] = tostring(v.name.Text.." #"..v._uuid.Value)
                            updatejson()
                            return true
                        end
                    end
                end
            end
        end

        local function Equip()
            --[[game:GetService("ReplicatedStorage").endpoints.client_to_server.unequip_all:InvokeServer()
            
            for i = 1, 6 do
                local unitinfo = getgenv().SelectedUnits["U" .. i]
                warn(unitinfo)
                if unitinfo ~= nil then
                    local unitinfo_ = unitinfo:split(" #")
                    task.wait(0.5)
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.equip_unit:InvokeServer(unitinfo_[2])
                end
            end]]

			equippedUnits = {}
			local reg = getreg() --> returns Roblox's registry in a table
		
			for i,v in next, reg do
				if type(v) == 'function' then --> Checks if the current iteration is a function
					if getfenv(v).script then --> Checks if the function's environment is in a script
						for _, v in pairs(debug.getupvalues(v)) do --> Basically a for loop that prints everything, but in one line
							if type(v) == 'table' then
								if v["session"] then
									for sus, bak in pairs(v["session"]["profile_data"]['collection']['equipped_units']) do
										table.insert(equippedUnits, {bak, v["session"]["profile_data"]['collection']['owned_units'][bak]['unit_id']})
									end
									break
								end
							end
						end
					end
				end
			end
			
            updatejson()
        end

		

        autoFarmTab:CreateButton({
            Name = "Select Equipped Units", 
            Callback = function()
                equippedUnits = {}
				local reg = getreg() --> returns Roblox's registry in a table
			
				for i,v in next, reg do
					if type(v) == 'function' then --> Checks if the current iteration is a function
						if getfenv(v).script then --> Checks if the function's environment is in a script
							for _, v in pairs(debug.getupvalues(v)) do --> Basically a for loop that prints everything, but in one line
								if type(v) == 'table' then
									if v["session"] then
										local iter = 1
										for sus, bak in pairs(v["session"]["profile_data"]['collection']['equipped_units']) do
											equippedUnits[tonumber(sus)] = {bak, v["session"]["profile_data"]['collection']['owned_units'][bak]['unit_id'], sus}
											iter += 1
										end
										break
									end
								end
							end
						end
					end
				end

				for i = 1, 6 do
					if equippedUnits[i] == nil then
						equippedUnits[i] = {"nil", "nil"}
					end
					getgenv().SelectedUnits["U"..tostring(i)] = equippedUnits[i][2].." #"..equippedUnits[i][1]
				end

				updatejson()
                
                RayfieldLib:Notify({
                Title = "Equipped Units Are Selected!",
                Content = "The dropdowns may not show the unit names now, but it will show next time you execute!",
                Duration = 6.5,
                Image = 4483362458,
                Actions = { -- Notification Buttons
                    Ignore = {
                        Name = "Okay!",
                        Callback = function()
                            print("The user tapped Okay!")
                        end},
                    },
                })
            end
        })

        local drop = autoFarmTab:CreateDropdown({
            Name = "Unit 1",
            Options = Units,
            CurrentOption = getgenv().SelectedUnits["U1"] or "nil",
            Callback = function(selectedUnit)
                getgenv().SelectedUnits["U1"] = selectedUnit
                Equip()
                Dropdown:Set(selectedUnit)
            end,
        })

        local drop2 = autoFarmTab:CreateDropdown({
            Name = "Unit 2",
            Options = Units,
            CurrentOption = getgenv().SelectedUnits["U2"] or "nil",
            Callback = function(selectedUnit)
                getgenv().SelectedUnits["U2"] = selectedUnit
                Equip()
                Dropdown:Set(selectedUnit)
            end,
        })

        local drop3 = autoFarmTab:CreateDropdown({
            Name = "Unit 3",
            Options = Units,
            CurrentOption = getgenv().SelectedUnits["U3"] or "nil",
            Callback = function(selectedUnit)
                getgenv().SelectedUnits["U3"] = selectedUnit
                Equip()
                Dropdown:Set(selectedUnit)
            end,
        })

        local drop4 = autoFarmTab:CreateDropdown({
            Name = "Unit 4",
            Options = Units,
            CurrentOption = getgenv().SelectedUnits["U4"] or "nil",
            Callback = function(selectedUnit)
                getgenv().SelectedUnits["U4"] = selectedUnit
                Equip()
                Dropdown:Set(selectedUnit)
            end,
        })

        local axx =  game.Players.LocalPlayer.PlayerGui["spawn_units"].Lives.Main.Desc.Level.Text:split(" ")
        _G.drop5 = nil
        _G.drop6 = nil

        if tonumber(axx[2]) >= 20 then
            _G.drop5 = autoFarmTab:CreateDropdown({
                Name = "Unit 5",
                Options = Units,
                CurrentOption = getgenv().SelectedUnits["U5"] or "nil",
                Callback = function(selectedUnit)
                    getgenv().SelectedUnits["U5"] = selectedUnit
                    Equip()
                    Dropdown:Set(selectedUnit)
                end,
            })
        end

        if tonumber(axx[2]) >= 50 then
            _G.drop6 = autoFarmTab:CreateDropdown({
                Name = "Unit 6",
                Options = Units,
                CurrentOption = getgenv().SelectedUnits["U6"] or "nil",
                Callback = function(selectedUnit)
                    getgenv().SelectedUnits["U6"] = selectedUnit
                    Equip()
                    Dropdown:Set(selectedUnit)
                end,
            })
        end

        local selectWorldSection = autoFarmTab:CreateSection("Select World")

        getgenv().levels = {"nil"}
		getgenv().raidLevels = {"nil"}

        getgenv().diff = autoFarmTab:CreateDropdown({
            Name = "Select Difficulty",
            Options = {"Normal", "Hard"},
            CurrentOption = getgenv().difficulty,
            Callback = function(diff)
                getgenv().difficulty = diff
                updatejson()
            end,
        })

		getgenv().leveldrop = autoFarmTab:CreateDropdown({
            Name = "Select Level", 
            Options = getgenv().levels, 
            CurrentOption = getgenv().level, 
            Callback = function(level)
                getgenv().level = level
                updatejson()
            end})
		

        local worlddrop = autoFarmTab:CreateDropdown({
            Name = "Select World", 
            Options = {"Planet Namak", "Shiganshinu District", "Snowy Town","Hidden Sand Village", "Marine's Ford",
        "Ghoul City", "Hollow World", "Hollow Invasion", "Ant Kingdom", "Magic Town", "Cursed Academy","Clover Kingdom", "Clover Kingdom [Elf Invasion]", "Cape Canaveral","Cape Canaveral [Legend]", "Alien Ship"},
        CurrentOption = getgenv().world, 
        Callback = function(world)
            getgenv().world = world
            updatejson()

            if world == "Planet Namak" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"namek_infinite", "namek_level_1", "namek_level_2", "namek_level_3",
                                    "namek_level_4", "namek_level_5", "namek_level_6"}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
            elseif world == "Shiganshinu District" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"aot_infinite", "aot_level_1", "aot_level_2", "aot_level_3", "aot_level_4",
                                    "aot_level_5", "aot_level_6"}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
            elseif world == "Snowy Town" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"demonslayer_infinite", "demonslayer_level_1", "demonslayer_level_2",
                                    "demonslayer_level_3", "demonslayer_level_4", "demonslayer_level_5",
                                    "demonslayer_level_6"}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
            elseif world == "Hidden Sand Village" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"naruto_infinite", "naruto_level_1", "naruto_level_2", "naruto_level_3",
                                    "naruto_level_4", "naruto_level_5", "naruto_level_6"}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
            elseif world == "Marine's Ford" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"marineford_infinite","marineford_level_1","marineford_level_2","marineford_level_3",
                "marineford_level_4","marineford_level_5","marineford_level_6"}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
            elseif world == "Ghoul City" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"tokyoghoul_infinite","tokyoghoul_level_1","tokyoghoul_level_2","tokyoghoul_level_3",
                                    "tokyoghoul_level_4","tokyoghoul_level_5","tokyoghoul_level_6"}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
            elseif world == "Hollow World" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"hueco_infinite","hueco_level_1","hueco_level_2","hueco_level_3",
                                    "hueco_level_4","hueco_level_5","hueco_level_6"}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
            elseif world == "Ant Kingdom" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"hxhant_infinite","hxhant_level_1","hxhant_level_2","hxhant_level_3",
                                    "hxhant_level_4","hxhant_level_5","hxhant_level_6"}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
               
            elseif world == "Magic Town" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"magnolia_infinite","magnolia_level_1","magnolia_level_2","magnolia_level_3",
                                    "magnolia_level_4","magnolia_level_5","magnolia_level_6"}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
            elseif world == "Cursed Academy" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"jjk_infinite","jjk_level_1","jjk_level_2","jjk_level_3",
                                    "jjk_level_4","jjk_level_5","jjk_level_6","jjk_finger"}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
            elseif world == "Clover Kingdom" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"clover_infinite","clover_level_1","clover_level_2","clover_level_3",
                                    "clover_level_4","clover_level_5","clover_level_6",}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
            elseif world == "Clover Legend - HARD" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"clover_legend_1","clover_legend_2","clover_legend_3",}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
            elseif world == "Hollow Legend - HARD" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"bleach_legend_1","bleach_legend_2","bleach_legend_3","bleach_legend_4","bleach_legend_5","bleach_legend_6"}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
            elseif world == "Cape Canaveral" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"jojo_infinite","jojo_level_1","jojo_level_2","jojo_level_3","jojo_level_4","jojo_level_5","jojo_level_6",}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
			elseif world == "Alien Ship" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"opm_infinite","opm_level_1","opm_level_2","opm_level_3","opm_level_4","opm_level_5","opm_level_6","opm_portal_g"}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
            elseif world == "Clover Kingdom [Elf Invasion]" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"clover_legend_1","clover_legend_2","clover_legend_3",}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
            elseif world == "Hollow Invasion" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"bleach_legend_1","bleach_legend_2","bleach_legend_3","bleach_legend_4","bleach_legend_5","bleach_legend_6"}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
            elseif world == "Cape Canaveral [Legend]" then
                getgenv().leveldrop:Clear()
                table.clear(levels)
                getgenv().levels = {"jojo_legend_1","jojo_legend_2","jojo_legend_3","jojo_portal_pucci"}
                for i, v in ipairs(levels) do
                    getgenv().leveldrop:Add(v)
                end
			end
        end})
        
		getgenv().raiddrop = autoFarmTab:CreateDropdown({
            Name = "Select Raid Level", 
            Options = getgenv().raidLevels, 
            CurrentOption = getgenv().raidLevel, 
            Callback = function(raidLevel)
                getgenv().raidLevel = raidLevel
                updatejson()
            end})

		local raiddrop = autoFarmTab:CreateDropdown({
            Name = "Select Raid World", 
            Options = {"Storm Hideout", "West City", "Infinity Train", "Shiganshinu District [Raid]","Hidden Sand Village [Raid]"},
        CurrentOption = getgenv().raidWorld, 
        Callback = function(raidWorld)
            getgenv().raidWorld = raidWorld
            updatejson()

			if raidWorld == "Storm Hideout" then
				getgenv().raiddrop:Clear()
				getgenv().raidLevels = {"uchiha_level_1","uchiha_level_2","uchiha_level_3","uchiha_level_4","uchiha_level_5"}
				for i, v in ipairs(getgenv().raidLevels) do
					getgenv().raiddrop:Add(v)
				end
			elseif raidWorld == "West City" then
				getgenv().raiddrop:Clear()
				getgenv().raidLevels = {"west_city_raid"}
				for i, v in ipairs(getgenv().raidLevels) do
					getgenv().raiddrop:Add(v)
				end
			elseif raidWorld == "Infinity Train" then
				getgenv().raiddrop:Clear()
				getgenv().raidLevels = {"demonslayer_raid_1"}
				for i, v in ipairs(getgenv().raidLevels) do
					getgenv().raiddrop:Add(v)
				end
			elseif raidWorld == "Shiganshinu District [Raid]" then
				getgenv().raiddrop:Clear()
				getgenv().raidLevels = {"aot_raid_1"}
				for i, v in ipairs(getgenv().raidLevels) do
					getgenv().raiddrop:Add(v)
				end
			elseif raidWorld == "Hidden Sand Village [Raid]" then
				getgenv().raiddrop:Clear()
				getgenv().raidLevels = {"naruto_raid_1"}
				for i, v in ipairs(getgenv().raidLevels) do
					getgenv().raiddrop:Add(v)
				end
			end
        end})

		--------------------------------------------------
		------------------ Auto Farm Tab -----------------
		--------------------------------------------------
        
        local autoFarmSection = autoFarmTab:CreateSection("Auto-Farm")
		
		autoFarmTab:CreateToggle({
            Name = "Alt Mode", 
            CurrentValue = getgenv().altMode, 
            Callback = function(bool)
                getgenv().altMode = bool
                updatejson()
            end})
		
        autoFarmTab:CreateToggle({
            Name = "Auto Continue", 
            CurrentValue = getgenv().AutoContinue, 
            Callback = function(bool)
                getgenv().AutoContinue = bool
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Replay", 
            CurrentValue = getgenv().AutoReplay, 
            Callback = function(bool)
                getgenv().AutoReplay = bool
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Leave", 
            CurrentValue = getgenv().AutoLeave, 
            Callback = function(bool)
                getgenv().AutoLeave = bool
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Farm Event", 
            CurrentValue = getgenv().AutoFarmTP, 
            Callback = function(bool)
                getgenv().AutoFarmTP = bool
                updatejson()
            end})

		autoFarmTab:CreateToggle({
			Name = "Auto Raid", 
			CurrentValue = getgenv().autoRaid, 
			Callback = function(bool)
				getgenv().autoRaid = bool
				updatejson()
			end})

		autoFarmTab:CreateToggle({
            Name = "Auto Farm OPM Portals", 
            CurrentValue = getgenv().autoPortal, 
            Callback = function(bool)
                getgenv().autoPortal = bool
                updatejson()
            end})

		autoFarmTab:CreateToggle({
            Name = "Auto Farm CSM Portals", 
            CurrentValue = getgenv().autoPortalCSM, 
            Callback = function(bool)
                getgenv().autoPortalCSM = bool
                updatejson()
            end})
        
        autoFarmTab:CreateToggle({
            Name = "Auto Start Infinity Castle", 
            CurrentValue = getgenv().AutoFarmIC, 
            Callback = function(bool)
                getgenv().AutoFarmIC = bool
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Farm", 
            CurrentValue = getgenv().AutoFarm, 
            Callback = function(bool)
                getgenv().AutoFarm = bool
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Start", 
            CurrentValue = getgenv().autoStart, 
            Callback = function(bool)
                getgenv().autoStart = bool
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Abilities", 
            CurrentValue = getgenv().autoabilities, 
            Callback = function(bool)
                getgenv().autoabilities = bool
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Upgrade Units", 
            CurrentValue = getgenv().autoUpgrade, 
            Callback = function(bool)
                getgenv().autoUpgrade = bool
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Sell at Specific Wave", 
            CurrentValue = getgenv().autoSell, 
            Callback = function(bool)
                getgenv().autoSell = bool
                updatejson()
                if getgenv().autoSell == false then
                    getgenv().disableAutoFarm = false
                end
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Quit at Specific Wave", 
            CurrentValue = getgenv().autoQuit, 
            Callback = function(bool)
                getgenv().autoQuit = bool
                updatejson()
            end})

        autoFarmTab:CreateInput({
            Name = "Select Wave Number for Auto Sell {Press Enter}", 
            PlaceholderText = tostring(getgenv().sellatwave), 
            RemoveTextAfterFocusLost = false,
            Callback = function(t)
                getgenv().sellatwave = tonumber(t)
                updatejson()
            end})

        autoFarmTab:CreateInput({
            Name = "Select Wave Number for Auto Quit {Press Enter}", 
            PlaceholderText = tostring(getgenv().quitAtWave), 
            RemoveTextAfterFocusLost = false,
            Callback = function(t)
                getgenv().quitAtWave = tonumber(t)
                updatejson()
            end})

        local autoLoadSection = autoFarmTab:CreateSection("Auto Load Script")
		autoFarmTab:CreateLabel("This Automatically executes script when you teleport to the main area.")
        autoFarmTab:CreateLabel("You don't need to put the script in your autoexec folder!")
        autoFarmTab:CreateToggle({
            Name = "Auto Load Script",
            CurrentValue = getgenv().AutoLoadTP,
            Callback =  function(bool)
                getgenv().AutoLoadTP = bool
                updatejson()
                if exec == "Synapse X" and getgenv().AutoLoadTP then
                    syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Tesseract1234567890/animeadv/main/script.lua'))()")

                    if exec == "Synapse X" then
                        syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Tesseract1234567890/animeadv/main/script.lua'))()")
                        RayfieldLib:Notify({
                            Title = "Queued to Auto-Attach on Teleport!",
                            Content =  "Success",
                            Duration = 6.5,
                            Actions = { -- Notification Buttons
                                Ignore = {
                                    Name = "Okay!",
                                    Callback = function()
                                        print("The user tapped Okay!")
                                    end
                                }
                            }
                        })
                    end

                elseif exec ~= "Synapse X" and getgenv().AutoLoadTP then
                    queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Tesseract1234567890/animeadv/main/script.lua'))()")
                end

        end})
        autoFarmTab:CreateLabel("If it doesn't work properly, then put the script in autoexec folder.")

        



        --------------------------------------------
        
        local autoChallengeSection = autoFarmTab:CreateSection("Auto-Challenge")
        
        autoFarmTab:CreateToggle({
            Name = "Auto Challenge", 
            CurrentValue = getgenv().AutoChallenge, 
            Callback = function(bool)
                getgenv().AutoChallenge = bool
                updatejson()
            end})
        
        local worlddrop = autoFarmTab:CreateDropdown({
            Name = "Select Reward",
            Options = {"star_fruit_random","star_remnant","gems", "gold"},
            CurrentOption = getgenv().selectedreward, 
            Callback = function(reward)
                getgenv().selectedreward = reward
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Farm All Rewards", 
            CurrentValue = getgenv().AutoChallengeAll, 
            Callback = function(bool)
                getgenv().AutoChallengeAll = bool
                updatejson()
            end})
        
        getgenv().UnitSellTog = false
        getgenv().autosummontickets = false
        getgenv().autosummongem = false
        getgenv().autosummongem10 = false

        getgenv().autosummonticketse = false
        getgenv().autosummongeme = false
        getgenv().autosummongem10e = false

        local autoBuySellSection = autoFarmTab:CreateSection("Auto Buy/Sell")


        local function autobuyfunc(xx, item)
            task.wait()

            local args = {
                [1] = xx,
                [2] = item
            }
            game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_from_banner:InvokeServer(unpack(args))
            
        end

        autoFarmTab:CreateLabel("Special Banner - 2x Mythic")
        autoFarmTab:CreateToggle({
            Name = "Auto Summon {Use Ticket}",
            CurrentValue =  getgenv().autosummonticketse, 
            Callback = function(bool)
                getgenv().autosummonticketse = bool
                while getgenv().autosummonticketse do
                    autobuyfunc("EventClover", "ticket")
                end
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Summon {Buy 1}", 
            CurrentValue = getgenv().autosummongeme,
            Callback = function(bool)
            getgenv().autosummongeme = bool
            while getgenv().autosummongeme do
                autobuyfunc("EventClover", "gems")
            end
            updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Summon {Buy 10}", 
            CurrentValue = getgenv().autosummongem10e,
            Callback = function(bool)
                getgenv().autosummongem10e = bool
                while getgenv().autosummongem10e do
                    autobuyfunc("EventClover", "gems10")
                end
                updatejson()
            end})

        autoFarmTab:CreateLabel("Standard Banner")

        autoFarmTab:CreateToggle({
            Name = "Auto Summon {Use Ticket}",
            CurrentValue = getgenv().autosummontickets, 
            Callback = function(bool)
                getgenv().autosummontickets = bool
                while getgenv().autosummontickets do
                    autobuyfunc("Standard", "ticket")
                end
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Summon {Buy 1}", 
            CurrentValue = getgenv().autosummongem,
            Callback = function(bool)
            getgenv().autosummongem = bool
            while getgenv().autosummongem do
                autobuyfunc("Standard", "gems")
            end
            updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Summon {Buy 10}", 
            CurrentValue = getgenv().autosummongem10,
            Callback = function(bool)
                getgenv().autosummongem10 = bool
                while getgenv().autosummongem10 do
                    autobuyfunc("Standard", "gems10")
                end
                updatejson()
            end})

        autoFarmTab:CreateLabel("Sell Units")
        local utts = autoFarmTab:CreateDropdown({
            Name = "Select Rarity", 
            Options = {"Rare", "Epic"}, 
            CurrentOption = tostring(getgenv().UnitToSell), 
            Callback = function(u)
                getgenv().UnitToSell = u
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Sell Units", 
            CurrentValue = getgenv().UnitSellTog, 
            Callback = function(bool)
                getgenv().UnitSellTog = bool
            end}) 
		
		local webhookSection = webhookTab:CreateSection("Webhooks")
		
		webhookTab:CreateLabel("Webhooks send notifications in Discord everytime a game is finished!")
			
		local webhookPlaceholder

		if getgenv().webUrl == "" then
			webhookPlaceholder = "Insert URL here!"
		else
			webhookPlaceholder = "Good to go!"
		end
		webhookTab:CreateInput({
			Name = "Webhook URL {Press Enter}" , 
			PlaceholderText = webhookPlaceholder, 
			RemoveTextAfterFocusLost = false, 
			Callback = function(web_url)
				getgenv().webUrl = web_url
				updatejson()
		end})
		
		local sniperWebhookPlaceholder
		if getgenv().sniperUrl == "" then
			sniperWebhookPlaceholder = "Insert URL here!"
		else
			sniperWebhookPlaceholder = "Good to go!"
		end
	
		webhookTab:CreateInput({
			Name = "Sniper Webhook URL {Press Enter}" , 
			PlaceholderText = sniperWebhookPlaceholder, 
			RemoveTextAfterFocusLost = false, 
			Callback = function(sniper_url)
				getgenv().sniperUrl = sniper_url
				updatejson()
		end})
	
		webhookTab:CreateButton({
			Name = "Test Regular Webhooks", 
			Callback = function()
				Webhook()
				BabyWebhook()
				NormalItemWebhook(true)
				UniqueItemWebhook(true)
			end})
	
		webhookTab:CreateButton({
			Name = "Test Sniper Webhooks", 
			Callback = function()
				ShopSniperWebhook(true)
				SpecialSummonSniperWebhook(true)
				StandardSummonSniperWebhook(true)
			end})


	else -- When in a match
		getgenv().lockAutoFunctions = false
		updatejson()

		unitPlacementTab = mainWindow:CreateTab("Unit Placement Settings")
		local Paragraph = unitPlacementTab:CreateParagraph({Title = "How to Use", 
															Content = "Placement Priority: If multiple units can be placed with current money, prioritizes higher numbered unit.\nUpgrade Priority: Same concept as Placement Priority.\nPlace From Wave: Will not place a unit until this wave.\nUpgrade From Wave: Will not upgrade a unit until this wave.\nUpgrade Cap: Will not upgrade a unit past this level."})
		unitOneSection = unitPlacementTab:CreateSection("Unit 1 - " .. getgenv().SelectedUnits["U1"]:split(" #")[1])

		unitOnePlacementPriority = unitPlacementTab:CreateInput({
			Name = "Placement Priority",
			PlaceholderText = getgenv().unitPlacementSettings["U1"]["placementPriority"],
			RemoveTextAfterFocusLost = false,
			Callback = function(placementPriority)
				getgenv().unitPlacementSettings["U1"]["placementPriority"] = placementPriority
				updatejson()
			end,
		})

		unitOneUpgradePriority = unitPlacementTab:CreateInput({
			Name = "Upgrade Priority",
			PlaceholderText = getgenv().unitPlacementSettings["U1"]["upgradePriority"],
			RemoveTextAfterFocusLost = false,
			Callback = function(upgradePriority)
				getgenv().unitPlacementSettings["U1"]["upgradePriority"] = upgradePriority
				updatejson()
			end,
		})

		unitOnePlaceFromWave = unitPlacementTab:CreateInput({
			Name = "Place From Wave",
			PlaceholderText = getgenv().unitPlacementSettings["U1"]["placeFromWave"],
			RemoveTextAfterFocusLost = false,
			Callback = function(placeFromWave)
				getgenv().unitPlacementSettings["U1"]["placeFromWave"] = placeFromWave
				updatejson()
			end,
		})

		unitOneUpgradeFromWave = unitPlacementTab:CreateInput({
			Name = "Upgrade From Wave",
			PlaceholderText = getgenv().unitPlacementSettings["U1"]["upgradeFromWave"],
			RemoveTextAfterFocusLost = false,
			Callback = function(upgradeFromWave)
				getgenv().unitPlacementSettings["U1"]["upgradeFromWave"] = upgradeFromWave
				updatejson()
			end,
		})

		unitOneUpgradeCap = unitPlacementTab:CreateInput({
			Name = "Upgrade Cap",
			PlaceholderText = getgenv().unitPlacementSettings["U1"]["upgradeCap"],
			RemoveTextAfterFocusLost = false,
			Callback = function(upgradeCap)
				getgenv().unitPlacementSettings["U1"]["upgradeCap"] = upgradeCap
				updatejson()
			end,
		})

		unitTwoSection = unitPlacementTab:CreateSection("Unit 2 - " .. getgenv().SelectedUnits["U2"]:split(" #")[1])

		unitTwoPlacementPriority = unitPlacementTab:CreateInput({
			Name = "Placement Priority",
			PlaceholderText = getgenv().unitPlacementSettings["U2"]["placementPriority"],
			RemoveTextAfterFocusLost = false,
			Callback = function(placementPriority)
				getgenv().unitPlacementSettings["U2"]["placementPriority"] = placementPriority
				updatejson()
			end,
		})

		unitTwoUpgradePriority = unitPlacementTab:CreateInput({
			Name = "Upgrade Priority",
			PlaceholderText = getgenv().unitPlacementSettings["U2"]["upgradePriority"],
			RemoveTextAfterFocusLost = false,
			Callback = function(upgradePriority)
				getgenv().unitPlacementSettings["U2"]["upgradePriority"] = upgradePriority
				updatejson()
			end,
		})

		unitTwoPlaceFromWave = unitPlacementTab:CreateInput({
			Name = "Place From Wave",
			PlaceholderText = getgenv().unitPlacementSettings["U2"]["placeFromWave"],
			RemoveTextAfterFocusLost = false,
			Callback = function(placeFromWave)
				getgenv().unitPlacementSettings["U2"]["placeFromWave"] = placeFromWave
				updatejson()
			end,
		})

		unitTwoUpgradeFromWave = unitPlacementTab:CreateInput({
			Name = "Upgrade From Wave",
			PlaceholderText = getgenv().unitPlacementSettings["U2"]["upgradeFromWave"],
			RemoveTextAfterFocusLost = false,
			Callback = function(upgradeFromWave)
				getgenv().unitPlacementSettings["U2"]["upgradeFromWave"] = upgradeFromWave
				updatejson()
			end,
		})

		unitTwoUpgradeCap = unitPlacementTab:CreateInput({
			Name = "Upgrade Cap",
			PlaceholderText = getgenv().unitPlacementSettings["U2"]["upgradeCap"],
			RemoveTextAfterFocusLost = false,
			Callback = function(upgradeCap)
				getgenv().unitPlacementSettings["U2"]["upgradeCap"] = upgradeCap
				updatejson()
			end,
		})

		unitThreeSection = unitPlacementTab:CreateSection("Unit 3 - " .. getgenv().SelectedUnits["U3"]:split(" #")[1])

		unitThreePlacementPriority = unitPlacementTab:CreateInput({
			Name = "Placement Priority",
			PlaceholderText = getgenv().unitPlacementSettings["U3"]["placementPriority"],
			RemoveTextAfterFocusLost = false,
			Callback = function(placementPriority)
				getgenv().unitPlacementSettings["U3"]["placementPriority"] = placementPriority
				updatejson()
			end,
		})

		unitThreeUpgradePriority = unitPlacementTab:CreateInput({
			Name = "Upgrade Priority",
			PlaceholderText = getgenv().unitPlacementSettings["U3"]["upgradePriority"],
			RemoveTextAfterFocusLost = false,
			Callback = function(upgradePriority)
				getgenv().unitPlacementSettings["U3"]["upgradePriority"] = upgradePriority
				updatejson()
			end,
		})

		unitThreePlaceFromWave = unitPlacementTab:CreateInput({
			Name = "Place From Wave",
			PlaceholderText = getgenv().unitPlacementSettings["U3"]["placeFromWave"],
			RemoveTextAfterFocusLost = false,
			Callback = function(placeFromWave)
				getgenv().unitPlacementSettings["U3"]["placeFromWave"] = placeFromWave
				updatejson()
			end,
		})

		unitThreeUpgradeFromWave = unitPlacementTab:CreateInput({
			Name = "Upgrade From Wave",
			PlaceholderText = getgenv().unitPlacementSettings["U3"]["upgradeFromWave"],
			RemoveTextAfterFocusLost = false,
			Callback = function(upgradeFromWave)
				getgenv().unitPlacementSettings["U3"]["upgradeFromWave"] = upgradeFromWave
				updatejson()
			end,
		})

		unitThreeUpgradeCap = unitPlacementTab:CreateInput({
			Name = "Upgrade Cap",
			PlaceholderText = getgenv().unitPlacementSettings["U3"]["upgradeCap"],
			RemoveTextAfterFocusLost = false,
			Callback = function(upgradeCap)
				getgenv().unitPlacementSettings["U3"]["upgradeCap"] = upgradeCap
				updatejson()
			end,
		})

		unitFourSection = unitPlacementTab:CreateSection("Unit 4 - " .. getgenv().SelectedUnits["U4"]:split(" #")[1])

		unitFourPlacementPriority = unitPlacementTab:CreateInput({
			Name = "Placement Priority",
			PlaceholderText = getgenv().unitPlacementSettings["U4"]["placementPriority"],
			RemoveTextAfterFocusLost = false,
			Callback = function(placementPriority)
				getgenv().unitPlacementSettings["U4"]["placementPriority"] = placementPriority
				updatejson()
			end,
		})

		unitFourUpgradePriority = unitPlacementTab:CreateInput({
			Name = "Upgrade Priority",
			PlaceholderText = getgenv().unitPlacementSettings["U4"]["upgradePriority"],
			RemoveTextAfterFocusLost = false,
			Callback = function(upgradePriority)
				getgenv().unitPlacementSettings["U4"]["upgradePriority"] = upgradePriority
				updatejson()
			end,
		})

		unitFourPlaceFromWave = unitPlacementTab:CreateInput({
			Name = "Place From Wave",
			PlaceholderText = getgenv().unitPlacementSettings["U4"]["placeFromWave"],
			RemoveTextAfterFocusLost = false,
			Callback = function(placeFromWave)
				getgenv().unitPlacementSettings["U4"]["placeFromWave"] = placeFromWave
				updatejson()
			end,
		})

		unitFourUpgradeFromWave = unitPlacementTab:CreateInput({
			Name = "Upgrade From Wave",
			PlaceholderText = getgenv().unitPlacementSettings["U4"]["upgradeFromWave"],
			RemoveTextAfterFocusLost = false,
			Callback = function(upgradeFromWave)
				getgenv().unitPlacementSettings["U4"]["upgradeFromWave"] = upgradeFromWave
				updatejson()
			end,
		})

		unitFourUpgradeCap = unitPlacementTab:CreateInput({
			Name = "Upgrade Cap",
			PlaceholderText = getgenv().unitPlacementSettings["U4"]["upgradeCap"],
			RemoveTextAfterFocusLost = false,
			Callback = function(upgradeCap)
				getgenv().unitPlacementSettings["U4"]["upgradeCap"] = upgradeCap
				updatejson()
			end,
		})

		if tonumber(game.Players.LocalPlayer.PlayerGui["spawn_units"].Lives.Main.Desc.Level.Text:split(" ")[2]) >= 20 then
			unitFiveSection = unitPlacementTab:CreateSection("Unit 5 - " .. getgenv().SelectedUnits["U5"]:split(" #")[1])

			unitFivePlacementPriority = unitPlacementTab:CreateInput({
				Name = "Placement Priority",
				PlaceholderText = getgenv().unitPlacementSettings["U5"]["placementPriority"],
				RemoveTextAfterFocusLost = false,
				Callback = function(placementPriority)
					getgenv().unitPlacementSettings["U5"]["placementPriority"] = placementPriority
					updatejson()
				end,
			})

			unitFiveUpgradePriority = unitPlacementTab:CreateInput({
				Name = "Upgrade Priority",
				PlaceholderText = getgenv().unitPlacementSettings["U5"]["upgradePriority"],
				RemoveTextAfterFocusLost = false,
				Callback = function(upgradePriority)
					getgenv().unitPlacementSettings["U5"]["upgradePriority"] = upgradePriority
					updatejson()
				end,
			})

			unitFivePlaceFromWave = unitPlacementTab:CreateInput({
				Name = "Place From Wave",
				PlaceholderText = getgenv().unitPlacementSettings["U5"]["placeFromWave"],
				RemoveTextAfterFocusLost = false,
				Callback = function(placeFromWave)
					getgenv().unitPlacementSettings["U5"]["placeFromWave"] = placeFromWave
					updatejson()
				end,
			})

			unitFiveUpgradeFromWave = unitPlacementTab:CreateInput({
				Name = "Upgrade From Wave",
				PlaceholderText = getgenv().unitPlacementSettings["U5"]["upgradeFromWave"],
				RemoveTextAfterFocusLost = false,
				Callback = function(upgradeFromWave)
					getgenv().unitPlacementSettings["U5"]["upgradeFromWave"] = upgradeFromWave
					updatejson()
				end,
			})

			unitFiveUpgradeCap = unitPlacementTab:CreateInput({
				Name = "Upgrade Cap",
				PlaceholderText = getgenv().unitPlacementSettings["U5"]["upgradeCap"],
				RemoveTextAfterFocusLost = false,
				Callback = function(upgradeCap)
					getgenv().unitPlacementSettings["U5"]["upgradeCap"] = upgradeCap
					updatejson()
				end,
			})
		end

		if tonumber(game.Players.LocalPlayer.PlayerGui["spawn_units"].Lives.Main.Desc.Level.Text:split(" ")[2]) >= 50 then
			unitSixSection = unitPlacementTab:CreateSection("Unit 6 - " .. getgenv().SelectedUnits["U6"]:split(" #")[1])
		
			unitSixPlacementPriority = unitPlacementTab:CreateInput({
				Name = "Placement Priority",
				PlaceholderText = getgenv().unitPlacementSettings["U6"]["placementPriority"],
				RemoveTextAfterFocusLost = false,
				Callback = function(placementPriority)
					getgenv().unitPlacementSettings["U6"]["placementPriority"] = placementPriority
					updatejson()
				end,
			})
		
			unitSixUpgradePriority = unitPlacementTab:CreateInput({
				Name = "Upgrade Priority",
				PlaceholderText = getgenv().unitPlacementSettings["U6"]["upgradePriority"],
				RemoveTextAfterFocusLost = false,
				Callback = function(upgradePriority)
					getgenv().unitPlacementSettings["U6"]["upgradePriority"] = upgradePriority
					updatejson()
				end,
			})
		
			unitSixPlaceFromWave = unitPlacementTab:CreateInput({
				Name = "Place From Wave",
				PlaceholderText = getgenv().unitPlacementSettings["U6"]["placeFromWave"],
				RemoveTextAfterFocusLost = false,
				Callback = function(placeFromWave)
					getgenv().unitPlacementSettings["U6"]["placeFromWave"] = placeFromWave
					updatejson()
				end,
			})
		
			unitSixUpgradeFromWave = unitPlacementTab:CreateInput({
				Name = "Upgrade From Wave",
				PlaceholderText = getgenv().unitPlacementSettings["U6"]["upgradeFromWave"],
				RemoveTextAfterFocusLost = false,
				Callback = function(upgradeFromWave)
					getgenv().unitPlacementSettings["U6"]["upgradeFromWave"] = upgradeFromWave
					updatejson()
				end,
			})
		
			unitSixUpgradeCap = unitPlacementTab:CreateInput({
				Name = "Upgrade Cap",
				PlaceholderText = getgenv().unitPlacementSettings["U6"]["upgradeCap"],
				RemoveTextAfterFocusLost = false,
				Callback = function(upgradeCap)
					getgenv().unitPlacementSettings["U6"]["upgradeCap"] = upgradeCap
					updatejson()
				end,
			})
		end

		if getgenv().recordMacroOnTeleport then
			getgenv().lockAutoFunctions = true
			getgenv().recordMacroOnTeleport = false
			getgenv().recordingMacro = true
			updatejson()
		else
			--getgenv().recordingMacro = false
			updatejson()
		end

		if getgenv().replayMacroOnTeleport then
			print("MACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAAMACRO STARTED AAAAAA")
			print("SESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSESSES")
			getgenv().lockAutoFunctions = true
			coroutine.resume(coroutine.create(function()
				getgenv().lockAutoFunctions = true
				if getgenv().levelMacros[tostring(workspace._MAP_CONFIG.GetLevelData:InvokeServer()["id"])] then
					decodedFile = game:GetService('HttpService'):JSONDecode(readfile(getgenv().levelMacros[tostring(workspace._MAP_CONFIG.GetLevelData:InvokeServer()["id"])]))
					getgenv().macroUnitPositions = {}
					instructionIncrement = 1
					
					local function updateUnitPositions()
						getgenv().macroUnitPositions = {}
						
						for i, v in ipairs(game.Workspace["_UNITS"]:GetChildren()) do
							if v:FindFirstChild("_stats") then
								if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name and v["_stats"].xp.Value >= 0  and v["_stats"].id.Value ~= "metal_knight_drone" and v["_stats"].id.Value ~= "metal_knight_drone:shiny" and v["_stats"].id.Value ~= "aot_generic" then
									table.insert(getgenv().macroUnitPositions, {v, v._hitbox.CFrame.X, v._hitbox.CFrame.Z})
								end
							end
						end
					end
					
					local function getEquippedUnits()
						equippedUnits = {}
						local reg = getreg() --> returns Roblox's registry in a table
					
						for i,v in next, reg do
							if type(v) == 'function' then --> Checks if the current iteration is a function
								if getfenv(v).script then --> Checks if the function's environment is in a script
									for _, v in pairs(debug.getupvalues(v)) do --> Basically a for loop that prints everything, but in one line
										if type(v) == 'table' then
											if v["session"] then
												for sus, bak in pairs(v["session"]["profile_data"]['collection']['equipped_units']) do
													table.insert(equippedUnits, {bak, v["session"]["profile_data"]['collection']['owned_units'][bak]['unit_id']})
												end
												return equippedUnits
											end
										end
									end
								end
							end
						end
					end
					
					local function getCoordArgs(position)
						coordArgs = {}
						for coordArg in string.gmatch(position, "([^ ,]+)") do
							table.insert(coordArgs, tonumber(coordArg))
							--print(coordArg)
						end
						return coordArgs
					end
					
					repeat 
						task.wait(0.5)
					
						if decodedFile[tostring(instructionIncrement)]['type'] == 'spawn_unit' then
							repeat task.wait() until game.Players.LocalPlayer._stats.resource.Value >= decodedFile[tostring(instructionIncrement)]['money']
							updateUnitPositions()
							for _, unitInfo in pairs(getEquippedUnits()) do
								if unitInfo[2] == decodedFile[tostring(instructionIncrement)]['unit'] then
									if unitInfo[2] == "metal_knight_evolved" or unitInfo[2] == "metal_knight_evolved:shiny" then
										task.spawn(function()
											game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unitInfo[1], CFrame.new(unpack(getCoordArgs(decodedFile[tostring(instructionIncrement)]['cframe']))))
											instructionIncrement += 1
											task.wait(2)
										end)
									else
										game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unitInfo[1], CFrame.new(unpack(getCoordArgs(decodedFile[tostring(instructionIncrement)]['cframe']))))
										instructionIncrement += 1
									end
								end
							end
						end
					
						if decodedFile[tostring(instructionIncrement)]['type'] == 'upgrade_unit_ingame' then
							repeat task.wait() until game.Players.LocalPlayer._stats.resource.Value >= decodedFile[tostring(instructionIncrement)]['money']
							updateUnitPositions()
							
							print(game.Players.LocalPlayer._stats.resource.Value)
							print(decodedFile[tostring(instructionIncrement)]['money'])
							for _, unitPosition in pairs(getgenv().macroUnitPositions) do
								if getCoordArgs(decodedFile[tostring(instructionIncrement)]['pos'])[1] == unitPosition[2] and getCoordArgs(decodedFile[tostring(instructionIncrement)]['pos'])[3] == unitPosition[3] then
									game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unitPosition[1], unpack(getCoordArgs(decodedFile[tostring(instructionIncrement)]['pos'])))
								end
							end
							instructionIncrement += 1
						end
					
						if decodedFile[tostring(instructionIncrement)]['type'] == 'sell_unit_ingame' then
							repeat task.wait() until game.Players.LocalPlayer._stats.resource.Value >= decodedFile[tostring(instructionIncrement)]['money']
					
							for _, unitPosition in pairs(getgenv().macroUnitPositions) do
								if getCoordArgs(decodedFile[tostring(instructionIncrement)]['pos'][1]) == unitPosition[2] and getCoordArgs(decodedFile[tostring(instructionIncrement)]['pos'][3]) == unitPosition[3] then
									game:GetService("ReplicatedStorage").endpoints.client_to_server.sell_unit_ingame:InvokeServer(unitPosition[1], unpack(getCoordArgs(decodedFile[tostring(instructionIncrement)]['pos'])))
								end
							end
							instructionIncrement += 1
						end
					until decodedFile[tostring(instructionIncrement)] == nil	
				end
			end))
		end

		if getgenv().recordingMacro then
			getgenv().lockAutoFunctions = true
			updatejson()
			writeMacroToFile(tostring(workspace._MAP_CONFIG.GetLevelData:InvokeServer()["id"]).."-"..tostring(os.date('%Y%m%d-%H%M%S')).."-"..game.Players.LocalPlayer.Name..".json")
			RayfieldLib:Notify({
				Title = "Recording macro to file: " .. tostring(workspace._MAP_CONFIG.GetLevelData:InvokeServer()["id"]).."-"..tostring(os.date('%Y-%m-%d-%H:%M:%S'))..".json",
				Content = "Starting Recording",
				Duration = 6.5
			})
			autoMacroTab:CreateLabel("Recording Macro to file: " .. tostring(workspace._MAP_CONFIG.GetLevelData:InvokeServer()["map"]).."-"..tostring(os.date('%Y-%m-%d %H:%M:%S'))..".json")
		end
		
        game.Players.LocalPlayer.PlayerGui.MessageGui.Enabled = false
        game:GetService("ReplicatedStorage").packages.assets["ui_sfx"].error.Volume = 0
        game:GetService("ReplicatedStorage").packages.assets["ui_sfx"].error_old.Volume = 0
    
        local autoLoadSection = autoFarmTab:CreateSection("Auto Load Script")
		autoFarmTab:CreateLabel("This automatically executes script when you teleport to the main area.")
        autoFarmTab:CreateLabel("You don't need to put the script in your autoexec folder!")
        autoFarmTab:CreateToggle({
            Name = "Auto Load Script", 
            CurrentValue = getgenv().AutoLoadTP, 
            Callback = function(bool)
                getgenv().AutoLoadTP = bool
                updatejson()
                if exec == "Synapse X" and getgenv().AutoLoadTP then
                    syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Tesseract1234567890/animeadv/main/script.lua'))()")
                    if exec == "Synapse X" then
                        syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Tesseract1234567890/animeadv/main/script.lua'))()")
                        RayfieldLib:Notify({
                            Title = "Queued to Auto-Attach on Teleport!",
                            Content =  "Success",
                            Duration = 6.5
                        })
                    end

                elseif exec ~= "Synapse X" and getgenv().AutoLoadTP then
                    queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Tesseract1234567890/animeadv/main/script.lua'))()")
                end
            end})

        autoFarmTab:CreateLabel("If it doesn't work properly, then put the script in the autoexec folder!")

        local autoFarmSection = autoFarmTab:CreateSection("Auto Farm")

        --#region Auto Farm Tab
        autoFarmTab:CreateToggle({
            Name = "Auto Continue", 
            CurrentValue = getgenv().AutoContinue, 
            Callback = function(bool)
                getgenv().AutoContinue = bool
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Replay", 
            CurrentValue = getgenv().AutoReplay, 
            Callback = function(bool)
                getgenv().AutoReplay = bool
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Leave", 
            CurrentValue = getgenv().AutoLeave, 
            Callback = function(bool)
                getgenv().AutoLeave = bool
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Farm Event", 
            CurrentValue = getgenv().AutoFarmTP, 
            Callback = function(bool)
                getgenv().AutoFarmTP = bool
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Start Infinity Castle", 
            CurrentValue = getgenv().AutoFarmIC, 
            Callback = function(bool)
                getgenv().AutoFarmIC = bool
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Farm", 
            CurrentValue = getgenv().AutoFarm, 
            Callback = function(bool)
                getgenv().AutoFarm = bool
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Start", 
            CurrentValue = getgenv().autoStart, 
            Callback = function(bool)
                getgenv().autoStart = bool
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Abilities", 
            CurrentValue = getgenv().autoabilities, 
            Callback = function(bool)
                getgenv().autoabilities = bool
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Upgrade Units", 
            CurrentValue = getgenv().autoUpgrade, 
            Callback = function(bool)
                getgenv().autoUpgrade = bool
                updatejson()
            end})

        local placementSection = autoFarmTab:CreateSection("Set Unit Placements")
        --// Set Position \\--
        autoFarmTab:CreateButton({
            Name = "Set Unit 1 Postion", 
            Callback = function()
                RayfieldLib:Notify({
                    Title = "Set Unit 1 Spawn Position",
                    Content = "Click on the floor to set the spawn unit position!\n (don't press \"Done\" until you set position)",
                    Duration = 99999999,
                    Actions = { -- Notification Buttons
                        Ignore = {
                            Name = "Done",
                            Callback = function()
                            print("The user tapped Okay!")
                        end
                    }
                }
            })
                MouseClick("UP1")
            end})

        autoFarmTab:CreateButton({
            Name = "Set Unit 2 Postion", 
            Callback = function()
                RayfieldLib:Notify({
                    Title = "Set Unit 2 Spawn Position",
                    Content = "Click on the floor to set the spawn unit position!\n (don't press \"Done\" until you set position)",
                    Duration = 99999999,
                    Actions = { -- Notification Buttons
                        Ignore = {
                            Name = "Done",
                            Callback = function()
                            print("The user tapped Okay!")
                        end
                    }
                }
            })
                MouseClick("UP2")
            end})

        autoFarmTab:CreateButton({
            Name = "Set Unit 3 Postion", 
            Callback = function()
                RayfieldLib:Notify({
                    Title = "Set Unit 3 Spawn Position",
                    Content = "Click on the floor to set the spawn unit position!\n (don't press \"Done\" until you set position)",
                    Duration = 99999999,
                    Actions = { -- Notification Buttons
                        Ignore = {
                            Name = "Done",
                            Callback = function()
                            print("The user tapped Okay!")
                        end
                    }
                }
            })
                MouseClick("UP3")
            end})

        autoFarmTab:CreateButton({
            Name = "Set Unit 4 Postion", 
            Callback = function()
                RayfieldLib:Notify({
                    Title = "Set Unit 4 Spawn Position",
                    Content = "Click on the floor to set the spawn unit position!\n (don't press \"Done\" until you set position)",
                    Duration = 99999999,
                    Actions = { -- Notification Buttons
                        Ignore = {
                            Name = "Done",
                            Callback = function()
                            print("The user tapped Okay!")
                        end
                    }
                }
            })
                MouseClick("UP4")
            end})

        
        local axxc = game.Players.LocalPlayer.PlayerGui["spawn_units"].Lives.Main.Desc.Level.Text:split(" ")

        if tonumber(axxc[2]) >= 20 then
            autoFarmTab:CreateButton({
            Name = "Set Unit 5 Postion", 
            Callback = function()
                RayfieldLib:Notify({
                    Title = "Set Unit 5 Spawn Position",
                    Content = "Click on the floor to set the spawn unit position!\n (don't press \"Done\" until you set position)",
                    Duration = 99999999,
                    Actions = { -- Notification Buttons
                        Ignore = {
                            Name = "Done",
                            Callback = function()
                            print("The user tapped Okay!")
                        end
                    }
                }
            })
                MouseClick("UP5")
            end})
        end

        if tonumber(axxc[2]) >= 50 then
            autoFarmTab:CreateButton({
            Name = "Set Unit 6 Postion", 
            Callback = function()
                RayfieldLib:Notify({
                    Title = "Set Unit 6 Spawn Position",
                    Content = "Click on the floor to set the spawn unit position!\n (don't press \"Done\" until you set position)",
                    Duration = 99999999,
                    Actions = { -- Notification Buttons
                        Ignore = {
                            Name = "Done",
                            Callback = function()
                            print("The user tapped Okay!")
                        end
                    }
                }
            })
                MouseClick("UP6")
            end})
        end
        
        local autoSellSection = autoFarmTab:CreateSection("Auto Sell/Quit")

        autoFarmTab:CreateToggle({
            Name = "Auto Sell at Specific Wave", 
            CurrentValue = getgenv().autoSell, 
            Callback = function(bool)
                getgenv().autoSell = bool
                updatejson()
                if getgenv().autoSell == false then
                    getgenv().disableAutoFarm = false
                end
            end})

        autoFarmTab:CreateToggle({
            Name = "Auto Quit at Specific Wave", 
            CurrentValue = getgenv().autoQuit, 
            Callback = function(bool)
                getgenv().autoQuit = bool
                updatejson()
            end})

        autoFarmTab:CreateInput({
            Name = "Select Wave Number for Auto Sell {Press Enter}", 
            PlaceholderText = tostring(getgenv().sellatwave), 
            RemoveTextAfterFocusLost = false,
            Callback = function(t)
                getgenv().sellatwave = tonumber(t)
                updatejson()
            end})

        autoFarmTab:CreateInput({
            Name = "Select Wave Number for Auto Quit {Press Enter}", 
            PlaceholderText = tostring(getgenv().quitAtWave), 
            RemoveTextAfterFocusLost = false,
            Callback = function(t)
                getgenv().quitAtWave = tonumber(t)
                updatejson()
            end})

        function MouseClick(UnitPos)
            local connection
            local _map = game:GetService("Workspace")["_BASES"].player.base["fake_unit"]:WaitForChild("HumanoidRootPart")
            connection = UserInputService.InputBegan:Connect(
                function(input, gameProcessed)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        connection:Disconnect()
                        local a = Instance.new("Part", game.Workspace)
                        a.Size = Vector3.new(1, 1, 1)
                        a.Material = Enum.Material.Neon
                        a.Position = mouse.hit.p
                        task.wait()
                        a.Anchored = true
                        RayfieldLib:Notify({
                            Title = "Spawn Unit Position:",
                            Content =  tostring(a.Position),
                            Duration = 6.5,
                            Actions = { -- Notification Buttons
                                Ignore = {
                                    Name = "Okay!",
                                    Callback = function()
                                        print("The user tapped Okay!")
                                    end
                                }
                            }
                        })
                        a.CanCollide = false
                        for i = 0, 1, 0.1 do
                            a.Transparency = i
                            task.wait()
                        end
                        a:Destroy()

                        if game.Workspace._map:FindFirstChild("namek mushroom model") then
                            print("Namak")
                            SpawnUnitPos["Namak"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["Namak"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["Namak"][UnitPos]["z"] = a.Position.Z
                        elseif game.Workspace._map:FindFirstChild("houses_new") then
                            print("Aot")
                            SpawnUnitPos["Aot"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["Aot"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["Aot"][UnitPos]["z"] = a.Position.Z
                        elseif game.Workspace._map:FindFirstChild("Snow Particles") then
                            print("Snowy")
                            SpawnUnitPos["Snowy"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["Snowy"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["Snowy"][UnitPos]["z"] = a.Position.Z
                        elseif game.Workspace._map:FindFirstChild("sand_gate") then
                            warn("Sand")
                            SpawnUnitPos["Sand"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["Sand"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["Sand"][UnitPos]["z"] = a.Position.Z
                        elseif game.Workspace._map:FindFirstChild("icebergs") then
                            print("Marine")
                            SpawnUnitPos["Marine"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["Marine"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["Marine"][UnitPos]["z"] = a.Position.Z
                        elseif game.Workspace._map:FindFirstChild("Helicopter Pad") then
                            print("Ghoul")
                            SpawnUnitPos["Ghoul"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["Ghoul"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["Ghoul"][UnitPos]["z"] = a.Position.Z
                        elseif game.Workspace._map:FindFirstChild("Bones/dust") then
                            print("Hollow")
                            SpawnUnitPos["Hollow"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["Hollow"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["Hollow"][UnitPos]["z"] = a.Position.Z
                        elseif game.Workspace._map:FindFirstChild("Ant Nest") then
                            print("Ant")
                            SpawnUnitPos["Ant"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["Ant"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["Ant"][UnitPos]["z"] = a.Position.Z
                        elseif game.Workspace._map:FindFirstChild("light poles") then
                            print("Magic")
                            SpawnUnitPos["Magic"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["Magic"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["Magic"][UnitPos]["z"] = a.Position.Z
                        elseif game.Workspace._map:FindFirstChild("LanternsGround") then
                            print("Cursed")    
                            SpawnUnitPos["Cursed"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["Cursed"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["Cursed"][UnitPos]["z"] = a.Position.Z
                        elseif game.Workspace._map:FindFirstChild("pumpkins") then
                            print("thriller_park")    
                            SpawnUnitPos["thriller_park"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["thriller_park"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["thriller_park"][UnitPos]["z"] = a.Position.Z
                        elseif game.Workspace._map:FindFirstChild("skeleton") then
                            print("black_clover")    
                            SpawnUnitPos["black_clover"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["black_clover"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["black_clover"][UnitPos]["z"] = a.Position.Z
                        elseif game.Workspace._map:FindFirstChild("graves") then
                            print("hollow_leg")    
                            SpawnUnitPos["hollow_leg"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["hollow_leg"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["hollow_leg"][UnitPos]["z"] = a.Position.Z
                        elseif game.Workspace._map:FindFirstChild("SpaceCenter") then
                            print("Cape Canaveral")    
                            SpawnUnitPos["jojo"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["jojo"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["jojo"][UnitPos]["z"] = a.Position.Z
						elseif game.Workspace._map:FindFirstChild("Big_Stairs") then
							print("Chainsaw Man")    
                            SpawnUnitPos["csm_event"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["csm_event"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["csm_event"][UnitPos]["z"] = a.Position.Z
						elseif game.Workspace._map:FindFirstChild("Capybara") then
							print("One Punch Man")    
                            SpawnUnitPos["opm"][UnitPos]["x"] = a.Position.X
                            SpawnUnitPos["opm"][UnitPos]["y"] = a.Position.Y
                            SpawnUnitPos["opm"][UnitPos]["z"] = a.Position.Z
						end
                        updatejson()
                    end
                end)
        end


        -- set unit position end--

--#endregion

--#region Auto Challenge 

        local autoChallengeSection = autoFarmTab:CreateSection("Auto Challenge")

        autoFarmTab:CreateToggle({
            Name = "Auto Challenge", 
            CurrentValue = getgenv().AutoChallenge, 
            Callback = function(bool)
                getgenv().AutoChallenge = bool
                updatejson()
            end})

        local worlddrop = autoFarmTab:CreateDropdown({
            Name = "Select Reward",
            Options = {"star_fruit_random","star_remnant","gems", "gold"},
            CurrentOption = getgenv().selectedreward, 
                Callback = function(reward)
                getgenv().selectedreward = reward
                updatejson()
            end})

        autoFarmTab:CreateToggle({
            Name = "Farm All Rewards", 
            CurrentValue = getgenv().AutoChallengeAll, 
            Callback = function(bool)
                getgenv().AutoChallengeAll = bool
                updatejson()
            end})

--#region Webhook
		--//Webhook Tab (in-game)\\--
		local webhookSection = webhookTab:CreateSection("Webhooks")
		webhookTab:CreateLabel("Webhooks send notifications in Discord everytime a game is finished!")
		
		local webhookPlaceholder
		if getgenv().webUrl == "" then
			webhookPlaceholder = "Insert URL here!"
		else
			webhookPlaceholder = "Good to go!"
		end
		webhookTab:CreateInput({
            Name = "Webhook URL {Press Enter}" , 
            PlaceholderText = webhookPlaceholder, 
            RemoveTextAfterFocusLost = false, 
            Callback = function(web_url)
                getgenv().webUrl = web_url
                updatejson()
		end})
    
        local sniperWebhookPlaceholder
		if getgenv().sniperUrl == "" then
			sniperWebhookPlaceholder = "Insert URL here!"
		else
			sniperWebhookPlaceholder = "Good to go!"
		end

        webhookTab:CreateInput({
            Name = "Sniper Webhook URL {Press Enter}" , 
            PlaceholderText = sniperWebhookPlaceholder, 
            RemoveTextAfterFocusLost = false, 
            Callback = function(sniper_url)
                getgenv().sniperUrl = sniper_url
                updatejson()
		end})

        webhookTab:CreateButton({
            Name = "Test Regular Webhooks", 
            Callback = function()
                Webhook()
                BabyWebhook()
				NormalItemWebhook(true)
				UniqueItemWebhook(true)
            end})
    
        webhookTab:CreateButton({
            Name = "Test Sniper Webhooks", 
            Callback = function()
                ShopSniperWebhook(true)
                SpecialSummonSniperWebhook(true)
                StandardSummonSniperWebhook(true)
            end})
--#endregion


    end

--#endregion

	local creditsTab = mainWindow:CreateTab("Credits")
    local credits = creditsTab:CreateSection("Credits")
    creditsTab:CreateLabel("Arpon AG#6612")
    creditsTab:CreateLabel("Forever4D#0001")
    creditsTab:CreateLabel("Defrag")
end

--------------------------------------------------
--------------------------------------------------

---// Checks if file exist or not\\---
if isfile(saveFileName) then 

    local jsonData = readfile(saveFileName)
    local data = HttpService:JSONDecode(jsonData)

    MainModule()

else
--#region CREATES JSON
    local xdata = {
		altcount = 3,
		lowcpumode = false,
        AutoReplay = false,
        AutoLeave = false,
        AutoChallenge = false,
		autoportal = false,
		autoportalcsm = false,
        selectedreward = "star_fruit_random",
        AutoChallengeAll = false,
        autoabilities = false,
		lockautofunctions = false,
        autofarmtp = false,
        webhook = "",
        sniperwebhook = "",
        sellatwave = 0,
        quitAtWave = 0,
        autoSell = false,
        autofarm = false,
        autofarmic = false,
        autoStart = false,
        autoloadtp = true,
        autoUpgrade = false,
        autocontinue = false,
        difficulty = "nil",
        world = "nil",
		macroworld = "nil",
        level = "nil",
		macrolevel = "nil",
		raidlevel = 'nil',
		levelmacros = {},
        door = "nil",
        currentmerchantitems = {},
        currentspecialbannerunits = {},
        currentstandardbannerunits = {},
		recordingmacro = false,
		recordmacroonteleport = false,
		replaymacroonteleport = false,
		macrotoreplay = "",
		altlist = {},
		mainaccount = "nil",
		altmode = false,
		unitplacementsettings = {
			U1 = {
				placementPriority = 0,
				upgradePriority = 0,
				placeFromWave = 0,
				upgradeFromWave = 0,
				upgradeCap = 999
			},
			U2 = {
				placementPriority = 0,
				upgradePriority = 0,
				placeFromWave = 0,
				upgradeFromWave = 0,
				upgradeCap = 999
			},
			U3 = {
				placementPriority = 0,
				upgradePriority = 0,
				placeFromWave = 0,
				upgradeFromWave = 0,
				upgradeCap = 999
			},
			U4 = {
				placementPriority = 0,
				upgradePriority = 0,
				placeFromWave = 0,
				upgradeFromWave = 0,
				upgradeCap = 999
			},
			U5 = {
				placementPriority = 0,
				upgradePriority = 0,
				placeFromWave = 0,
				upgradeFromWave = 0,
				upgradeCap = 999
			},
			U6 = {
				placementPriority = 0,
				upgradePriority = 0,
				placeFromWave = 0,
				upgradeFromWave = 0,
				upgradeCap = 999
			}
		},
    
        xspawnUnitPos  = {
			uchiha  = {
				UP1  = {
				  y  = 1.4244641065597535,
				  x  = -109.30056762695313,
				  z  = -54.575347900390628
			   },
				UP3  = {
				  y  = 1.4322717189788819,
				  x  = -114.2433853149414,
				  z  = -55.260982513427737
			   },
				UP2  = {
				  y  = 1.7082736492156983,
				  x  = -127.53932189941406,
				  z  = -55.277626037597659
			   },
				UP6  = {
				  y  = 1.4487617015838624,
				  x  = -107.07078552246094,
				  z  = -51.333045959472659
			   },
				UP5  = {
				  y  = 1.8965977430343629,
				  x  = -118.5692138671875,
				  z  = -57.20484161376953
			   },
				UP4  = {
				  y  = 1.4205386638641358,
				  x  = -105.46223449707031,
				  z  = -51.20615005493164
			   }
			 },
			opm  = {
				UP1  = {
				  y  = 1.4244641065597535,
				  x  = -109.30056762695313,
				  z  = -54.575347900390628
			   },
				UP3  = {
				  y  = 1.4322717189788819,
				  x  = -114.2433853149414,
				  z  = -55.260982513427737
			   },
				UP2  = {
				  y  = 1.7082736492156983,
				  x  = -127.53932189941406,
				  z  = -55.277626037597659
			   },
				UP6  = {
				  y  = 1.4487617015838624,
				  x  = -107.07078552246094,
				  z  = -51.333045959472659
			   },
				UP5  = {
				  y  = 1.8965977430343629,
				  x  = -118.5692138671875,
				  z  = -57.20484161376953
			   },
				UP4  = {
				  y  = 1.4205386638641358,
				  x  = -105.46223449707031,
				  z  = -51.20615005493164
			   }
			 },
            csm_event  = {
				UP1  = {
				  y  = 1.4244641065597535,
				  x  = -109.30056762695313,
				  z  = -54.575347900390628
			   },
				UP3  = {
				  y  = 1.4322717189788819,
				  x  = -114.2433853149414,
				  z  = -55.260982513427737
			   },
				UP2  = {
				  y  = 1.7082736492156983,
				  x  = -127.53932189941406,
				  z  = -55.277626037597659
			   },
				UP6  = {
				  y  = 1.4487617015838624,
				  x  = -107.07078552246094,
				  z  = -51.333045959472659
			   },
				UP5  = {
				  y  = 1.8965977430343629,
				  x  = -118.5692138671875,
				  z  = -57.20484161376953
			   },
				UP4  = {
				  y  = 1.4205386638641358,
				  x  = -105.46223449707031,
				  z  = -51.20615005493164
			   }
			 },
			 black_clover  = {
              UP1  = {
                y  = 1.4244641065597535,
                x  = -109.30056762695313,
                z  = -54.575347900390628
             },
              UP3  = {
                y  = 1.4322717189788819,
                x  = -114.2433853149414,
                z  = -55.260982513427737
             },
              UP2  = {
                y  = 1.7082736492156983,
                x  = -127.53932189941406,
                z  = -55.277626037597659
             },
              UP6  = {
                y  = 1.4487617015838624,
                x  = -107.07078552246094,
                z  = -51.333045959472659
             },
              UP5  = {
                y  = 1.8965977430343629,
                x  = -118.5692138671875,
                z  = -57.20484161376953
             },
              UP4  = {
                y  = 1.4205386638641358,
                x  = -105.46223449707031,
                z  = -51.20615005493164
             }
           },
           hollow_leg = {
            UP1 = {
                x = -168.71795654296875,
                y = 36.04443359375, 
                z = 564.4705810546875 
            },
            UP2 = {
                x = -161.105712890625, 
                y = 36.04443359375, 
                z = 558.4195556640625 
            },
            UP3 = {
                x = -161.05670166015625, 
                y = 36.04443359375, 
                z = 546.204833984375 
               
            },
            UP4 = {
                x = -163.51824951171875, 
                y = 36.04443359375, 
                z = 534.6953735351562 
            },
            UP5 = {
                x = -170.02479553222656, 
                y = 36.04443359375, 
                z = 528.9660034179688
            },
            UP6 = {
                x = -160.92405700683594, 
                y = 36.04443359375, 
                z = 565.2430419921875 
            }
           },
            Cursed  = {
              UP1  = {
                y  = 122.78201293945313,
                x  = 361.69732666015627,
                z  = -89.76468658447266
             },
              UP3  = {
                y  = 122.73872375488281,
                x  = 372.2068786621094,
                z  = -62.877601623535159
             },
              UP2  = {
                y  = 122.73872375488281,
                x  = 391.6465759277344,
                z  = -62.87253189086914
             },
              UP6  = {
                y  = 121.5274887084961,
                x  = 399.4963684082031,
                z  = -60.31044387817383
             },
              UP5  = {
                y  = 121.6282958984375,
                x  = 400.8389587402344,
                z  = -64.46269226074219
             },
              UP4  = {
                y  = 122.73872375488281,
                x  = 362.14788818359377,
                z  = -77.3993148803711
             }
           },
            Sand  = {
              UP1  = {
                y  = 25.514015197753908,
                x  = -919.7685546875,
                z  = 290.9293518066406
             },
              UP3  = {
                y  = 25.518001556396486,
                x  = -919.7103881835938,
                z  = 288.1217346191406
             },
              UP2  = {
                y  = 26.06340980529785,
                x  = -920.3797607421875,
                z  = 300.7817077636719
             },
              UP6  = {
                y  = 25.528093338012697,
                x  = -916.4822998046875,
                z  = 287.9609069824219
             },
              UP5  = {
                y  = 25.71731185913086,
                x  = -920.7069091796875,
                z  = 296.8504943847656
             },
              UP4  = {
                y  = 25.508501052856447,
                x  = -919.2952270507813,
                z  = 294.7797546386719
             }
           },
            Namak  = {
              UP1  = {
                y  = 92.14557647705078,
                x  = -2931.182861328125,
                z  = -698.5640869140625
             },
              UP3  = {
                y  = 92.5256118774414,
                x  = -2950.3916015625,
                z  = -697.1671142578125
             },
              UP2  = {
                y  = 93.32953643798828,
                x  = -2940.813720703125,
                z  = -697.09326171875
             },
              UP6  = {
                y  = 92.16944885253906,
                x  = -2946.967041015625,
                z  = -710.122802734375
             },
              UP5  = {
                y  = 92.15478515625,
                x  = -2947.684326171875,
                z  = -699.6248779296875
             },
              UP4  = {
                y  = 92.5256118774414,
                x  = -2950.408935546875,
                z  = -709.8072509765625
             }
           },
            Hollow  = {
              UP1  = {
                y  = 133.10752868652345,
                x  = -168.9812774658203,
                z  = -692.3645629882813
             },
              UP3  = {
                y  = 133.09632873535157,
                x  = -167.3197021484375,
                z  = -695.4755249023438
             },
              UP2  = {
                y  = 133.50978088378907,
                x  = -160.6356964111328,
                z  = -709.1862182617188
             },
              UP6  = {
                y  = 133.08169555664063,
                x  = -176.02857971191407,
                z  = -691.7825317382813
             },
              UP5  = {
                y  = 133.0151824951172,
                x  = -161.20188903808595,
                z  = -702.9484252929688
             },
              UP4  = {
                y  = 133.17193603515626,
                x  = -172.60714721679688,
                z  = -691.3147583007813
             }
           },
            Ant  = {
              UP1  = {
                y  = 23.502197265625,
                x  = -180.23072814941407,
                z  = 2961.130126953125
             },
              UP3  = {
                y  = 23.855152130126954,
                x  = -167.0123748779297,
                z  = 2954.2958984375
             },
              UP2  = {
                y  = 23.637359619140626,
                x  = -205.69203186035157,
                z  = 2964.095947265625
             },
              UP6  = {
                y  = 23.31997299194336,
                x  = -163.1376953125,
                z  = 2959.968017578125
             },
              UP5  = {
                y  = 23.598222732543947,
                x  = -170.1063232421875,
                z  = 2955.477294921875
             },
              UP4  = {
                y  = 23.855152130126954,
                x  = -156.4979705810547,
                z  = 2959.6123046875
             }
           },
            Aot  = {
              UP1  = {
                y  = 34.25483703613281,
                x  = -3016.723388671875,
                z  = -682.4714965820313
             },
              UP3  = {
                y  = 34.442054748535159,
                x  = -3024.1181640625,
                z  = -682.2401123046875
             },
              UP2  = {
                y  = 34.387603759765628,
                x  = -3035.071533203125,
                z  = -683.9107055664063
             },
              UP6  = {
                y  = 34.25492477416992,
                x  = -3019.5390625,
                z  = -681.8257446289063
             },
              UP5  = {
                y  = 34.25492477416992,
                x  = -3030.930419921875,
                z  = -683.3449096679688
             },
              UP4  = {
                y  = 34.442054748535159,
                x  = -3013.065185546875,
                z  = -681.4302368164063
             }
           },
            Snowy  = {
              UP1  = {
                y  = 34.8720588684082,
                x  = -2884.6103515625,
                z  = -139.17750549316407
             },
              UP3  = {
                y  = 35.055450439453128,
                x  = -2871.251708984375,
                z  = -131.86231994628907
             },
              UP2  = {
                y  = 34.86832046508789,
                x  = -2863.6240234375,
                z  = -120.90508270263672
             },
              UP6  = {
                y  = 34.79566192626953,
                x  = -2853.62548828125,
                z  = -123.30137634277344
             },
              UP5  = {
                y  = 34.79277038574219,
                x  = -2853.63232421875,
                z  = -119.10173034667969
             },
              UP4  = {
                y  = 34.86832046508789,
                x  = -2878.749755859375,
                z  = -138.48580932617188
             }
           },
            Ghoul  = {
              UP1  = {
                y  = 59.36590576171875,
                x  = -3008.964111328125,
                z  = -56.00475311279297
             },
              UP3  = {
                y  = 59.03008270263672,
                x  = -3008.75732421875,
                z  = -58.37107849121094
             },
              UP2  = {
                y  = 59.382938385009769,
                x  = -2998.44140625,
                z  = -42.68498992919922
             },
              UP6  = {
                y  = 59.03008270263672,
                x  = -3009.03125,
                z  = -67.12299346923828
             },
              UP5  = {
                y  = 59.03008270263672,
                x  = -3007.1025390625,
                z  = -52.12919998168945
             },
              UP4  = {
                y  = 59.03008270263672,
                x  = -3008.94580078125,
                z  = -63.67665100097656
             }
           },
            Magic  = {
              UP1  = {
                y  = 7.411101341247559,
                x  = -606.7291259765625,
                z  = -815.5218505859375
             },
              UP3  = {
                y  = 7.411093711853027,
                x  = -589.5305786132813,
                z  = -814.8512573242188
             },
              UP2  = {
                y  = 7.413991928100586,
                x  = -578.809814453125,
                z  = -814.5386962890625
             },
              UP6  = {
                y  = 7.372146129608154,
                x  = -605.3615112304688,
                z  = -820.8731079101563
             },
              UP5  = {
                y  = 7.413986682891846,
                x  = -597.8843383789063,
                z  = -814.5377807617188
             },
              UP4  = {
                y  = 7.4139862060546879,
                x  = -600.348388671875,
                z  = -814.8621215820313
             }
           },
            Marine  = {
              UP1  = {
                y  = 25.521255493164064,
                x  = -2566.733642578125,
                z  = -62.77167892456055
             },
              UP3  = {
                y  = 25.5211124420166,
                x  = -2565.930419921875,
                z  = -57.89338684082031
             },
              UP2  = {
                y  = 25.210872650146486,
                x  = -2560.966796875,
                z  = -44.40180969238281
             },
              UP6  = {
                y  = 25.676485061645509,
                x  = -2566.796142578125,
                z  = -67.01408386230469
             },
              UP5  = {
                y  = 25.5211238861084,
                x  = -2563.39990234375,
                z  = -63.74509811401367
             },
              UP4  = {
                y  = 24.990556716918947,
                x  = -2570.3349609375,
                z  = -69.34259033203125
             }
           },
            thriller_park  = {
              UP1  = {
                y  = 113.23728942871094,
                x  = -224.14295959472657,
                z  = -657.738037109375
             },
              UP3  = {
                y  = 109.37400817871094,
                x  = -224.78709411621095,
                z  = -640.7178955078125
             },
              UP2  = {
                y  = 109.37401580810547,
                x  = -229.42715454101563,
                z  = -649.636474609375
             },
              UP6  = {
                y  = 109.37400817871094,
                x  = -214.7626190185547,
                z  = -632.3900146484375
             },
              UP5  = {
                y  = 109.37401580810547,
                x  = -230.53053283691407,
                z  = -657.9769287109375
             },
              UP4  = {
                y  = 109.37400817871094,
                x  = -220.0915985107422,
                z  = -636.2127075195313
             }
           },
           jojo = {
            UP1  = {
                x = -111.61297607421875, 
                y = 15.255210876464844, 
                z = -513.5579833984375
             },
              UP3  = {
                x = -120.01858520507812, 
                y = 15.255210876464844, 
                z = -522.66650390625
             },
              UP2  = {
                x = -124.42668151855469, 
                y = 15.255210876464844, 
                z = -530.7169799804688
             },
              UP6  = {
                x = -120.38040161132812, 
                y = 15.255212783813477, 
                z = -536.6077270507812
             },
              UP5  = {
                x = -115.62987518310547, 
                y = 15.255210876464844, 
                z = -518.679931640625                
             },
              UP4  = {
                x = -118.3056411743164, 
                y = 15.255210876464844, 
                z = -529.9589233398438
             }
           }
           
         },

        xselectedUnits = {
            U1 = "nil #nil",
            U2 = "nil #nil",
            U3 = "nil #nil",
            U4 = "nil #nil",
            U5 = "nil #nil",
            U6 = "nil #nil"
        },
		raidworld = "nil"
    
    }

    local json = HttpService:JSONEncode(xdata)
    writefile(saveFileName, json)

    MainModule()
--#endregion
end

--#region ----------------------
--#endregion
--------------------------------------------------

--[[
coroutine.resume(coroutine.create(function()
    repeat task.wait() until game:GetService("Workspace"):WaitForChild("_UNITS")

    unitTrackerTab = mainWindow:CreateTab("Unit Tracker")

    while task.wait() do 
        
        local unitList = {}
        local sections = {}
        local toggles = {}

        for i, v in ipairs(game:GetService("Workspace")["_UNITS"]:GetChildren()) do
            if v:FindFirstChild("_stats") then
                if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name and v["_stats"].xp.Value >= 0 then
                    table.insert(unitList, {v["_stats"]["id"].Value, v["_stats"]["upgrade"].Value, v})
                end
            end
        end
    
        for _, unit in pairs(unitList) do
            local unitHolder = unitTrackerTab:CreateSection(unit[1] .. " (Upgrade [" .. tostring(unit[2]) .. " > " ..tostring(unit[2] + 1) .. "])")
            table.insert(sections, unitHolder)
        end

        task.wait(3)

        unitTrackerTab:Clear()
    end
end))
--]]

------// Auto Farm \\------
--#region Auto Farm Loop
PlaceUnits = function(mapName, waveNum, x, y, z)
	local raycastParams = RaycastParams.new()

	raycastParams.FilterType = Enum.RaycastFilterType.Whitelist
	raycastParams.FilterDescendantsInstances = {game:GetService("Workspace")["_terrain"]}

	local rayOrigin = CFrame.new(xPos, 1000, zPos).p
	local rayDestination = CFrame.new(xPos, -1000, zPos).p

	local rayDirection = (rayDestination - rayOrigin)

	local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)

	local units = {}

	for i = 1, 6 do
		local unitInfo = getgenv().SelectedUnits["U" .. i]
		table.insert(units, {"U" .. i, unitInfo})
	end

	table.sort(units, function(a, b)
		if tonumber(getgenv().unitPlacementSettings[a[1]]["placementPriority"]) ~= nil and tonumber(getgenv().unitPlacementSettings[b[1]]["placementPriority"]) ~= nil then
			return tonumber(getgenv().unitPlacementSettings[a[1]]["placementPriority"]) > tonumber(getgenv().unitPlacementSettings[b[1]]["placementPriority"])
		else
			return false
		end
	end)
	
	for i = 1, 6 do
			print(i)
			local unitinfo = units[i][2]
			local spacer = 2

			if unitinfo ~= nil then
				if tonumber(getgenv().unitPlacementSettings[units[i][1]]["placeFromWave"]) <= tonumber(game:GetService("Workspace"):WaitForChild("_wave_num").Value) then
					local unitinfo_ = unitinfo:split(" #")
					local pos = getgenv().SpawnUnitPos[mapName][string.gsub(units[i][1], "U", "UP")]
					
					for j = 1, 9 do
						
						--if not ((unitinfo_[1] == "Bulmy" or unitinfo_[1] == "Speedcart") and waveNum < 4) then
						local rayOrigin = CFrame.new(pos["x"] + (x * (((j - 1) % 3) - 1)), 1000, pos["z"] + (z * (math.ceil(j / 3) - 2))).p
						local rayDestination = CFrame.new(pos["x"] + (x * (((j - 1) % 3) - 1)), -1000, pos["z"] + (z * (math.ceil(j / 3) - 2))).p
						local rayDirection = (rayDestination - rayOrigin)

						local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)

						--place units
						if raycastResult ~= nil then
							if unitinfo_[1] == "metal_knight_evolved" then
								task.spawn(function()
									task.wait(j)
									local args = {
										[1] = unitinfo_[2],
										[2] = CFrame.new(raycastResult.Position) * CFrame.Angles(0, -0, -0)
									}
									game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
								end)
							else
								local args = {
									[1] = unitinfo_[2],
									[2] = CFrame.new(raycastResult.Position) * CFrame.Angles(0, -0, -0)
								}
								game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
							end
						end
					end
				end
			end
	end
end

coroutine.resume(coroutine.create(function()
    local wave = 0

    while task.wait(1.5) do
        local _wave = game:GetService("Workspace"):WaitForChild("_wave_num").Value
        if wave ~= _wave then
            wave = game:GetService("Workspace"):WaitForChild("_wave_num").Value
            pcall(function() BabyWebhook() end)
        end

        if getgenv().AutoFarm and not getgenv().disableAutoFarm and not getgenv().lockAutoFunctions then
            if game.PlaceId ~= 8304191830 then
                --print("AutoFarming")
                xOffset = 2
                yOffset = -0.5
                zOffset = 2

				repeat task.wait() until game:GetService("Workspace"):WaitForChild("_map")

                if game.Workspace._map:FindFirstChild("namek mushroom model") then
                    print("Namak")
                    PlaceUnits("Namak", _wave, xOffset, yOffset, zOffset)
                elseif game.Workspace._map:FindFirstChild("houses_new") then
                    print("Aot")
                    PlaceUnits("Aot", _wave, xOffset, yOffset, zOffset)
                elseif game.Workspace._map:FindFirstChild("Snow Particles") then
                    print("Snowy")
                    PlaceUnits("Snowy", _wave, xOffset, yOffset, zOffset)
                elseif game.Workspace._map:FindFirstChild("sand_gate") then
                    print("Sand")
                    PlaceUnits("Sand", _wave, xOffset, yOffset, zOffset)
                elseif game.Workspace._map:FindFirstChild("icebergs") then
                    print("Marine")
                    PlaceUnits("Marine", _wave, xOffset, yOffset, zOffset)
                elseif game.Workspace._map:FindFirstChild("Helicopter Pad") then
                    print("Ghoul")
                    PlaceUnits("Ghoul", _wave, xOffset, yOffset, zOffset)
                elseif game.Workspace._map:FindFirstChild("Bones/dust") then
                    print("Hollow")
                    PlaceUnits("Hollow", _wave, xOffset, yOffset, zOffset)
                elseif game.Workspace._map:FindFirstChild("Ant Nest") then
                    print("Ant")
                    PlaceUnits("Ant", _wave, xOffset, yOffset, zOffset)
                elseif game.Workspace._map:FindFirstChild("light poles") then
                    print("Magic")
                    PlaceUnits("Magic", _wave, xOffset, yOffset, zOffset)
                elseif game.Workspace._map:FindFirstChild("LanternsGround") then
                    print("Cursed")    
                    PlaceUnits("Cursed", _wave, xOffset, yOffset, zOffset)
                elseif game.Workspace._map:FindFirstChild("pumpkins") then
                    print("thriller_park")    
                    PlaceUnits("thriller_park", _wave, xOffset, yOffset, zOffset)
                elseif game.Workspace._map:FindFirstChild("skeleton") then
                    print("black_clover")    
                    PlaceUnits("black_clover", _wave, xOffset, yOffset, zOffset)
                elseif game.Workspace._map:FindFirstChild("graves") then
                    print("Hollow Legend")
                    PlaceUnits("hollow_leg", _wave, xOffset, yOffset, zOffset)
                elseif game.Workspace._map:FindFirstChild("SpaceCenter") then
                    print("Cape Canaveral")
                    PlaceUnits("jojo", _wave, xOffset, yOffset, zOffset)
                elseif game.Workspace._map:FindFirstChild("Big_Stairs") then
                    print("Chainsaw Man")
                    PlaceUnits("csm_event", _wave, xOffset, yOffset, zOffset)
				elseif game.Workspace._map:FindFirstChild("Capybara") then
                    print("One Punch Man")
                    PlaceUnits("opm", _wave, xOffset, yOffset, zOffset)
                else
                    print("Something bad happened")
                end
            end
        end

        if getgenv().autoUpgrade then
            if game.PlaceId ~= 8304191830 then
                pcall(function()
                    autoUpgradefunc()
                end)
            end
            if getgenv().autoUpgrader == true then
                task.wait()
                autoUpgradefunc()
                getgenv().autoUpgrader = false
            end
        end
    end
end))
--#endregion



------// Auto Leave \\------
--#region Auto Leave 



--- Made by "CharWar" # Modified by "binsfr" (V3rm)
local PlaceID = 8304191830
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false

local last

local File = pcall(function()
   AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
   table.insert(AllIDs, actualHour)
   writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end

function TPReturner()
   local Site;
   if foundAnything == "" then
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
   else
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
   end
   local ID = ""
   if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
       foundAnything = Site.nextPageCursor
   end
   local num = 0;
   local extranum = 0
   for i, v in pairs(Site.data) do
       extranum += 1
       local Possible = true
       ID = tostring(v.id)
       if tonumber(v.maxPlayers) > tonumber(v.playing) then
           if extranum ~= 1 and tonumber(v.playing) < last or extranum == 1 then
               last = tonumber(v.playing)
           elseif extranum ~= 1 then
               continue
           end
           for _,Existing in pairs(AllIDs) do
               if num ~= 0 then
                   if ID == tostring(Existing) then
                       Possible = false
                   end
               else
                   if tonumber(actualHour) ~= tonumber(Existing) then
                       local delFile = pcall(function()
                           delfile("NotSameServers.json")
                           AllIDs = {}
                           table.insert(AllIDs, actualHour)
                       end)
                   end
               end
               num = num + 1
           end
           if Possible == true then
               table.insert(AllIDs, ID)
               wait()
				if getgenv().isAlt ~= true then
					writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
					wait()
					writefile("TeleportTo.lua", "game:GetService(\"TeleportService\"):TeleportToPlaceInstance(" .. PlaceID ..",\"".. ID.."\", game.Players.LocalPlayer)")
					task.wait(5)
					loadfile("TeleportTo.lua")()
				end
               	task.wait(400)
           end
       end
   end
end

function Teleport()
	if getgenv().isAlt ~= true then
		while wait() do
			pcall(function()
				TPReturner()
				if foundAnything ~= "" then
					TPReturner()
				end
			end)
		end
	else
		repeat
			task.wait()
			local mainAccountFound = false
			for _, v in pairs(game.Players:GetPlayers()) do
				if tostring(v) == getgenv().mainAccount then
					mainAccountFound = true
				end
			end
		until mainAccountFound == false
		task.wait(5)
		loadfile("TeleportTo.lua")()
	end
end
-------------------------------------------

coroutine.resume(coroutine.create(function()
	local GameFinished = game:GetService("Workspace"):WaitForChild("_DATA"):WaitForChild("GameFinished")
    GameFinished:GetPropertyChangedSignal("Value"):Connect(function()
        print("Changed", GameFinished.Value == true)
        if GameFinished.Value == true then
			getgenv().recordingMacro = false
			updatejson()
            repeat task.wait() until game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Enabled == true
            task.wait()
            pcall(function() Webhook() end)
			pcall(function() NormalItemWebhook() end)
			pcall(function() UniqueWebhook() end)
            print("next button pressed")
            task.wait(2.1)

            if getgenv().AutoFarmIC then
                for i = 1, 25 do
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_infinite_tower_from_game:InvokeServer()
                    task.wait(1)
                end
            end

            if getgenv().AutoContinue then	
				
                if game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.bg:FindFirstChild("Win") ~= nil then
					getgenv().level = GetNextLevel(GetCurrentLevelId())
					task.wait(10)
                    local args = {
						[1] = "next_story"
					}
					for i = 1, 25 do
						task.wait(1)
						game:GetService("ReplicatedStorage").endpoints.client_to_server.set_game_finished_vote:InvokeServer(unpack(args))
					end
                else
                    getgenv().level = GetCurrentLevelId()
                    updatejson()
                    if getgenv().isAlt ~= true then
						Teleport()
					end
                end
                updatejson()
            end

            if getgenv().AutoReplay then
                for i = 1, 25 do
                    local a={[1]="replay"} game:GetService("ReplicatedStorage").endpoints.client_to_server.set_game_finished_vote:InvokeServer(unpack(a))
                    task.wait(1)
                end
            elseif getgenv().AutoLeave then
				if getgenv().isAlt then
					repeat
						task.wait(1)
						local mainAccountFound = false
						for _, v in pairs(game.Players:GetPlayers()) do
							if tostring(v) == getgenv().mainAccount then
								mainAccountFound = true
							end
						end
					until mainAccountFound == false
					Teleport()
				else
					Teleport()
				end
            end
        end
	end)
end))
--#endregion

------// Auto Sell Units \\------
coroutine.resume(coroutine.create(function()
while task.wait() do
    if getgenv().UnitSellTog then

        for i, v in pairs(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.collection.grid.List.Outer.UnitFrames:GetChildren()) do
            if v.Name == "CollectionUnitFrame" then
                repeat task.wait() until v:FindFirstChild("name")
                for _, Info in next, getgenv().UnitCache do
                    if Info.name == v.name.Text and Info.rarity == getgenv().UnitToSell then
                        local args = {
                            [1] = {
                                [1] = tostring(v._uuid.Value)
                            }
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.sell_units:InvokeServer(unpack(args))
                     end
                end
            end
        end
        
    end
end
end))

------// Auto Upgrade \\------
--#region Auto Upgrade Loop
getgenv().autoUpgrader = false

function autoUpgradefunc()
	if not getgenv().lockAutoFunctions then
		repeat task.wait() until game:GetService("Workspace"):WaitForChild("_UNITS")

		unitList = {}
		for i, v in ipairs(game:GetService("Workspace")["_UNITS"]:GetChildren()) do
			if v:FindFirstChild("_stats") and v:FindFirstChild("_hitbox") then
				if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name and v["_stats"].xp.Value >= 0 then
					table.insert(unitList, {v["_stats"]["id"].Value, v["_stats"]["uuid"].Value, v, v["_stats"]["upgrade"].Value})
				end
			end
		end

		local currentUnitUUIDs = {}
		for i = 1, 6 do
			local unitUUID = getgenv().SelectedUnits["U" .. i]:split(" #")[2]
			table.insert(currentUnitUUIDs, {"U" .. i, unitUUID})
		end

		table.sort(unitList, function(a, b)
			local unitAFound = false
			local unitBFound = false

			for i = 1, 6 do
				if currentUnitUUIDs[i][2] == a[2] then
					unitAFound = true
				end
			end

			for i = 1, 6 do
				if currentUnitUUIDs[i][2] == b[2] then
					unitBFound = true
				end
			end

			if (unitAFound == false and unitBFound == false) then
				return true
			elseif (unitAFound == true and unitBFound == false) then
				return true
			elseif (unitAFound == false and unitBFound == true) then
				return false
			else
				local unitAIdentifier
				local unitBIdentifier

				for i = 1, 6 do
					if currentUnitUUIDs[i][2] == a[2] then
						unitAIdentifier = currentUnitUUIDs[i][1]
					end
				end

				for i = 1, 6 do
					if currentUnitUUIDs[i][2] == b[2] then
						unitBIdentifier = currentUnitUUIDs[i][1]
					end
				end

				if tonumber(getgenv().unitPlacementSettings[unitAIdentifier]["upgradePriority"]) ~= nil and tonumber(getgenv().unitPlacementSettings[unitBIdentifier]["upgradePriority"]) ~= nil then
					return tonumber(getgenv().unitPlacementSettings[unitAIdentifier]["upgradePriority"]) > tonumber(getgenv().unitPlacementSettings[unitBIdentifier]["upgradePriority"])
				end
			end
		end)
		for _, unitEntry in pairs(unitList) do
			
			for i = 1, 6 do
				if currentUnitUUIDs[i][2] == unitEntry[2] then
					localIdentifier = currentUnitUUIDs[i][1]
				end
			end
			print("localIDENT"..localIdentifier)
			if localIdentifier ~= nil then
				if tonumber(getgenv().unitPlacementSettings[localIdentifier]["upgradeFromWave"]) < game:GetService("Workspace"):WaitForChild("_wave_num").Value and tonumber(getgenv().unitPlacementSettings[localIdentifier]["upgradeCap"]) > unitEntry[4] and unitEntry[1] ~= "metal_knight_drone" and unitEntry[1] ~= "metal_knight_drone:shiny" then
					game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unitEntry[3])
				end
			end
		end
	end
end

--#endregion


------// Auto Sell/Quit \\------
--#region Auto Sell/Quit loop
coroutine.resume(coroutine.create(function()
    while task.wait(1.5) do
		if not getgenv().lockAutoFunctions then
			local _wave = game:GetService("Workspace"):WaitForChild("_wave_num")
			if getgenv().autoQuit and tonumber(getgenv().quitAtWave) <= _wave.Value then
				Teleport()
			end

			if getgenv().autoSell and tonumber(getgenv().sellatwave) <= _wave.Value then
				getgenv().disableAutoFarm = true
				if game.PlaceId ~= 8304191830 then
					repeat task.wait() until game:GetService("Workspace"):WaitForChild("_UNITS")
					for i, v in ipairs(game:GetService("Workspace")["_UNITS"]:GetChildren()) do
						repeat
							task.wait()
						until v:WaitForChild("_stats")
						if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name then
							repeat task.wait() until v:WaitForChild("_stats"):WaitForChild("upgrade")
							game:GetService("ReplicatedStorage").endpoints.client_to_server.sell_unit_ingame:InvokeServer(v)
						end
					end
				end
			end
		end
    end
end))
--#endregion

--//Auto Abilities--
--#region Auto Abilities loop
getgenv().autoabilityerr = false

function autoabilityfunc()
	local success, err = pcall(function() --///
		if not getgenv().lockAutoFunctions then
			repeat task.wait() until game:GetService("Workspace"):WaitForChild("_UNITS")
			for i, v in ipairs(game:GetService("Workspace")["_UNITS"]:GetChildren()) do
				if v:FindFirstChild("_stats") then
					if v._stats:FindFirstChild("player") and v._stats:FindFirstChild("xp") then
						if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name and v["_stats"].xp.Value > 0 then
							game:GetService("ReplicatedStorage").endpoints.client_to_server.use_active_attack:InvokeServer(v)
						end
					end
				end
			end
		end
	end)
		
	if err then
		warn("//////////////////////////////////////////////////")
		warn("//////////////////////////////////////////////////")
		getgenv().autoabilityerr = true
		error(err)
	end
	
end

coroutine.resume(coroutine.create(function()

    while task.wait(2) do
        if getgenv().autoabilities then
            if game.PlaceId ~= 8304191830 then
                pcall(function()
                    autoabilityfunc()
                end)
            end
            if  getgenv().autoabilityerr == true then
                task.wait()
                autoabilityfunc()
                getgenv().autoabilityerr = false
            end
        end
    end   

end))
--#endregion


getgenv().teleporting = true

------// Auto Start \\------
--#region Auto Start loop

local function checkChallenge()
    for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
        if v:IsA("SurfaceGui") then
            if v:FindFirstChild("ChallengeCleared") then
                --print(v.ChallengeCleared.Visible)
                return v.ChallengeCleared.Visible
            end
        end
    end
end

local function checkReward()
    if checkChallenge() == false then
        if getgenv().selectedreward == game:GetService("Workspace")["_LOBBIES"]["_DATA"]["_CHALLENGE"]["current_reward"].Value then
            return true
        elseif getgenv().AutoChallengeAll then
            return true
        else
            return false
        end
    else
        return false
    end
end

local function startfarming()
	task.wait(1)
    if getgenv().autoStart and getgenv().AutoFarm and getgenv().teleporting 
                           and getgenv().AutoFarmTP == false and getgenv().AutoFarmIC == false then
        if game.PlaceId == 8304191830 then
            local cpos = player.Character.HumanoidRootPart.CFrame
			
			if not getgenv().isAlt then
				if getgenv().altMode then
					repeat 
						task.wait(1)
						local altsInGame = 0
						for _, val in pairs(game.Players:GetPlayers()) do
							for i, alt in pairs(getgenv().altList) do
								if tostring(val.Name) == tostring(alt) then
									print(val.Name)
									altsInGame += 1
									break
								end
							end
						end
					until altsInGame >= getgenv().altCount
				end

				if getgenv().autoRaid then
					if Workspace._RAID.Raid:FindFirstChild(getgenv().raiddoor) then
						if tostring(Workspace._RAID.Raid[getgenv().raiddoor].Owner.Value) ~= player.Name then
							for i, v in pairs(game:GetService("Workspace")["_RAID"].Raid:GetDescendants()) do
								if v.Name == "Owner" and v.Value == nil then
									local args = {
										[1] = tostring(v.Parent.Name)
									}
									game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer(unpack(args))

									local args = {
										[1] = tostring(v.Parent.Name), -- Lobby 
										[2] = getgenv().raidLevel, -- World
										[3] = true, -- Friends Only or not
										[4] = "Hard"
									}
									game:GetService("ReplicatedStorage").endpoints.client_to_server.request_lock_level:InvokeServer(unpack(args))
			
									local altsInGame = false
			
									for _, val in pairs(game.Players:GetPlayers()) do
										for i, alt in pairs(getgenv().altList) do
											if tostring(val.Name) == tostring(alt) then
												altsInGame = true
												break
											end
										end
									end
									
									if altsInGame then
										repeat 
											task.wait(1)
											print(v.Parent.Timer.Value)
											if v.Parent.Timer.Value <= 50 then
												local leave_args = {
													[1] = v.Parent.Name
												}
			
												game:GetService("ReplicatedStorage").endpoints.client_to_server.request_leave_lobby:InvokeServer(unpack(leave_args))
												break
											end
										until #v.Parent.Players:GetChildren() >= getgenv().altCount + 1
			
										local args = { 
											[1] = tostring(v.Parent.Name)
										}
			
										task.wait(0.1)
										game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_game:InvokeServer(unpack(args))
										getgenv().raiddoor = v.Parent.Name print(v.Parent.Name) --v.Parent:GetFullName()
										player.Character.HumanoidRootPart.CFrame = v.Parent.Door.CFrame
										break
									else
										local args = { 
											[1] = tostring(v.Parent.Name)
										}
										
										game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_game:InvokeServer(unpack(args))
										getgenv().raiddoor = v.Parent.Name print(v.Parent.Name) --v.Parent:GetFullName()
										player.Character.HumanoidRootPart.CFrame = v.Parent.Door.CFrame
										return(1)
									end		
								end
							end
						end
					end
					return(1)
				end

				if getgenv().autoPortal then
					for _, val in pairs(game.Players:GetPlayers()) do
						print(val.Name)
						for i, alt in pairs(getgenv().altList) do
							if tostring(val.Name) == tostring(alt) then
								altsInGame = true
								break
							end
						end
					end

					local args = {
						[1] = getBorosPortals()[1]["uuid"],
						[2] = {
							["friends_only"] = true
						}
					}
					  
					game:GetService("ReplicatedStorage").endpoints.client_to_server.use_portal:InvokeServer(unpack(args))
					  
					for i, v in pairs(game:GetService("Workspace")["_PORTALS"].Lobbies:GetDescendants()) do
						if v.Name == "Owner" and tostring(v.Value) == getgenv().mainAccount then
							if altsInGame then
								repeat 
									task.wait(1)
									print(v.Parent.Timer.Value)
									if v.Parent.Timer.Value <= 50 then
										local leave_args = {
											[1] = v.Parent.Name
										}
		
										game:GetService("ReplicatedStorage").endpoints.client_to_server.request_leave_lobby:InvokeServer(unpack(leave_args))
										break
									end
								until #v.Parent.Players:GetChildren() >= getgenv().altCount + 1
							end

							local args = {
								[1] = v.Parent.Name
							}
							game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_game:InvokeServer(unpack(args))
							return(1)
						end
					end
					return(1)
				end

				if getgenv().autoPortalCSM then
					for _, val in pairs(game.Players:GetPlayers()) do
						print(val.Name)
						for i, alt in pairs(getgenv().altList) do
							if tostring(val.Name) == tostring(alt) then
								altsInGame = true
								break
							end
						end
					end

					local args = {
						[1] = getCSMPortals()[1]["uuid"],
						[2] = {
							["friends_only"] = true
						}
					}
					  
					game:GetService("ReplicatedStorage").endpoints.client_to_server.use_portal:InvokeServer(unpack(args))
					  
					for i, v in pairs(game:GetService("Workspace")["_PORTALS"].Lobbies:GetDescendants()) do
						if v.Name == "Owner" and tostring(v.Value) == getgenv().mainAccount then
							if altsInGame then
								repeat 
									task.wait(1)
									print(v.Parent.Timer.Value)
									if v.Parent.Timer.Value <= 50 then
										local leave_args = {
											[1] = v.Parent.Name
										}
		
										game:GetService("ReplicatedStorage").endpoints.client_to_server.request_leave_lobby:InvokeServer(unpack(leave_args))
										break
									end
								until #v.Parent.Players:GetChildren() >= getgenv().altCount + 1
							end

							local args = {
								[1] = v.Parent.Name
							}
							game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_game:InvokeServer(unpack(args))
							return(1)
						end
					end
				end

				if Workspace._LOBBIES.Story:FindFirstChild(getgenv().door) then
					if tostring(Workspace._LOBBIES.Story[getgenv().door].Owner.Value) ~= player.Name and not getgenv().autoRaid then
						for i, v in pairs(game:GetService("Workspace")["_LOBBIES"].Story:GetDescendants()) do
							if v.Name == "Owner" and v.Value == nil then
								local args = {
									[1] = tostring(v.Parent.Name)
								}
								game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer(unpack(args))
							
								task.wait()
							
								if getgenv().level:match("infinite") then
									local args = {
										[1] = tostring(v.Parent.Name), -- Lobby 
										[2] = getgenv().level, -- World
										[3] = true, -- Friends Only or not
										[4] = "Hard"
									}
									game:GetService("ReplicatedStorage").endpoints.client_to_server.request_lock_level:InvokeServer(unpack(args))
								else
									local args = {
										[1] = tostring(v.Parent.Name), -- Lobby 
										[2] = getgenv().level, -- World
										[3] = true, -- Friends Only or not
										[4] = getgenv().difficulty
									}
									game:GetService("ReplicatedStorage").endpoints.client_to_server.request_lock_level:InvokeServer(unpack(args))
								end
		
								local altsInGame = false
		
								for _, val in pairs(game.Players:GetPlayers()) do
									print(val.Name)
									for i, alt in pairs(getgenv().altList) do
										if tostring(val.Name) == tostring(alt) then
											altsInGame = true
											break
										end
									end
								end
								
								if altsInGame then
									repeat 
										task.wait(1)
										print(v.Parent.Timer.Value)
										if v.Parent.Timer.Value <= 50 then
											local leave_args = {
												[1] = v.Parent.Name
											}
		
											game:GetService("ReplicatedStorage").endpoints.client_to_server.request_leave_lobby:InvokeServer(unpack(leave_args))
											break
										end
									until #v.Parent.Players:GetChildren() >= getgenv().altCount + 1
		
									local args = { 
										[1] = tostring(v.Parent.Name)
									}
		
									game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_game:InvokeServer(unpack(args))
									getgenv().door = v.Parent.Name print(v.Parent.Name) --v.Parent:GetFullName()
									player.Character.HumanoidRootPart.CFrame = v.Parent.Door.CFrame
									break
								else
									local args = { 
										[1] = tostring(v.Parent.Name)
									}
									
									game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_game:InvokeServer(unpack(args))
									getgenv().door = v.Parent.Name print(v.Parent.Name) --v.Parent:GetFullName()
									player.Character.HumanoidRootPart.CFrame = v.Parent.Door.CFrame
									break
								end		
							end
						end
					end
				end
			else
				local timer = 0
				local mainAccountFound = false
				repeat
					task.wait(1)
					timer += 1
					mainAccountFound = false
					for _, v in pairs(game.Players:GetPlayers()) do
						if tostring(v) == getgenv().mainAccount then
							mainAccountFound = true
							print("FOUND")
						end
					end
				until mainAccountFound

				if mainAccountFound ~= true then
					loadfile("TeleportTo.lua")()
				end

				local inMainLobby = false
				
				repeat
					print("WAITING ON MAIN TO SET LEVEL")
					for i, v in pairs(game:GetService("Workspace")["_LOBBIES"].Story:GetDescendants()) do
						if v.Name == "Owner" and tostring(v.Value) == getgenv().mainAccount then
							for _, val in pairs(v.Parent:GetDescendants()) do
								if val.Name == "TouchInterest" and val.Parent then
									firetouchinterest(game.Players.LocalPlayer.Character.Head, val.Parent, 0)
									task.wait(0.1)
									firetouchinterest(game.Players.LocalPlayer.Character.Head, val.Parent, 1)
									task.wait(0.1)
								end
							end
						end
					end
					for i, v in pairs(game:GetService("Workspace")["_EVENT_CHALLENGES"].Lobbies:GetDescendants()) do
						if v.Name == "Owner" and tostring(v.Value) == getgenv().mainAccount then
							for _, val in pairs(v.Parent:GetDescendants()) do
								if val.Name == "TouchInterest" and val.Parent then
									firetouchinterest(game.Players.LocalPlayer.Character.Head, val.Parent, 0)
									task.wait(0.1)
									firetouchinterest(game.Players.LocalPlayer.Character.Head, val.Parent, 1)
									task.wait(0.1)
								end
							end
						end
					end
					for i, v in pairs(game:GetService("Workspace")["_PORTALS"].Lobbies:GetDescendants()) do
						if v.Name == "Owner" and tostring(v.Value) == getgenv().mainAccount then
							local args = {
								[1] = v.Parent.Name
							}
							game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer(unpack(args))
						end
					end
					task.wait(0.5)
				until (inMainLobby == true)
			end
            task.wait()

            player.Character.HumanoidRootPart.CFrame = cpos

			if not getgenv().isAlt then
				if Workspace._LOBBIES.Story[getgenv().door].Owner == player.Name or Workspace._LOBBIES.Story[getgenv().raiddoor].Owner == player.Name then
					if Workspace._RAID.Raid[getgenv().door].Owner == player.Name then
						if Workspace._RAID.Raid[getgenv().door].Teleporting.Value == true then
							getgenv().teleporting = false
						else
							getgenv().teleporting = true
						end
					end
				end

				if Workspace._LOBBIES.Story:FindFirstChild(getgenv().door) then
					if Workspace._LOBBIES.Story[getgenv().door].Owner == player.Name or Workspace._LOBBIES.Story[getgenv().raiddoor].Owner == player.Name then
						if Workspace._LOBBIES.Story[getgenv().door].Teleporting.Value == true then
							getgenv().teleporting = false
						else
							getgenv().teleporting = true
						end
					end
				end

			else
				if Workspace._RAID.Raid:FindFirstChild(getgenv().door) then
					if tostring(Workspace._RAID.Raid[getgenv().door].Owner) == getgenv().mainAccount or tostring(Workspace._RAID.Raid[getgenv().raiddoor].Owner) == getgenv().mainAccount  then
						if Workspace._RAID.Raid[getgenv().door].Teleporting.Value == true then
							getgenv().teleporting = false
						else
							getgenv().teleporting = true
						end
					end
				end

				if Workspace._LOBBIES.Story:FindFirstChild(getgenv().door) then
					if tostring(Workspace._RAID.Raid[getgenv().door].Owner) == getgenv().mainAccount or tostring(Workspace._RAID.Raid[getgenv().raiddoor].Owner) == getgenv().mainAccount then
						if Workspace._LOBBIES.Story[getgenv().door].Teleporting.Value == true then
							getgenv().teleporting = false
						else
							getgenv().teleporting = true
						end
					end
				end
			end

            warn("farming")
            task.wait(3)

        end
    end
end

local function startChallenge()
    if game.PlaceId == 8304191830 then
        local cpos = player.Character.HumanoidRootPart.CFrame

        if getgenv().AutoChallenge and getgenv().autoStart and getgenv().AutoFarm and checkReward() == true then

            for i, v in pairs(game:GetService("Workspace")["_CHALLENGES"].Challenges:GetDescendants()) do
                if v.Name == "Owner" and v.Value == nil then
                    --print(v.Parent.Name.." "..v.Parent:GetFullName())
                    local args = { 
                        [1] = tostring(v.Parent.Name)
                    }
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer(unpack(args))

                    getgenv().chdoor = v.Parent.Name
                    break
                end
            end
            task.wait()
            player.Character.HumanoidRootPart.CFrame = cpos
           
        end
    end
end

coroutine.resume(coroutine.create(function()
    while task.wait() do
        if getgenv().AutoFarmIC == false and getgenv().AutoFarmTP == false then
            if checkChallenge() == false  then --challenge is not cleared
                if  getgenv().AutoChallenge and checkReward() == true then
                    startChallenge() --start challenge
                else
                    startfarming()--regular farming
                end
            elseif checkChallenge() == true then
                startfarming()--regular farming
            end
        end
    end
end))
--#endregion


------// Auto Start Infinity Castle && Thriller Park \\------

local function FarmCastlePark()
    if getgenv().AutoFarmIC and getgenv().AutoFarm then
        if game.PlaceId == 8304191830 then

            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(12423.1855, 155.24025, 3198.07593, -1.34111269e-06, -2.02512282e-08, 1, 3.91705386e-13, 1, 2.02512282e-08, -1, 4.18864542e-13, -1.34111269e-06)
            
            getgenv().infinityroom = 0

            for i, v in pairs(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.InfiniteTowerUI.LevelSelect.InfoFrame.LevelButtons:GetChildren()) do
                if v.Name == "FloorButton" then
                    if v.clear.Visible == false and v.Locked.Visible == false then
                        local room = string.split(v.Main.text.Text, " ")

                        local args = {
                            [1] = tonumber(room[2])
                        }
                        
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_infinite_tower:InvokeServer(unpack(args))
                        getgenv().infinityroom = tonumber(room[2])
                        break
                    end
                end
            end
            
            task.wait(6)
        end
    elseif getgenv().AutoFarmTP and getgenv().AutoFarm then
        if game.PlaceId == 8304191830 then

            local cpos = player.Character.HumanoidRootPart.CFrame

            for i, v in pairs(game:GetService("Workspace")["_EVENT_CHALLENGES"].Lobbies:GetDescendants()) do
                    if v.Name == "Owner" and v.Value == nil then

                        local args = {
                            [1] = tostring(v.Parent.Name)
                        }
                        
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer(unpack(args))

                        task.wait()

                        player.Character.HumanoidRootPart.CFrame = v.Parent.Door.CFrame
                        break
                    end
                end

            task.wait()

            player.Character.HumanoidRootPart.CFrame = cpos
            warn("farming")
            task.wait(5)

        end
    end
end

coroutine.resume(coroutine.create(function()
    while task.wait() do
        if checkChallenge() == false  then --challenge is not cleared
            if  getgenv().AutoChallenge and checkReward() == true then
                startChallenge() --start challenge
            else
                FarmCastlePark()--regular farming
            end
        elseif checkChallenge() == true then
            FarmCastlePark()--regular farming
        end
    end
end))

if getgenv().AutoLoadTP == true then
    local exec = tostring(identifyexecutor())

    if exec == "Synapse X" then
        syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Tesseract1234567890/animeadv/main/script.lua'))()")
        RayfieldLib:Notify({
            Title = "Queued to Auto-Attach on Teleport!",
            Content = "Success",
            Duration = 6.5
        })
    else
        queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Tesseract1234567890/animeadv/main/script.lua'))()")
    end

end


--hide name
task.spawn(function()  -- Hides name for yters (not sure if its Fe)
    while task.wait() do
		if getgenv().hidename == true then
			pcall(function()
				if game.Players.LocalPlayer.Character.Head:FindFirstChild("_overhead") then
				workspace[game.Players.LocalPlayer.Name].Head["_overhead"].Enabled = false
				end
			end)
		else
			pcall(function()
				if game.Players.LocalPlayer.Character.Head:FindFirstChild("_overhead") then
				workspace[game.Players.LocalPlayer.Name].Head["_overhead"].Enabled = false
				end
			end)
		end
    end
end)


--anti afk
pcall(function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)

    game:GetService("ReplicatedStorage").endpoints.client_to_server.claim_daily_reward:InvokeServer()
end)

if game.PlaceId == 8304191830 then
    
    pcall(function() ShopSniperWebhook(true) end)
    pcall(function() SpecialSummonSniperWebhook(true) end)
    pcall(function() StandardSummonSniperWebhook(true) end)
    
    
end

print("Successfully Loaded!!")
---------------------------------------------------------------------
