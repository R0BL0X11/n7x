local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local m = Instance.new("ScreenGui", pg)
m.ResetOnSpawn = false

local h = Instance.new("Frame", m)
h.Size = UDim2.new(0, 200, 0, 450)
h.Position = UDim2.new(0.5, -100, 0.5, -225)
h.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
h.BorderSizePixel = 0
h.Draggable = true
h.Active = true

local t = Instance.new("TextLabel", h)
t.Size = UDim2.new(1, 0, 0, 30)
t.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
t.TextColor3 = Color3.fromRGB(255, 255, 255)
t.Text = "N7x"
t.BorderSizePixel = 0

local states = {fly = false, esp = false, invis = false}
local checkpoint = nil

local function btn(name, pos)
    local b = Instance.new("TextButton", h)
    b.Size = UDim2.new(1, 0, 0, 32)
    b.Position = UDim2.new(0, 0, 0, pos)
    b.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Text = name
    b.TextSize = 11
    b.BorderSizePixel = 0
    return b
end

local fly_btn = btn("طيران", 30)
local esp_btn = btn("ESP", 62)
local invis_btn = btn("اختفاء", 94)
local save_cp = btn("حفظ CP", 126)
local tp_cp = btn("TP CP", 158)
local del_cp = btn("حذف CP", 190)

local inp = Instance.new("TextBox", h)
inp.Size = UDim2.new(1, 0, 0, 28)
inp.Position = UDim2.new(0, 0, 0, 222)
inp.PlaceholderText = "اسم اللاعب"
inp.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
inp.TextColor3 = Color3.fromRGB(255, 255, 255)
inp.TextSize = 10
inp.BorderSizePixel = 0

local kill_btn = btn("Kill", 250)
local flick_btn = btn("Flick", 282)
local rejoin_btn = btn("Rejoin", 314)

-- طيران
fly_btn.MouseButton1Click:Connect(function()
    states.fly = not states.fly
    fly_btn.BackgroundColor3 = states.fly and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(100, 0, 0)
    
    if states.fly then
        local c = p.Character or p.CharacterAdded:Wait()
        local r = c:FindFirstChild("HumanoidRootPart")
        local hu = c:FindFirstChild("Humanoid")
        
        if not r or not hu then return end
        
        local bv = Instance.new("BodyVelocity", r)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(0, 0, 0)
        
        local bg = Instance.new("BodyGyro", r)
        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bg.CFrame = r.CFrame
        
        hu.JumpPower = 100
        
        local conn
        conn = game:GetService("RunService").RenderStepped:Connect(function()
            if not states.fly or not bv or not bg then if conn then conn:Disconnect() end return end
            
            local m = Vector3.new(0, 0, 0)
            local ui = game:GetService("UserInputService")
            local cam = workspace.CurrentCamera
            
            if ui:IsKeyDown(Enum.KeyCode.W) then m = m + (cam.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit end
            if ui:IsKeyDown(Enum.KeyCode.S) then m = m - (cam.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit end
            if ui:IsKeyDown(Enum.KeyCode.A) then m = m - cam.CFrame.RightVector end
            if ui:IsKeyDown(Enum.KeyCode.D) then m = m + cam.CFrame.RightVector end
            if ui:IsKeyDown(Enum.KeyCode.Space) then m = m + Vector3.new(0, 1, 0) end
            if ui:IsKeyDown(Enum.KeyCode.LeftControl) then m = m - Vector3.new(0, 1, 0) end
            
            if m.Magnitude > 0 then m = m.Unit end
            bv.Velocity = m * 50
            bg.CFrame = cam.CFrame
        end)
    else
        if fly_btn:FindFirstChild("bv") then fly_btn.bv:Destroy() end
        if fly_btn:FindFirstChild("bg") then fly_btn.bg:Destroy() end
    end
end)

-- ESP
esp_btn.MouseButton1Click:Connect(function()
    states.esp = not states.esp
    esp_btn.BackgroundColor3 = states.esp and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(100, 0, 0)
    
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= p and player.Character then
            local root = player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local esp = root:FindFirstChild("EspLabel")
                if states.esp then
                    if not esp then
                        local bill = Instance.new("BillboardGui", root)
                        bill.Name = "EspLabel"
                        bill.Size = UDim2.new(4, 0, 2, 0)
                        bill.MaxDistance = 500
                        local txt = Instance.new("TextLabel", bill)
                        txt.Size = UDim2.new(1, 0, 1, 0)
                        txt.BackgroundTransparency = 1
                        txt.TextColor3 = Color3.fromRGB(0, 255, 0)
                        txt.Text = player.Name
                        txt.TextSize = 16
                    end
                else
                    if esp then esp:Destroy() end
                end
            end
        end
    end
end)

-- اختفاء
invis_btn.MouseButton1Click:Connect(function()
    states.invis = not states.invis
    invis_btn.BackgroundColor3 = states.invis and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(100, 0, 0)
    
    local c = p.Character
    if c then
        for _, v in pairs(c:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Transparency = states.invis and 1 or 0
            end
        end
    end
end)

-- حفظ Checkpoint
save_cp.MouseButton1Click:Connect(function()
    local c = p.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        checkpoint = c.HumanoidRootPart.CFrame
        save_cp.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    end
end)

-- TP Checkpoint
tp_cp.MouseButton1Click:Connect(function()
    if checkpoint then
        local c = p.Character
        if c and c:FindFirstChild("HumanoidRootPart") then
            c.HumanoidRootPart.CFrame = checkpoint
        end
    end
end)

-- حذف Checkpoint
del_cp.MouseButton1Click:Connect(function()
    checkpoint = nil
    save_cp.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
end)

-- Kill
kill_btn.MouseButton1Click:Connect(function()
    local target = game.Players:FindFirstChild(inp.Text)
    if target and target.Character and target.Character:FindFirstChild("Humanoid") then
        target.Character.Humanoid.Health = 0
    end
end)

-- Flick
flick_btn.MouseButton1Click:Connect(function()
    local target = game.Players:FindFirstChild(inp.Text)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        target.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 50, 0)
    end
end)

-- Rejoin
rejoin_btn.MouseButton1Click:Connect(function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, p)
end)
