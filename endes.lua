local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

getgenv().EndessConfig = getgenv().EndessConfig or {
    AimbotEnabled = false,
    SilentAimEnabled = false,
    FOV = 120,
    Smoothness = 0.12,
    FlyEnabled = false,
    Speed = 50,
    NoClipEnabled = false
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local FloatButton = Instance.new("TextButton")
FloatButton.Size = UDim2.new(0, 60, 0, 60)
FloatButton.Position = UDim2.new(0, 20, 0, 20)
FloatButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
FloatButton.Text = "E"
FloatButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FloatButton.TextSize = 28
FloatButton.Font = Enum.Font.Code
FloatButton.Parent = ScreenGui
FloatButton.BorderSizePixel = 0

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 480, 0, 420)
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
TitleBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -90, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "evilperson232's movement script"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.Code
Title.TextSize = 15
Title.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Position = UDim2.new(1, -40, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
CloseBtn.TextSize = 26
CloseBtn.Font = Enum.Font.Code
CloseBtn.Parent = TitleBar

local TabCombat = Instance.new("TextButton")
TabCombat.Size = UDim2.new(0.25, 0, 0, 40)
TabCombat.Position = UDim2.new(0, 0, 0, 40)
TabCombat.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TabCombat.Text = "Combat"
TabCombat.TextColor3 = Color3.fromRGB(200, 200, 200)
TabCombat.Font = Enum.Font.Code
TabCombat.TextSize = 14
TabCombat.Parent = MainFrame

local Scrolling = Instance.new("ScrollingFrame")
Scrolling.Size = UDim2.new(1, -20, 1, -100)
Scrolling.Position = UDim2.new(0, 10, 0, 90)
Scrolling.BackgroundTransparency = 1
Scrolling.ScrollBarThickness = 6
Scrolling.CanvasSize = UDim2.new(0, 0, 0, 620)
Scrolling.Parent = MainFrame

local AimbotLabel = Instance.new("TextLabel")
AimbotLabel.Size = UDim2.new(0, 240, 0, 35)
AimbotLabel.Position = UDim2.new(0, 20, 0, 20)
AimbotLabel.BackgroundTransparency = 1
AimbotLabel.Text = "Aimbot (Legit)"
AimbotLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotLabel.Font = Enum.Font.Code
AimbotLabel.TextSize = 15
AimbotLabel.TextXAlignment = Enum.TextXAlignment.Left
AimbotLabel.Parent = Scrolling

local AimbotToggle = Instance.new("TextButton")
AimbotToggle.Size = UDim2.new(0, 90, 0, 35)
AimbotToggle.Position = UDim2.new(0, 300, 0, 20)
AimbotToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AimbotToggle.Text = getgenv().EndessConfig.AimbotEnabled and "ON" or "OFF"
AimbotToggle.TextColor3 = getgenv().EndessConfig.AimbotEnabled and Color3.fromRGB(0, 255, 120) or Color3.fromRGB(255, 80, 80)
AimbotToggle.Font = Enum.Font.Code
AimbotToggle.TextSize = 14
AimbotToggle.Parent = Scrolling

local SilentLabel = Instance.new("TextLabel")
SilentLabel.Size = UDim2.new(0, 240, 0...
