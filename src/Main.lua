-- Roblox Brainrot Farmer - Combined System
-- GitHub: https://github.com/your-username/Roblox-Brainrot-Farmer

local MainModule = {}

-- Загрузка конфигурации
function MainModule.LoadConfig()
    return game:GetService("HttpService"):JSONDecode(game:HttpGet(
        "https://raw.githubusercontent.com/your-username/Roblox-Brainrot-Farmer/main/config/servers.json"
    ))
end

-- Инициализация системы
function MainModule.Init()
    local config = MainModule.LoadConfig()
    
    -- Загрузка модулей
    local ServerHopper = loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/your-username/Roblox-Brainrot-Farmer/main/src/ServerHopper.lua"
    ))()
    
    local PetFinder = loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/your-username/Roblox-Brainrot-Farmer/main/src/PetFinder.lua"
    ))()
    
    local GUI = loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/your-username/Roblox-Brainrot-Farmer/main/src/GUI.lua"
    ))()
    
    return {
        ServerHopper = ServerHopper,
        PetFinder = PetFinder,
        GUI = GUI,
        Config = config
    }
end

-- Запуск системы
function MainModule.Start()
    local system = MainModule.Init()
    system.GUI.Create()
    system.ServerHopper.StartLoop()
    system.PetFinder.StartScanning()
end

return MainModule
