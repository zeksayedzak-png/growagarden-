-- Auto Clicker for SpinButton - Mobile Version FIXED
-- Made for: Players.sayedmma1.PlayerGui.TheGardenGames_SpinWheel.WheelFrame.SpinButton
-- Usage: loadstring(game:HttpGet("URL"))()

if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ✅ **FIX: CREATE SCREEN GUI FIRST**
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SpinAutoClicker"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = PlayerGui

-- ✅ **FIX: MAKE SURE IT'S VISIBLE**
ScreenGui.Enabled = true

print("✅ ScreenGui created successfully!")

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 280, 0, 180)
MainFrame.Position = UDim2.new(0.5, -140, 0.05, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

-- ✅ **FIX: ADD ROUNDED CORNERS**
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.12, 0)
UICorner.Parent = MainFrame

-- ✅ **FIX: ADD DROP SHADOW FOR VISIBILITY**
local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(0, 120, 215)
UIStroke.Parent = MainFrame

-- Title
local Title = Instance.new("TextLabel")
Title.Text = "⚡ SPIN AUTOCLICKER"
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
Title.TextColor3 = Color3.white
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Parent = MainFrame

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Text = "✕"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
CloseBtn.TextColor3 = Color3.white
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.Parent = MainFrame

-- Stats Frame
local StatsFrame = Instance.new("Frame")
StatsFrame.Size = UDim2.new(1, -20, 0, 50)
StatsFrame.Position = UDim2.new(0, 10, 0, 45)
StatsFrame.BackgroundTransparency = 1
StatsFrame.Parent = MainFrame

local ClicksLabel = Instance.new("TextLabel")
ClicksLabel.Text = "CLICKS/SECOND:"
ClicksLabel.Size = UDim2.new(0.5, -5, 1, 0)
ClicksLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
ClicksLabel.Font = Enum.Font.Gotham
ClicksLabel.TextSize = 14
ClicksLabel.TextXAlignment = Enum.TextXAlignment.Left
ClicksLabel.Parent = StatsFrame

local ClicksValue = Instance.new("TextLabel")
ClicksValue.Text = "1"
ClicksValue.Size = UDim2.new(0.5, -5, 1, 0)
ClicksValue.Position = UDim2.new(0.5, 5, 0, 0)
ClicksValue.TextColor3 = Color3.fromRGB(0, 255, 150)
ClicksValue.Font = Enum.Font.GothamBold
ClicksValue.TextSize = 20
ClicksValue.Parent = StatsFrame

local TotalLabel = Instance.new("TextLabel")
TotalLabel.Text = "TOTAL CLICKS:"
TotalLabel.Size = UDim2.new(0.5, -5, 1, 0)
TotalLabel.Position = UDim2.new(0, 0, 0, 30)
TotalLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
TotalLabel.Font = Enum.Font.Gotham
TotalLabel.TextSize = 14
TotalLabel.Parent = StatsFrame

local TotalValue = Instance.new("TextLabel")
TotalValue.Text = "0"
TotalValue.Size = UDim2.new(0.5, -5, 1, 0)
TotalValue.Position = UDim2.new(0.5, 5, 0, 30)
TotalValue.TextColor3 = Color3.fromRGB(255, 200, 0)
TotalValue.Font = Enum.Font.GothamBold
TotalValue.TextSize = 20
TotalValue.Parent = StatsFrame

-- Controls
local ControlsFrame = Instance.new("Frame")
ControlsFrame.Size = UDim2.new(1, -20, 0, 70)
ControlsFrame.Position = UDim2.new(0, 10, 0, 100)
ControlsFrame.BackgroundTransparency = 1
ControlsFrame.Parent = MainFrame

-- CPS Selector
local CPSFrame = Instance.new("Frame")
CPSFrame.Size = UDim2.new(1, 0, 0, 30)
CPSFrame.BackgroundTransparency = 1
CPSFrame.Parent = ControlsFrame

local MinusBtn = Instance.new("TextButton")
MinusBtn.Text = "➖"
MinusBtn.Size = UDim2.new(0, 40, 0, 30)
MinusBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
MinusBtn.TextColor3 = Color3.white
MinusBtn.Font = Enum.Font.GothamBold
MinusBtn.TextSize = 18
MinusBtn.Parent = CPSFrame

