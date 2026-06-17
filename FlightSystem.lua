local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")

local mainGui = Instance.new("ScreenGui", pg)
mainGui.ResetOnSpawn = false
mainGui.Name = "N7x"

-- الدائرة الصغيرة
local circle = Instance.new("TextButton", mainGui)
circle.Size = UDim2.new(0, 50, 0, 50)
circle.Position = UDim2.new(0.5, -25, 0.5, -25)
circle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
circle.TextColor3 = Color3.fromRGB(255, 255, 255)
circle.Text = "N7x"
circle.TextSize = 14
circle.BorderSizePixel = 0
circle.Draggable = true
circle.Active = true

-- اللوحة الرئيسية
local panel = Instance.new("Frame", mainGui)
panel.Size = UDim2.new(0, 900, 0, 550)
panel.Position = UDim2.new(0.5, -450, 0.5, -275)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.BorderColor3 = Color3.fromRGB(0, 255, 0)
panel.BorderSizePixel = 2
panel.Visible = false
panel.Draggable = true
panel.Active = true

-- الرأس
local header = Instance.new("TextLabel", panel)
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
header.TextColor3 = Color3.fromRGB(255, 255, 255)
header.Text = "N7x"
header.TextSize = 16
header.BorderSizePixel = 0

-- زر الإغلاق
local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -40, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Text = "X"
closeBtn.BorderSizePixel = 0

-- الخانتين العلويات
local cmdBtn = Instance.new("TextButton", panel)
cmdBtn.Size = UDim2.new(0.5, -5, 0, 35)
cmdBtn.Position = UDim2.new(0, 5, 0, 45)
cmdBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
cmdBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
cmdBtn.Text = "أوامر"
cmdBtn.TextSize = 12
cmdBtn.BorderSizePixel = 0

local playerBtn = Instance.new("TextButton", panel)
playerBtn.Size = UDim2.new(0.5, -5, 0, 35)
playerBtn.Position = UDim2.new(0.5, 5, 0, 45)
playerBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
playerBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
playerBtn.Text = "اللاعب"
playerBtn.TextSize = 12
playerBtn.BorderSizePixel = 0

-- محتوى الأوامر
local cmdContent = Instance.new("Frame", panel)
cmdContent.Size = UDim2.new(1, 0, 1, -85)
cmdContent.Position = UDim2.new(0, 0, 0, 85)
cmdContent.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
cmdContent.BorderSizePixel = 0
cmdContent.Visible = true

-- اليسار (الأزرار)
local leftPanel = Instance.new("Frame", cmdContent)
leftPanel.Size = UDim2.new(0.35, 0, 1, 0)
leftPanel.Position = UDim2.new(0, 0, 0, 0)
leftPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
leftPanel.BorderSizePixel = 0

-- اليمين (الإعدادات)
local rightPanel = Instance.new("Frame", cmdContent)
rightPanel.Size = UDim2.new(0.65, 0, 1, 0)
rightPanel.Position = UDim2.new(0.35, 0, 0, 0)
rightPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
rightPanel.BorderSizePixel = 0

-- محتوى اللاعب
local playerContent = Instance.new("Frame", panel)
playerContent.Size = UDim2.new(1, 0, 1, -85)
playerContent.Position = UDim2.new(0, 0, 0, 85)
playerContent.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
playerContent.BorderSizePixel = 0
playerContent.Visible = false

-- اليسار في قسم اللاعب (البحث والصورة)
local playerLeftPanel = Instance.new("Frame", playerContent)
playerLeftPanel.Size = UDim2.new(0.35, 0, 1, 0)
playerLeftPanel.Position = UDim2.new(0, 0, 0, 0)
playerLeftPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
playerLeftPanel.BorderSizePixel = 0

-- اليمين في قسم اللاعب (الأزرار)
local playerRightPanel = Instance.new("Frame", playerContent)
playerRightPanel.Size = UDim2.new(0.65, 0, 1, 0)
playerRightPanel.Position = UDim2.new(0.35, 0, 0, 0)
playerRightPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
playerRightPanel.BorderSizePixel = 0

local function makeBtn(parent, name, y)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = name
    btn.TextSize = 11
    btn.BorderSizePixel = 0
    return btn
end

local function makeLabel(parent, text, y)
    local lbl = Instance.new("TextLabel", parent)
    lbl.Size = UDim2.new(0.9, 0, 0, 25)
    lbl.Position = UDim2.new(0.05, 0, 0, y)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = Color3.fromRGB(0, 255, 0)
    lbl.Text = text
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return lbl
end

local function makeInputBox(parent, placeholder, y)
    local box = Instance.new("TextBox", parent)
    box.Size = UDim2.new(0.9, 0, 0, 35)
    box.Position = UDim2.new(0.05, 0, 0, y)
    box.PlaceholderText = placeholder
    box.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.TextSize = 11
    box.BorderSizePixel = 0
    return box
end

