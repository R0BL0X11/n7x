-- N7x Flight and High Jump System
-- LocalScript for Roblox
-- Place this in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Variables
local isFlying = false
local isHighJump = false
local flySpeed = 50
local jumpPower = 100

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "N7xGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create Button
local button = Instance.new("TextButton")
button.Name = "ToggleButton"
button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(0.5, -75, 0, 20)
button.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextSize = 18
button.Font = Enum.Font.GothamBold
button.Text = "تشغيل"
button.Parent = screenGui

-- Create Status Label
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(0, 200, 0, 40)
statusLabel.Position = UDim2.new(0.5, -100, 0, 80)
statusLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.TextSize = 14
statusLabel.Font = Enum.Font.Gotham
statusLabel.Text = "الحالة: معطل"
statusLabel.Parent = screenGui

-- Flying variables
local bodyVelocity
local bodyGyro

-- Function to start flying
local function startFlying()
    if isFlying then return end
    isFlying = true
    
    -- Create BodyVelocity for movement
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bodyVelocity.Parent = rootPart
    
    -- Create BodyGyro for rotation
    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bodyGyro.CFrame = rootPart.CFrame
    bodyGyro.Parent = rootPart
    
    button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    button.Text = "إيقاف"
    statusLabel.Text = "الحالة: الطيران مفعل ✈️"
end

-- Function to stop flying
local function stopFlying()
    if not isFlying then return end
    isFlying = false
    
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end
    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end
    
    button.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
    button.Text = "تشغيل"
    statusLabel.Text = "الحالة: معطل"
end

-- Function to activate high jump
local function activateHighJump()
    if isHighJump then return end
    isHighJump = true
    humanoid.JumpPower = jumpPower
    statusLabel.Text = "الحالة: القفز العالي مفعل 🚀"
end

-- Function to deactivate high jump
local function deactivateHighJump()
    if not isHighJump then return end
    isHighJump = false
    humanoid.JumpPower = 50 -- Default jump power
    statusLabel.Text = "الحالة: معطل"
end

-- Button click event
button.MouseButton1Click:Connect(function()
    if not isFlying and not isHighJump then
        startFlying()
        activateHighJump()
    else
        stopFlying()
        deactivateHighJump()
    end
end)

-- Flying movement loop
RunService.RenderStepped:Connect(function()
    if isFlying and bodyVelocity and bodyGyro then
        local camera = workspace.CurrentCamera
        local moveDirection = Vector3.new(0, 0, 0)
        
        -- Get input
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + (camera.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - (camera.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDirection = moveDirection + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            moveDirection = moveDirection - Vector3.new(0, 1, 0)
        end
        
        -- Normalize and apply speed
        if moveDirection.Magnitude > 0 then
            moveDirection = moveDirection.Unit
        end
        bodyVelocity.Velocity = moveDirection * flySpeed
        
        -- Update rotation
        bodyGyro.CFrame = camera.CFrame
    end
end)

-- Handle character respawn
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    rootPart = character:WaitForChild("HumanoidRootPart")
    
    stopFlying()
    deactivateHighJump()
end)

print("✅ N7x Flight System Loaded Successfully!")