local CPSDisplay = Instance.new("TextLabel")
CPSDisplay.Text = "1 CPS"
CPSDisplay.Size = UDim2.new(0, 100, 0, 30)
CPSDisplay.Position = UDim2.new(0.5, -50, 0, 0)
CPSDisplay.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
CPSDisplay.TextColor3 = Color3.fromRGB(0, 255, 150)
CPSDisplay.Font = Enum.Font.GothamBold
CPSDisplay.TextSize = 16
CPSDisplay.Parent = CPSFrame

local PlusBtn = Instance.new("TextButton")
PlusBtn.Text = "➕"
PlusBtn.Size = UDim2.new(0, 40, 0, 30)
PlusBtn.Position = UDim2.new(1, -40, 0, 0)
PlusBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
PlusBtn.TextColor3 = Color3.white
PlusBtn.Font = Enum.Font.GothamBold
PlusBtn.TextSize = 18
PlusBtn.Parent = CPSFrame

-- Start/Stop Buttons
local StartBtn = Instance.new("TextButton")
StartBtn.Text = "▶️ START"
StartBtn.Size = UDim2.new(0.48, -5, 0, 35)
StartBtn.Position = UDim2.new(0, 0, 0, 40)
StartBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
StartBtn.TextColor3 = Color3.white
StartBtn.Font = Enum.Font.GothamBold
StartBtn.TextSize = 16
StartBtn.Parent = ControlsFrame

local StopBtn = Instance.new("TextButton")
StopBtn.Text = "⏹️ STOP"
StopBtn.Size = UDim2.new(0.48, -5, 0, 35)
StopBtn.Position = UDim2.new(0.52, 5, 0, 40)
StopBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
StopBtn.TextColor3 = Color3.white
StopBtn.Font = Enum.Font.GothamBold
StopBtn.TextSize = 16
StopBtn.Parent = ControlsFrame

-- ✅ **FIX: ADD VISIBILITY CONFIRMATION**
print("✅ UI Created! You should see the window now!")

-- Logic
local clicking = false
local clicksPerSecond = 1
local totalClicks = 0
local lastClickTime = 0

-- Function to find and click the SpinButton
local function clickSpinButton()
    -- Direct path to the button
    local success, spinButton = pcall(function()
        return Players.sayedmma1.PlayerGui.TheGardenGames_SpinWheel.WheelFrame.SpinButton
    end)
    
    if success and spinButton then
        -- Try to click it
        pcall(function()
            if spinButton:IsA("TextButton") or spinButton:IsA("ImageButton") then
                spinButton:Fire("MouseButton1Click")
                return true
            end
        end)
        
        -- Also try remote events
        pcall(function()
            local remoteNames = {"SpinButton", "SpinWheel", "PurchaseSpin", "BuySpin"}
            for _, name in ipairs(remoteNames) do
                local remote = game.ReplicatedStorage:FindFirstChild(name)
                if remote and remote:IsA("RemoteEvent") then
                    remote:FireServer()
                    break
                end
            end
        end)
    end
    return false
end

-- Update UI function
local function updateUI()
    ClicksValue.Text = tostring(clicksPerSecond)
    CPSDisplay.Text = clicksPerSecond .. " CPS"
    TotalValue.Text = tostring(totalClicks)
end

-- Click loop
game:GetService("RunService").Heartbeat:Connect(function()
    if clicking and tick() - lastClickTime >= (1 / clicksPerSecond) then
        if clickSpinButton() then
            totalClicks = totalClicks + 1
            updateUI()
        end
        lastClickTime = tick()
    end
end)

-- Button Events
MinusBtn.MouseButton1Click:Connect(function()
    if clicksPerSecond > 1 then
        clicksPerSecond = clicksPerSecond - 1
        updateUI()
    end
end)

PlusBtn.MouseButton1Click:Connect(function()
    if clicksPerSecond < 20 then
        clicksPerSecond = clicksPerSecond + 1
        updateUI()
    end
end)

StartBtn.MouseButton1Click:Connect(function()
    clicking = true
    StartBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    StopBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
    print("✅ Auto-clicking STARTED at " .. clicksPerSecond .. " CPS")
end)

StopBtn.MouseButton1Click:Connect(function()
    clicking = false
    StartBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
    print("⏹️ Auto-clicking STOPPED")
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    print("❌ Auto-clicker closed")
end)

-- Make window draggable
local dragging = false
local dragStart, startPos

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
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

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- Initial update
updateUI()

print("🎯 Spin AutoClicker loaded successfully!")
print("🎮 Controls: +/- buttons to adjust speed")
print("▶️ START button to begin clicking")
print("⏹️ STOP button to pause")
print("✕ Close button to remove UI")
