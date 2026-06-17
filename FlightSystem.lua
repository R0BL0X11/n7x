local success, err = pcall(function()
    local p = game.Players.LocalPlayer
    local pg = p:WaitForChild("PlayerGui")

    local mainGui = Instance.new("ScreenGui", pg)
    mainGui.ResetOnSpawn = false
    mainGui.Name = "N7x"
    mainGui.ZIndex = 999

    -- الدائرة الصغيرة
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
    circle.ZIndex = 1000

    -- اللوحة الرئيسية
    local panel = Instance.new("Frame", mainGui)
    panel.Size = UDim2.new(0, 900, 0, 550)
    panel.Position = UDim2.new(0.5, -450, 0.5, -275)
    panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    panel.BorderColor3 = Color3.fromRGB(147, 51, 234)
    panel.BorderSizePixel = 2
    panel.Visible = false
    panel.Draggable = true
    panel.Active = true
    panel.ZIndex = 1001

    -- الرأس
    local header = Instance.new("TextLabel", panel)
    header.Size = UDim2.new(1, 0, 0, 40)
    header.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
    header.TextColor3 = Color3.fromRGB(255, 255, 255)
    header.Text = "N7x"
    header.TextSize = 16
    header.BorderSizePixel = 0
    header.ZIndex = 1002

    -- زر الإغلاق
    local closeBtn = Instance.new("TextButton", header)
    closeBtn.Size = UDim2.new(0, 40, 0, 40)
    closeBtn.Position = UDim2.new(1, -40, 0, 0)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Text = "X"
    closeBtn.BorderSizePixel = 0
    closeBtn.ZIndex = 1003

    -- الخانتين العلويات
    local cmdBtn = Instance.new("TextButton", panel)
    cmdBtn.Size = UDim2.new(0.5, -5, 0, 35)
    cmdBtn.Position = UDim2.new(0, 5, 0, 45)
    cmdBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    cmdBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    cmdBtn.Text = "أوامر"
    cmdBtn.TextSize = 12
    cmdBtn.BorderSizePixel = 0
    cmdBtn.ZIndex = 1002

    local playerBtn = Instance.new("TextButton", panel)
    playerBtn.Size = UDim2.new(0.5, -5, 0, 35)
    playerBtn.Position = UDim2.new(0.5, 5, 0, 45)
    playerBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    playerBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    playerBtn.Text = "اللاعب"
    playerBtn.TextSize = 12
    playerBtn.BorderSizePixel = 0
    playerBtn.ZIndex = 1002

    -- محتوى الأوامر
    local cmdContent = Instance.new("Frame", panel)
    cmdContent.Size = UDim2.new(1, 0, 1, -85)
    cmdContent.Position = UDim2.new(0, 0, 0, 85)
    cmdContent.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    cmdContent.BorderSizePixel = 0
    cmdContent.Visible = true
    cmdContent.ZIndex = 1001

    -- اليسار (الأزرار)
    local leftPanel = Instance.new("Frame", cmdContent)
    leftPanel.Size = UDim2.new(0.35, 0, 1, 0)
    leftPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    leftPanel.BorderSizePixel = 0
    leftPanel.ZIndex = 1001

    -- اليمين (الإعدادات)
    local rightPanel = Instance.new("Frame", cmdContent)
    rightPanel.Size = UDim2.new(0.65, 0, 1, 0)
    rightPanel.Position = UDim2.new(0.35, 0, 0, 0)
    rightPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    rightPanel.BorderSizePixel = 0
    rightPanel.ZIndex = 1001

    -- محتوى اللاعب
    local playerContent = Instance.new("Frame", panel)
    playerContent.Size = UDim2.new(1, 0, 1, -85)
    playerContent.Position = UDim2.new(0, 0, 0, 85)
    playerContent.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    playerContent.BorderSizePixel = 0
    playerContent.Visible = false
    playerContent.ZIndex = 1001

    -- اليسار في قسم اللاعب
    local playerLeftPanel = Instance.new("Frame", playerContent)
    playerLeftPanel.Size = UDim2.new(0.35, 0, 1, 0)
    playerLeftPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    playerLeftPanel.BorderSizePixel = 0
    playerLeftPanel.ZIndex = 1001

    -- اليمين في قسم اللاعب
    local playerRightPanel = Instance.new("Frame", playerContent)
    playerRightPanel.Size = UDim2.new(0.65, 0, 1, 0)
    playerRightPanel.Position = UDim2.new(0.35, 0, 0, 0)
    playerRightPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    playerRightPanel.BorderSizePixel = 0
    playerRightPanel.ZIndex = 1001

    local function makeBtn(parent, name, y)
        local btn = Instance.new("TextButton", parent)
        btn.Size = UDim2.new(0.9, 0, 0, 35)
        btn.Position = UDim2.new(0.05, 0, 0, y)
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Text = name
        btn.TextSize = 11
        btn.BorderSizePixel = 0
        btn.ZIndex = 1002
        return btn
    end

    local function makeLabel(parent, text, y)
        local lbl = Instance.new("TextLabel", parent)
        lbl.Size = UDim2.new(0.9, 0, 0, 25)
        lbl.Position = UDim2.new(0.05, 0, 0, y)
        lbl.BackgroundTransparency = 1
        lbl.TextColor3 = Color3.fromRGB(147, 51, 234)
        lbl.Text = text
        lbl.TextSize = 11
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.ZIndex = 1002
        return lbl
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
        box.ZIndex = 1002
        return box
    end

    -- أزرار الأوامر
    local fly_btn = makeBtn(leftPanel, "طيران", 10)
    local noclip_btn = makeBtn(leftPanel, "اختراق جدران", 50)
    local save_btn = makeBtn(leftPanel, "حفظ نقطة", 90)
    local tp_btn = makeBtn(leftPanel, "الذهاب للنقطة", 130)
    local del_cp_btn = makeBtn(leftPanel, "حذف النقطة", 170)
    local tp_player_btn = makeBtn(leftPanel, "انتقال للاعب", 210)

    -- الإعدادات
    makeLabel(rightPanel, "السرعة", 10)
    local speedBox = makeInputBox(rightPanel, "1-199", 35)
    speedBox.Text = "50"

    makeLabel(rightPanel, "قوة النط", 75)
    local jumpBox = makeInputBox(rightPanel, "1-199", 100)
    jumpBox.Text = "100"

    makeLabel(rightPanel, "سرعة الطيران", 140)
    local flySpeedBox = makeInputBox(rightPanel, "1-199", 165)
    flySpeedBox.Text = "50"

    -- قسم اللاعب
    local searchBox = Instance.new("TextBox", playerLeftPanel)
    searchBox.Size = UDim2.new(0.9, 0, 0, 40)
    searchBox.Position = UDim2.new(0.05, 0, 0, 10)
    searchBox.PlaceholderText = "اسم الضحية"
    searchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    searchBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    searchBox.TextSize = 12
    searchBox.BorderSizePixel = 0
    searchBox.ZIndex = 1002

    local playerImage = Instance.new("ImageLabel", playerLeftPanel)
    playerImage.Size = UDim2.new(0.9, 0, 0.5, 0)
    playerImage.Position = UDim2.new(0.05, 0, 0.12, 0)
    playerImage.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    playerImage.BorderSizePixel = 0
    playerImage.Image = ""
    playerImage.ZIndex = 1002

    local playerName = Instance.new("TextLabel", playerLeftPanel)
    playerName.Size = UDim2.new(0.9, 0, 0, 25)
    playerName.Position = UDim2.new(0.05, 0, 0.68, 0)
    playerName.BackgroundTransparency = 1
    playerName.TextColor3 = Color3.fromRGB(255, 255, 255)
    playerName.Text = ""
    playerName.TextSize = 11
    playerName.ZIndex = 1002

    -- أزرار اللاعب
    local esp_btn = makeBtn(playerRightPanel, "كشف لاعبين", 10)
    local screen_btn = makeBtn(playerRightPanel, "مشاهدة الشاشة", 50)
    local sit_mouth_btn = makeBtn(playerRightPanel, "في الفم", 90)
    local sit_knee_btn = makeBtn(playerRightPanel, "في الركبة", 130)

    makeLabel(playerRightPanel, "سرعة", 170)
    local sitSpeedBox = makeInputBox(playerRightPanel, "1-199", 195)
    sitSpeedBox.Text = "50"

    local end_btn = Instance.new("TextButton", playerRightPanel)
    end_btn.Size = UDim2.new(0.9, 0, 0, 35)
    end_btn.Position = UDim2.new(0.05, 0, 0, 235)
    end_btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    end_btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end_btn.Text = "إنهاء"
    end_btn.TextSize = 11
    end_btn.BorderSizePixel = 0
    end_btn.ZIndex = 1002

    local states = {fly = false, noclip = false, esp = false, screen = false, sit = false}
    local cp = nil
    local currentTarget = nil
    local screenLoop = nil
    local originalCam = nil
    local sitLoop = nil
    local sitType = nil
    local mouthBasePos = nil
    local flySpeed = 50
    local jumpPower = 100
    local speed = 50
    local sitSpeed = 50

    local function clampValue(val, min, max)
        if not val or val < min then return min end
        if val > max then return max end
        return math.floor(val)
    end

    -- التبديل بين الأقسام
    cmdBtn.MouseButton1Click:Connect(function()
        cmdContent.Visible = true
        playerContent.Visible = false
        cmdBtn.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
        playerBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)

    playerBtn.MouseButton1Click:Connect(function()
        cmdContent.Visible = false
        playerContent.Visible = true
        cmdBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        playerBtn.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
    end)

    -- فتح/إغلاق اللوحة
    circle.MouseButton1Click:Connect(function()
        panel.Visible = not panel.Visible
        circle.BackgroundColor3 = panel.Visible and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(147, 51, 234)
    end)

    closeBtn.MouseButton1Click:Connect(function()
        panel.Visible = false
        circle.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
    end)

    -- تحديث السرعة
    speedBox.FocusLost:Connect(function()
        local val = tonumber(speedBox.Text)
        if val then
            val = clampValue(val, 1, 199)
            speed = val
            speedBox.Text = tostring(val)
        else
            speedBox.Text = "50"
            speed = 50
        end
    end)

    jumpBox.FocusLost:Connect(function()
        local val = tonumber(jumpBox.Text)
        if val then
            val = clampValue(val, 1, 199)
            jumpPower = val
            jumpBox.Text = tostring(val)
        else
            jumpBox.Text = "100"
            jumpPower = 100
        end
    end)

    flySpeedBox.FocusLost:Connect(function()
        local val = tonumber(flySpeedBox.Text)
        if val then
            val = clampValue(val, 1, 199)
            flySpeed = val
            flySpeedBox.Text = tostring(val)
        else
            flySpeedBox.Text = "50"
            flySpeed = 50
        end
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

    -- الطيران
    fly_btn.MouseButton1Click:Connect(function()
        states.fly = not states.fly
        fly_btn.BackgroundColor3 = states.fly and Color3.fromRGB(147, 51, 234) or Color3.fromRGB(50, 50, 50)
        
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

    -- اختراق الجدران
    noclip_btn.MouseButton1Click:Connect(function()
        states.noclip = not states.noclip
        noclip_btn.BackgroundColor3 = states.noclip and Color3.fromRGB(147, 51, 234) or Color3.fromRGB(50, 50, 50)
        
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
            save_btn.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
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

    -- الانتقال للاعب
    tp_player_btn.MouseButton1Click:Connect(function()
        if currentTarget and currentTarget.Character then
            local targetRoot = currentTarget.Character:FindFirstChild("HumanoidRootPart")
            local myRoot = p.Character:FindFirstChild("HumanoidRootPart")
            if targetRoot and myRoot then
                myRoot.CFrame = targetRoot.CFrame + Vector3.new(5, 0, 0)
            end
        end
    end)

    -- البحث عن اللاعب
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
            playerName.Text = "متعدد"
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
        esp_btn.BackgroundColor3 = states.esp and Color3.fromRGB(147, 51, 234) or Color3.fromRGB(50, 50, 50)
        
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
                                newBox.Color3 = Color3.fromRGB(147, 51, 234)
                            end
                        else
                            if box then box:Destroy() end
                        end
                    end
                end
            end
        end
    end)

    -- الجلوس في الفم
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

    -- الجلوس في الركبة
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

    -- مشاهدة الشاشة
    screen_btn.MouseButton1Click:Connect(function()
        if not currentTarget or not currentTarget.Character then return end
        
        states.screen = not states.screen
        screen_btn.BackgroundColor3 = states.screen and Color3.fromRGB(147, 51, 234) or Color3.fromRGB(50, 50, 50)
        
        if states.screen then
            panel.Visible = false
            local cam = workspace.CurrentCamera
            local targetRoot = currentTarget.Character:FindFirstChild("HumanoidRootPart")
            local targetHum = currentTarget.Character:FindFirstChild("Humanoid")
            
            if targetRoot and targetHum then
                if screenLoop then screenLoop:Disconnect() end
                originalCam = cam.CFrame
                
                screenLoop = game:GetService("RunService").RenderStepped:Connect(function()
                    if not states.screen or not currentTarget or not currentTarget.Character then
                        if screenLoop then screenLoop:Disconnect() screenLoop = nil end
                        return
                    end
                    
                    targetRoot = currentTarget.Character:FindFirstChild("HumanoidRootPart")
                    if targetRoot and targetHum then
                        cam.CFrame = targetRoot.CFrame * CFrame.new(0, targetHum.HipHeight, 0)
                        cam.Focus = targetRoot.CFrame * CFrame.new(0, targetHum.HipHeight, -10)
                    end
                end)
            end
        else
            panel.Visible = true
            if screenLoop then 
                screenLoop:Disconnect() 
                screenLoop = nil
            end
            if originalCam then
                workspace.CurrentCamera.CFrame = originalCam
            end
        end
    end)

    -- الإنهاء
    end_btn.MouseButton1Click:Connect(function()
        states.screen = false
        states.sit = false
        screen_btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        sit_mouth_btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        sit_knee_btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        panel.Visible = true
        if screenLoop then 
            screenLoop:Disconnect() 
            screenLoop = nil
        end
        if sitLoop then
            sitLoop:Disconnect()
            sitLoop = nil
        end
        if originalCam then
            workspace.CurrentCamera.CFrame = originalCam
        end
        mouthBasePos = nil
    end)

    print("✅ N7x تم تحميله بنجاح!")
end)

if not success then
    print("❌ خطأ في السكربت: " .. err)
end