-- أزرار الأوامر على اليسار
local fly_btn = makeBtn(leftPanel, "طيران", 10)
local noclip_btn = makeBtn(leftPanel, "اختراق جدران", 50)
local save_btn = makeBtn(leftPanel, "حفظ نقطة", 90)
local tp_btn = makeBtn(leftPanel, "الذهاب للنقطة", 130)
local del_cp_btn = makeBtn(leftPanel, "حذف النقطة", 170)
local tp_player_btn = makeBtn(leftPanel, "انتقال للاعب", 210)

-- الإعدادات على اليمين
makeLabel(rightPanel, "السرعة", 10)
local speedBox = makeInputBox(rightPanel, "مثال: 50", 35)

makeLabel(rightPanel, "قوة النط", 75)
local jumpBox = makeInputBox(rightPanel, "مثال: 100", 100)

makeLabel(rightPanel, "سرعة الطيران", 140)
local flySpeedBox = makeInputBox(rightPanel, "مثال: 50", 165)

-- حقل البحث في قسم اللاعب
local searchBox = Instance.new("TextBox", playerLeftPanel)
searchBox.Size = UDim2.new(0.9, 0, 0, 40)
searchBox.Position = UDim2.new(0.05, 0, 0, 10)
searchBox.PlaceholderText = "اسم اللاعب"
searchBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.TextSize = 12
searchBox.BorderSizePixel = 0

-- صورة اللاعب
local playerImage = Instance.new("ImageLabel", playerLeftPanel)
playerImage.Size = UDim2.new(0.9, 0, 0.5, 0)
playerImage.Position = UDim2.new(0.05, 0, 0.12, 0)
playerImage.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playerImage.BorderSizePixel = 0
playerImage.Image = ""

-- اسم اللاعب
local playerName = Instance.new("TextLabel", playerLeftPanel)
playerName.Size = UDim2.new(0.9, 0, 0, 25)
playerName.Position = UDim2.new(0.05, 0, 0.68, 0)
playerName.BackgroundTransparency = 1
playerName.TextColor3 = Color3.fromRGB(0, 255, 0)
playerName.Text = ""
playerName.TextSize = 11

-- أزرار اللاعب على اليمين
local esp_btn = makeBtn(playerRightPanel, "كشف لاعبين", 10)
local watch_btn = makeBtn(playerRightPanel, "مراقبة", 50)
local screen_btn = makeBtn(playerRightPanel, "مشاهدة الشاشة", 90)

local end_btn = Instance.new("TextButton", playerRightPanel)
end_btn.Size = UDim2.new(0.9, 0, 0, 35)
end_btn.Position = UDim2.new(0.05, 0, 0, 130)
end_btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
end_btn.TextColor3 = Color3.fromRGB(255, 255, 255)
end_btn.Text = "إنهاء"
end_btn.TextSize = 11
end_btn.BorderSizePixel = 0

local states = {fly = false, noclip = false, esp = false, watch = false}
local cp = nil
local currentTarget = nil
local screenActive = false

-- المتغيرات الافتراضية
local flySpeed = 50
local jumpPower = 100
local speed = 50

-- تبديل الأقسام
cmdBtn.MouseButton1Click:Connect(function()
    cmdContent.Visible = true
    playerContent.Visible = false
    cmdBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    playerBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
end)

playerBtn.MouseButton1Click:Connect(function()
    cmdContent.Visible = false
    playerContent.Visible = true
    cmdBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    playerBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
end)

-- الدائرة تفتح/تغلق اللوحة
circle.MouseButton1Click:Connect(function()
    panel.Visible = not panel.Visible
    circle.BackgroundColor3 = panel.Visible and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0)
end)

closeBtn.MouseButton1Click:Connect(function()
    panel.Visible = false
    circle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
end)

-- تحديث قيم السرعة
speedBox:GetPropertyChangedSignal("Text"):Connect(function()
    local val = tonumber(speedBox.Text)
    if val then speed = val end
end)

jumpBox:GetPropertyChangedSignal("Text"):Connect(function()
    local val = tonumber(jumpBox.Text)
    if val then jumpPower = val end
end)

flySpeedBox:GetPropertyChangedSignal("Text"):Connect(function()
    local val = tonumber(flySpeedBox.Text)
    if val then flySpeed = val end
end)

-- طيران
fly_btn.MouseButton1Click:Connect(function()
    states.fly = not states.fly
    fly_btn.BackgroundColor3 = states.fly and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(50, 50, 50)
    
    if states.fly then
        local c = p.Character
        if not c then return end
        local r = c:FindFirstChild("HumanoidRootPart")
        local hu = c:FindFirstChild("Humanoid")
        if not r or not hu then return end
        
        local bv = Instance.new("BodyVelocity", r)
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        local bg = Instance.new("BodyGyro", r)
        bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        
        hu.JumpPower = jumpPower
        
        local loop
        loop = game:GetService("RunService").RenderStepped:Connect(function()
            if not states.fly then
                loop:Disconnect()
                bv:Destroy()
                bg:Destroy()
                hu.JumpPower = 50
                return
            end
            
            local move = Vector3.new(0, 0, 0)
            local ui = game:GetService("UserInputService")
            local cam = workspace.CurrentCamera
            
            if ui:IsKeyDown(Enum.KeyCode.W) then move = move + cam.CFrame.LookVector end
            if ui:IsKeyDown(Enum.KeyCode.S) then move = move - cam.CFrame.LookVector end
            if ui:IsKeyDown(Enum.KeyCode.A) then move = move - cam.CFrame.RightVector end
            if ui:IsKeyDown(Enum.KeyCode.D) then move = move + cam.CFrame.RightVector end
            if ui:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
            
            if move.Magnitude > 0 then move = move.Unit end
            bv.Velocity = move * flySpeed
            bg.CFrame = cam.CFrame
        end)
    end
end)

