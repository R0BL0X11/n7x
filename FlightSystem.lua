local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")

local mainGui = Instance.new("ScreenGui", pg)
mainGui.ResetOnSpawn = false
mainGui.Name = "N7x"

local circle = Instance.new("TextButton", mainGui)
circle.Size = UDim2.new(0, 50, 0, 50)
circle.Position = UDim2.new(0.5, -25, 0.5, -25)
circle.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
circle.TextColor3 = Color3.fromRGB(255, 255, 255)
circle.Text = "N7x"
circle.TextSize = 14
circle.BorderSizePixel = 0
circle.Draggable = true
circle.Active = true

local panel = Instance.new("Frame", mainGui)
panel.Size = UDim2.new(0, 900, 0, 550)
panel.Position = UDim2.new(0.5, -450, 0.5, -275)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.BorderColor3 = Color3.fromRGB(147, 51, 234)
panel.BorderSizePixel = 2
panel.Visible = false
panel.Draggable = true
panel.Active = true

local header = Instance.new("TextLabel", panel)
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
header.TextColor3 = Color3.fromRGB(255, 255, 255)
header.Text = "N7x"
header.TextSize = 16
header.BorderSizePixel = 0

local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -40, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Text = "X"
closeBtn.BorderSizePixel = 0

local playerContent = Instance.new("Frame", panel)
playerContent.Size = UDim2.new(1, 0, 1, -85)
playerContent.Position = UDim2.new(0, 0, 0, 85)
playerContent.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
playerContent.BorderSizePixel = 0
playerContent.Visible = true

local playerLeftPanel = Instance.new("Frame", playerContent)
playerLeftPanel.Size = UDim2.new(0.35, 0, 1, 0)
playerLeftPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
playerLeftPanel.BorderSizePixel = 0

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

local function makeInputBox(parent, placeholder, y)
    local box = Instance.new("TextBox", parent)
    box.Size = UDim2.new(0.9, 0, 0, 35)
    box.Position = UDim2.new(0.05, 0, 0, y)
    box.PlaceholderText = placeholder
    box.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    box.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.TextSize = 11
    box.BorderSizePixel = 0
    return box
end

local searchBox = Instance.new("TextBox", playerLeftPanel)
searchBox.Size = UDim2.new(0.9, 0, 0, 40)
searchBox.Position = UDim2.new(0.05, 0, 0, 10)
searchBox.PlaceholderText = "اسم الضحية"
searchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
searchBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.TextSize = 12
searchBox.BorderSizePixel = 0

local playerImage = Instance.new("ImageLabel", playerLeftPanel)
playerImage.Size = UDim2.new(0.9, 0, 0.35, 0)
playerImage.Position = UDim2.new(0.05, 0, 0.12, 0)
playerImage.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playerImage.BorderSizePixel = 0

local playerName = Instance.new("TextLabel", playerLeftPanel)
playerName.Size = UDim2.new(0.9, 0, 0, 25)
playerName.Position = UDim2.new(0.05, 0, 0.52, 0)
playerName.BackgroundTransparency = 1
playerName.TextColor3 = Color3.fromRGB(255, 255, 255)
playerName.Text = "لا يوجد لاعب محدد"
playerName.TextSize = 11

local esp_btn = makeBtn(playerRightPanel, "كشف لاعبين", 10)
local screen_btn = makeBtn(playerRightPanel, "مشاهدة الشاشة", 50)
local tp_player_btn = makeBtn(playerRightPanel, "انتقال للاعب", 90)
local sit_mouth_btn = makeBtn(playerRightPanel, "في الفم", 130)
local sit_knee_btn = makeBtn(playerRightPanel, "في الركبة", 170)

local speedLabel = Instance.new("TextLabel", playerRightPanel)
speedLabel.Size = UDim2.new(0.9, 0, 0, 25)
speedLabel.Position = UDim2.new(0.05, 0, 0, 250)
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.fromRGB(147, 51, 234)
speedLabel.Text = "سرعة"
speedLabel.TextSize = 11
speedLabel.TextXAlignment = Enum.TextXAlignment.Left

local sitSpeedBox = makeInputBox(playerRightPanel, "1-199", 275)
sitSpeedBox.Text = "50"

local end_btn = Instance.new("TextButton", playerRightPanel)
end_btn.Size = UDim2.new(0.9, 0, 0, 35)
end_btn.Position = UDim2.new(0.05, 0, 0, 315)
end_btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
end_btn.TextColor3 = Color3.fromRGB(255, 255, 255)
end_btn.Text = "إنهاء"
end_btn.TextSize = 11
end_btn.BorderSizePixel = 0

local states = {sit = false}
local currentTarget = nil
local sitLoop = nil
local sitType = nil
local mouthBasePos = nil
local sitSpeed = 50

