-- Auto Clicker for SpinButton - Mobile Version
-- Made for: Players.sayedmma1.PlayerGui.TheGardenGames_SpinWheel.WheelFrame.SpinButton
-- Usage: loadstring(game:HttpGet("https://raw.githubusercontent.com/yourrepo/main/spinclicker.lua"))()

-- Wait for game to load
if not game:IsLoaded() then game.Loaded:Wait() end

-- Services
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Main UI (Mobile Friendly)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SpinAutoClicker"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- Main Frame (Compact, Top Center)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 280, 0, 180)
MainFrame.Position = UDim2.new(0.5, -140, 0.05, 0) -- Top Center
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Rounded corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.12, 0)
UICorner.Parent = MainFrame

-- Title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Text = "⚡ SPIN AUTOCLICKER"
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
Title.TextColor3 = Color3.white
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Parent = MainFrame

-- Close button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Text = "✕"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
CloseBtn.TextColor3 = Color3.white
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = MainFrame

-- Stats Display
local StatsFrame = Instance.new("Frame")
StatsFrame.Name = "StatsFrame"
StatsFrame.Size = UDim2.new(1, -20, 0, 50)
StatsFrame.Position = UDim2.new(0, 10, 0, 45)
StatsFrame.BackgroundTransparency = 1
StatsFrame.Parent = MainFrame

local ClicksLabel = Instance.new("TextLabel")
ClicksLabel.Name = "ClicksLabel"
ClicksLabel.Text = "CLICKS PER SECOND:"
ClicksLabel.Size = UDim2.new(0.5, -5, 1, 0)
ClicksLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
ClicksLabel.Font = Enum.Font.Gotham
ClicksLabel.TextSize = 14
ClicksLabel.TextXAlignment = Enum.TextXAlignment.Left
ClicksLabel.Parent = StatsFrame

local ClicksValue = Instance.new("TextLabel")
ClicksValue.Name = "ClicksValue"
ClicksValue.Text = "1"
ClicksValue.Size = UDim2.new(0.5, -5, 1, 0)
ClicksValue.Position = UDim2.new(0.5, 5, 0, 0)
ClicksValue.TextColor3 = Color3.fromRGB(0, 255, 150)
ClicksValue.Font = Enum.Font.GothamBold
ClicksValue.TextSize = 20
ClicksValue.TextXAlignment = Enum.TextXAlignment.Right
ClicksValue.Parent = StatsFrame

local TotalLabel = Instance.new("TextLabel")
TotalLabel.Name = "TotalLabel"
TotalLabel.Text = "TOTAL CLICKS:"
TotalLabel.Size = UDim2.new(0.5, -5, 1, 0)
TotalLabel.Position = UDim2.new(0, 0, 0, 30)
TotalLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
TotalLabel.Font = Enum.Font.Gotham
TotalLabel.TextSize = 14
TotalLabel.TextXAlignment = Enum.TextXAlignment.Left
TotalLabel.Parent = StatsFrame

local TotalValue = Instance.new("TextLabel")
TotalValue.Name = "TotalValue"
TotalValue.Text = "0"
TotalValue.Size = UDim2.new(0.5, -5, 1, 0)
TotalValue.Position = UDim2.new(0.5, 5, 0, 30)
TotalValue.TextColor3 = Color3.fromRGB(255, 200, 0)
TotalValue.Font = Enum.Font.GothamBold
TotalValue.TextSize = 20
TotalValue.TextXAlignment = Enum.TextXAlignment.Right
TotalValue.Parent = StatsFrame

-- Control Buttons
local ControlsFrame = Instance.new("Frame")
ControlsFrame.Name = "ControlsFrame"
ControlsFrame.Size = UDim2.new(1, -20, 0, 70)
ControlsFrame.Position = UDim2.new(0, 10, 0, 100)
ControlsFrame.BackgroundTransparency = 1
ControlsFrame.Parent = MainFrame

-- Clicks per second selector
local CPSFrame = Instance.new("Frame")
CPSFrame.Name = "CPSFrame"
CPSFrame.Size = UDim2.new(1, 0, 0, 30)
CPSFrame.BackgroundTransparency = 1
CPSFrame.Parent = ControlsFrame

local MinusBtn = Instance.new("TextButton")
MinusBtn.Name = "MinusBtn"
MinusBtn.Text = "➖"
MinusBtn.Size = UDim2.new(0, 40, 0, 30)
MinusBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
MinusBtn.TextColor3 = Color3.white
MinusBtn.Font = Enum.Font.GothamBold
MinusBtn.TextSize = 18
MinusBtn.Parent = CPSFrame

