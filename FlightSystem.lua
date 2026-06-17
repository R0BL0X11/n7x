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
panel.Size = UDim2.new(0, 500, 0, 300)
panel.Position = UDim2.new(0.5, -250, 0.5, -150)
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
header.Text = "N7x Menu"
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

-- الجزء الأيسر (الأزرار)
local leftFrame = Instance.new("Frame", panel)
leftFrame.Size = UDim2.new(0, 200, 1, -40)
leftFrame.Position = UDim2.new(0, 0, 0, 40)
leftFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
leftFrame.BorderSizePixel = 0

-- الجزء الأيمن (البحث والصورة)
local rightFrame = Instance.new("Frame", panel)
rightFrame.Size = UDim2.new(0, 300, 1, -40)
rightFrame.Position = UDim2.new(0, 200, 0, 40)
rightFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
rightFrame.BorderSizePixel = 0

-- حقل البحث
local searchBox = Instance.new("TextBox", rightFrame)
searchBox.Size = UDim2.new(0.9, 0, 0, 40)
searchBox.Position = UDim2.new(0.05, 0, 0, 10)
searchBox.PlaceholderText = "اكتب اسم اللاعب"
searchBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.TextSize = 12
searchBox.BorderSizePixel = 0

-- صورة اللاعب
local playerImage = Instance.new("ImageLabel", rightFrame)
playerImage.Size = UDim2.new(0.8, 0, 0.6, 0)
playerImage.Position = UDim2.new(0.1, 0, 0.15, 0)
playerImage.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playerImage.BorderSizePixel = 0
playerImage.Image = ""

-- اسم اللاعب
local playerName = Instance.new("TextLabel", rightFrame)
playerName.Size = UDim2.new(1, 0, 0, 20)
playerName.Position = UDim2.new(0, 0, 0.75, 0)
playerName.BackgroundTransparency = 1
playerName.TextColor3 = Color3.fromRGB(0, 255, 0)
playerName.Text = ""
playerName.TextSize = 12

local function makeBtn(name, y)
    local btn = Instance.new("TextButton", leftFrame)
    btn.Size = UDim2.new(0.9, 0, 0, 32)
    btn.Position = UDim2.new(0.05, 0, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = name
    btn.TextSize = 11
    btn.BorderSizePixel = 0
    return btn
end

local fly_btn = makeBtn("طيران", 10)
local esp_btn = makeBtn("كشف لاعبين", 45)
local invis_btn = makeBtn("اختفاء", 80)
local save_btn = makeBtn("حفظ نقطة", 115)
local tp_btn = makeBtn("الذهاب للنقطة", 150)
local del_cp_btn = makeBtn("حذف النقطة", 185)
local tp_player_btn = makeBtn("ذهاب للاعب", 220)
local watch_btn = makeBtn("مراقبة", 255)

local states = {fly = false, esp = false, invis = false, menu = false, watch = false}
local cp = nil
local currentTarget = nil

-- الدائرة تفتح/تغلق اللوحة
circle.MouseButton1Click:Connect(function()
    states.menu = not states.menu
    panel.Visible = states.menu
    circle.BackgroundColor3 = states.menu and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0)
end)

closeBtn.MouseButton1Click:Connect(function()
    states.menu = false
    panel.Visible = false
    circle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
end)

-- الاختفاء الحقيقي
invis_btn.MouseButton1Click:Connect(function()
    states.invis = not states.invis
    invis_btn.BackgroundColor3 = states.invis and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(50, 50, 50)
    
    local c = p.Character
    if c then
        for _, v in pairs(c:GetDescendants()) do
            if v:IsA("BasePart") then
                if states.invis then
                    v.CanCollide = false
                    v.Transparency = 1
                else
                    v.Transparency = 0
                    if v.Name ~= "HumanoidRootPart" then v.CanCollide = true end
                end
            end
        end
    end
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
        
        hu.JumpPower = 100
        
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
            bv.Velocity = move * 50
            bg.CFrame = cam.CFrame
        end)
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

-- حفظ نقطة
save_btn.MouseButton1Click:Connect(function()
    local c = p.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        cp = c.HumanoidRootPart.CFrame
        save_btn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        del_cp_btn.Visible = true
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
    del_cp_btn.Visible = false
end)

-- البحث عن لاعب
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local text = searchBox.Text:lower()
    if text:len() == 0 then
        playerImage.Image = ""
        playerName.Text = ""
        tp_player_btn.Visible = false
        watch_btn.Visible = false
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
        tp_player_btn.Visible = true
        watch_btn.Visible = true
    elseif #matches > 1 then
        playerImage.Image = ""
        playerName.Text = "متعدد - اكتب أكثر"
        tp_player_btn.Visible = false
        watch_btn.Visible = false
        currentTarget = nil
    else
        playerImage.Image = ""
        playerName.Text = "لم يتم العثور"
        tp_player_btn.Visible = false
        watch_btn.Visible = false
        currentTarget = nil
    end
end)

-- ذهاب للاعب
tp_player_btn.MouseButton1Click:Connect(function()
    if currentTarget and currentTarget.Character then
        local targetRoot = currentTarget.Character:FindFirstChild("HumanoidRootPart")
        local myRoot = p.Character:FindFirstChild("HumanoidRootPart")
        if targetRoot and myRoot then
            myRoot.CFrame = targetRoot.CFrame + Vector3.new(5, 0, 0)
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

print("N7x تم تحميله!")
