
local SuperSecretGuifake = Instance.new("ScreenGui")
local NotMainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local ImTitle = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local UIGradient_2 = Instance.new("UIGradient")
local JustAtEXT = Instance.new("TextLabel")
local UIGradient_3 = Instance.new("UIGradient")
local CountinueBtn = Instance.new("TextButton")
local UIGradient_4 = Instance.new("UIGradient")

SuperSecretGuifake.Name = "SuperSecretGui(fake)"
SuperSecretGuifake.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

NotMainFrame.Name = "NotMainFrame"
NotMainFrame.Parent = SuperSecretGuifake
NotMainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotMainFrame.Position = UDim2.new(0.34290266, 0, 0.352727264, 0)
NotMainFrame.Size = UDim2.new(0.313716114, 0, 0.292727321, 0)

UICorner.Parent = NotMainFrame

ImTitle.Name = "ImTitle"
ImTitle.Parent = NotMainFrame
ImTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImTitle.BackgroundTransparency = 1.000
ImTitle.BorderSizePixel = 0
ImTitle.Size = UDim2.new(1.00000012, 0, 0.285714269, 0)
ImTitle.Font = Enum.Font.Kalam
ImTitle.Text = "nanohub loader"
ImTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ImTitle.TextScaled = true
ImTitle.TextSize = 14.000
ImTitle.TextWrapped = true

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
UIGradient.Parent = ImTitle

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
UIGradient_2.Rotation = 90
UIGradient_2.Parent = NotMainFrame

JustAtEXT.Name = "JustAtEXT"
JustAtEXT.Parent = NotMainFrame
JustAtEXT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
JustAtEXT.BackgroundTransparency = 1.000
JustAtEXT.BorderSizePixel = 0
JustAtEXT.Position = UDim2.new(0, 0, 0.285714239, 0)
JustAtEXT.Size = UDim2.new(1.00000012, 0, 0.40219754, 0)
JustAtEXT.Font = Enum.Font.Kalam
JustAtEXT.Text = "Rank: Free"
JustAtEXT.TextColor3 = Color3.fromRGB(255, 255, 255)
JustAtEXT.TextScaled = true
JustAtEXT.TextSize = 14.000
JustAtEXT.TextWrapped = true

UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
UIGradient_3.Parent = JustAtEXT

CountinueBtn.Name = "CountinueBtn"
CountinueBtn.Parent = NotMainFrame
CountinueBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CountinueBtn.BackgroundTransparency = 1.000
CountinueBtn.Position = UDim2.new(0, 0, 0.691511273, 0)
CountinueBtn.Size = UDim2.new(1.00000036, 0, 0.308488607, 0)
CountinueBtn.Font = Enum.Font.Kalam
CountinueBtn.Text = "Continue"
CountinueBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CountinueBtn.TextScaled = true
CountinueBtn.TextSize = 14.000
CountinueBtn.TextWrapped = true

UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
UIGradient_4.Parent = CountinueBtn

return SuperSecretGuifake

