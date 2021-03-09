local JojoHub = Instance.new("ScreenGui") JojoHub.Name = "JojoHubFps" JojoHub.Parent = game.CoreGui JojoHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local Main = Instance.new("Frame",JojoHub) Main.Name = "Main" Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Main.Position = UDim2.new(0.060956791, 0, 0.0675675645, 0) Main.Size = UDim2.new(0, 200, 0, 42) Main.Visible = false
local NameOfHub = Instance.new("TextLabel",Main) NameOfHub.Name = "NameOfHub" NameOfHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255) NameOfHub.BackgroundTransparency = 1.000 NameOfHub.Size = UDim2.new(0.75999999, 0, 1, 0) NameOfHub.Font = Enum.Font.Roboto NameOfHub.Text = "Nano|Hub" NameOfHub.TextColor3 = Color3.fromRGB(255, 255, 255) NameOfHub.TextScaled = true NameOfHub.TextSize = 14.000 NameOfHub.TextWrapped = true NameOfHub.TextXAlignment = Enum.TextXAlignment.Left
local ToggleOpen = Instance.new("TextButton",Main) ToggleOpen.Name = "ToggleOpen" ToggleOpen.Parent = Main ToggleOpen.BackgroundColor3 = Color3.fromRGB(255, 255, 255) ToggleOpen.BackgroundTransparency = 1.000 ToggleOpen.Position = UDim2.new(0.75999999, 0, 0, 0) ToggleOpen.Size = UDim2.new(0, 48, 0, 42) ToggleOpen.Font = Enum.Font.SourceSans ToggleOpen.Text = "-" ToggleOpen.TextColor3 = Color3.fromRGB(255, 255, 255) ToggleOpen.TextSize = 90.000
local Opened = Instance.new("Frame",Main) Opened.Name = "Opened" Opened.Parent = Main Opened.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Opened.Position = UDim2.new(0, 0, 1, 0) Opened.Size = UDim2.new(0, 200, 0, 320) Opened.Visible = false
local tabFrame = Instance.new("ScrollingFrame",Opened) local listLayout = Instance.new("UIListLayout",tabFrame) local padding = Instance.new("UIPadding",tabFrame)listLayout.Padding = UDim.new(0,10)padding.PaddingLeft = UDim.new(0.100000001, 0)padding.PaddingTop = UDim.new(0.0199999996, 0)tabFrame.BackgroundTransparency = 1 tabFrame.BorderSizePixel = 0 tabFrame.Size = UDim2.new(1,1,1,1)tabFrame.Name = 'Scroll'tabFrame.BottomImage = ""tabFrame.MidImage = ""tabFrame.TopImage = ""
--Corners
local Corner1 = Instance.new("UICorner",Main) local Corner2 = Instance.new("UICorner",Opened)
--Gradients
local gradient1 = Instance.new("UIGradient",Opened) gradient1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(85, 0, 127))} local gradient2 = Instance.new("UIGradient",Main) gradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(85, 0, 127))}
--Esp
local espFolder = Instance.new("Folder",game.TestService) espFolder.Name = 'Esp'
--Services
local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RService = game:GetService("RunService")
--Other
local library = {
	esp = loadstring(game:HttpGet('https://raw.githubusercontent.com/MrAntiMatteryAlt/No/main/Esp.lua'))()
}

library.esp:Toggle(true)
library.esp.Boxes = false
library.esp.Names = false

local binds = {};binds.Esp = 'Z';binds.Aimbot = 'X';binds.UpdateEsp = 'T';binds.Toggle = 'RightAlt';

local allThings = {}

--_G

_G.DrawingApi = true
_G.getrawmetatable = true

--Start of UI library
function library:Dragify(Frame)
	dragToggle = nil
	local dragSpeed = 0.50
	dragInput = nil
	dragStart = nil
	local dragPos = nil
	function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(0), {Position = Position}):Play()
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

