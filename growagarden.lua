-- سكريبت متكامل لمراقبة واجهات Roblox على الموبايل
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- مكتبة للواجهات
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- زر التحكم العائم
local floatingButton = Instance.new("TextButton")
floatingButton.Name = "MobileControlButton"
floatingButton.Text = "🎯"
floatingButton.Size = UDim2.new(0, 60, 0, 60)
floatingButton.Position = UDim2.new(0.8, 0, 0.7, 0) -- زاوية الشاشة
floatingButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
floatingButton.TextColor3 = Color3.white
floatingButton.Font = Enum.Font.GothamBold
floatingButton.TextSize = 24
floatingButton.ZIndex = 100
floatingButton.Parent = PlayerGui

-- جعل الزر دائري
floatingButton.BackgroundTransparency = 0.3
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0)
corner.Parent = floatingButton

-- خاصية السحب
local dragging = false
local dragInput, dragStart, startPos

floatingButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = floatingButton.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

floatingButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        floatingButton.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X,
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- نافذة المعلومات
local infoFrame = Instance.new("Frame")
infoFrame.Name = "ButtonInfoFrame"
infoFrame.Size = UDim2.new(0, 250, 0, 150)
infoFrame.Position = UDim2.new(0.5, -125, 0.1, 0)
infoFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
infoFrame.BackgroundTransparency = 0.2
infoFrame.Visible = false
infoFrame.Parent = PlayerGui

local corner2 = Instance.new("UICorner")
corner2.CornerRadius = UDim.new(0.1, 0)
corner2.Parent = infoFrame

local title = Instance.new("TextLabel")
title.Text = "🎮 Button Detector"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
title.TextColor3 = Color3.white
title.Font = Enum.Font.GothamBold
title.Parent = infoFrame

local buttonName = Instance.new("TextLabel")
buttonName.Text = "Button: None"
buttonName.Position = UDim2.new(0, 10, 0, 40)
buttonName.Size = UDim2.new(1, -20, 0, 25)
buttonName.TextColor3 = Color3.fromRGB(200, 200, 200)
buttonName.Parent = infoFrame

local buttonPath = Instance.new("TextLabel")
buttonPath.Text = "Path: ..."
buttonPath.Position = UDim2.new(0, 10, 0, 70)
buttonPath.Size = UDim2.new(1, -20, 0, 40)
buttonPath.TextWrapped = true
buttonPath.TextColor3 = Color3.fromRGB(180, 180, 180)
buttonPath.Parent = infoFrame

local clickBtn = Instance.new("TextButton")
clickBtn.Text = "🖱️ Click Detected Button"
clickBtn.Position = UDim2.new(0, 10, 0, 115)
clickBtn.Size = UDim2.new(1, -20, 0, 25)
clickBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
clickBtn.TextColor3 = Color3.white
clickBtn.Parent = infoFrame

-- فتح/إغلاق نافذة المعلومات
floatingButton.MouseButton1Click:Connect(function()
    infoFrame.Visible = not infoFrame.Visible
end)

-- دالة البحث عن الأزرار
local function findButtonsInGui(gui)
    local buttons = {}
    
    local function scan(obj)
        if obj:IsA("TextButton") or obj:IsA("ImageButton") then
            if obj.Visible and obj.Active then
                table.insert(buttons, {
                    Button = obj,
                    Name = obj.Name,
                    Path = obj:GetFullName(),
                    Text = obj.Text or ""
                })
            end
        end
        
        for _, child in ipairs(obj:GetChildren()) do
            scan(child)
        end
    end
    
    scan(gui)
    return buttons
end

-- دالة التحديث
local lastScan = 0
local scanDelay = 1 -- ثانية بين كل سكان

local function updateButtonList()
    local currentTime = tick()
    if currentTime - lastScan < scanDelay then return end
    lastScan = currentTime
    
    local allButtons = findButtonsInGui(PlayerGui)
    
    -- فلترة الأزرار المهمة
    local importantButtons = {}
    for _, btn in ipairs(allButtons) do
        if btn.Name:lower():find("spin") or 
           btn.Name:lower():find("buy") or 
           btn.Name:lower():find("purchase") or
           btn.Text:lower():find("spin") then
            
            table.insert(importantButtons, btn)
        end
    end
    
    -- عرض أول زر مهم
    if #importantButtons > 0 then
        local btn = importantButtons[1]
        buttonName.Text = "Button: " .. btn.Name
        buttonPath.Text = "Path: " .. btn.Path
        
        -- تحديث زر النقر
        clickBtn.MouseButton1Click:Connect(function()
            -- محاولة النقر على الزر الحقيقي
            pcall(function()
                btn.Button:Fire("MouseButton1Click")
            end)
            
            -- محاولة البحث عن Remote
            pcall(function()
                local remoteName = btn.Name .. "Event"
                local remote = game:GetService("ReplicatedStorage"):FindFirstChild(remoteName)
                if remote and remote:IsA("RemoteEvent") then
                    remote:FireServer()
                end
            end)
            
            -- إظهار تأكيد
            clickBtn.Text = "✅ Clicked!"
            wait(1)
            clickBtn.Text = "🖱️ Click Detected Button"
        end)
    end
end

-- تحديث مستمر
while true do
    updateButtonList()
    wait(scanDelay)
end