local CPSDisplay = Instance.new("TextLabel")
CPSDisplay.Name = "CPSDisplay"
CPSDisplay.Text = "1 CPS"
CPSDisplay.Size = UDim2.new(0, 100, 0, 30)
CPSDisplay.Position = UDim2.new(0.5, -50, 0, 0)
CPSDisplay.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
CPSDisplay.TextColor3 = Color3.fromRGB(0, 255, 150)
CPSDisplay.Font = Enum.Font.GothamBold
CPSDisplay.TextSize = 16
CPSDisplay.Parent = CPSFrame

local PlusBtn = Instance.new("TextButton")
PlusBtn.Name = "PlusBtn"
PlusBtn.Text = "➕"
PlusBtn.Size = UDim2.new(0, 40, 0, 30)
PlusBtn.Position = UDim2.new(1, -40, 0, 0)
PlusBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
PlusBtn.TextColor3 = Color3.white
PlusBtn.Font = Enum.Font.GothamBold
PlusBtn.TextSize = 18
PlusBtn.Parent = CPSFrame

-- Start/Stop buttons
local StartBtn = Instance.new("TextButton")
StartBtn.Name = "StartBtn"
StartBtn.Text = "▶️ START"
StartBtn.Size = UDim2.new(0.48, -5, 0, 35)
StartBtn.Position = UDim2.new(0, 0, 0, 40)
StartBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
StartBtn.TextColor3 = Color3.white
StartBtn.Font = Enum.Font.GothamBold
StartBtn.TextSize = 16
StartBtn.Parent = ControlsFrame

local StopBtn = Instance.new("TextButton")
StopBtn.Name = "StopBtn"
StopBtn.Text = "⏹️ STOP"
StopBtn.Size = UDim2.new(0.48, -5, 0, 35)
StopBtn.Position = UDim2.new(0.52, 5, 0, 40)
StopBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
StopBtn.TextColor3 = Color3.white
StopBtn.Font = Enum.Font.GothamBold
StopBtn.TextSize = 16
StopBtn.Parent = ControlsFrame

-- Variables
local clicking = false
local clicksPerSecond = 1
local totalClicks = 0
local lastClickTime = 0

-- Find the SpinButton
local function findSpinButton()
    local path = "Players.sayedmma1.PlayerGui.TheGardenGames_SpinWheel.WheelFrame.SpinButton"
    local parts = string.split(path, ".")
    
    local current = game
    for i = 1, #parts do
        current = current:FindFirstChild(parts[i])
        if not current then
            return nil
        end
    end
    return current
end

-- Click the SpinButton
local function clickSpinButton()
    local spinButton = findSpinButton()
    
    if spinButton and spinButton:IsA("GuiButton") then
        -- Try to fire the button
        pcall(function()
            spinButton:Fire("MouseButton1Click")
        end)
        
        -- Also try to find and fire related remote
        pcall(function()
            local RS = game:GetService("ReplicatedStorage")
            local remotes = {
                "SpinButton",
                "SpinWheel",
                "PurchaseSpin",
                "BuySpin"
            }
            
            for _, name in ipairs(remotes) do
                local remote = RS:FindFirstChild(name)
                if remote and remote:IsA("RemoteEvent") then
                    remote:FireServer()
                    break
                end
            end
        end)
        
        return true
    end
    return false
end

-- Update UI
local function updateUI()
    ClicksValue.Text = tostring(clicksPerSecond)
    CPSDisplay.Text = clicksPerSecond .. " CPS"
    TotalValue.Text = tostring(totalClicks)
end

-- Clicking loop
local function clickLoop()
    if not clicking then return end
    
    local currentTime = tick()
    if currentTime - lastClickTime >= (1 / clicksPerSecond) then
        if clickSpinButton() then
            totalClicks = totalClicks + 1
            updateUI()
        end
        lastClickTime = currentTime
    end
end

-- Button events
MinusBtn.MouseButton1Click:Connect(function()
    if clicksPerSecond > 1 then
        clicksPerSecond = clicksPerSecond - 1
        updateUI()
    end
end)

PlusBtn.MouseButton1Click:Connect(function()
    if clicksPerSecond < 20 then  -- Max 20 clicks per second
        clicksPerSecond = clicksPerSecond + 1
        updateUI()
    end
end)

StartBtn.MouseButton1Click:Connect(function()
    clicking = true
    StartBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    StopBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
end)

StopBtn.MouseButton1Click:Connect(function()
    clicking = false
    StartBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Make frame draggable
local dragging = false
local dragStart, startPos

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.Touch then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- Run click loop
RunService.Heartbeat:Connect(clickLoop)

-- Initial update
updateUI()

-- Notify user
Title.Text = "✅ SPIN AUTOCLICKER LOADED"
wait(1)
Title.Text = "⚡ SPIN AUTOCLICKER"

print("Spin AutoClicker loaded successfully!")
print("Target: SpinButton")
print("Controls: +/- to adjust speed, Start/Stop buttons")