local function clampValue(val, min, max)
    if not val or val < min then return min end
    if val > max then return max end
    return math.floor(val)
end

circle.MouseButton1Click:Connect(function()
    panel.Visible = not panel.Visible
    circle.BackgroundColor3 = panel.Visible and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(147, 51, 234)
end)

closeBtn.MouseButton1Click:Connect(function()
    panel.Visible = false
    circle.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
end)

sitSpeedBox.FocusLost:Connect(function()
    local val = tonumber(sitSpeedBox.Text)
    if val then
        val = clampValue(val, 1, 199)
        sitSpeed = val
        sitSpeedBox.Text = tostring(val)
    else
        sitSpeedBox.Text = "50"
        sitSpeed = 50
    end
end)

sit_mouth_btn.MouseButton1Click:Connect(function()
    if not currentTarget or not currentTarget.Character then return end
    
    if states.sit and sitType == "mouth" then
        states.sit = false
        if sitLoop then sitLoop:Disconnect() sitLoop = nil end
        sit_mouth_btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        mouthBasePos = nil
        return
    end
    
    states.sit = true
    sitType = "mouth"
    sit_mouth_btn.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
    sit_knee_btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    
    local myRoot = p.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
    
    if sitLoop then sitLoop:Disconnect() end
    
    sitLoop = game:GetService("RunService").RenderStepped:Connect(function()
        if not states.sit or not currentTarget or not currentTarget.Character or sitType ~= "mouth" then
            if sitLoop then sitLoop:Disconnect() sitLoop = nil end
            mouthBasePos = nil
            return
        end
        
        local targetHead = currentTarget.Character:FindFirstChild("Head")
        myRoot = p.Character:FindFirstChild("HumanoidRootPart")
        
        if targetHead and myRoot then
            if not mouthBasePos then
                mouthBasePos = targetHead.CFrame
            end
            
            local time = tick()
            local depthOffset = math.sin(time * sitSpeed / 10) * 1.2
            myRoot.CFrame = mouthBasePos * CFrame.new(depthOffset, 0, 0)
        end
    end)
end)

sit_knee_btn.MouseButton1Click:Connect(function()
    if not currentTarget or not currentTarget.Character then return end
    
    if states.sit and sitType == "knee" then
        states.sit = false
        if sitLoop then sitLoop:Disconnect() sitLoop = nil end
        sit_knee_btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        mouthBasePos = nil
        return
    end
    
    states.sit = true
    sitType = "knee"
    sit_knee_btn.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
    sit_mouth_btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    
    local myRoot = p.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
    
    if sitLoop then sitLoop:Disconnect() end
    
    sitLoop = game:GetService("RunService").RenderStepped:Connect(function()
        if not states.sit or not currentTarget or not currentTarget.Character or sitType ~= "knee" then
            if sitLoop then sitLoop:Disconnect() sitLoop = nil end
            mouthBasePos = nil
            return
        end
        
        local targetLeg = currentTarget.Character:FindFirstChild("LeftLowerLeg") or currentTarget.Character:FindFirstChild("RightLowerLeg")
        myRoot = p.Character:FindFirstChild("HumanoidRootPart")
        
        if targetLeg and myRoot then
            if not mouthBasePos then
                mouthBasePos = targetLeg.CFrame
            end
            
            local time = tick()
            local depthOffset = math.sin(time * sitSpeed / 10) * 1.2
            myRoot.CFrame = mouthBasePos * CFrame.new(depthOffset, 0, 0)
        end
    end)
end)

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local text = searchBox.Text:lower()
    if text:len() == 0 then
        playerImage.Image = ""
        playerName.Text = "لا يوجد لاعب محدد"
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

esp_btn.MouseButton1Click:Connect(function()
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p and pl.Character then
            for _, part in pairs(pl.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    local box = Instance.new("SelectionBox", part)
                    box.Adornee = part
                    box.Color3 = Color3.fromRGB(147, 51, 234)
                end
            end
        end
    end
end)

tp_player_btn.MouseButton1Click:Connect(function()
    if currentTarget and currentTarget.Character then
        local targetRoot = currentTarget.Character:FindFirstChild("HumanoidRootPart")
        local myRoot = p.Character:FindFirstChild("HumanoidRootPart")
        if targetRoot and myRoot then
            myRoot.CFrame = targetRoot.CFrame + Vector3.new(5, 0, 0)
        end
    end
end)

end_btn.MouseButton1Click:Connect(function()
    states.sit = false
    sit_mouth_btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    sit_knee_btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    if sitLoop then sitLoop:Disconnect() sitLoop = nil end
    mouthBasePos = nil
end)

print("N7x تم تحميله!")
