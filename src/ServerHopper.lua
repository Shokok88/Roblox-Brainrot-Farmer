local ServerHopper = {}

local TeleportService = game:GetService("TeleportService")
local GAME_ID = 109983668079237

ServerHopper.Active = false
ServerHopper.CurrentServers = {}

function ServerHopper.LoadServerList()
    local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet(
        "https://raw.githubusercontent.com/your-username/Roblox-Brainrot-Farmer/main/config/servers.json"
    ))
    ServerHopper.CurrentServers = servers
    return servers
end

function ServerHopper.HopToBestServer()
    local servers = ServerHopper.LoadServerList()
    
    -- Сортировка серверов по доходу
    table.sort(servers, function(a, b)
        return a.moneyPerSec > b.moneyPerSec
    end)
    
    -- Телепортация на лучший сервер
    if #servers > 0 then
        local bestServer = servers[1]
        pcall(function()
            TeleportService:TeleportToPlaceInstance(GAME_ID, bestServer.instanceId)
        end)
        return bestServer
    end
end

function ServerHopper.StartLoop()
    ServerHopper.Active = true
    
    coroutine.wrap(function()
        while ServerHopper.Active do
            wait(30) -- Хоп каждые 30 секунд
            ServerHopper.HopToBestServer()
        end
    end)()
end

function ServerHopper.Stop()
    ServerHopper.Active = false
end

return ServerHopper
