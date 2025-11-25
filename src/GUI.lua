local GUI = {}

function GUI.Create()
    local Players = game:GetService("Players")
    local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    
    -- Основной интерфейс
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "BrainrotFarmerGUI"
    ScreenGui.Parent = PlayerGui
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 350, 0, 400)
    MainFrame.Position = UDim2.new(0, 10, 0, 10)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    MainFrame.Parent = ScreenGui
    
    -- Заголовок
    local Title = Instance.new("TextLabel")
    Title.Text = "🧠 BRAINROT FARMER"
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Parent = MainFrame
    
    -- Кнопки управления
    local StartButton = Instance.new("TextButton")
    StartButton.Text = "🚀 START FARMING"
    StartButton.Size = UDim2.new(0.9, 0, 0, 50)
    StartButton.Position = UDim2.new(0.05, 0, 0, 50)
    StartButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    StartButton.Parent = MainFrame
    
    local StopButton = Instance.new("TextButton")
    StopButton.Text = "🛑 STOP FARMING"
    StopButton.Size = UDim2.new(0.9, 0, 0, 50)
    StopButton.Position = UDim2.new(0.05, 0, 0, 110)
    StopButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    StopButton.Parent = MainFrame
    
    -- Статус
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Text = "Status: Ready\nServers Loaded: 0\nPets Found: 0"
    StatusLabel.Size = UDim2.new(0.9, 0, 0, 150)
    StatusLabel.Position = UDim2.new(0.05, 0, 0, 180)
    StatusLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
    StatusLabel.TextYAlignment = Enum.TextYAlignment.Top
    StatusLabel.Parent = MainFrame
    
    return ScreenGui
end

return GUI
