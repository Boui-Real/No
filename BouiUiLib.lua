local library = {


	Pointers = {};


	Symbols = {


		Checkbox = '✔';


		Dropdown = {


			Dropped = '△';


			Drop = '▽';


		}


	};


	BlacklistedKeybinds = {'W','A','S','D','Space','Delete','Backspace','Escape'};


	AlwaysBlacklistedKeybinds = {'Unknown','Slash'};


	UseBlacklistedKeybinds = false;


}



local UIS = game:GetService("UserInputService")



function library:CreateWindow(name)


	name = name or 'n'





	local UILib = Instance.new("ScreenGui")


	local MainFrame = Instance.new("Frame")


	local CurrentTab = Instance.new("Frame")


	local Tabs = Instance.new("Frame")


	local Grid_Handler = Instance.new("UIGridLayout")


	local Title = Instance.new("Frame")


	local Text_3 = Instance.new("TextLabel")





	local SliderDragging,WindowDragging,CPDragging = false,false,false





	UILib.Name = "UILib"


	if pcall(function() UILib.Parent = game.CoreGui end) then
		UILib.Parent = game.CoreGui
	else
		UILib.Parent = game.Players.LocalPlayer:WaitForChild('PlayerGui')
	end


	UILib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling



	MainFrame.Name = "MainFrame"


	MainFrame.Parent = UILib


	MainFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


	MainFrame.BorderColor3 = Color3.fromRGB(0, 85, 255)


	MainFrame.BorderSizePixel = 2


	MainFrame.Position = UDim2.new(0.314972818, 0, 0.159999996, 0)


	MainFrame.Size = UDim2.new(0.369200915, 0, 0.678181827, 0)



	CurrentTab.Name = "CurrentTab"


	CurrentTab.Parent = MainFrame


	CurrentTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


	CurrentTab.BackgroundTransparency = 1.000


	CurrentTab.BorderSizePixel = 0


	CurrentTab.Position = UDim2.new(0.0126076909, 0, 0.178731009, 0)


	CurrentTab.Size = UDim2.new(0.970582187, 0, 0.808757603, 0)





	Tabs.Name = "Tabs"


	Tabs.Parent = MainFrame


	Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


	Tabs.BackgroundTransparency = 1.000


	Tabs.BorderSizePixel = 0


	Tabs.Position = UDim2.new(0.0126076909, 0, 0.0732797161, 0)


	Tabs.Size = UDim2.new(0.971000016, 0, 0.104999997, 0)





	Grid_Handler.Name = "Grid_Handler"


	Grid_Handler.Parent = Tabs


	Grid_Handler.SortOrder = Enum.SortOrder.LayoutOrder


	Grid_Handler.CellPadding = UDim2.new(0, 0, 0, 0)


	Grid_Handler.CellSize = UDim2.new(0.200000003, 0, 0.5, 0)





	Title.Name = "Title"


	Title.Parent = MainFrame


	Title.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


	Title.BackgroundTransparency = 1.000


	Title.BorderSizePixel = 0


	Title.Size = UDim2.new(0.971000016, 0, 0.0729999989, 0)





	Text_3.Name = "Text"


	Text_3.Parent = Title


	Text_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


	Text_3.BackgroundTransparency = 1.000


	Text_3.Position = UDim2.new(0.0212638453, 0, 0, 0)


	Text_3.Size = UDim2.new(0.987392306, 0, 1, 0)


	Text_3.Font = Enum.Font.TitilliumWeb


	Text_3.LineHeight = 1.250


	Text_3.Text = name


	Text_3.TextColor3 = Color3.fromRGB(255, 255, 255)


	Text_3.TextScaled = true


	Text_3.TextSize = 14.000


	Text_3.TextWrapped = true


	Text_3.TextXAlignment = Enum.TextXAlignment.Left


	Text_3.TextYAlignment = Enum.TextYAlignment.Top





	local dragToggle = nil


	local dragSpeed = 0.50


	local dragInput = nil


	local dragStart = nil


	local dragPos = nil


	MainFrame.InputBegan:Connect(function(input)


		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then


			dragToggle = true


			dragStart = input.Position


			startPos = MainFrame.Position


			input.Changed:Connect(function()


				if input.UserInputState == Enum.UserInputState.End then


					dragToggle = false


				end


			end)


		end


	end)


	MainFrame.InputChanged:Connect(function(input)


		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then


			dragInput = input


		end


	end)


	game:GetService("UserInputService").InputChanged:Connect(function(input)


		if input == dragInput and dragToggle and not CPDragging then


			local Delta = input.Position - dragStart


			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)


			MainFrame.Position = Position


		end


	end)






	local WindowLib = {}





	function WindowLib:CreateTab(name)


		name = name or 'Tab'





		local sometext_btn = Instance.new("TextButton")


		local sometext_tab = Instance.new("Frame")


		local Left = Instance.new("ScrollingFrame")


		local Right = Instance.new("ScrollingFrame")


		local UIListLayout_2 = Instance.new("UIListLayout")


		local UIPadding = Instance.new("UIPadding")


		local UIListLayout_3 = Instance.new("UIListLayout")


		local UIPadding_2 = Instance.new("UIPadding")





		sometext_btn.Name = name .. "_btn"


		sometext_btn.Parent = Tabs


		sometext_btn.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


		sometext_btn.BorderColor3 = Color3.fromRGB(0, 85, 255)


		sometext_btn.Size = UDim2.new(0.333333343, 0, 0.5, 0)


		sometext_btn.Font = Enum.Font.TitilliumWeb


		sometext_btn.Text = name


		sometext_btn.TextColor3 = Color3.fromRGB(255, 255, 255)


		sometext_btn.TextScaled = true


		sometext_btn.TextSize = 14.000


		sometext_btn.TextWrapped = true





		sometext_tab.Name = name .. "_tab"


		sometext_tab.Parent = CurrentTab


		sometext_tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


		sometext_tab.BackgroundTransparency = 1.000


		sometext_tab.Size = UDim2.new(1, 0, 1, 0)





		Left.Name = "Left"


		Left.Parent = sometext_tab


		Left.Active = true


		Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


		Left.BackgroundTransparency = 1.000


		Left.BorderSizePixel = 0


		Left.Position = UDim2.new(0, 0, -3.37210899e-08, 0)


		Left.Size = UDim2.new(0.5, 0, 1, 0)


		Left.CanvasSize = UDim2.new(0, 0, 0, 0)





		Right.Name = "Right"


		Right.Parent = sometext_tab


		Right.Active = true


		Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


		Right.BackgroundTransparency = 1.000


		Right.BorderSizePixel = 0


		Right.Position = UDim2.new(0.495778263, 0, -3.37210899e-08, 0)


		Right.Size = UDim2.new(0.5, 0, 1, 0)


		Right.CanvasSize = UDim2.new(0, 0, 0, 0)





		UIListLayout_2.Parent = Left


		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder


		UIListLayout_2.Padding = UDim.new(0, 13)



		UIPadding.Parent = Left


		UIPadding.PaddingLeft = UDim.new(0, 2)


		UIPadding.PaddingRight = UDim.new(0, 5)


		UIPadding.PaddingTop = UDim.new(0, 1)





		UIListLayout_3.Parent = Right


		UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder


		UIListLayout_3.Padding = UDim.new(0, 13)



		UIPadding_2.Parent = Right


		UIPadding_2.PaddingLeft = UDim.new(0, 2)


		UIPadding_2.PaddingRight = UDim.new(0, 5)


		UIPadding_2.PaddingTop = UDim.new(0, 1)





		sometext_btn.MouseButton1Click:Connect(function()


			for i,v in pairs(CurrentTab:GetChildren()) do


				if v.Name ~= name .. '_tab' then


					v.Visible = false


				else


					v.Visible = true


				end


			end


		end)		





		Grid_Handler.CellSize = UDim2.new(1 / (#Tabs:GetChildren() - 1),0,0.5,0)

		for i,v in pairs(CurrentTab:GetChildren()) do
			if v ~= CurrentTab:GetChildren()[1] then
				v.Visible = false
			else
				v.Visible = true
			end
		end


		local TabLib = {}





		function TabLib:CreateGroupbox(name,side)


			local Sides = {


				'Left';


				'Right';


			}





			name = name or 'Groupbox'


			side = side or (Sides[math.random(1,#Sides)])





			local Section = Instance.new("Frame")


			local UIListLayout = Instance.new("UIListLayout")


			local _GroupboxName = Instance.new("TextLabel")





			Section.Name = "Section"


			Section.Parent = sometext_tab[side]


			Section.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


			Section.BorderColor3 = Color3.fromRGB(0, 85, 255)


			Section.BorderSizePixel = 0


			Section.Size = UDim2.new(0.949999988, 0, 0, 0)





			UIListLayout.Parent = Section


			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder


			UIListLayout.Padding = UDim.new(0, 7)





			_GroupboxName.Name = '_GroupboxName'


			_GroupboxName.Parent = Section


			_GroupboxName.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


			_GroupboxName.BorderColor3 = Color3.fromRGB(0, 85, 255)


			_GroupboxName.BorderSizePixel = 1


			_GroupboxName.Size = UDim2.new(1,0,0,25)


			_GroupboxName.TextColor3 = Color3.fromRGB(255,255,255)


			_GroupboxName.Font = Enum.Font.TitilliumWeb


			_GroupboxName.TextScaled = true


			_GroupboxName.TextWrapped = true


			_GroupboxName.Text = 'Groupbox: ' .. name





			sometext_tab[side].CanvasSize = UDim2.new(0,0,0,((#sometext_tab[side]:GetChildren() - 2) + (math.floor(Section.Size.Y / 10))) * 60)





			local GroupboxLib = {}





			function GroupboxLib:CreateButton(name,_function)


				name = name or 'Button'


				_function = _function or function() end





				local Button = Instance.new("TextButton")





				Button.Name = "Button"


				Button.Parent = Section


				Button.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


				Button.BorderColor3 = Color3.fromRGB(0, 85, 255)


				Button.Size = UDim2.new(1, 0, 0, 25)


				Button.Font = Enum.Font.TitilliumWeb


				Button.TextColor3 = Color3.fromRGB(255, 255, 255)


				Button.TextScaled = true


				Button.TextSize = 14.000


				Button.TextWrapped = true


				Button.Text = name





				if #Section:GetChildren() == 2 then


					Section.Size = UDim2.new(0.949999988, 0, 0, 25)


				elseif #Section:GetChildren() > 2 then


					Section.Size = UDim2.new(0.949999988, 0, 0, ((#Section:GetChildren() - 1) * 25) + ((#Section:GetChildren() - 1) * 7))


				end


				sometext_tab[side].CanvasSize = UDim2.new(0,0,0,((#sometext_tab[side]:GetChildren() - 2) + (math.floor(Section.Size.Y / 10))) * 60)


				Button.MouseButton1Click:Connect(_function)


			end





			function GroupboxLib:CreateToggle(name,_function,def)


				name = name or 'Toggle'


				def = def or false


				_function = _function or function() end





				local Toggle = Instance.new("TextButton")


				local Checkbox = Instance.new("Frame")


				local Text = Instance.new("TextLabel")





				local toggle = {state = def}





				Toggle.Name = "Toggle"


				Toggle.Parent = Section


				Toggle.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


				Toggle.BorderColor3 = Color3.fromRGB(0, 85, 255)


				Toggle.Size = UDim2.new(1, 0, 0, 25)


				Toggle.Font = Enum.Font.TitilliumWeb


				Toggle.Text = name


				Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)


				Toggle.TextScaled = true


				Toggle.TextSize = 14.000


				Toggle.TextWrapped = true



				Checkbox.Name = "Checkbox"


				Checkbox.Parent = Toggle


				Checkbox.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


				Checkbox.BorderColor3 = Color3.fromRGB(0, 85, 255)


				Checkbox.Position = UDim2.new(0.0385014825, 0, 0.148999989, 0)


				Checkbox.Size = UDim2.new(0.0799999982, 0, 0.699999988, 0)



				Text.Name = "Text"


				Text.Parent = Checkbox


				Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


				Text.BackgroundTransparency = 1.000


				Text.Size = UDim2.new(1, 0, 1, 0)


				Text.Font = Enum.Font.TitilliumWeb


				Text.TextColor3 = Color3.fromRGB(255, 255, 255)


				Text.Text = ''


				Text.TextScaled = true


				Text.TextSize = 14.000


				Text.TextWrapped = true





				if #Section:GetChildren() == 2 then


					Section.Size = UDim2.new(0.949999988, 0, 0, 25)


				elseif #Section:GetChildren() > 2 then


					Section.Size = UDim2.new(0.949999988, 0, 0, ((#Section:GetChildren() - 1) * 25) + ((#Section:GetChildren() - 1) * 7))


				end


				sometext_tab[side].CanvasSize = UDim2.new(0,0,0,((#sometext_tab[side]:GetChildren() - 2) + (math.floor(Section.Size.Y / 10))) * 60)


				Toggle.MouseButton1Click:Connect(function()


					toggle.state = not toggle.state


					if toggle.state == true then


						Text.Text = 'X'


					else


						Text.Text = ''


					end


					_function(toggle.state)


				end)





				library.Pointers[name] = toggle





				local ToggleLib = {}





				function ToggleLib:CreateKeyBind(def,__function)


					__function = __function or function() end


					def = def or ''





					local keybind = {binding = false,bind = def}





					local Keybind = Instance.new("Frame")


					local Text_2 = Instance.new("TextButton")





					Keybind.Name = "Keybind"


					Keybind.Parent = Toggle


					Keybind.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


					Keybind.BorderColor3 = Color3.fromRGB(0, 85, 255)


					Keybind.Position = UDim2.new(0.814919829, 0, 0.149000242, 0)


					Keybind.Size = UDim2.new(0.144934878, 0, 0.699999988, 0)



					Text_2.Name = "Text"


					Text_2.Parent = Keybind


					Text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


					Text_2.BackgroundTransparency = 1.000


					Text_2.Size = UDim2.new(1, 0, 1, 0)


					Text_2.Font = Enum.Font.TitilliumWeb


					Text_2.Text = '[' .. def .. ']'


					Text_2.TextColor3 = Color3.fromRGB(255, 255, 255)


					Text_2.TextScaled = true


					Text_2.TextSize = 14.000


					Text_2.TextWrapped = true





					Text_2.MouseButton1Click:Connect(function()


						keybind.binding = true


						Text_2.Text = '[...]'


					end)





					UIS.InputBegan:Connect(function(input)


						local Key = input.KeyCode


						if Key.Name == keybind.bind and not keybind.binding then


							toggle.state = not toggle.state


							if toggle.state == true then


								Text.Text = 'X'


							else


								Text.Text = ''


							end


							_function(toggle.state)


							__function(keybind.bind)


						end


						if keybind.binding then


							if library.UseBlacklistedKeybinds then


								print(not library.AlwaysBlacklistedKeybinds[Key.Name])


								if library.AlwaysBlacklistedKeybinds[Key.Name] == nil then


									keybind.binding = false


									keybind.bind = Key.Name


								else


									keybind.binding = false


									keybind.bind = ''


								end


							else


								if table.find(library.BlacklistedKeybinds,Key.Name) or table.find(library.AlwaysBlacklistedKeybinds,Key.Name) then


									keybind.binding = false


									keybind.bind = ''


								else


									keybind.binding = false


									keybind.bind = Key.Name


								end


							end


							Text_2.Text = '[' .. keybind.bind .. ']'


						end


					end)





					toggle['keybind'] = keybind


					library.Pointers[name] = toggle





					local KeybindLib = {}





					function KeybindLib:Set(val)


						keybind.bind = val


					end





					function KeybindLib:Get()


						return keybind.bind


					end





					return KeybindLib


				end





				function ToggleLib:Set(val)


					toggle.state = val


					if toggle.state == true then


						Text.Text = 'X'


					else


						Text.Text = ''


					end


					_function(toggle.state)


				end





				function ToggleLib:Get()


					return toggle.state


				end





				return ToggleLib


			end





			function GroupboxLib:CreateDropdown(name,options,_function,multi)


				name = name or 'Dropdown'


				options = options or {'Option 1'}


				_function = _function or function() end


				multi = multi or false





				local dropdown = {selected = '',opened = false,option = options[1]}





				local Dropdown = Instance.new("TextButton")


				local Toggle_2 = Instance.new("Frame")


				local Btn = Instance.new("TextButton")


				local Drop = Instance.new("Frame")


				local List = Instance.new("UIListLayout")





				Dropdown.Name = "Dropdown"


				Dropdown.Parent = Section


				Dropdown.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


				Dropdown.BorderColor3 = Color3.fromRGB(0, 85, 255)


				Dropdown.Position = UDim2.new(-0.0141008906, 0, 0, 0)


				Dropdown.Size = UDim2.new(1, 0, 0, 25)


				Dropdown.Font = Enum.Font.TitilliumWeb


				Dropdown.Text = name .. ' , Selected: ' .. dropdown.option


				Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)


				Dropdown.TextScaled = true


				Dropdown.TextSize = 14.000


				Dropdown.TextWrapped = true

				
				
				Toggle_2.Name = "Toggle"


				Toggle_2.Parent = Dropdown


				Toggle_2.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


				Toggle_2.BackgroundTransparency = 1.000


				Toggle_2.BorderColor3 = Color3.fromRGB(0, 85, 255)


				Toggle_2.Position = UDim2.new(0.0385014825, 0, 0.148999989, 0)


				Toggle_2.Size = UDim2.new(0.0799999982, 0, 0.699999988, 0)



				Btn.Name = "Btn"


				Btn.Parent = Toggle_2


				Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


				Btn.BackgroundTransparency = 1.000


				Btn.Size = UDim2.new(1, 0, 1, 0)


				Btn.Font = Enum.Font.TitilliumWeb


				Btn.Text = "▽"


				Btn.TextColor3 = Color3.fromRGB(255, 255, 255)


				Btn.TextScaled = true


				Btn.TextSize = 14.000


				Btn.TextWrapped = true



				Drop.Name = "Drop"


				Drop.Parent = Dropdown


				Drop.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


				Drop.BorderColor3 = Color3.fromRGB(0, 85, 255)


				Drop.Position = UDim2.new(0.0752047449, 0, 1, 0)


				Drop.Size = UDim2.new(0.845000029, 0, 0, 25)


				Drop.Visible = false


				Drop.ZIndex = 6





				List.Parent = Drop





				for _,v in pairs(options) do


					local Option = Instance.new("TextButton")





					Option.Name = "Option"


					Option.Parent = Drop


					Option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


					Option.BackgroundTransparency = 1.000


					Option.Size = UDim2.new(1, 0, 0, 25)


					Option.Font = Enum.Font.TitilliumWeb


					Option.TextColor3 = Color3.fromRGB(255, 255, 255)


					Option.TextScaled = true


					Option.TextSize = 14.000


					Option.TextWrapped = true


					Option.Text = v





					Drop.Size = UDim2.new(0.845,0,0,(#Drop:GetChildren() - 1) * 25)


				end





				if #Section:GetChildren() == 2 then


					Section.Size = UDim2.new(0.949999988, 0, 0, 25)


				elseif #Section:GetChildren() > 2 then


					Section.Size = UDim2.new(0.949999988, 0, 0, ((#Section:GetChildren() - 1) * 25) + ((#Section:GetChildren() - 1) * 7))


				end


				sometext_tab[side].CanvasSize = UDim2.new(0,0,0,((#sometext_tab[side]:GetChildren() - 2) + (math.floor(Section.Size.Y / 10))) * 60)


				local function _Dropdown()


					dropdown.opened = not dropdown.opened


					if dropdown.opened == true then
						Btn.Text = library.Symbols.Dropdown.Dropped
						Dropdown.ZIndex = 5
					else
						Btn.Text = library.Symbols.Dropdown.Drop
						Dropdown.ZIndex = 1
					end



					if dropdown.opened then


						Drop.Visible = true


						for i,v in pairs(Drop:GetChildren()) do


							if v:IsA("TextButton") then


								v.MouseButton1Click:Connect(function()


									dropdown.option = v.Text


									dropdown.opened = false


									Drop.Visible = false


									Btn.Text = library.Symbols.Dropdown.Drop


									Dropdown.Text = name .. ' , Selected: ' .. dropdown.option


									_function(dropdown.option)


								end)


							end


							Dropdown.MouseButton1Click:Connect(function()


								Btn.Text = library.Symbols.Dropdown.Drop


								Drop.Visible = false


							end)


							Btn.MouseButton1Click:Connect(function()


								Btn.Text = library.Symbols.Dropdown.Drop


								Drop.Visible = false


							end)


						end


					end


				end





				Dropdown.MouseButton1Click:Connect(_Dropdown)





				Btn.MouseButton1Click:Connect(_Dropdown)





				library.Pointers[name] = dropdown





				local DropdownLib = {}





				function DropdownLib:Set(val)


					dropdown.option = options[val]


					_function(dropdown.option)


				end





				function DropdownLib:Get()


					return dropdown.option


				end





				return DropdownLib


			end





			function GroupboxLib:CreateSlider(name,min,max,val,_function)


				name = name or 'Slider'


				min = min or 0


				max = max or 50


				val = val or 0


				_function = _function or function() end





				local slider = {value = val}





				local Slider = Instance.new("TextButton")


				local Value = Instance.new("TextBox")


				local Slider_2 = Instance.new("Frame")


				local Dragger = Instance.new("TextButton")


				local _Text = Instance.new("TextLabel")





				Slider.Name = "Slider"


				Slider.Parent = Section


				Slider.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


				Slider.BorderColor3 = Color3.fromRGB(0, 85, 255)


				Slider.Size = UDim2.new(1, 0, 0, 25)


				Slider.Font = Enum.Font.TitilliumWeb


				Slider.Text = ""


				Slider.TextColor3 = Color3.fromRGB(255, 255, 255)


				Slider.TextScaled = true


				Slider.TextSize = 14.000


				Slider.TextWrapped = true



				Value.Name = "Value"


				Value.Parent = Slider


				Value.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


				Value.BorderColor3 = Color3.fromRGB(0, 85, 255)


				Value.Position = UDim2.new(0.90, 0, 0.149000004, 0)


				Value.Size = UDim2.new(0.0799999982, 0, 0.699999988, 0)


				Value.Font = Enum.Font.SourceSans


				Value.Text = slider.value


				Value.TextColor3 = Color3.fromRGB(255, 255, 255)


				Value.TextScaled = true


				Value.TextSize = 14.000


				Value.TextWrapped = true



				Slider_2.Name = "Slider"


				Slider_2.Parent = Slider


				Slider_2.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


				Slider_2.BorderColor3 = Color3.fromRGB(0, 85, 255)


				Slider_2.Position = UDim2.new(0.305519313, 0, 0.14899902, 0)


				Slider_2.Size = UDim2.new(0.537602425, 0, 0.670999765, 0)



				Dragger.Name = "Dragger"


				Dragger.Parent = Slider_2


				Dragger.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


				Dragger.BorderColor3 = Color3.fromRGB(0, 85, 255)


				Dragger.Position = UDim2.new(0, 0, -0.102830172, 0)


				Dragger.Size = UDim2.new(0.1, 0, 1.20000005, 0)


				Dragger.Font = Enum.Font.SourceSans


				Dragger.Text = ""


				Dragger.TextColor3 = Color3.fromRGB(0, 0, 0)


				Dragger.TextSize = 14.000


				Dragger.ZIndex = 4





				_Text.Name = "_Text"


				_Text.Parent = Slider


				_Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


				_Text.BackgroundTransparency = 1.000


				_Text.Position = UDim2.new(0.0376023762, 0, 0, 0)


				_Text.Size = UDim2.new(0.22570917, 0, 1, 0)


				_Text.Font = Enum.Font.TitilliumWeb


				_Text.Text = name


				_Text.TextColor3 = Color3.fromRGB(255, 255, 255)


				_Text.TextScaled = true


				_Text.TextSize = 14.000


				_Text.TextWrapped = true





				local dragging = false


				local dragValue = 0





				Dragger.MouseButton1Down:Connect(function()


					dragging = true


					SliderDragging = true


				end)





				if #Section:GetChildren() == 2 then


					Section.Size = UDim2.new(0.949999988, 0, 0, 25)


				elseif #Section:GetChildren() > 2 then


					Section.Size = UDim2.new(0.949999988, 0, 0, ((#Section:GetChildren() - 1) * 25) + ((#Section:GetChildren() - 1) * 7))


				end


				sometext_tab[side].CanvasSize = UDim2.new(0,0,0,((#sometext_tab[side]:GetChildren() - 2) + (math.floor(Section.Size.Y / 10))) * 60)


				local function Slide(input)


					local Pos = UDim2.new(math.clamp((input.Position.X - Slider.AbsolutePosition.X) / Slider.AbsoluteSize.X, 0, 1), 0, -0.103, 0)


					Dragger.Position = Pos


					local s = math.floor(((Pos.X.Scale * max) / max) * (max - min) + min)


					dragValue = s


					slider.value = dragValue


					Value.Text = slider.value


					_function(slider.value)


				end





				UIS.InputChanged:Connect(function(input)


					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then


						Slide(input)


					end


				end)





				UIS.InputEnded:Connect(function(input)


					if input.UserInputType == Enum.UserInputType.MouseButton1 then


						if dragging or SliderDragging then


							dragging = false


							SliderDragging = false


							slider.value = dragValue


							Value.Text = slider.value


							_function(slider.value)


						end


					end


				end)





				Dragger.MouseButton1Up:Connect(function()


					SliderDragging = false


					dragging = false


					slider.value = dragValue


					Value.Text = slider.value


					_function(slider.value)


				end)





				Value.Changed:Connect(function(prop)


					if prop == 'Text' then


						local val = Value.Text


						if val > max then


							val = max


						elseif val < min then


							val = min


						end





						dragValue = tonumber(val)


						slider.value = dragValue


						Value.Text = slider.value


						_function(slider.value)


					end


				end)





				local SliderLib = {}





				function SliderLib:Set(val)


					slider.value = val


					_function(val)


				end





				function SliderLib:Get()


					return slider.value


				end





				return SliderLib


			end





			function GroupboxLib:CreateTextbox(name,text,_function)


				name = name or 'Textbox'


				text = text or 'Text'


				_function = _function or function() end





				local textbox = {text = text}





				local TextBox = Instance.new("TextButton")


				local _Text_2 = Instance.new("TextLabel")


				local _TextFrame = Instance.new("Frame")


				local _Box = Instance.new("TextBox")





				TextBox.Name = "TextBox"


				TextBox.Parent = Section


				TextBox.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


				TextBox.BorderColor3 = Color3.fromRGB(0, 85, 255)


				TextBox.Size = UDim2.new(1, 0, 0, 25)


				TextBox.Font = Enum.Font.TitilliumWeb


				TextBox.Text = ""


				TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)


				TextBox.TextScaled = true


				TextBox.TextSize = 14.000


				TextBox.TextWrapped = true



				_Text_2.Name = "_Text"


				_Text_2.Parent = TextBox


				_Text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


				_Text_2.BackgroundTransparency = 1.000


				_Text_2.Position = UDim2.new(0.0376023762, 0, 0, 0)


				_Text_2.Size = UDim2.new(0.267916858, 0, 1, 0)


				_Text_2.Font = Enum.Font.TitilliumWeb


				_Text_2.Text = name


				_Text_2.TextColor3 = Color3.fromRGB(255, 255, 255)


				_Text_2.TextScaled = true


				_Text_2.TextSize = 14.000


				_Text_2.TextWrapped = true



				_TextFrame.Name = "_TextFrame"


				_TextFrame.Parent = TextBox


				_TextFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


				_TextFrame.BorderColor3 = Color3.fromRGB(0, 85, 255)


				_TextFrame.Position = UDim2.new(0.371323466, 0, 0.14899902, 0)


				_TextFrame.Size = UDim2.new(0.58902967, 0, 0.670999765, 0)



				_Box.Name = "_Box"


				_Box.Parent = _TextFrame


				_Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


				_Box.BackgroundTransparency = 1.000


				_Box.Size = UDim2.new(1, 0, 1, 0)


				_Box.ClearTextOnFocus = false


				_Box.Font = Enum.Font.SourceSans


				_Box.Text = "Text"


				_Box.TextColor3 = Color3.fromRGB(255, 255, 255)


				_Box.TextScaled = true


				_Box.TextSize = 14.000


				_Box.TextWrapped = true


				_Box.FocusLost:Connect(function(prop)


					textbox.text = _Box.Text


					_function(textbox.text)


				end)





				if #Section:GetChildren() == 2 then


					Section.Size = UDim2.new(0.949999988, 0, 0, 25)


				elseif #Section:GetChildren() > 2 then


					Section.Size = UDim2.new(0.949999988, 0, 0, ((#Section:GetChildren() - 1) * 25) + ((#Section:GetChildren() - 1) * 7))


				end


				sometext_tab[side].CanvasSize = UDim2.new(0,0,0,((#sometext_tab[side]:GetChildren() - 2) + (math.floor(Section.Size.Y / 10))) * 60)


				library.Pointers[name] = textbox





				local TextLib = {}





				function TextLib:Set(val)


					textbox.text = val


					TextBox.Text = textbox.text


					_function(textbox.text)


				end





				function TextLib:Get()


					return textbox.text


				end





				return TextLib


			end





			function GroupboxLib:CreateColorPicker(name,def,_function)


				name = name or 'Color Picker'


				def = def or Color3.fromRGB(255,255,255)


				_function = _function or function() end





				local ColorPicker = Instance.new("TextButton")


				local Color = Instance.new("Frame")


				local ColorPicker_2 = Instance.new("Frame")


				local Gradient = Instance.new("ImageLabel")


				local Picker = Instance.new("ImageLabel")


				local ColorSlider = Instance.new("Frame")


				local UIGradient = Instance.new("UIGradient")





				local picker = {H = 5,S = 1,V = 1,SelColor = def}



				ColorPicker.Name = "ColorPicker"


				ColorPicker.Parent = Section


				ColorPicker.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


				ColorPicker.BorderColor3 = Color3.fromRGB(0, 85, 255)


				ColorPicker.Position = UDim2.new(-0.0141008906, 0, -0.168750003, 0)


				ColorPicker.Size = UDim2.new(1, 0, 0, 25)


				ColorPicker.Font = Enum.Font.TitilliumWeb


				ColorPicker.Text = name


				ColorPicker.TextColor3 = Color3.fromRGB(255, 255, 255)


				ColorPicker.TextScaled = true


				ColorPicker.TextSize = 14.000


				ColorPicker.TextWrapped = true

				ColorPicker.ZIndex = 10



				Color.Name = "Color"


				Color.Parent = ColorPicker


				Color.BackgroundColor3 = Color3.fromRGB(255, 0, 0)


				Color.BorderColor3 = Color3.fromRGB(0, 85, 255)


				Color.Position = UDim2.new(0.0385014825, 0, 0.148999989, 0)


				Color.Size = UDim2.new(0.0799999982, 0, 0.699999988, 0)



				ColorPicker_2.Name = "ColorPicker"


				ColorPicker_2.Parent = ColorPicker


				ColorPicker_2.BackgroundColor3 = Color3.fromRGB(33, 33, 33)


				ColorPicker_2.BorderColor3 = Color3.fromRGB(0, 85, 255)


				ColorPicker_2.Position = UDim2.new(0.0517034084, 0, 1.36000001, 0)


				ColorPicker_2.Size = UDim2.new(0.889349937, 0, 5.5, 0)


				ColorPicker_2.ZIndex = 25


				ColorPicker_2.Visible = false



				Gradient.Name = "Gradient"


				Gradient.Parent = ColorPicker_2


				Gradient.BackgroundColor3 = Color3.fromRGB(255, 0, 0)


				Gradient.BorderSizePixel = 0


				Gradient.Size = UDim2.new(1, 0, 1, 0)


				Gradient.Image = "rbxassetid://4155801252"



				Picker.Name = "Picker"


				Picker.Parent = ColorPicker_2


				Picker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


				Picker.BackgroundTransparency = 1.000


				Picker.Position = UDim2.new(0.903750837, 0, 0, 0)


				Picker.Size = UDim2.new(0, 18, 0, 18)


				Picker.ZIndex = 26


				Picker.Image = "rbxassetid://4953646208"



				ColorSlider.Name = "ColorSlider"


				ColorSlider.Parent = ColorPicker


				ColorSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


				ColorSlider.BorderColor3 = Color3.fromRGB(0, 85, 255)


				ColorSlider.BorderSizePixel = 0


				ColorSlider.Position = UDim2.new(0.0517032668, 0, 7.19999981, 0)


				ColorSlider.Size = UDim2.new(0.889350116, 0, 1.17999995, 0)


				ColorSlider.ZIndex = 28


				ColorSlider.Visible = false



				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(21, 255, 0)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(234, 255, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))}


				UIGradient.Parent = ColorSlider


				if #Section:GetChildren() == 2 then


					Section.Size = UDim2.new(0.949999988, 0, 0, 25)


				elseif #Section:GetChildren() > 2 then


					Section.Size = UDim2.new(0.949999988, 0, 0, ((#Section:GetChildren() - 1) * 25) + ((#Section:GetChildren() - 1) * 7))


				end

				sometext_tab[side].CanvasSize = UDim2.new(0,0,0,((#sometext_tab[side]:GetChildren() - 2) + (math.floor(Section.Size.Y / 10))) * 60)
				
				
				ColorPicker.MouseButton1Click:Connect(function()


					ColorPicker_2.Visible = not ColorPicker_2.Visible


					ColorSlider.Visible = not ColorSlider.Visible
					
					if ColorPicker_2.Visible == true and ColorSlider.Visible == true then
						Section.ZIndex = 5
					else
						Section.ZIndex = 1
					end
				end)





				local function NewColor()


					Color.BackgroundColor3 = Color3.fromHSV(picker.H,picker.S,picker.V)


					Gradient.BackgroundColor3 = Color3.fromHSV(picker.H,1,1)


					picker.SelColor = Color.BackgroundColor3


					_function(picker.SelColor)


				end



				local dragging = false


				local cinput = nil

				Gradient.InputBegan:Connect(function(input)


					if input.UserInputType == Enum.UserInputType.MouseButton1 then


						if cinput then


							cinput:Disconnect()


						end





						dragging = true


						CPDragging = true





						cinput = game:GetService("RunService").RenderStepped:Connect(function()


							local Mouse = game.Players.LocalPlayer:GetMouse()


							local ColorX = (math.clamp(Mouse.X - ColorSlider.AbsolutePosition.X, 0, ColorSlider.AbsoluteSize.X) / ColorSlider.AbsoluteSize.X)


							local ColorY = (math.clamp(Mouse.Y - Gradient.AbsolutePosition.Y, 0, Gradient.AbsoluteSize.Y) / Gradient.AbsoluteSize.Y)



							picker.S = ColorX


							picker.V = 1 - ColorY



							Picker.Position = UDim2.new(ColorX, 0, ColorY, 0)



							NewColor()


						end)


					end


				end)





				Gradient.InputEnded:Connect(function(input)


					if input.UserInputType == Enum.UserInputType.MouseButton1 then


						if (cinput) then


							cinput:Disconnect()


						end



						dragging = false


						CPDragging = false


					end


				end)





				local hinput = nil





				ColorSlider.InputBegan:Connect(function(input)


					if input.UserInputType == Enum.UserInputType.MouseButton1 then


						if (hinput) then


							hinput:Disconnect()


						end



						hinput = game:GetService("RunService").RenderStepped:Connect(function()


							local Mouse = game.Players.LocalPlayer:GetMouse()


							local HY = (math.clamp(Mouse.X - ColorSlider.AbsolutePosition.X, 0, ColorSlider.AbsoluteSize.X) / ColorSlider.AbsoluteSize.X)



							picker.H = 1 - HY



							NewColor()


						end)



						dragging = true


						CPDragging = true


					end


				end)



				ColorSlider.InputEnded:Connect(function(input)


					if input.UserInputType == Enum.UserInputType.MouseButton1 then


						if (hinput) then


							hinput:Disconnect()


						end



						dragging = false


						CPDragging = false


					end

					local ColorLib = {}

					function ColorLib:Set(val)
						Color.BackgroundColor3 = val


						Gradient.BackgroundColor3 = val


						picker.SelColor = Color.BackgroundColor3


						_function(picker.SelColor)
					end

					function ColorLib:Get()
						return picker.SelColor
					end

					return ColorLib
				end)


			end





			return GroupboxLib


		end





		return TabLib


	end





	return WindowLib,UILib


end

return library