function library:CreateButton(parent,text,enabled,buttonname)
	local Button = Instance.new("TextButton",parent)
	local Text = Instance.new("TextLabel",Button)
	local UICorner = Instance.new("UICorner",Button)
	local boolValue = Instance.new("BoolValue",Button)
	--Value part
	boolValue.Name = 'Enabled'
	boolValue.Value = enabled
	--Button part
	Button.Name = buttonname
	Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	Button.Position = UDim2.new(0.219999999, 0, 0, 0)
	Button.Size = UDim2.new(0, 30, 0, 30)
	Button.Font = Enum.Font.SourceSans
	Button.Text = ""
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.TextSize = 14.000
	--Text part
	Text.Name = "Texting"
	Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Text.BackgroundTransparency = 1.000
	Text.Position = UDim2.new(1.33333337, 0, 0, 0)
	Text.Size = UDim2.new(0, 120, 1, 0)
	Text.Font = Enum.Font.Roboto
	Text.TextScaled = true
	Text.TextWrapped = true
	Text.TextXAlignment = Enum.TextXAlignment.Left
	Text.Text = text
end

function library:CreateTextBox(parent,text,name,textcolor3,atextcolor3)
	local TextBox = Instance.new("TextBox",parent)
	--TextBox part
	TextBox.Name = name
	TextBox.BackgroundTransparency = 1
	TextBox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	TextBox.Position = UDim2.new(0.219999999, 0, 0, 0)
	TextBox.Size = UDim2.new(0, 160, 0, 50)
	TextBox.Font = Enum.Font.Roboto
	TextBox.PlaceholderText = text
	TextBox.Text = ""
	TextBox.PlaceholderColor3 = atextcolor3
	TextBox.TextColor3 = textcolor3
	TextBox.TextSize = 20
end

