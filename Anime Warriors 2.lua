_G.Color = Color3.fromRGB(255, 255, 255)
_G.Color2 = Color3.fromRGB(1, 1, 1)
getgenv().NextMobWait = 30
--// Tables \\--
local mobs = {
    "Troop",
    "Alligator",
    "Ostrich",
    "Lava",
    "Sharky"
}

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blackout4781/thing/main/sss"))()
local window  = library:CreateWindow("Project Nemisis | Anime Warriors 2", Vector2.new(440, 650), Enum.KeyCode.RightControl)
local Watermark = library:CreateWatermark("Project Nemisis | Anime Warriors 2 | {fps}")

local Main = window:CreateTab("Main")
local Main1 = Main:CreateSector("Main", 'left')
local Misc = Main:CreateSector("Misc", 'right')


--// Main \\--
Main1:AddDropdown("Select A Mob", mobs, "No Mob", false, function(v)
    getgenv().SelectedMob = v
end)

Main1:AddToggle("Farm Selected Mob", false, function(v)
    getgenv().FarmSelected = v
end)

Main1:AddToggle("Auto Click", false, function(v)
    getgenv().Click = v
end)

Main1:AddSlider("Next Mob/Rejoin Mob ", 1, 30, 10000, 1, function(v)
    getgenv().NextMobWait = v
end)

Main1:AddToggle("Auto Collect Coins", false, function(v)
    getgenv().CollectCoins = v
end)

--// Misc \\--

Misc:AddToggle("Auto Daily Spin", false, function(v)
    getgenv().AutoSpinWheel = v
end)

--// Code \\--
spawn(function()
    while task.wait() do
        if getgenv().AutoSpinWheel == true then
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ItemsService"):WaitForChild("RF"):WaitForChild("DailySpin"):InvokeServer()
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().Click == true then
            local args = {
                [1] = {
                    [1] = {
                        [1] = "&"
                    }
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
        end
    end
end)


--// Auto Collect COins \\--

spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().CollectCoins ~= true then return end
            for i,v in pairs(game:GetService("Workspace").Drops:GetChildren()) do
                v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,0,0)
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().FarmSelected == true then
            for i,v in pairs(game:GetService("Workspace").ClientEnemies:GetChildren()) do
                pcall(function()
                    if v:FindFirstChild("HumanoidRootPart") then
                        if v.HumanoidRootPart.EnemyHealthBar.Title.Text == getgenv().SelectedMob then
                            repeat
                                task.wait(getgenv().NextMobWait)
                            local args = {
                                [1] = {
                                    [1] = {
                                        [1] = "%",
                                        [2] = v.Name
                                    }
                                }
                            }
                            
                            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                         until getgenv().FarmSelected == false or not v.HumanoidRootPart
                        end
                    end
                end)
            end
        end
    end
end)