-- اختراق جدران
noclip_btn.MouseButton1Click:Connect(function()
    states.noclip = not states.noclip
    noclip_btn.BackgroundColor3 = states.noclip and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(50, 50, 50)
    
    local c = p.Character
    if c then
        for _, v in pairs(c:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = not states.noclip
            end
        end
    end
end)

-- حفظ نقطة
save_btn.MouseButton1Click:Connect(function()
    local c = p.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        cp = c.HumanoidRootPart.CFrame
        save_btn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    end
end)

-- الذهاب للنقطة
tp_btn.MouseButton1Click:Connect(function()
    if cp then
        local c = p.Character
        if c and c:FindFirstChild("HumanoidRootPart") then
            c.HumanoidRootPart.CFrame = cp
        end
    end
end)

-- حذف النقطة
del_cp_btn.MouseButton1Click:Connect(function()
    cp = nil
    save_btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end)

-- انتقال للاعب
tp_player_btn.MouseButton1Click:Connect(function()
    if currentTarget and currentTarget.Character then
        local targetRoot = currentTarget.Character:FindFirstChild("HumanoidRootPart")
        local myRoot = p.Character:FindFirstChild("HumanoidRootPart")
        if targetRoot and myRoot then
            myRoot.CFrame = targetRoot.CFrame + Vector3.new(5, 0, 0)
        end
    end
end)

-- البحث عن لاعب
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local text = searchBox.Text:lower()
    if text:len() == 0 then
        playerImage.Image = ""
        playerName.Text = ""
        currentTarget = nil
        return
    end
    
    local matches = {}
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p and pl.Name:lower():sub(1, text:len()) == text then
            table.insert(matches, pl)
        end
    end
    
    if #matches == 1 then
        local target = matches[1]
        currentTarget = target
        pcall(function()
            playerImage.Image = game:GetService("Players"):GetUserThumbnailAsync(target.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        end)
        playerName.Text = target.Name
    elseif #matches > 1 then
        playerImage.Image = ""
        playerName.Text = "متعدد - اكتب أكثر"
        currentTarget = nil
    else
        playerImage.Image = ""
        playerName.Text = "لم يتم العثور"
        currentTarget = nil
    end
end)

-- كشف لاعبين
esp_btn.MouseButton1Click:Connect(function()
    states.esp = not states.esp
    esp_btn.BackgroundColor3 = states.esp and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(50, 50, 50)
    
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p and pl.Character then
            for _, part in pairs(pl.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    local box = part:FindFirstChild("EspBox")
                    if states.esp then
                        if not box then
                            local newBox = Instance.new("SelectionBox", part)
                            newBox.Name = "EspBox"
                            newBox.Adornee = part
                            newBox.Color3 = Color3.fromRGB(255, 0, 0)
                        end
                    else
                        if box then box:Destroy() end
                    end
                end
            end
        end
    end
end)

-- مراقبة لاعب
watch_btn.MouseButton1Click:Connect(function()
    states.watch = not states.watch
    watch_btn.BackgroundColor3 = states.watch and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(50, 50, 50)
    
    if currentTarget and currentTarget.Character then
        for _, part in pairs(currentTarget.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                local box = part:FindFirstChild("WatchBox")
                if states.watch then
                    if not box then
                        local newBox = Instance.new("SelectionBox", part)
                        newBox.Name = "WatchBox"
                        newBox.Adornee = part
                        newBox.Color3 = Color3.fromRGB(255, 0, 0)
                    end
                else
                    if box then box:Destroy() end
                end
            end
        end
    end
end)

-- مشاهدة الشاشة
screen_btn.MouseButton1Click:Connect(function()
    if currentTarget and currentTarget.Character then
        screenActive = true
        local cam = workspace.CurrentCamera
        local targetRoot = currentTarget.Character:FindFirstChild("HumanoidRootPart")
        if targetRoot then
            local loop
            loop = game:GetService("RunService").RenderStepped:Connect(function()
                if not screenActive or not currentTarget or not currentTarget.Character then
                    loop:Disconnect()
                    return
                end
                cam.CFrame = targetRoot.CFrame + targetRoot.CFrame.LookVector * 5
            end)
        end
    end
end)

-- إنهاء مشاهدة الشاشة
end_btn.MouseButton1Click:Connect(function()
    screenActive = false
end)

print("N7x تم تحميله!")
