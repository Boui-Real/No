local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/MrAntiMatteryAlt/No/main/KavoUI_Lib.lua"))()

local Player = game.Players.LocalPlayer

local Window = library.CreateLib("Drawing Library", "Sentinel")

local LineTab = Window:CreateTab("Line")
local CircleTab = Window:CreateTab('Circle')
local KeybindsTab = Window:CreateTab("Keybinds")

local LineTabCaSettings = LineTab:AddLocalTab("Settings")
local LineTabCaTracers = LineTab:AddLocalTab("Tracers")
local LineTabCaBox = LineTab:AddLocalTab("Box")

local CircleTabCaSettings = CircleTab:AddLocalTab('Settings')
local CircleTabCaMouse = CircleTab:AddLocalTab('Mouse')

local KeybindsTabCaKeybinds = KeybindsTab:AddLocalTab("Keybinds")

KeybindsTabCaKeybinds:AddKeybind(
    "Toggle UI",
    "Toggle UI Visibility",
    Enum.KeyCode.Insert,
    function()
        library:ToggleUI()
    end
)

getgenv().circlecolor = Color3.new(1,0,0)
getgenv().circleradius = 10

CircleTabCaSettings:AddCP('Circle Color','',getgenv().circlecolor,function(v)
    getgenv().circlecolor = v
end)

local circles = {}

CircleTabCaMouse:AddToggle('Show Mouse','',function(v)
    getgenv().circlemouse = v
    if getgenv().circlemouse then
        local idk = nil
        if circles['mouse'] ~= nil then
            idk = circles['mouse']
        else
            idk = Drawing.new('Circle')
            circles['mouse'] = idk
        end

        local mouse = game.Players.LocalPlayer:GetMouse()

        idk.Visible = true
        mouse.Move:Connect(function()
            idk.Position = game:service('UserInputService'):GetMouseLocation()
        end)
        while wait() do
            idk.Radius = getgenv().circleradius
            idk.Color = getgenv().circlecolor
        end
    else
        if circles['mouse'] ~= nil then
            circles['mouse']:Remove()
            circles['mouse'] = nil
        end
    end
end)

CircleTabCaMouse:AddSlider('Radius','',50,5,function(v)
    getgenv().circleradius = v
end)

getgenv().linecolor = Color3.new(1, 0, 0)

LineTabCaSettings:AddToggle(
    "Team Based",
    "",
    function(v)
        getgenv().linebased = v
    end
)

LineTabCaSettings:AddCP(
    "Other Team Color",
    "",
    Color3.new(1, 0, 0),
    function(v)
        getgenv().linecolor = v
    end
)

LineTabCaTracers:AddToggle(
    "Enabled",
    "",
    function(val)
        getgenv().tracers = val
        local drawings = {}

        game.Players.PlayerRemoving:Connect(
            function(plr)
                if drawings[plr.Name] ~= nil then
                    drawings[plr.Name]:Remove()
                    drawings[plr.Name] = nil
                end
            end
        )

        while wait() do
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Character and getgenv().tracers then
                    if getgenv().linebased then
                        if v.Team ~= Player.Team then
                            pcall(
                                function()
                                    local mouse = Player:GetMouse()
                                    local vector, onScreen =
                                        workspace.CurrentCamera:WorldToViewportPoint(
                                        v.Character.HumanoidRootPart.Position
                                    )
                                    local camera = workspace.CurrentCamera
                                    local draw = nil
                                    if drawings[v.Name] and drawings[v.Name] ~= nil then
                                        draw = drawings[v.Name]
                                    else
                                        draw = Drawing.new("Line")
                                        drawings[v.Name] = draw
                                    end
                                    if onScreen then
                                        if getgenv().linetracerfrommouse then
                                            draw.From = game:service("UserInputService"):GetMouseLocation()
                                        else
                                            draw.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
                                        end
                                        draw.To = Vector2.new(vector.X, vector.Y)
                                        draw.Thickness = 2
                                        draw.Color = getgenv().linecolor
                                        draw.Visible = true
                                    elseif not onScreen then
                                        draw.Visible = false
                                    end
                                end
                            )
                        end
                    else
                        if v ~= Player then
                            pcall(
                                function()
                                    local mouse = Player:GetMouse()
                                    local vector, onScreen =
                                        workspace.CurrentCamera:WorldToViewportPoint(
                                        v.Character.HumanoidRootPart.Position
                                    )
                                    local camera = workspace.CurrentCamera
                                    local draw = nil
                                    if drawings[v.Name] and drawings[v.Name] ~= nil then
                                        draw = drawings[v.Name]
                                    else
                                        draw = Drawing.new("Line")
                                        drawings[v.Name] = draw
                                    end
                                    if onScreen then
                                        if getgenv().linetracerfrommouse then
                                            draw.From = game:service("UserInputService"):GetMouseLocation()
                                        else
                                            draw.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
                                        end
                                        draw.To = Vector2.new(vector.X, vector.Y)
                                        draw.Thickness = 2
                                        draw.Color = v.TeamColor.Color
                                        draw.Visible = true
                                    elseif not onScreen then
                                        draw.Visible = false
                                    end
                                end
                            )
                        end
                    end
                elseif v ~= Player and v.Character == nil then
                    if drawings[v.Name] then
                        drawings[v.Name]:Remove()
                        drawings[v.Name] = nil
                    end
                elseif getgenv().tracers == false then
                    for o, d in pairs(drawings) do
                        d:Remove()
                    end
                    table.clear(drawings)
                end
            end
        end
    end
)

