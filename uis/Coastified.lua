local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/coastified/src.lua"))()
local Window = Lib:Window("Evolution", "Da Hood", Enum.KeyCode.RightShift)

local Silent = Window:Tab("Silent Aimbot")

Silent:Toggle('Enabled',function(state)
    getgenv().Evolution.SilentAim.Enabled = state
end)

Silent:Toggle('Auto Prediction',function(state)
    getgenv().Evolution.SilentAim.AutoPredict = state
end)


Silent:Slider('Prediction',111,999,155,function(Value)
    getgenv().Evolution.SilentAim.Prediction = tonumber("0."..Value)
end)


Silent:Toggle('Wallcheck',function(state)
    getgenv().Evolution.SilentAim.Wallcheck = state
end)

Silent:Toggle('Show FOV',function(state)
    getgenv().Evolution.FOV.Visible = state
end)

Silent:Slider('FOV Size',1,200,75,function(Value)
    getgenv().Evolution.FOV.Radius = Value
end)

Silent:Colorpicker("FOV Color",Color3.fromRGB(255,255,255), function(color)
    getgenv().Evolution.FOV.Color = color
end)


Silent:Dropdown("Target Part",{'Head',"UpperTorso","HumanoidRootPart","LowerTorso"}, function(v)
    getgenv().Evolution.SilentAim.TargetBone = v
end)

local Resolver = Window:Tab("Resolver")

Resolver:Toggle('Desync Resolver',function(state)
    getgenv().Evolution.Resolver.DesyncResolver = state
end)

local fov = Window:Tab("Gun FOV")

fov:Toggle('Enabled',function(state)
    getgenv().Evolution.GunFOV.Enabled = state
end)

fov:Slider('Double Barrel',1,200,20,function(v)
    getgenv().Evolution.GunFOV.DoubleBarrel = v
end)

fov:Slider('Revolver',1,200,25,function(v)
    getgenv().Evolution.GunFOV.Revolver = v
end)

fov:Slider('Rifle',1,200,20,function(v)
    getgenv().Evolution.GunFOV.Rifle = v
end)

fov:Slider('Shotgun',1,200,20,function(v)
    getgenv().Evolution.GunFOV.Shotgun = v
end)

fov:Slider('SMG',1,200,23,function(v)
    getgenv().Evolution.GunFOV.Smg = v
end)

fov:Slider('TacticalShotgun',1,200,24,function(v)
    getgenv().Evolution.GunFOV.TacticalShotgun = v
end)

fov:Slider('Silencer',1,200,17,function(v)
    getgenv().Evolution.GunFOV.Silencer = v
end)

fov:Slider('AK47',1,200,8,function(v)
    getgenv().Evolution.GunFOV.AK47 = v
end)

fov:Slider('AR',1,200,15,function(v)
    getgenv().Evolution.GunFOV.AR = v
end)

local memory = Window:Tab("Memory Spoofer")

memory:Toggle('Enabled',function(state)
    getgenv().Evolution.MemorySpoofer.Enabled = state
end)

memory:Slider('Minimum',1,800,100,function(v)
    getgenv().Evolution.MemorySpoofer.Values.Minimum = v
end)

memory:Slider('Maximum',1,1500,200,function(v)
    getgenv().Evolution.MemorySpoofer.Values.Maximum = v
end)
