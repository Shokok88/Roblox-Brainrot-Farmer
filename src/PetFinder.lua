local PetFinder = {}

PetFinder.Scanning = false
PetFinder.Threshold = 500000

function PetFinder.ScanForValuablePets()
    local valuablePets = {}
    
    for _, obj in pairs(workspace:GetDescendants()) do
        if PetFinder.IsValuablePet(obj) then
            table.insert(valuablePets, {
                Object = obj,
                Name = obj.Name,
                Position = obj:IsA("Model") and obj:FindFirstChild("HumanoidRootPart") and obj.HumanoidRootPart.Position
            })
        end
    end
    
    return valuablePets
end

function PetFinder.IsValuablePet(obj)
    -- Проверка по доходу
    if obj:FindFirstChild("MoneyPerSec") then
        return obj.MoneyPerSec.Value >= PetFinder.Threshold
    end
    
    -- Проверка по имени
    local valuableNames = {"Brainrot", "Orcalero", "Legendary", "Mythical"}
    for _, name in pairs(valuableNames) do
        if string.find(obj.Name, name) then
            return true
        end
    end
    
    return false
end

function PetFinder.StartScanning()
    PetFinder.Scanning = true
    
    coroutine.wrap(function()
        while PetFinder.Scanning do
            local pets = PetFinder.ScanForValuablePets()
            
            if #pets > 0 then
                PetFinder.NotifyPetsFound(pets)
            end
            
            wait(5) -- Сканирование каждые 5 секунд
        end
    end)()
end

function PetFinder.NotifyPetsFound(pets)
    for _, pet in pairs(pets) do
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "🎯 VALUABLE PET FOUND",
            Text = pet.Name .. " detected!",
            Duration = 5
        })
    end
end

return PetFinder
