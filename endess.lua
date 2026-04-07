local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 520, 0, 380)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
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

local Scrolling = Instance.new("ScrollingFrame")
Scrolling.Size = UDim2.new(1, -20, 1, -80)
Scrolling.Position = UDim2.new(0, 10, 0, 70)
Scrolling.BackgroundTransparency = 1
Scrolling.ScrollBarThickness = 4
Scrolling.CanvasSize = UDim2.new(0, 0, 0, 600)
Scrolling.Parent = MainFrame

-- Aimbot Section
local AimbotLabel = Instance.new("TextLabel")
AimbotLabel.Size = UDim2.new(0, 200, 0, 30)
AimbotLabel.Position = UDim2.new(0, 20, 0, 20)
AimbotLabel.BackgroundTransparency = 1
AimbotLabel.Text = "Aimbot Rivals"
AimbotLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotLabel.Font = Enum.Font.Code
AimbotLabel.TextSize = 16
AimbotLabel.TextXAlignment = Enum.TextXAlignment.Left
AimbotLabel.Parent = Scrolling

local AimbotToggle = Instance.new("TextButton")
AimbotToggle.Size = UDim2.new(0, 80, 0, 30)
AimbotToggle.Position = UDim2.new(0, 250, 0, 20)
AimbotToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AimbotToggle.Text = "OFF"
AimbotToggle.TextColor3 = Color3.fromRGB(255, 80, 80)
AimbotToggle.Font = Enum.Font.Code
AimbotToggle.TextSize = 14
AimbotToggle.Parent = Scrolling

local SmoothLabel = Instance.new("TextLabel")
SmoothLabel.Size = UDim2.new(0, 150, 0, 25)
SmoothLabel.Position = UDim2.new(0, 20, 0, 70)
SmoothLabel.BackgroundTransparency = 1
SmoothLabel.Text = "Smoothness : 0.12"
SmoothLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
SmoothLabel.Font = Enum.Font.Code
SmoothLabel.TextSize = 13
SmoothLabel.Parent = Scrolling

local SmoothSlider = Instance.new("TextBox")
SmoothSlider.Size = UDim2.new(0, 120, 0, 25)
SmoothSlider.Position = UDim2.new(0, 250, 0, 70)
SmoothSlider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SmoothSlider.Text = "0.12"
SmoothSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
SmoothSlider.Font = Enum.Font.Code
SmoothSlider.TextSize = 13
SmoothSlider.Parent = Scrolling

-- Variables
local aimbotEnabled = false
local smoothness = 0.12

local function getClosestEnemy()
    local closest = nil
    local shortest = 99999
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") then
            local head = plr.Character.Head
            local screenPos, visible = camera:WorldToViewportPoint(head.Position)
            if visible then
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)).Magnitude
                if dist < shortest then
                    shortest = dist
                    closest = plr
                end
            end
        end
    end
    return closest
end

RunService.RenderStepped:Connect(function()
    if not aimbotEnabled then return end
    local target = getClosestEnemy()
    if target and target.Character and target.Character:FindFirstChild("Head") then
        local targetPos = target.Character.Head.Position
        local current = camera.CFrame
        local targetCFrame = CFrame.new(current.Position, targetPos)
        camera.CFrame = current:Lerp(targetCFrame, smoothness)
    end
end)

-- Controls
AimbotToggle.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    AimbotToggle.Text = aimbotEnabled and "ON" or "OFF"
    AimbotToggle.TextColor3 = aimbotEnabled and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 80, 80)
end)

SmoothSlider.FocusLost:Connect(function()
    local num = tonumber(SmoothSlider.Text)
    if num then
        smoothness = math.clamp(num, 0.01, 1)
        SmoothLabel.Text = "Smoothness : " .. smoothness
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

print("Endess Rivals chargé - Aimbot activable + Smoothness réglable")
