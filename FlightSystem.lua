local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local m = Instance.new("ScreenGui", pg)
m.ResetOnSpawn = false

local h = Instance.new("Frame", m)
h.Size = UDim2.new(0, 200, 0, 150)
h.Position = UDim2.new(0.5, -100, 0.5, -75)
h.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
h.Draggable = true
h.Active = true

local t = Instance.new("TextLabel", h)
t.Size = UDim2.new(1, 0, 0, 30)
t.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
t.TextColor3 = Color3.fromRGB(255, 255, 255)
t.Text = "N7x"

local fly_on = false
local esp_on = false
local tool_on = false

local function btn(name, pos)
    local b = Instance.new("TextButton", h)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Position = UDim2.new(0, 0, 0, pos)
    b.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Text = name
    return b
end

local fly_btn = btn("طيران", 30)
local esp_btn = btn("ESP", 70)
local tool_btn = btn("Tools", 110)

fly_btn.MouseButton1Click:Connect(function()
    fly_on = not fly_on
    fly_btn.BackgroundColor3 = fly_on and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(100, 0, 0)
    if fly_on then
        local c = p.Character
        local r = c:WaitForChild("HumanoidRootPart")
        local h = c:WaitForChild("Humanoid")
        local bv = Instance.new("BodyVelocity", r)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        local bg = Instance.new("BodyGyro", r)
        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        h.JumpPower = 100
        
        local conn
        conn = game:GetService("RunService").RenderStepped:Connect(function()
            if not fly_on then conn:Disconnect() bv:Destroy() bg:Destroy() h.JumpPower = 50 return end
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

esp_btn.MouseButton1Click:Connect(function()
    esp_on = not esp_on
    esp_btn.BackgroundColor3 = esp_on and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(100, 0, 0)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= p and player.Character then
            local esp = player.Character:FindFirstChild("ESP")
            if esp_on then
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

tool_btn.MouseButton1Click:Connect(function()
    tool_on = not tool_on
    tool_btn.BackgroundColor3 = tool_on and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(100, 0, 0)
    if tool_on then
        for _, tool in pairs(workspace:FindFirstChild("Tools") and workspace.Tools:GetChildren() or {}) do
            tool:MoveTo(p.Character:WaitForChild("HumanoidRootPart").Position)
        end
    end
end)
