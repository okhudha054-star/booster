if _G.DarkBoostLoaded then return end
_G.DarkBoostLoaded = true

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local canBoost = true
local boostEnabled = true

local DASH_POWER = 300
local MIN_POWER = 100
local MAX_POWER = math.huge

local DASH_DURATION = 0.12
local COOLDOWN_TIME = 1.53

local BOOST_TOOLS = {
    ["Skull Guitar"] = true,
    ["Lowek"] = true,
    ["Kabuch"] = true,
}

local function applyPowerfulBoost()
    if not canBoost or not boostEnabled then return end

    local char = player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not (root and hum) then return end

    canBoost = false

    local dir = hum.MoveDirection
    if dir.Magnitude == 0 then
        dir = root.CFrame.LookVector
    end

    local att = Instance.new("Attachment", root)
    local lv = Instance.new("LinearVelocity")
    lv.MaxForce = 9999999
    lv.VectorVelocity = (dir * DASH_POWER) + Vector3.new(0, 10, 0)
    lv.Attachment0 = att
    lv.Parent = root

    task.wait(DASH_DURATION)
    lv:Destroy()
    att:Destroy()

    task.wait(COOLDOWN_TIME - DASH_DURATION)
    canBoost = true
end

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local char = player.Character
        local tool = char and char:FindFirstChildOfClass("Tool")
        if tool and BOOST_TOOLS[tool.Name] then
            applyPowerfulBoost()
        end
    end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "DarkBoostGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")



local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.20, 0.45)
frame.Position = UDim2.fromScale(0.37, 0.34)
frame.BackgroundTransparency = 1
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,12)

local logo = Instance.new("ImageLabel", frame)
logo.Size = UDim2.fromScale(1, 1)
logo.Position = UDim2.fromScale(0, 0)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://133339815167564"
logo.ScaleType = Enum.ScaleType.Crop
logo.ZIndex = 0
Instance.new("UICorner", logo).CornerRadius = UDim.new(0,12)

local function makeButton(text, y)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.fromScale(0.9, 0.15)
    b.Position = UDim2.fromScale(0.05, y)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(40,40,40)
    b.BackgroundTransparency = 0.5
    b.BackgroundTransparency = 0.5
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextScaled = true
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)
    return b
end

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.fromScale(0.7, 0.17)
title.Position = UDim2.fromScale(0, 0)
title.Text = "KerherBoost"
title.TextColor3 = Color3.fromRGB(0, 0, 0)
title.TextTransparency = 0.4
title.Font = Enum.Font.GothamBlack
title.TextScaled = true
title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
title.BackgroundTransparency = 0.5
Instance.new("UICorner", title).CornerRadius = UDim.new(0, 6)

-- Кнопка свернуть (скрывает меню полностью)
local minimizeBtn = Instance.new("TextButton", frame)
minimizeBtn.Size = UDim2.fromScale(0.12, 0.14)
minimizeBtn.Position = UDim2.fromScale(0.74, 0.015)
minimizeBtn.Text = "—"
minimizeBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
minimizeBtn.BackgroundTransparency = 0.5
minimizeBtn.BackgroundTransparency = 0.5
minimizeBtn.TextColor3 = Color3.new(1,1,1)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextScaled = true
minimizeBtn.ZIndex = 10
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0,6)
minimizeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- Resize handle (правый нижний угол)
local resizeHandle = Instance.new("TextButton", frame)
resizeHandle.Size = UDim2.fromOffset(16, 16)
resizeHandle.AnchorPoint = Vector2.new(1, 1)
resizeHandle.Position = UDim2.fromScale(1, 1)
resizeHandle.Text = "◢"
resizeHandle.BackgroundTransparency = 1
resizeHandle.TextColor3 = Color3.fromRGB(180, 80, 255)
resizeHandle.Font = Enum.Font.GothamBold
resizeHandle.TextScaled = true
resizeHandle.ZIndex = 20

local resizing = false
local startMousePos, startSize

resizeHandle.MouseButton1Down:Connect(function()
    resizing = true
    startMousePos = UserInputService:GetMouseLocation()
    startSize = frame.AbsoluteSize
end)

UserInputService.InputChanged:Connect(function(input)
    if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = UserInputService:GetMouseLocation() - startMousePos
        local newW = math.clamp(startSize.X + delta.X, 120, 600)
        local newH = math.clamp(startSize.Y + delta.Y, 150, 800)
        frame.Size = UDim2.fromOffset(newW, newH)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        resizing = false
    end
end)

-- Кнопка закрыть (полностью останавливает скрипт)
local closed = false
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.fromScale(0.12, 0.14)
closeBtn.Position = UDim2.fromScale(0.87, 0.015)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(180,40,40)
closeBtn.BackgroundTransparency = 0.5
closeBtn.BackgroundTransparency = 0.5
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextScaled = true
closeBtn.ZIndex = 10
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,6)
closeBtn.MouseButton1Click:Connect(function()
    closed = true
    boostEnabled = false
    canBoost = false
    _G.DarkBoostLoaded = nil
    gui:Destroy()
end)


local toggle = makeButton("Boost: ON", 0.22)
toggle.MouseButton1Click:Connect(function()
    boostEnabled = not boostEnabled
    toggle.Text = "Boost: " .. (boostEnabled and "ON" or "OFF")
end)

local powerPlus = makeButton("Power +", 0.40)
powerPlus.MouseButton1Click:Connect(function()
    DASH_POWER = math.clamp(DASH_POWER + 50, MIN_POWER, MAX_POWER)
end)

local powerMinus = makeButton("Power -", 0.56)
powerMinus.MouseButton1Click:Connect(function()
    DASH_POWER = math.clamp(DASH_POWER - 50, MIN_POWER, MAX_POWER)
end)

local info = makeButton("", 0.72)
info.AutoButtonColor = false

task.spawn(function()
    while task.wait(0.15) do
        info.Text = "Power: "..DASH_POWER
    end
end)

local hint = Instance.new("TextLabel", frame)
hint.Size = UDim2.fromScale(0.9, 0.08)
hint.Position = UDim2.fromScale(0.05, 0.90)
hint.Text = "DEL — скрыть"
hint.TextColor3 = Color3.fromRGB(200, 200, 200)
hint.TextTransparency = 0.15
hint.BackgroundTransparency = 1
hint.Font = Enum.Font.Gotham
hint.TextScaled = true
hint.ZIndex = 5


UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.Delete then
        if not closed then
            frame.Visible = not frame.Visible
        end
    end
end)

print("DarkBoost loaded!")