LineTabCaTracers:AddToggle(
    "From Mouse",
    "",
    function(v)
        getgenv().linetracerfrommouse = v
    end
)

LineTabCaBox:AddToggle(
    "Enabled",
    "",
    function(val)
        getgenv().esp = val
        local camera = workspace.CurrentCamera
        local Player = game.Players.LocalPlayer

        local drawings = {}

        game.Players.PlayerRemoving:Connect(
            function(plr)
                if drawings[plr.Name] ~= nil then
                    for i,v in pairs(drawings[plr.Name]) do
                        v:Remove()
                        drawings[plr.Name] = nil
                    end
                end
            end
        )

        while wait() do
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Character and getgenv().esp then
                    if getgenv().linebased then
                        if v.Team ~= Player.Team then
                            pcall(
                                function()
                                    local lines = nil
                                    if drawings[v.Name] ~= nil then
                                        lines = drawings[v.Name]
                                    else
                                        local upper = Drawing.new("Line")
                                        local left = Drawing.new("Line")
                                        local right = Drawing.new("Line")
                                        local down = Drawing.new("Line")
                                        lines = {
                                            upper = upper,
                                            left = left,
                                            right = right,
                                            down = down
                                        }
                                        drawings[v.Name] = lines
                                    end
                                    local vector, OnScreen =
                                        camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                                    if OnScreen then
                                        local Scale = v.Character.Head.Size.Y / 2
                                        local Size = Vector3.new(2, 3, 0) * (Scale * 2)
                                        local TL =
                                            camera:WorldToViewportPoint(
                                            (v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, 0)).p
                                        )
                                        local TR =
                                            camera:WorldToViewportPoint(
                                            (v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, 0)).p
                                        )
                                        local BL =
                                            camera:WorldToViewportPoint(
                                            (v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, 0)).p
                                        )
                                        local BR =
                                            camera:WorldToViewportPoint(
                                            (v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, 0)).p
                                        )

                                        lines.upper.From = Vector2.new(TL.X, TL.Y)
                                        lines.upper.To = Vector2.new(TR.X, TR.Y)

                                        lines.left.From = Vector2.new(TL.X, TL.Y)
                                        lines.left.To = Vector2.new(BL.X, BL.Y)

                                        lines.right.From = Vector2.new(TR.X, TR.Y)
                                        lines.right.To = Vector2.new(BR.X, BR.Y)

                                        lines.down.From = Vector2.new(BL.X, BL.Y)
                                        lines.down.To = Vector2.new(BR.X, BR.Y)

                                        for _, ok in pairs(lines) do
                                            ok.Visible = true
                                            ok.Color = getgenv().linecolor
                                        end
                                    else
                                        lines.upper.Visible = false
                                        lines.down.Visible = false
                                        lines.left.Visible = false
                                        lines.right.Visible = false
                                    end
                                end
                            )
                        end
                    else
                        if v ~= Player then
                            pcall(
                                function()
                                    local lines = nil
                                    if drawings[v.Name] ~= nil then
                                        lines = drawings[v.Name]
                                    else
                                        local upper = Drawing.new("Line")
                                        local left = Drawing.new("Line")
                                        local right = Drawing.new("Line")
                                        local down = Drawing.new("Line")
                                        lines = {
                                            upper = upper,
                                            left = left,
                                            right = right,
                                            down = down
                                        }
                                        drawings[v.Name] = lines
                                    end
                                    local vector, OnScreen =
                                        camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                                    if OnScreen then
                                        local Scale = v.Character.Head.Size.Y / 2
                                        local Size = Vector3.new(2, 3, 0) * (Scale * 2)
                                        local TL =
                                            camera:WorldToViewportPoint(
                                            (v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, 0)).p
                                        )
                                        local TR =
                                            camera:WorldToViewportPoint(
                                            (v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, 0)).p
                                        )
                                        local BL =
                                            camera:WorldToViewportPoint(
                                            (v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, 0)).p
                                        )
                                        local BR =
                                            camera:WorldToViewportPoint(
                                            (v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, 0)).p
                                        )

                                        lines.upper.From = Vector2.new(TL.X, TL.Y)
                                        lines.upper.To = Vector2.new(TR.X, TR.Y)

                                        lines.left.From = Vector2.new(TL.X, TL.Y)
                                        lines.left.To = Vector2.new(BL.X, BL.Y)

                                        lines.right.From = Vector2.new(TR.X, TR.Y)
                                        lines.right.To = Vector2.new(BR.X, BR.Y)

                                        lines.down.From = Vector2.new(BL.X, BL.Y)
                                        lines.down.To = Vector2.new(BR.X, BR.Y)

                                        for _, ok in pairs(lines) do
                                            ok.Visible = true
                                            ok.Color = v.TeamColor.Color
                                        end
                                    else
                                        lines.upper.Visible = false
                                        lines.down.Visible = false
                                        lines.left.Visible = false
                                        lines.right.Visible = false
                                    end
                                end
                            )
                        end
                    end
                elseif not getgenv().esp then
                    for _, ok in pairs(drawings) do
                        for _, g in pairs(ok) do
                            g:Remove()
                            drawings[v.Name] = nil
                        end
                    end
                    table.clear(drawings)
                end
            end
        end
    end
)
