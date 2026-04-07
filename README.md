local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local mouse = player:GetMouse()

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 520, 0, 340)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -80, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "evilperson232's movement script"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.Code
Title.TextSize = 14
Title.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.TextSize = 22
CloseBtn.Font = Enum.Font.Code
CloseBtn.Parent = TitleBar

local MainTab = Instance.new("TextButton")
MainTab.Size = UDim2.new(0.5, 0, 0, 30)
MainTab.Position = UDim2.new(0, 0, 0, 30)
MainTab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainTab.Text = "main"
MainTab.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTab.Font = Enum.Font.Code
MainTab.TextSize = 14
MainTab.Parent = MainFrame

local TrollTab = Instance.new("TextButton")
TrollTab.Size = UDim2.new(0.5, 0, 0, 30)
TrollTab.Position = UDim2.new(0.5, 0, 0, 30)
TrollTab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TrollTab.Text = "troll"
TrollTab.TextColor3 = Color3.fromRGB(180, 180, 180)
TrollTab.Font = Enum.Font.Code
TrollTab.TextSize = 14
TrollTab.Parent = MainFrame

local Scrolling = Instance.new("ScrollingFrame")
Scrolling.Size = UDim2.new(1, -20, 1, -80)
Scrolling.Position = UDim2.new(0, 10, 0, 70)
Scrolling.BackgroundTransparency = 1
Scrolling.ScrollBarThickness = 4
Scrolling.CanvasSize = UDim2.new(0, 0, 0, 500)
Scrolling.Parent = MainFrame

-- Void Spam
local Label1 = Instance.new("TextLabel")
Label1.Size = UDim2.new(0, 180, 0, 25)
Label1.Position = UDim2.new(0, 15, 0, 15)
Label1.BackgroundTransparency = 1
Label1.Text = "void spam"
Label1.TextColor3 = Color3.fromRGB(255, 255, 255)
Label1.Font = Enum.Font.Code
Label1.TextSize = 13
Label1.TextXAlignment = Enum.TextXAlignment.Left
Label1.Parent = Scrolling

local Toggle1 = Instance.new("TextButton")
Toggle1.Size = UDim2.new(0, 70, 0, 25)
Toggle1.Position = UDim2.new(0, 220, 0, 15)
Toggle1.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Toggle1.Text = "ON"
Toggle1.TextColor3 = Color3.fromRGB(0, 255, 80)
Toggle1.Font = Enum.Font.Code
Toggle1.TextSize = 13
Toggle1.Parent = Scrolling

-- Void Drop
local Label2 = Instance.new("TextLabel")
Label2.Size = UDim2.new(0, 180, 0, 25)
Label2.Position = UDim2.new(0, 15, 0, 50)
Label2.BackgroundTransparency = 1
Label2.Text = "void drop"
Label2.TextColor3 = Color3.fromRGB(255, 255, 255)
Label2.Font = Enum.Font.Code
Label2.TextSize = 13
Label2.TextXAlignment = Enum.TextXAlignment.Left
Label2.Parent = Scrolling

local VoidDropBox = Instance.new("TextBox")
VoidDropBox.Size = UDim2.new(0, 130, 0, 25)
VoidDropBox.Position = UDim2.new(0, 220, 0, 50)
VoidDropBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
VoidDropBox.Text = "-7000000"
VoidDropBox.TextColor3 = Color3.fromRGB(255, 255, 255)
VoidDropBox.Font = Enum.Font.Code
VoidDropBox.TextSize = 13
VoidDropBox.Parent = Scrolling

-- Wallbang
local Label3 = Instance.new("TextLabel")
Label3.Size = UDim2.new(0, 180, 0, 25)
Label3.Position = UDim2.new(0, 15, 0, 85)
Label3.BackgroundTransparency = 1
Label3.Text = "wallbang (tp)"
Label3.TextColor3 = Color3.fromRGB(255, 255, 255)
Label3.Font = Enum.Font.Code
Label3.TextSize = 13
Label3.TextXAlignment = Enum.TextXAlignment.Left
Label3.Parent = Scrolling

local RadiusLabel = Instance.new("TextLabel")
RadiusLabel.Size = UDim2.new(0, 100, 0, 20)
RadiusLabel.Position = UDim2.new(0, 220, 0, 85)
RadiusLabel.BackgroundTransparency = 1
RadiusLabel.Text = "radius: 3.5"
RadiusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
RadiusLabel.Font = Enum.Font.Code
RadiusLabel.TextSize = 12
RadiusLabel.Parent = Scrolling

-- ==================== AIMBOT FONCTIONNEL ====================

local aimbot = false
local smoothness = 0.12

local function getClosest()
    local closest, dist = nil, 9999
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("Head") then
            local pos, onScreen = camera:WorldToViewportPoint(p.Character.Head.Position)
            if onScreen then
                local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)).Magnitude
                if distance < dist then
                    dist = distance
                    closest = p
                end
            end
        end
    end
    return closest
end

RunService.RenderStepped:Connect(function()
    if not aimbot then return end
    local target = getClosest()
    if target and target.Character and target.Character.Head then
        local targetCFrame = CFrame.new(camera.CFrame.Position, target.Character.Head.Position)
        camera.CFrame = camera.CFrame:Lerp(targetCFrame, smoothness)
    end
end)

-- ==================== CONTROLES ====================

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        MainFrame.Visible = not MainFrame.Visible
    end
    if input.KeyCode == Enum.KeyCode.F then
        aimbot = not aimbot
    end
end)

print("Script chargé - Aimbot avec touche F | Menu avec INSERT")
