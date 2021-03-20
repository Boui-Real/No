repeat wait() until game:IsLoaded()

local warnmsg = [==[
                             
|\    |      /\      |\    |  /-----\   |     |  |       |  |‾‾‾‾\
| \   |     /  \     | \   | |       |  |     |  |       |  |____/
|  \  |    /    \    |  \  | |       |  |-----|  |       |  |‾‾‾‾\
|   \ |   /------\   |   \ | |       |  |     |  |       |  |     |
|    \|  /        \  |    \|  \-----/   |     |   \_____/   |____/
All credits to 8A5T0K#6221
]==]

warn(warnmsg)

local NanoHub = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local NameOfHub = Instance.new("TextLabel")
local Load = Instance.new("TextButton")
local GameName = Instance.new("TextLabel")
local exploitLevel = 7

--Properties:

NanoHub.Name = "NanoHub"
NanoHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if exploitLevel == 1 then
	NanoHub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
elseif exploitLevel >= 2 then
	NanoHub.Parent = game.CoreGui
end


Main.Name = "Main"
Main.Parent = NanoHub
Main.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.342635661, 0, 0.325552821, 0)
Main.Size = UDim2.new(0, 0, 0, 271)

NameOfHub.Name = "NameOfHub"
NameOfHub.Parent = Main
NameOfHub.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
NameOfHub.BorderSizePixel = 0
NameOfHub.Size = UDim2.new(0, 0, 0, 43)
NameOfHub.Font = Enum.Font.SourceSans
NameOfHub.Text = ""
NameOfHub.TextColor3 = Color3.fromRGB(255, 255, 255)
NameOfHub.TextScaled = true
NameOfHub.TextSize = 14.000
NameOfHub.TextWrapped = true
NameOfHub.ZIndex = 0
NameOfHub.Selectable = false

Load.Name = "Load"
Load.Parent = Main
Load.BackgroundColor3 = Color3.fromRGB(32, 117, 60)
Load.BorderSizePixel = 0
Load.Position = UDim2.new(0.248, 0, -0.759, 0)
Load.Size = UDim2.new(.5, 0, .2, 0)
Load.Font = Enum.Font.SourceSans
Load.Text = "Load"
Load.TextColor3 = Color3.fromRGB(255, 255, 255)
Load.TextScaled = true
Load.TextSize = 14.000
Load.TextWrapped = true
Load.Visible = false
Load.ZIndex = 2

GameName.Name = "GameName"
GameName.Parent = Main
GameName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GameName.BackgroundTransparency = 1.000
GameName.Position = UDim2.new(0.24830699, 0, 0.287822902, 0)
GameName.Size = UDim2.new(0, 0, 0.241, 0)
GameName.Font = Enum.Font.SourceSans
GameName.Text = "Arsenal"
GameName.TextColor3 = Color3.fromRGB(64, 157, 71)
GameName.TextSize = 35.000
GameName.TextWrapped = true

local LOADSTRING_Function = function()
	local UIS = game:GetService("UserInputService")
	local ts = game:GetService("TweenService")
	local gameName = GameName
	local load = Load
	
	function checkDrawingAndMeta()
		if Drawing and getrawmetatable then
			return true
		else
			return false
		end
	end
	
	_G.games = loadstring(game:HttpGet('\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\77\114\65\110\116\105\77\97\116\116\101\114\121\65\108\116\47\78\111\47\109\97\105\110\47\71\97\109\101\115\46\108\117\97'))();
	
	local dragify = function(Frame)
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
	
	dragify(Main)
	
	if checkDrawingAndMeta() == true then
		for i, v in next, _G.games do
			if i == game.PlaceId then
				gameName.Text = v['name']
				load.MouseButton1Click:Connect(function()
					local succes,err = pcall(function()
						v['func']()
						NanoHub:Destroy()
					end)
					if succes and not err then
						warn('Loading...')
					else
						warn('There was an error')
					end
				end)
				break
			else
				gameName.Text = 'No NanoHub'
				load.Text = 'Remove'
				load.MouseButton1Click:Connect(function()
					NanoHub:Destroy()
				end)
			end
		end
		NameOfHub.Text = 'NanoHub'
		local tweenInfo = TweenInfo.new(.75)
		local tween = ts:Create(gameName,tweenInfo,{Size = UDim2.new(.5,0,.241,0)})
		local tween1 = ts:Create(NameOfHub,tweenInfo,{Size = UDim2.new(1,0,0.185,0)})
		tween1:Play()
		tween1.Completed:Connect(function()
			local newTweenInfo = TweenInfo.new(.8,Enum.EasingStyle.Bounce,Enum.EasingDirection.Out)
			local tween2 = ts:Create(Main,tweenInfo,{Size = UDim2.new(0.344,0,0.334,0)})
			local tween3 = ts:Create(load,newTweenInfo,{Position = UDim2.new(.248,0,.69,0)})
			tween:Play()
			tween2:Play()
			wait(1.25)
			load.Visible = true
			tween3:Play()
		end)
	else
		gameName.Text = 'To shitty exploit'
		load.Text = 'Ok'
		NameOfHub.Text = 'No'
		local tweenInfo = TweenInfo.new(.75)
		local tween = ts:Create(gameName,tweenInfo,{Size = UDim2.new(.5,0,.241,0)})
		local tween1 = ts:Create(NameOfHub,tweenInfo,{Size = UDim2.new(1,0,0.185,0)})
		tween1:Play()
		tween1.Completed:Connect(function()
			local newTweenInfo = TweenInfo.new(.8,Enum.EasingStyle.Bounce,Enum.EasingDirection.Out)
			local tween2 = ts:Create(Main,tweenInfo,{Size = UDim2.new(0.344,0,0.334,0)})
			local tween3 = ts:Create(load,newTweenInfo,{Position = UDim2.new(.248,0,.69,0)})
			tween:Play()
			tween2:Play()
			wait(1.25)
			load.Visible = true
			tween3:Play()
		end)
		load.MouseButton1Click:Connect(function()
			NanoHub:Destroy()
		end)
	end
end

coroutine.wrap(LOADSTRING_Function)()
