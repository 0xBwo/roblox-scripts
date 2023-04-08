if game.PlaceId == 12802235086 then
repeat task.wait() until game:IsLoaded()
_G.Color = Color3.fromRGB(255, 255, 255)
_G.Color2 = Color3.fromRGB(1, 1, 1)

getgenv().WebhookWait = 150 

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

--// Functions \\--
local LP = game:GetService("Players").LocalPlayer
    
local function GetDistance(Endpoint)
    if typeof(Endpoint) == "Instance" then
       Endpoint = Vector3.new(Endpoint.Position.X, LP.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
    elseif typeof(Endpoint) == "CFrame" then
       Endpoint = Vector3.new(Endpoint.Position.X, LP.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
    end
    local Magnitude = (Endpoint - LP.Character.HumanoidRootPart.Position).Magnitude
    return Magnitude
end

function Tween(Endpoint)
    if typeof(Endpoint) == "Instance" then
       Endpoint = Endpoint.CFrame
    end
    local TweenFunc = {}
    local Distance = GetDistance(Endpoint)
    local TweenInfo = game:GetService("TweenService"):Create(LP.Character.HumanoidRootPart, TweenInfo.new(Distance/getgenv().TweenSpeed, Enum.EasingStyle.Linear), {CFrame = Endpoint * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(0))})
    TweenInfo:Play()
    function TweenFunc:Cancel()
       TweenInfo:Cancel()
       return false
    end
    if Distance <= 1 then
        LP.Character.HumanoidRootPart.CFrame = Endpoint
        TweenInfo:Cancel()
        return false
     end
    return TweenFunc
end
--// End of functions list \\--

--// Webhook Functions \\--

local request = http_request or request or HttpPost or syn.request;

local function send_webhook()

   local data = {
      ["content"] = "",
      ["embeds"] = {
         {
            ["title"] = "Infinite Rarities Webhook",
            ["type"] = "rich",
            ["color"] = color,
            ["fields"] = {
               --UserName
               {
                  ["name"] = "UserName",
                  ["value"] = "||"..game.Players.LocalPlayer.Name.."||",
                  ["inline"] = true,
               },
               --Level
               {
                  ["name"] = "Ascenion Points",
                  ["value"] = game:GetService("Players").LocalPlayer.PlayerData.APM.Value,
                  ["inline"] = true,
               },
               {
                ["name"] = "SP",
                ["value"] = game:GetService("Players").LocalPlayer.leaderstats.SP.Value,
                ["inline"] = true,
             },
             {
                ["name"] = "Highest Rarity",
                ["value"] = game:GetService("Players").LocalPlayer.leaderstats["Highest Rarity"].Value,
                ["inline"] = true,
             },
             {
                ["name"] = "Prestige Points",
                ["value"] = game:GetService("Players").LocalPlayer.PlayerData.PP.Value,
                ["inline"] = true,
             },
            },
            ["footer"] = {["text"] = "Blackout#0101"},
         }
      }
   }
   
   local headers = {
       ["content-type"] = "application/json"
   }
   
   local abcdef = {Url = webhook, Body = game:GetService("HttpService"):JSONEncode(data), Method = "POST", Headers = headers}
   
   request(abcdef)
   
   headers = nil;
   abcdef = nil;
   data = nil;
   
end

--// \\--

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blackout4781/thing/main/sss"))()
local window  = library:CreateWindow("Project Nemisis | Infinite Rarities", Vector2.new(440, 650), Enum.KeyCode.RightControl)
local Watermark = library:CreateWatermark("Project Nemisis | Infinite Rarities | {fps}")

local Main = window:CreateTab("Main")
local Farming = Main:CreateSector("Farming", 'left')
local Settings = Main:CreateSector("Settings", 'right')

--// Main \\--
Farming:AddToggle("Farm Every Basic Thing", false, function(value)
    getgenv().FarmAll = value 
end)

Farming:AddToggle("Farm Prestiges", false, function(value)
    getgenv().Prestiges = value 
end)

Farming:AddToggle("Farm Acensions", false, function(value)
    getgenv().Acensions = value 
end)

Farming:AddToggle("Farm Sp", false, function(value)
    getgenv().SpFarm = value 
end)

Farming:AddToggle("Farm Rarity", false, function(value)
    getgenv().RarityFarm = value 
end)

Farming:AddToggle("Auto Upgrade Luck", false, function(value)
    getgenv().LU = value 
end)

Farming:AddToggle("Auto Upgrade Roll CD", false, function(value)
    getgenv().RU = value 
end)

Farming:AddToggle("+1 Bulk Roll", false, function(value)
    getgenv().BU = value 
end)

Farming:AddToggle("1x SPM", false, function(value)
    getgenv().SU = value 
end)
--// Settings \\--

Settings:AddSlider("Tween Speed", 150, 150, 500, 1, function(v)
    getgenv().TweenSpeed = v
end)

Settings:AddTextbox("Enter Webhook","webhook",function(v)
    webhook = v
end)

Settings:AddToggle("Send webhook", false, function(value)
    getgenv().StatNoti = value 
end)

Settings:AddSlider("Webhook Time", 150, 150, 5000, 1, function(v)
    getgenv().WebhookWait = v
end)

--// Functions/Code Below \\-- 
spawn(function()
    while task.wait() do
            if getgenv().SpFarm == true then
            Tween(CFrame.new(0, 3, 40))
            task.wait(0.5)
            Tween(CFrame.new(40, 3, 39))
            task.wait(0.5)
        end
    end
end)

spawn(function()
    while task.wait() do
            if getgenv().RarityFarm == true then
            Tween(CFrame.new(0, 3, 40))
            task.wait(0.5)
            Tween(CFrame.new(1, 3, 34))
            task.wait(0.1)
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().Ru == true then
            Tween(CFrame.new(40, 3, 20))
            task.wait(1)
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().BU == true then
            Tween(CFrame.new(41, 3, 11))
            task.wait(1)
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().SU == true then
            Tween(CFrame.new(42, 3, 4))
            task.wait(1)
        end
    end
end)

spawn(function()
    while task.wait() do
            if getgenv().LU == true then
            Tween(CFrame.new(40, 3, 27))
            task.wait(1)
        end
    end
end)

spawn(function()
    while task.wait() do
            if getgenv().FarmAll == true then
            Tween(CFrame.new(0, 3, 40))
            task.wait(0.5)
            Tween(CFrame.new(40, 3, 39))
            task.wait(0.4)
            Tween(CFrame.new(40, 3, 20))
            task.wait(0.2)
            Tween(CFrame.new(41, 3, 11))
            task.wait(0.3)
            Tween(CFrame.new(42, 3, 4))
            task.wait(0.3)
            Tween(CFrame.new(38, 3, 3))
            task.wait(0.5)
        end
    end
end)

spawn(function()
    while task.wait() do
            if getgenv().Prestiges == true then
            Tween(CFrame.new(0, 3, 40))
            task.wait(0.5)
            Tween(CFrame.new(40, 3, -39))
            task.wait(0.3)
            Tween(CFrame.new(28, 3, -40))
            task.wait(0.2)
            Tween(CFrame.new(20, 3, -41))
            task.wait(0.3)
            Tween(CFrame.new(12, 3, -40))
            task.wait(0.5)
        end
    end
end)

spawn(function()
    while task.wait() do
            if getgenv().Acensions == true then
            Tween(CFrame.new(0, 3, 40))
            task.wait(0.5)
            Tween(CFrame.new(-40, 3, -40))
            task.wait(1)
            Tween(CFrame.new(-92, 16, -18))
            task.wait(0.4)
            Tween(CFrame.new(-92, 16, -10))
            task.wait(0.2)
            Tween(CFrame.new(-92, 16, -2))
            task.wait(0.3)
            Tween(CFrame.new(-92, 16, 5))
            task.wait(0.5)
        end
    end
end)

--// Webhook \\--
spawn(function()
    while task.wait(getgenv().WebhookWait) do
            if getgenv().StatNoti then
            send_webhook()
            print("Send Webhook")
        end
    end
end)
end