local function BMEA_fake_script() -- JojoHub.Handler 
	library:CreateButton(tabFrame,'Wallbang',false,'Wallbang')
	library:CreateButton(tabFrame,'Aimbot',false,'Aimbot')
	library:CreateButton(tabFrame,'Esp',false,'Esp')
	library:CreateButton(tabFrame,'SmoothAim',false,'SmoothAim')
	library:CreateButton(tabFrame,'Teamcheck',false,'Teamcheck')
	library:CreateButton(tabFrame,'Silent Aim',false,'SilentAim')
	library:CreateButton(tabFrame,'Trigger Bot',false,'Triggerbot')
	library:CreateButton(tabFrame,'Tracers',false,'Tracers')
	--library:CreateTextBox(tabFrame,'Command Here','CommandBox',Color3.fromRGB(0, 0, 255),Color3.fromRGB(0, 0, 255))
	local script = Instance.new('LocalScript', JojoHub)

	local colors = {}
	
	local openedCombat = Opened
	local togglecombat = ToggleOpen
	local jojoaim = openedCombat.Scroll.Aimbot
	--local commandBar = openedCombat.Scroll.CommandBox
	local teamcheck = openedCombat.Scroll.Teamcheck
	local tracers = openedCombat.Scroll.Tracers
	local silentaim = openedCombat.Scroll.SilentAim
	local wallbang = openedCombat.Scroll.Wallbang
	local smoothAim = openedCombat.Scroll.SmoothAim
	local triggerBot = openedCombat.Scroll.Triggerbot
	local esp = openedCombat.Scroll.Esp
	local UIS = game:GetService("UserInputService")
	local localplr = game.Players.LocalPlayer
	local character = localplr.Character
	local camera = workspace.Camera
	local ts = game:GetService("TweenService")
	local mouse = localplr:GetMouse()
	local bindToRender = function(name,numberpriority,func)
		RService:BindToRenderStep(name,numberpriority,func)
	end
	local tweenInfo = TweenInfo.new(
		0.1,
		Enum.EasingStyle.Bounce,
		Enum.EasingDirection.InOut,
		0.5
	)
	
	--_G. things
	_G.silentaim = false
	_G.wallbang = false
	_G.aim = false
	_G.teamcheck = true
	_G.smoothAim = false
	_G.esp = false
	_G.holding = false
	_G.triggerbot = false
	_G.tracers = false
	
	--For Saving
	
	allThings.Aim = _G.aim
	allThings.Esp = _G.esp
	allThings.SmoothAim = _G.smoothAim
	allThings.Teamcheck = _G.teamcheck
	
	UIS.InputBegan:Connect(function(input,IsTyping)
		if IsTyping then
			return
		elseif input.KeyCode == Enum.KeyCode[binds.Toggle] then
			for i,frame in pairs(script.Parent:GetChildren()) do
				if frame:IsA("Frame") then
					if frame.Visible == true then
						frame.Visible = false
					else
						frame.Visible = true
					end
				end
			end
		end
	end)
	
	UIS.InputBegan:Connect(function(input,IsTyping)
		if IsTyping then
			return
			elseif input.KeyCode == Enum.KeyCode[binds.Aimbot] then
				if _G.aim == true then
					_G.aim = false
				else
					_G.aim = true
				end
		end
	end)
	UIS.InputBegan:Connect(function(input,IsTyping)
		if IsTyping then
			return
			elseif input.KeyCode == Enum.KeyCode[binds.Esp] then
				if _G.esp == true then
					_G.esp = false
					enableEsp()
				else
					_G.esp = true
					enableEsp()
				end
		end
	end)
	function gethumanoids()
		local localplayer = game.Players.LocalPlayer or game.Players.PlayerAdded:Wait()
		local char = workspace:WaitForChild(localplayer.Name)
		local dist = math.huge
		local humPos = {}
		for i,v in pairs(workspace:GetChildren()) do
			if v:FindFirstChild('Humanoid') and v ~= char then
				table.insert(humPos,(char.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude)
			end
		end
		table.sort(humPos)
		for i,v in pairs(humPos) do
			if i ~= 1 then
				table.remove(humPos,i)
			end
		end
		for i,v in pairs(workspace:GetChildren()) do
			if v:FindFirstChild('Humanoid') and v ~= char then
				if (char.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude == humPos[1] then
					return v
				end
			end
		end
	end

	function colors.rainbow(obj,typing)
		if typing == 'Esp' then
			local x = 0
			while true do
				obj.Color3 = Color3.fromHSV(x,1,1)
				x = x + 1/100
				wait(.1)
				if x >= 1 then
					x = 0
				end
			end
		end
	end
	
	local function ClosestPlayerToMouse()
		local target = nil
		local dist = math.huge
		for i,v in pairs(game.Players:GetPlayers()) do
			if v.Name ~= localplr.Name then
				if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and _G.silentaim and _G.teamcheck and v.Team ~= localplr.Team then
					local screenpoint = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
					local check = (Vector2.new(mouse.X,mouse.Y)-Vector2.new(screenpoint.X,screenpoint.Y)).magnitude

					if check < dist then
						target  = v
						dist = check
					end
				elseif v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and _G.silentaim and not _G.teamcheck then
					local screenpoint = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
					local check = (Vector2.new(mouse.X,mouse.Y)-Vector2.new(screenpoint.X,screenpoint.Y)).magnitude

					if check < dist then
						target  = v
						dist = check
					end
				end
			end
		end

		return target 
	end

	
	function enableSilentAim()
		local mt = getrawmetatable(game)
		local namecall = mt.__namecall
		setreadonly(mt,false)

		mt.__namecall = function(self,...)
			local args = {...}
			local method = getnamecallmethod()

			if tostring(self) == "HitPart" and method == "FireServer" and _G.silentaim then
				args[1] = ClosestPlayerToMouse().Character.PrimaryPart
				args[2] = ClosestPlayerToMouse().Character.PrimaryPart.Position
				return self.FireServer(self, unpack(args))
			end
			return namecall(self,...)
		end
	end
	
	function disableSilentAim()
		_G.silentaim = false
	end
	
	function allPlayers(argument)
		for _,v in pairs(game.Players:GetPlayers()) do
			if argument == 'with' then
				if v ~= localplr then
					return v
				end
			end
		end
	end
	
	function enableTracers() --For all esps
		bindToRender('tracers',1,function()
			if _G.tracers then
				library.esp.Tracers = true
			else
				library.esp.Tracers = false
			end
		end)
	end
	
	function reloadesp()
		if _G.esp then
			_G.esp = false
			wait()
			_G.esp = true
		end
	end
	
	--[[while wait(30) do
		reloadesp()
	end]]
	
	togglecombat.MouseButton1Click:Connect(function()
		if openedCombat.Visible == true then
			openedCombat.Visible = false
		else
			openedCombat.Visible = true
		end
	end)
	
	function enableEsp()
		bindToRender('esp',1,function()
			if _G.esp then
				library.esp.Boxes = true
			else
				library.esp.Boxes = false
			end
		end)
	end
	
	function enableWallbang()
		local MT = getrawmetatable(game)
		local OldIndex = MT.__index
		setreadonly(MT, false)
		MT.__index = newcclosure(function(A, B)
			if B == "Clips" then
				if _G.wallbang then
					return workspace.Map
				end
			end
			return OldIndex(A, B)
		end)
	end
	
	function disbaleWallbang()
		_G.wallbang = false
	end
	
	bindToRender('aimbot',1,function()
		if _G.holding then
			if _G.aim and not _G.smoothAim then
				if _G.teamcheck then
					if gethumanoids() and game.Players:WaitForChild(gethumanoids().Name) and gethumanoids().Head then
						local humplr = game.Players[gethumanoids().Name]
						if localplr.Neutral == false then
							if humplr.Team ~= localplr.Team then
								camera.CFrame = CFrame.new(camera.CFrame.Position,gethumanoids().Head.Position)
							end
						else
							if humplr.Neutral == true then
								camera.CFrame = CFrame.new(camera.CFrame.Position,gethumanoids().Head.Position)
							end
						end
					end
				else
					if gethumanoids() and gethumanoids().Head then
						camera.CFrame = CFrame.new(camera.CFrame.Position,gethumanoids().Head.Position)
					end
				end
			end
		end
	end)
	
	UIS.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton3 then
			_G.holding = true
		end
	end)
	
	UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton3 then
			if _G.holding then
				_G.holding = false
			end
		end
	end)

	bindToRender('tweens',1,function()
		local newTweenInfo = TweenInfo.new(0.5)
		if _G.teamcheck then local tween = ts:Create(teamcheck,tweenInfo,{BackgroundColor3 = Color3.fromRGB(0, 255, 0)}); local tween2 = ts:Create(teamcheck.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(0,0,0)});tween:Play();tween2:Play();wait(0.5);else local tween = ts:Create(teamcheck,tweenInfo,{BackgroundColor3 = Color3.fromRGB(255, 0, 0)});local tween2 = ts:Create(teamcheck.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(145, 145, 145)});tween2:Play();tween:Play();wait(0.5);end;
		if _G.esp then
			local tween = ts:Create(esp,tweenInfo,{BackgroundColor3 = Color3.fromRGB(0, 255, 0)});
			local tween2 = ts:Create(esp.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(0,0,0)});
			tween:Play();
			tween2:Play();
			wait(0.5);
		else
			local tween = ts:Create(esp,tweenInfo,{BackgroundColor3 = Color3.fromRGB(255, 0, 0)});
			local tween2 = ts:Create(esp.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(145, 145, 145)});
			tween:Play();
			tween2:Play();
			wait(0.5);
		end;
		if _G.tracers then
			local tween = ts:Create(tracers,tweenInfo,{BackgroundColor3 = Color3.fromRGB(0, 255, 0)});
			local tween2 = ts:Create(tracers.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(0,0,0)});
			tween:Play();
			tween2:Play();
			wait(0.5);
		else
			local tween = ts:Create(tracers,tweenInfo,{BackgroundColor3 = Color3.fromRGB(255, 0, 0)});
			local tween2 = ts:Create(tracers.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(145, 145, 145)});
			tween:Play();
			tween2:Play();
			wait(0.5);
		end;
		if _G.wallbang then
			local tween = ts:Create(wallbang,tweenInfo,{BackgroundColor3 = Color3.fromRGB(0, 255, 0)});
			local tween2 = ts:Create(wallbang.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(0,0,0)});
			tween:Play();
			tween2:Play();
			wait(0.5);
		else
			local tween = ts:Create(wallbang,tweenInfo,{BackgroundColor3 = Color3.fromRGB(255, 0, 0)});
			local tween2 = ts:Create(wallbang.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(145, 145, 145)});
			tween:Play();
			tween2:Play();
			wait(0.5);
		end;
		if _G.aim then
			local tween = ts:Create(jojoaim,tweenInfo,{BackgroundColor3 = Color3.fromRGB(0, 255, 0)});
			local tween2 = ts:Create(jojoaim.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(0,0,0)});
			tween:Play();
			tween2:Play();
			wait(0.5);
		else
			local tween = ts:Create(jojoaim,tweenInfo,{BackgroundColor3 = Color3.fromRGB(255, 0, 0)})
			local tween2 = ts:Create(jojoaim.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(145,145,145)})
			tween:Play()
			tween2:Play()
			wait(0.5)
		end;
		if _G.smoothAim then
			local tween = ts:Create(smoothAim,tweenInfo,{BackgroundColor3 = Color3.fromRGB(0, 255, 0)})
			local tween2 = ts:Create(smoothAim.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(0,0,0)})
			tween:Play()
			tween2:Play()
			wait(0.5)
		else
			local tween = ts:Create(smoothAim,tweenInfo,{BackgroundColor3 = Color3.fromRGB(255, 0, 0)})
			local tween2 = ts:Create(smoothAim.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(145, 145, 145)})
			tween:Play()
			tween2:Play()
			wait(0.5)
		end;
		if _G.silentaim then
			local tween = ts:Create(silentaim,tweenInfo,{BackgroundColor3 = Color3.fromRGB(0, 255, 0)})
			local tween2 = ts:Create(silentaim.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(0,0,0)})
			tween:Play()
			tween2:Play()
			wait(0.5)
		else
			local tween = ts:Create(silentaim,tweenInfo,{BackgroundColor3 = Color3.fromRGB(255, 0, 0)})
			local tween2 = ts:Create(silentaim.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(145, 145, 145)})
			tween:Play()
			tween2:Play()
			wait(0.5)
		end;
		if _G.triggerbot then
			local tween = ts:Create(triggerBot,tweenInfo,{BackgroundColor3 = Color3.fromRGB(0, 255, 0)})
			local tween2 = ts:Create(triggerBot.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(0,0,0)})
			tween:Play()
			tween2:Play()
			wait(0.5)
		else
			local tween = ts:Create(triggerBot,tweenInfo,{BackgroundColor3 = Color3.fromRGB(255, 0, 0)})
			local tween2 = ts:Create(triggerBot.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(145, 145, 145)})
			tween:Play()
			tween2:Play()
			wait(0.5)
		end;
		--[[
		if _G.teamcheck then
			local tween = ts:Create(teamcheck,tweenInfo,{BackgroundColor3 = Color3.fromRGB(0, 255, 0)});
			local tween2 = ts:Create(teamcheck.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(0,0,0)});
			tween:Play();
			tween2:Play();
			wait(0.5);
		else
			local tween = ts:Create(teamcheck,tweenInfo,{BackgroundColor3 = Color3.fromRGB(255, 0, 0)});
			local tween2 = ts:Create(teamcheck.Texting,tweenInfo,{TextColor3 = Color3.fromRGB(145, 145, 145)});
			tween2:Play();
			tween:Play();
			wait(0.5);
		end;
		--]]
	end)
	
	--[[RService.RenderStepped:Connect(function()
		if _G.wallbang then
			enableWallbang()
		else
			disbaleWallbang()
		end
	end)]]
	
	bindToRender('triggerBot',1,function()
		if _G.triggerbot then
			if mouse.Target.Parent ~= nil then
				if mouse.Target.Parent:FindFirstChild('Humanoid') ~= nil then
					local playerCur = game.Players:GetPlayerFromCharacter(mouse.Target.Parent)
					if _G.teamcheck then
						if localplr.Neutrak == false then
							if playerCur.Team ~= localplr.Team or playerCur.Neutral == true then
								mouse1press()wait()mouse1release()
							end
						else
							if playerCur.Neutral == true then
								mouse1press()wait()mouse1release()
							end
						end
					else
						mouse1press()wait()mouse1release()
					end
				else
					return
				end
			end
		end
	end)
	
	teamcheck.MouseButton1Click:Connect(function()
		if _G.teamcheck == true then
			_G.teamcheck = false
		else
			_G.teamcheck = true
		end
	end)

	jojoaim.MouseButton1Click:Connect(function()
		if _G.aim == true then
			_G.aim = false
		else
			_G.aim = true
		end
	end)
	
	silentaim.MouseButton1Click:Connect(function()
		if _G.silentaim == true then
			_G.silentaim = false
			disableSilentAim()
		else
			_G.silentaim = true
			enableSilentAim()
		end
	end)
	
	smoothAim.MouseButton1Click:Connect(function()
		if _G.smoothAim == true then
			_G.smoothAim = false
		else
			_G.smoothAim = true
		end
	end)

	esp.MouseButton1Click:Connect(function()
		if _G.esp == true then
			_G.esp = false
			enableEsp()
		elseif _G.esp == false then
			_G.esp = true
			enableEsp()
		end
	end)
	
	wallbang.MouseButton1Click:Connect(function()
		if _G.wallbang == true then
			_G.wallbang = false
			disbaleWallbang()
		elseif _G.wallbang == false then
			_G.wallbang = true
			enableWallbang()
		end
	end)
	
	triggerBot.MouseButton1Click:Connect(function()
		if _G.triggerbot == true then
			_G.triggerbot = false
		elseif _G.triggerbot == false then
			_G.triggerbot = true
		end
	end)
	
	tracers.MouseButton1Click:Connect(function()
		if _G.tracers == true then
			_G.tracers = false
			enableTracers()
		elseif _G.tracers == false then
			_G.tracers = true
			enableTracers()
		end
	end)
	
	library:Dragify(Main)
	
	--Saving
	local cooldown = false
	function writefileExploit()
		if writefile then
			return true
		end
	end
	
	function writefileCooldown(name,data)
		spawn(function()
			if not cooldown then
				cooldown = true
				writefile(name, data)
			else
				repeat wait() until cooldown == false
				writefileCooldown(name,data)
			end
			wait(3)
			cooldown = false
		end)
	end
	
	local defaultStrings = {
		binds = {
			Esp = 'Z';
			Aimbot = 'X';
			Toggle = 'RightAlt';
			UpdateEsp = 'T';
		};
		Esp = false;
		Aimbot = false;
		SmoothAim = false;
		Teamcheck = true;
		Wallbang = false;
		SilentAim = false;
		TriggerBot = false;
	}
	
	local defaults = game:GetService("HttpService"):JSONEncode(defaultStrings)
	
	function updatesaves()
		if writefileExploit() then
			local update = {
				binds = binds;
				Esp = _G.esp;
				Aimbot = _G.aim;
				SmoothAim = _G.smoothAim;
				Teamcheck = _G.teamcheck;
				Wallbang = _G.wallbang;
				SilentAim = _G.silentaim;
				TriggerBot = _G.triggerbot;
			}
			writefileCooldown(game.PlaceId.."JojohubDrawing.jojo", game:GetService("HttpService"):JSONEncode(update))
		end
	end
	
	for i,v in pairs(openedCombat.Scroll:GetChildren()) do
		v.Changed:Connect(function()
			updatesaves()
		end)
	end
	
	function saves()
		if writefileExploit() then
			if pcall(function() readfile(game.PlaceId.."JojohubDrawing.jojo") end) then
				if readfile(game.PlaceId.."JojohubDrawing.jojo") ~= nil then
					local success, response = pcall(function()
						local json = game:GetService("HttpService"):JSONDecode(readfile(game.PlaceId.."JojohubDrawing.jojo"))
						if json.binds ~= nil then binds = json.binds end
						if json.Esp ~= nil then _G.esp = json.Esp if json.Esp == true then enableEsp() end end
						if json.Teamcheck ~= nil then _G.Teamcheck = json.Teamcheck end
						if json.SmoothAim ~= nil then _G.SmoothAim = json.SmoothAim end
						if json.Aimbot ~= nil then _G.aim = json.Aimbot end
						if json.Wallbang ~= nil then _G.wallbang = json.Wallbang if json.Wallbang == true then enableWallbang() end end
						if json.SilentAim ~= nil then _G.silentaim = json.SilentAim if json.SilentAim == true then enableSilentAim() end end
						if json.TriggerBot then _G.triggerbot = json.TriggerBot end
					end)
					if not success then
						warn("Save Json Error:", response)
						warn("Overwriting Save File")
						writefileCooldown(game.PlaceId.."JojohubDrawing.jojo", defaults)
						wait()
						saves()
					end
				else
					writefileCooldown(game.PlaceId.."JojohubDrawing.jojo", defaults)
					wait()
					saves()
				end
			else
				writefileCooldown(game.PlaceId.."JojohubDrawing.jojo", defaults)
				wait()
				if pcall(function() readfile(game.PlaceId.."JojohubDrawing.jojo") end) then
					saves()
				else
					
				end
			end
		else
			
		end
	end
	
	saves()
	
end



coroutine.wrap(BMEA_fake_script)()
