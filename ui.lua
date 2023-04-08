_G.Color = Color3.fromRGB(255, 255, 255)
_G.Color2 = Color3.fromRGB(1, 1, 1)

repeat task.wait() until game:IsLoaded()

local SelectSword

local notifications = loadstring(game:HttpGet(("https://raw.githubusercontent.com/0xBwo/roblox-scripts/main/local%20library.lua"),true))()
local Framework = loadstring(game:HttpGet("https://raw.githubusercontent.com/0xBwo/roblox-scripts/main/local%20library.lua"))()
local Watermark = Framework:CreateWatermark("Carley Hub | GPO | {fps}")
local WriteLine  = Framework:CreateWindow("Carley Hub | GPO | discord.gg/carley", Vector2.new(492, 588), Enum.KeyCode.RightControl)


local General = WriteLine:CreateTab("General")

local Extra = WriteLine:CreateTab("Extra")

local Main = General:CreateSector("Auto-Farm", "left")

local ShipfarmTab = General:CreateSector("Ship-Farm", "left")

local SwordModTab = General:CreateSector("Sword-Mod", "right")

local PlayerTab = General:CreateSector("Player", "right")

local ProgressTabCheck = General:CreateSector("Progression Check", "left")

local NoStaminaTab = General:CreateSector("No-Stamina", "right")


local Swords = {}

for i,v in pairs(game.ReplicatedStorage.Modules.SwordHandle.Swords:GetChildren()) do 
    if v:IsA("Folder") then 
        table.insert(Swords,v.Name)
    end
end




-->>> AutoFarm Tab <<--

Main:AddToggle("Level Farm", false, function(v)

end)

Main:AddToggle("Auto Buso Quest", false, function(v)

end)

Main:AddDropdown("Select Method", {"Rifle","Sword"}, "No Quest", false, function(v)
    SelectSword = v
end)

-->>> End Of AutoFarm Tab <<--



-->>> ShipFarm Tab <<--

ShipfarmTab:AddToggle("Ship Farm", false, function(v)

end)

ShipfarmTab:AddDropdown("Select Method", {"Rifle","Sword"}, "No Quest", false, function(v)
    SelectSword = v
end)

ShipfarmTab:AddToggle("Boat Speed", false, function(v)

end)

ShipfarmTab:AddSlider("Ship Speed", 1, 1, 100, 1, function(v)
    
end)

ShipfarmTab:AddToggle("Ban Player (USES BOAT)", false, function(v)

end)

-->>> End Of ShipFarm Tab <<--



-->>> Sword Mods <<<--

SwordModTab:AddButton("Apply Sword Mod",function()
 
end)

SwordModTab:AddDropdown("Select Sword", {unpack(Swords)}, "No Quest", false, function(v)
 
end)

SwordModTab:AddSlider("Animation Speed (NOT DONE)", 1, 1, 100, 1, function(v)
    
end)


-->>> End Of Sword Mods Tab <<<--




-->>> Player <<<--

PlayerTab:AddToggle("Walkspeed", false, function(v)

end)


PlayerTab:AddSlider("WalkSpeed", 1, 1, 50, 1, function(v)

end)

PlayerTab:AddToggle("No Clip", false, function(v)

end)

PlayerTab:AddToggle("Swim in water", false, function(v)

end)

PlayerTab:AddToggle("No drown", false, function(v)

end)

PlayerTab:AddToggle("No fall", false, function(v)

end)


-->>> End Of Player Tab <<<--


-->>> Progression Check <<<--

ProgressTabCheck:AddButton("Check Buso Progress",function()

end)

ProgressTabCheck:AddButton("Check Logia Progress",function()

end)

ProgressTabCheck:AddButton("Check Ken Haki Progress",function()

end)

-->>> End Of Progression Check <<<--


NoStaminaTab:AddToggle("No Stamina", false, function(v)

end)

NoStaminaTab:AddDropdown("Select Style", {"Blackleg","Roku"}, "No Style Selected", false, function(v)
   -- SelectSword = v
end)
--[[
a1:AddTextbox("Enter Webhook","E",false,function()
    
end)]]

miscsect:AddLabel("made by ouw#7809")
