-- [[ LARB HACK: DARKBOOST SECURE LAYER ]]
local _0x1F2A = {"\103\97\109\101", "\80\108\97\121\101\114\115", "\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101", "\76\111\99\97\108\80\108\97\121\101\114", "\68\97\114\107\66\111\111\115\116\76\111\97\100\101\100", "\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116"}
if _G[_0x1F2A[5]] then return end; _G[_0x1F2A[5]] = true

local L_1_ = game:GetService(_0x1F2A[2]); local L_2_ = game:GetService(_0x1F2A[3]); local L_3_ = L_1_[_0x1F2A[4]]
local L_4_, L_5_ = true, true; local L_6_, L_7_, L_8_ = 300, 100, math.huge
local L_9_, L_10_ = 0.12, 1.53
local L_11_ = {["\83\107\117\108\108\32\71\117\105\116\97\114"] = true, ["\76\111\119\101\107"] = true, ["\75\97\98\117\99\104"] = true}

local function L_12_()
    if not L_4_ or not L_5_ then return end
    local L_13_ = L_3_.Character; local L_14_ = L_13_ and L_13_:FindFirstChild(_0x1F2A[6])
    local L_15_ = L_13_ and L_13_:FindFirstChildOfClass("\72\117\109\97\110\111\105\100")
    if not (L_14_ and L_15_) then return end; L_4_ = false
    local L_16_ = L_15_.MoveDirection; if L_16_.Magnitude == 0 then L_16_ = L_14_.CFrame.LookVector end
    local L_17_ = Instance.new("\65\116\116\97\99\104\109\101\110\116", L_14_)
    local L_18_ = Instance.new("\76\105\110\101\97\114\86\101\108\111\99\105\116\121")
    L_18_.MaxForce = 9999999; L_18_.VectorVelocity = (L_16_ * L_6_) + Vector3.new(0, 10, 0)
    L_18_.Attachment0 = L_17_; L_18_.Parent = L_14_
    task.wait(L_9_); L_18_:Destroy(); L_17_:Destroy()
    task.wait(L_10_ - L_9_); L_4_ = true
end

L_2_.InputBegan:Connect(function(L_19_, L_20_)
    if L_20_ then return end
    if L_19_.UserInputType == Enum.UserInputType.MouseButton1 then
        local L_21_ = L_3_.Character; local L_22_ = L_21_ and L_21_:FindFirstChildOfClass("\84\111\111\108")
        if L_22_ and L_11_[L_22_.Name] then L_12_() end
    end
end)

local L_23_ = Instance.new("\83\99\114\101\101\110\71\117\105")
L_23_.Name = "\68\97\114\107\66\111\111\115\116\71\117\105"; L_23_.ResetOnSpawn = false
L_23_.Parent = L_3_:WaitForChild("\80\108\97\121\101\114\71\117\105")

local L_24_ = Instance.new("\70\114\97\109\101", L_23_)
L_24_.Size = UDim2.fromScale(0.20, 0.45); L_24_.Position = UDim2.fromScale(0.37, 0.34)
L_24_.BackgroundTransparency = 1; L_24_.BorderSizePixel = 0; L_24_.Active = true; L_24_.Draggable = true
Instance.new("\85\73\67\111\114\110\101\114", L_24_).CornerRadius = UDim.new(0, 12)

local L_25_ = Instance.new("\73\109\97\103\101\76\97\98\101\108", L_24_)
L_25_.Size = UDim2.fromScale(1, 1); L_25_.Position = UDim2.fromScale(0, 0)
L_25_.BackgroundTransparency = 1; L_25_.Image = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\51\51\51\51\57\56\49\53\49\54\55\53\54\52"
L_25_.ScaleType = Enum.ScaleType.Crop; L_25_.ZIndex = 0
Instance.new("\85\73\67\111\114\110\101\114", L_25_).CornerRadius = UDim.new(0, 12)

local function L_26_(L_27_, L_28_)
    local L_29_ = Instance.new("\84\101\120\116\66\117\116\116\111\110", L_24_)
    L_29_.Size = UDim2.fromScale(0.9, 0.15); L_29_.Position = UDim2.fromScale(0.05, L_28_)
    L_29_.Text = L_27_; L_29_.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    L_29_.BackgroundTransparency = 0.5; L_29_.TextColor3 = Color3.new(1, 1, 1)
    L_29_.Font = Enum.Font.GothamBold; L_29_.TextScaled = true
    Instance.new("\85\73\67\111\114\110\101\114", L_29_).CornerRadius = UDim.new(0, 10)
    return L_29_
end

local L_30_ = Instance.new("\84\101\120\116\76\97\98\101\108", L_24_)
L_30_.Size = UDim2.fromScale(0.7, 0.17); L_30_.Position = UDim2.fromScale(0, 0)
L_30_.Text = "\75\101\114\104\101\114\66\111\111\115\116"; L_30_.TextColor3 = Color3.fromRGB(0, 0, 0)
L_30_.TextTransparency = 0.4; L_30_.Font = Enum.Font.GothamBlack; L_30_.TextScaled = true
L_30_.BackgroundColor3 = Color3.fromRGB(0, 0, 0); L_30_.BackgroundTransparency = 0.5
Instance.new("\85\73\67\111\114\110\101\114", L_30_).CornerRadius = UDim.new(0, 6)

