-- Verificar se o hub já está rodando
if game.CoreGui:FindFirstChild("Orion") or game.CoreGui:FindFirstChild("OrionLib") then
    warn("Hub já está em execução! Fechando instância anterior...")
    for _, gui in pairs(game.CoreGui:GetChildren()) do
        if gui.Name == "Orion" or gui.Name == "OrionLib" or gui.Name:find("Orion") then
            gui:Destroy()
        end
    end
    wait(1) -- Aguardar limpeza
end

-- Carregar OrionLib com URL correta
local success, OrionLib = pcall(function()
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()
end)

if not success then
    warn("Erro ao carregar OrionLib:", OrionLib)
    error("Falha ao carregar OrionLib. Verifique sua conexão.")
    return
end

-- Aguardar um pouco antes de criar a janela
wait(0.5)

-- Criar janela com configurações mais seguras
local Window = OrionLib:MakeWindow({
    Name = "Vox Hub", 
    HidePremium = false, 
    SaveConfig = false, -- Desabilitado para evitar conflitos
    ConfigFolder = "VoxHubConfig",
    IntroEnabled = false -- Desabilitar intro para carregamento mais rápido
})

-- Criar aba principal
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Variáveis para controlar os loops automáticos
local autoSellEnabled = false
local autoBuyWeaponEnabled = false
local autoBuyDNAEnabled = false
local autoSwingEnabled = false

MainTab:AddToggle({
    Name = "Auto Swing",
    Default = false,
    Callback = function(Value)
        autoSwingEnabled = Value
        print("Auto Swing:", Value and "Ativado" or "Desativado")
        
        if Value then
            spawn(function()
                while autoSwingEnabled do
                    pcall(function()
                        local swingEvent = game:GetService("ReplicatedStorage"):WaitForChild("Events", 5):WaitForChild("SwingSaber", 5)
                        if swingEvent then
                            swingEvent:FireServer()
                        else
                            warn("Evento SwingSaber não encontrado!")
                        end
                    end)
                    wait(0.1) -- Intervalo rápido para swing contínuo
                end
            end)
        end
    end
})

-- Funções automáticas com toggles
MainTab:AddToggle({
    Name = "Auto Sell",
    Default = false,
    Callback = function(Value)
        autoSellEnabled = Value
        print("Auto Sell:", Value and "Ativado" or "Desativado")
        
        if Value then
            spawn(function()
                while autoSellEnabled do
                    pcall(function()
                        local sellEvent = game:GetService("ReplicatedStorage"):WaitForChild("Events", 5):WaitForChild("SellStrength", 5)
                        if sellEvent then
                            sellEvent:FireServer()
                        else
                            warn("Evento SellStrength não encontrado!")
                        end
                    end)
                    wait(1) -- Intervalo de 1 segundo
                end
            end)
        end
    end
})

MainTab:AddToggle({
    Name = "Auto Buy Best Weapon",
    Default = false,
    Callback = function(Value)
        autoBuyWeaponEnabled = Value
        print("Auto Buy Weapons:", Value and "Ativado" or "Desativado")
        
        if Value then
            spawn(function()
                while autoBuyWeaponEnabled do
                    pcall(function()
                        local uiEvent = game:GetService("ReplicatedStorage"):WaitForChild("Events", 5):WaitForChild("UIAction", 5)
                        if uiEvent then
                            uiEvent:FireServer("BuyAllWeapons")
                        else
                            warn("Evento UIAction não encontrado!")
                        end
                    end)
                    wait(2) -- Intervalo de 2 segundos
                end
            end)
        end
    end
})

MainTab:AddToggle({
    Name = "Auto Buy DNA",
    Default = false,
    Callback = function(Value)
        autoBuyDNAEnabled = Value
        print("Auto Buy DNA:", Value and "Ativado" or "Desativado")
        
        if Value then
            spawn(function()
                while autoBuyDNAEnabled do
                    pcall(function()
                        local uiEvent = game:GetService("ReplicatedStorage"):WaitForChild("Events", 5):WaitForChild("UIAction", 5)
                        if uiEvent then
                            uiEvent:FireServer("BuyAllDNAs")
                        else
                            warn("Evento UIAction não encontrado!")
                        end
                    end)
                    wait(2) -- Intervalo de 2 segundos
                end
            end)
        end
    end
})

MainTab:AddButton({
    Name = "Infinite Yield",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            print("Infinite Yield carregado!")
        end)
    end
})

MainTab:AddButton({
    Name = "Fechar UI",
    Callback = function()
        pcall(function()
            OrionLib:Destroy()
            print("UI fechada!")
        end)
    end
})

MainTab:AddButton({
    Name = "Rejoin",
    Callback = function()
        pcall(function()
            local TeleportService = game:GetService("TeleportService")
            local player = game.Players.LocalPlayer
            if player and game.PlaceId then
                TeleportService:Teleport(game.PlaceId, player)
            else
                warn("Erro ao tentar rejoin!")
            end
        end)
    end
})

-- Adicionar botão de debug
MainTab:AddButton({
    Name = "Debug Info",
    Callback = function()
        print("=== DEBUG INFO ===")
        print("Player:", game.Players.LocalPlayer.Name)
        print("PlaceId:", game.PlaceId)
        print("ReplicatedStorage Events:", game:GetService("ReplicatedStorage"):FindFirstChild("Events"))
        if game:GetService("ReplicatedStorage"):FindFirstChild("Events") then
            for _, event in pairs(game:GetService("ReplicatedStorage").Events:GetChildren()) do
                print("- Event:", event.Name)
            end
        end
        print("=== END DEBUG ===")
    end
})

-- Inicializar com tratamento de erro
local initSuccess = pcall(function()
    OrionLib:Init()
end)

if not initSuccess then
    warn("Erro ao inicializar OrionLib")
end

print("Vox Hub carregado com sucesso!")
