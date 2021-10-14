repeat wait() until game:IsLoaded()

local asseted_System = game:GetObjects("rbxassetid://7735190140")[1]
asseted_System.Parent = game.CoreGui
asseted_System.NotificationHandler.Disabled = true
local script = asseted_System.NotificationHandler

local NotifyLib = {
	Colors = {
		Title = Color3.fromRGB(255,255,255);
		Description = Color3.fromRGB(200,200,200);
	};
	Tween_Info = TweenInfo.new(.5,Enum.EasingStyle.Back)
}

local SoundsFolder = Instance.new("Folder",game:GetService("SoundService"))
SoundsFolder.Name = "NotificationSounds"

local TweenService,RunService = game:GetService("TweenService"),game:GetService("RunService")

function NotifyLib.isType(obj,objType)
	obj = obj or "String"
	objType = objType or "string"
	if typeof(objType) == "string" then
		return typeof(obj) == objType
	end
end

function NotifyLib.setTableValue(tbl, index, value)
	if NotifyLib.isType(tbl,"table") then
		if tbl[index] ~= nil then
			tbl[index] = value
		end
	end
end

function NotifyLib.setNotifyDefaultTitleColor(color)
	if NotifyLib.isType(color,"Color3") then
		NotifyLib.setTableValue(NotifyLib.Colors,"Title",color)
	end
end

function NotifyLib.setNotifyDefaultDescriptionColor(color)
	if NotifyLib.isType(color,"Color3") then
		NotifyLib.setTableValue(NotifyLib.Colors,"Description",color)
	end
end

local LastSize = 839

function NotifyLib.createNotify(TitleText, DescriptionText, Sound, TitleColor, DescriptionColor, Duration)
	if NotifyLib.isType(TitleText,"string") == false then TitleText = "Title";end
	if NotifyLib.isType(DescriptionText,"string") == false then DescriptionText = "Description";end
	if NotifyLib.isType(Sound,"number") == false then Sound = 1;end
	if NotifyLib.isType(TitleColor,"Color3") == false then TitleColor = NotifyLib.Colors.Title;end
	if NotifyLib.isType(DescriptionColor,"Color3") == false then DescriptionColor = NotifyLib.Colors.Description;end
	if NotifyLib.isType(Duration,"number") == false then Duration = 3;end
	
	local SoundTable = {
		[1] = "261082034";
		[2] = "5153734236";
		[3] = "7222026049";
		[4] = "7474063704";
	}
	
	local notifyLabel = script.Notify:Clone()
	notifyLabel.Parent = script.Parent.NotificationsFrame
	
	notifyLabel.NotifyTitle.Text = TitleText
	notifyLabel.NotifyTitle.TextColor3 = TitleColor
	
	notifyLabel.NotifyDescription.Text = DescriptionText
	notifyLabel.NotifyDescription.TextColor3 = DescriptionColor
	
	local SoundIns = Instance.new("Sound",SoundsFolder)
	SoundIns.Name = SoundTable[Sound]
	SoundIns.SoundId = "rbxassetid://" .. SoundTable[Sound]
	SoundIns.Playing = true
	SoundIns.Looped = false
	SoundStep = RunService.RenderStepped:Connect(function()
		if SoundIns ~= nil then
			if SoundIns:IsA("Sound") and SoundIns.Playing == false then
				SoundIns:Destroy()
				SoundStep:Disconnect()
			end
		end
	end)
	
	local Count = #script.Parent.NotificationsFrame:GetChildren() - 1
	local Size = 127
	local ToPosition = UDim2.new()
	
	if Count > 1 then
		--[[if Count == 2 then
			ToPosition = UDim2.new(0.05,0,(LastSize - ((87 * Count) + Size)) / 1000 ,0)
			LastSize = LastSize - ((87 * Count) + Size)
		elseif Count > 2 then
			ToPosition = UDim2.new(0.05,0,(LastSize - Size - 12) / 1000,0)
			LastSize = LastSize - Size - 12
		end]]
		
		ToPosition = UDim2.new(0.05,0,(LastSize - Size - 12) / 1000,0)
		LastSize = LastSize - Size - 12
	else
		ToPosition = UDim2.new(0.05,0,0.839,0)
	end
	
	notifyLabel.Position = UDim2.new(1.5,0,ToPosition.Y.Scale,0)
	
	TweenService:Create(notifyLabel,NotifyLib.Tween_Info,{Position = ToPosition}):Play()
	
	spawn(function()
		wait(Duration + 0.5)
		
		TweenService:Create(notifyLabel,NotifyLib.Tween_Info,{Position = UDim2.new(1.5,0,notifyLabel.Position.Y.Scale,0)}):Play()
		
		wait(.5)
		
		notifyLabel:Destroy()
		
		LastSize = LastSize + Size + 12
		
		local newLastSize = 1000
		local newCount = #script.Parent.NotificationsFrame:GetChildren() - 1
		
		for _,notify in pairs(script.Parent.NotificationsFrame:GetChildren()) do
			if notify:IsA("Frame") then
				if newCount > 1 then
					TweenService:Create(notify,TweenInfo.new(0.25),{Position = UDim2.new(0.05,0,(newLastSize - Size - 12) / 1000,0)}):Play()
					newLastSize = newLastSize - Size - 12
				else
					TweenService:Create(notify,TweenInfo.new(0.25),{Position = UDim2.new(0.05,0,0.839,0)}):Play()
					--notify.Position = UDim2.new(0.05,0,0.839,0)
				end
			end
		end
	end)
end

function NotifyLib.isGameLoaded()
	return game:IsLoaded()
end

return NotifyLib
