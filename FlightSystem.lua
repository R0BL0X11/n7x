local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local m = Instance.new("ScreenGui", pg)
m.ResetOnSpawn = false

local h = Instance.new("Frame", m)
h.Size = UDim2.new(0, 200, 0, 500)
h.Position = UDim2.new(0.5, -100, 0.5, -250)
h.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
h.Draggable = true
h.Active = true
h.CanCollide = false

local t = Instance.new("TextLabel", h)
t.Size = UDim2.new(1, 0, 0, 30)
t.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
t.TextColor3 = Color3.fromRGB(255, 255, 255)
t.Text = "N7x"

local states = {fly = false, esp = false, tool = false, invis = false}
local checkpoint = nil

local function btn(name, pos)
    local b = Instance.new("TextButton", h)
    b.Size = UDim2.new(1, 0, 0, 35)
    b.Position = UDim2.new(0, 0, 0, pos)
    b.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Text = name
    b.TextSize = 12
    return b
end

-- الأزرار الأساسية
local fly_btn = btn("طيران", 30)
local esp_btn = btn("ESP", 65)
local tool_btn = btn("Tools", 100)
local invis_btn = btn("اختفاء", 135)
local save_cp_btn = btn("حفظ Checkpoint", 170)
local tp_cp_btn = btn("انتقال Checkpoint", 205)
local del_cp_btn = btn("إزالة Checkpoint", 240)
local respawn_btn = btn("ترسيل لاعب", 275)
local rejoin_btn = btn("إعادة انضمام", 310)

local player_input = Instance.new("TextBox", h)
player_input.Size = UDim2.new(1, 0, 0, 30)
player_input.Position = UDim2.new(0, 0, 0, 345)
player_input.PlaceholderText = "اسم اللاعب"
player_input.TextScaled = true

local flick_btn = Instance.new("TextButton", h)
flick_btn.Size = UDim2.new(1, 0, 0, 35)
flick_btn.Position = UDim2.new(0, 0, 0, 380)
flick_btn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
flick_btn.TextColor3 = Color3.fromRGB(255, 255, 255)
flick_btn.Text = "Flick لاعب"
flick_btn.TextSize = 12

-- طيران
fly_btn.MouseButton1Click:Connect(function()
    states.fly = not states.fly
    fly_btn.BackgroundColor3 = states.fly and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(100, 0, 0)
    if states.fly then
        local c = p.Character
        local r = c:WaitForChild("HumanoidRootPart")
        local hu = c:WaitForChild("Humanoid")
        local bv = Instance.new("BodyVelocity", r)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        local bg = Instance.new("BodyGyro", r)
        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        hu.JumpPower = 100
        
        local conn
        conn = game:GetService("RunService").RenderStepped:Connect(function()
            if not states.fly then conn:Disconnect() bv:Destroy() bg:Destroy() hu.JumpPower = 50 return end
            local m = Vector3.new(0,0,0)
            local ui = game:GetService("UserInputService")
            if ui:IsKeyDown(Enum.KeyCode.W) then m = m + workspace.CurrentCamera.CFrame.LookVector end
            if ui:IsKeyDown(Enum.KeyCode.S) then m = m - workspace.CurrentCamera.CFrame.LookVector end
            if ui:IsKeyDown(Enum.KeyCode.A) then m = m - workspace.CurrentCamera.CFrame.RightVector end
            if ui:IsKeyDown(Enum.KeyCode.D) then m = m + workspace.CurrentCamera.CFrame.RightVector end
            if ui:IsKeyDown(Enum.KeyCode.Space) then m = m + Vector3.new(0,1,0) end
            if m.Magnitude > 0 then m = m.Unit end
            bv.Velocity = m * 50
            bg.CFrame = workspace.CurrentCamera.CFrame
        end)
    end
end)

-- ESP
esp_btn.MouseButton1Click:Connect(function()
    states.esp = not states.esp
    esp_btn.BackgroundColor3 = states.esp and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(100, 0, 0)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= p and player.Character then
            local esp = player.Character:FindFirstChild("ESP")
            if states.esp then
                if not esp then
                    local box = Instance.new("BillboardGui")
                    box.Name = "ESP"
                    box.Size = UDim2.new(4, 0, 5, 0)
                    box.StudsOffset = Vector3.new(0, 3, 0)
                    box.Parent = player.Character:FindFirstChild("HumanoidRootPart")
                    local label = Instance.new("TextLabel", box)
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.BackgroundTransparency = 1
                    label.TextColor3 = Color3.fromRGB(0, 255, 0)
                    label.Text = player.Name
                end
            else
                if esp then esp:Destroy() end
            end
        end
    end
end)

-- Tools
tool_btn.MouseButton1Click:Connect(function()
    states.tool = not states.tool
    tool_btn.BackgroundColor3 = states.tool and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(100, 0, 0)
    if states.tool then
        for _, tool in pairs(workspace:FindFirstChild("Tools") and workspace.Tools:GetChildren() or {}) do
            tool:MoveTo(p.Character:WaitForChild("HumanoidRootPart").Position)
        end
    end
end)

-- اختفاء
invis_btn.MouseButton1Click:Connect(function()
    states.invis = not states.invis
    invis_btn.BackgroundColor3 = states.invis and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(100, 0, 0)
    for _, v in pairs(p.Character:GetDescendants()) do
        if v:IsA("BasePart") then v.Transparency = states.invis and 1 or 0 end
    end
end)

-- حفظ Checkpoint
save_cp_btn.MouseButton1Click:Connect(function()
    checkpoint = p.Character:WaitForChild("HumanoidRootPart").CFrame
    save_cp_btn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
end)

-- انتقال Checkpoint
tp_cp_btn.MouseButton1Click:Connect(function()
    if checkpoint then
        p.Character:WaitForChild("HumanoidRootPart").CFrame = checkpoint
    end
end)

-- إزالة Checkpoint
del_cp_btn.MouseButton1Click:Connect(function()
    checkpoint = nil
    save_cp_btn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
end)

-- ترسيل لاعب
respawn_btn.MouseButton1Click:Connect(function()
    local target = game.Players:FindFirstChild(player_input.Text)
    if target and target.Character then
        target.Character:WaitForChild("Humanoid").Health = 0
    end
end)

-- Flick
flick_btn.MouseButton1Click:Connect(function()
    local target = game.Players:FindFirstChild(player_input.Text)
    if target and target.Character then
        local r = target.Character:WaitForChild("HumanoidRootPart")
        r.CFrame = r.CFrame + Vector3.new(0, 50, 0)
    end
end)

-- إعادة انضمام
rejoin_btn.MouseButton1Click:Connect(function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, p)
end)