local L_31_ = Instance.new("\84\101\120\116\66\117\116\116\111\110", L_24_)
L_31_.Size = UDim2.fromScale(0.12, 0.14); L_31_.Position = UDim2.fromScale(0.74, 0.015)
L_31_.Text = "\226\128\148"; L_31_.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
L_31_.BackgroundTransparency = 0.5; L_31_.TextColor3 = Color3.new(1, 1, 1)
L_31_.Font = Enum.Font.GothamBold; L_31_.TextScaled = true; L_31_.ZIndex = 10
Instance.new("\85\73\67\111\114\110\101\114", L_31_).CornerRadius = UDim.new(0, 6)
L_31_.MouseButton1Click:Connect(function() L_24_.Visible = false end)

local L_32_ = Instance.new("\84\101\120\116\66\117\116\116\111\110", L_24_)
L_32_.Size = UDim2.fromOffset(16, 16); L_32_.AnchorPoint = Vector2.new(1, 1)
L_32_.Position = UDim2.fromScale(1, 1); L_32_.Text = "\226\151\154"; L_32_.BackgroundTransparency = 1
L_32_.TextColor3 = Color3.fromRGB(180, 80, 255); L_32_.Font = Enum.Font.GothamBold
L_32_.TextScaled = true; L_32_.ZIndex = 20

local L_33_, L_34_, L_35_ = false, nil, nil
L_32_.MouseButton1Down:Connect(function()
    L_33_ = true; L_34_ = L_2_.GetMouseLocation(L_2_); L_35_ = L_24_.AbsoluteSize
end)

L_2_.InputChanged:Connect(function(L_36_)
    if L_33_ and L_36_.UserInputType == Enum.UserInputType.MouseMovement then
        local L_37_ = L_2_.GetMouseLocation(L_2_) - L_34_
        L_24_.Size = UDim2.fromOffset(math.clamp(L_35_.X + L_37_.X, 120, 600), math.clamp(L_35_.Y + L_37_.Y, 150, 800))
    end
end)

L_2_.InputEnded:Connect(function(L_38_)
    if L_38_.UserInputType == Enum.UserInputType.MouseButton1 then L_33_ = false end
end)

local L_39_ = false
local L_40_ = Instance.new("\84\101\120\116\66\117\116\116\111\110", L_24_)
L_40_.Size = UDim2.fromScale(0.12, 0.14); L_40_.Position = UDim2.fromScale(0.87, 0.015)
L_40_.Text = "\88"; L_40_.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
L_40_.BackgroundTransparency = 0.5; L_40_.TextColor3 = Color3.new(1, 1, 1)
L_40_.Font = Enum.Font.GothamBold; L_40_.TextScaled = true; L_40_.ZIndex = 10
Instance.new("\85\73\67\111\114\110\101\114", L_40_).CornerRadius = UDim.new(0, 6)
L_40_.MouseButton1Click:Connect(function()
    L_39_ = true; L_5_ = false; L_4_ = false; _G[_0x1F2A[5]] = nil; L_23_.Destroy(L_23_)
end)

local L_41_ = L_26_("\66\111\111\115\116\58\32\79\78", 0.22)
L_41_.MouseButton1Click:Connect(function()
    L_5_ = not L_5_; L_41_.Text = "\66\111\111\115\116\58\32" .. (L_5_ and "\79\78" or "\79\70\70")
end)

local L_42_ = L_26_("\80\111\119\101\114\32\43", 0.40)
L_42_.MouseButton1Click:Connect(function() L_6_ = math.clamp(L_6_ + 50, L_7_, L_8_) end)

local L_43_ = L_26_("\80\111\119\101\114\32\45", 0.56)
L_43_.MouseButton1Click:Connect(function() L_6_ = math.clamp(L_6_ - 50, L_7_, L_8_) end)

local L_44_ = L_26_("", 0.72); L_44_.AutoButtonColor = false
task.spawn(function() while task.wait(0.15) do L_44_.Text = "\80\111\119\101\114\58\32" .. L_6_ end end)

local L_45_ = Instance.new("\84\101\120\116\76\97\98\101\108", L_24_)
L_45_.Size = UDim2.fromScale(0.9, 0.08); L_45_.Position = UDim2.fromScale(0.05, 0.90)
L_45_.Text = "\68\69\76\32\226\128\148\32\209\129\208\186\209\128\209\139\209\130\209\140"
L_45_.TextColor3 = Color3.fromRGB(200, 200, 200); L_45_.TextTransparency = 0.15
L_45_.BackgroundTransparency = 1; L_45_.Font = Enum.Font.Gotham; L_45_.TextScaled = true; L_45_.ZIndex = 5

L_2_.InputBegan:Connect(function(L_46_, L_47_)
    if not L_47_ and L_46_.KeyCode == Enum.KeyCode.Delete then
        if not L_39_ then L_24_.Visible = not L_24_.Visible end
    end
end)
print("\68\97\114\107\66\111\111\115\116\32\108\111\97\100\101\100\33")
