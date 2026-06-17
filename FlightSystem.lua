local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")

local m = Instance.new("ScreenGui", pg)
m.ResetOnSpawn = false
m.Name = "N7xGui"

local h = Instance.new("Frame", m)
h.Size = UDim2.new(0, 200, 0, 400)
h.Position = UDim2.new(0, 10, 0, 10)
h.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
h.BorderColor3 = Color3.fromRGB(0, 255, 0)
h.BorderSizePixel = 2
h.Draggable = true
h.Active = true

local t = Instance.new("TextLabel", h)
t.Size = UDim2.new(1, 0, 0, 40)
t.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
t.TextColor3 = Color3.fromRGB(255, 255, 255)
t.Text = "N7x Menu"
t.TextSize = 16
t.BorderSizePixel = 0

local function makeBtn(name, y)
    local btn = Instance.new("TextButton", h)
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = name
    btn.TextSize = 12
    btn.BorderSizePixel = 0
    return btn
end

local fly_btn = makeBtn("Fly", 45)
local esp_btn = makeBtn("ESP", 85)
local invis_btn = makeBtn("Invisible", 125)
local save_btn = makeBtn("Save CP", 165)
local tp_btn = makeBtn("TP CP", 205)
local del_btn = makeBtn("Delete CP", 245)
local kill_btn = makeBtn("Kill Player", 285)
local flick_btn = makeBtn("Flick Player", 325)
local rejoin_btn = makeBtn("Rejoin", 365)

local input = Instance.new("TextBox", h)
input.Size = UDim2.new(0.9, 0, 0, 30)
input.Position = UDim2.new(0.05, 0, 0, 45)
input.PlaceholderText = "Player Name"
input.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.TextSize = 12
input.BorderSizePixel = 0
input.Visible = false

local states = {fly = false, esp = false, invis = false}
local cp = nil

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

esp_btn.MouseButton1Click:Connect(function()
    states.esp = not states.esp
    esp_btn.BackgroundColor3 = states.esp and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(50, 50, 50)
    
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p and pl.Character then
            local root = pl.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local old = root:FindFirstChild("Esp2")
                if old then old:Destroy() end
                
                if states.esp then
                    local bill = Instance.new("BillboardGui", root)
                    bill.Name = "Esp2"
                    bill.Size = UDim2.new(4, 0, 2, 0)
                    local txt = Instance.new("TextLabel", bill)
                    txt.Size = UDim2.new(1, 0, 1, 0)
                    txt.BackgroundTransparency = 1
                    txt.TextColor3 = Color3.fromRGB(0, 255, 0)
                    txt.TextSize = 14
                    txt.Text = pl.Name
                end
            end
        end
    end
end)

invis_btn.MouseButton1Click:Connect(function()
    states.invis = not states.invis
    invis_btn.BackgroundColor3 = states.invis and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(50, 50, 50)
    
    local c = p.Character
    if c then
        for _, v in pairs(c:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Transparency = states.invis and 1 or 0
            end
        end
    end
end)

save_btn.MouseButton1Click:Connect(function()
    local c = p.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        cp = c.HumanoidRootPart.CFrame
        save_btn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    end
end)

tp_btn.MouseButton1Click:Connect(function()
    if cp then
        local c = p.Character
        if c and c:FindFirstChild("HumanoidRootPart") then
            c.HumanoidRootPart.CFrame = cp
        end
    end
end)

del_btn.MouseButton1Click:Connect(function()
    cp = nil
    save_btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end)

kill_btn.MouseButton1Click:Connect(function()
    local target = game.Players:FindFirstChild(input.Text)
    if target and target.Character then
        local hu = target.Character:FindFirstChild("Humanoid")
        if hu then hu.Health = 0 end
    end
end)

flick_btn.MouseButton1Click:Connect(function()
    local target = game.Players:FindFirstChild(input.Text)
    if target and target.Character then
        local r = target.Character:FindFirstChild("HumanoidRootPart")
        if r then r.CFrame = r.CFrame + Vector3.new(0, 50, 0) end
    end
end)

rejoin_btn.MouseButton1Click:Connect(function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, p)
end)

print("N7x Loaded!")
