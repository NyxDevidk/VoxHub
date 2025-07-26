-- Verificar se o hub já está rodando
if game.CoreGui:FindFirstChild("Rayfield") then
    warn("Hub já está em execução! Fechando instância anterior...")
    game.CoreGui:FindFirstChild("Rayfield"):Destroy()
    wait(1)
end

-- Carregar Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Criar janela principal
local Window = Rayfield:CreateWindow({
    Name = "Vox Hub",
    LoadingTitle = "Vox Hub v1.3",
    LoadingSubtitle = "by alemao027",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = "VoxHubConfig",
        FileName = "VoxConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false
})

-- ========================
-- VARIÁVEIS DE CONTROLE
-- ========================

local autoSellEnabled = false
local autoBuyWeaponEnabled = false
local autoBuyDNAEnabled = false
local autoSwingEnabled = false
local autoWebhookEnabled = false

-- ========================
-- ABA PRINCIPAL
-- ========================

local MainTab = Window:CreateTab("🏠 Main", 4483345998)

-- Auto Swing Toggle
MainTab:CreateToggle({
    Name = "⚔️ Auto Swing",
    CurrentValue = false,
    Flag = "AutoSwingToggle",
    Callback = function(Value)
        autoSwingEnabled = Value
        Rayfield:Notify({
            Title = "Auto Swing",
            Content = Value and "Ativado!" or "Desativado!",
            Duration = 2,
            Image = 4483345998
        })
        
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
                    wait(0.1)
                end
            end)
        end
    end,
})

-- Auto Sell Toggle
MainTab:CreateToggle({
    Name = "💰 Auto Sell",
    CurrentValue = false,
    Flag = "AutoSellToggle",
    Callback = function(Value)
        autoSellEnabled = Value
        Rayfield:Notify({
            Title = "Auto Sell",
            Content = Value and "Ativado!" or "Desativado!",
            Duration = 2,
            Image = 4483345998
        })
        
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
                    wait(1)
                end
            end)
        end
    end,
})

-- Auto Buy Weapon Toggle
MainTab:CreateToggle({
    Name = "🗡️ Auto Buy Best Weapon",
    CurrentValue = false,
    Flag = "AutoBuyWeaponToggle",
    Callback = function(Value)
        autoBuyWeaponEnabled = Value
        Rayfield:Notify({
            Title = "Auto Buy Weapon",
            Content = Value and "Ativado!" or "Desativado!",
            Duration = 2,
            Image = 4483345998
        })
        
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
                    wait(2)
                end
            end)
        end
    end,
})

-- Auto Buy DNA Toggle
MainTab:CreateToggle({
    Name = "🧬 Auto Buy DNA",
    CurrentValue = false,
    Flag = "AutoBuyDNAToggle",
    Callback = function(Value)
        autoBuyDNAEnabled = Value
        Rayfield:Notify({
            Title = "Auto Buy DNA",
            Content = Value and "Ativado!" or "Desativado!",
            Duration = 2,
            Image = 4483345998
        })
        
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
                    wait(2)
                end
            end)
        end
    end,
})

-- Auto Webhook Stats Toggle
MainTab:CreateToggle({
    Name = "📊 Auto Webhook Stats",
    CurrentValue = false,
    Flag = "AutoWebhookStats",
    Callback = function(Value)
        autoWebhookEnabled = Value
        Rayfield:Notify({
            Title = "Auto Webhook",
            Content = Value and "Relatórios a cada 5 minutos ativados!" or "Desativado!",
            Duration = 3,
            Image = 4483345998
        })

        if Value then
            spawn(function()
                while autoWebhookEnabled do
                    pcall(function()
                        local path = game.Players.LocalPlayer.PlayerGui.MainGui.StartFrame.Currency

                        local data = {
                            Coins = path.Coins.Amount.Text,
                            Crowns = path.Crowns.Amount.Text,
                            Diamonds = path.Diamonds.Amount.Text,
                            Elements = path.Elements.Amount.Text,
                            EventCoins = path.EventCoins.Amount.Text,
                            Strength = path.Strength.Amount.Text,
                        }

                        local webhookUrl = "https://discord.com/api/webhooks/1398758795953438822/Ln4T3j3JkSgwOGgtDukEFFbyJn0rK4qc-PaqncY-29hFIBeQFBWP1YfZTlght_5ViyER" -- ⛔ Substitua isso pela sua URL real!

                        local embedData = {
                            ["embeds"] = {{
                                ["title"] = "📊 Vox Hub - Relatório Automático",
                                ["description"] = "Status do jogador:",
                                ["fields"] = {
                                    {["name"] = "💰 Coins", ["value"] = data.Coins, ["inline"] = true},
                                    {["name"] = "👑 Crowns", ["value"] = data.Crowns, ["inline"] = true},
                                    {["name"] = "💎 Diamonds", ["value"] = data.Diamonds, ["inline"] = true},
                                    {["name"] = "🔥 Elements", ["value"] = data.Elements, ["inline"] = true},
                                    {["name"] = "🎟️ EventCoins", ["value"] = data.EventCoins, ["inline"] = true},
                                    {["name"] = "⚔️ Strength", ["value"] = data.Strength, ["inline"] = true}
                                },
                                ["footer"] = {["text"] = "Vox Hub v1.3 - by alemao027"},
                                ["color"] = 5814783
                            }}
                        }

                        local HttpService = game:GetService("HttpService")
                        local httpRequest = http and http.request or syn and syn.request or request

                        if httpRequest then
                            httpRequest({
                                Url = webhookUrl,
                                Method = "POST",
                                Headers = {["Content-Type"] = "application/json"},
                                Body = HttpService:JSONEncode(embedData)
                            })
                        else
                            warn("Exploit não suporta envio HTTP.")
                        end
                    end)

                    wait(300)
                end
            end)
        end
    end,
})

-- Botões utilitários
MainTab:CreateSection("🛠️ Utilities")

MainTab:CreateButton({
    Name = "📜 Infinite Yield",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            Rayfield:Notify({
                Title = "Infinite Yield",
                Content = "Carregado com sucesso!",
                Duration = 3,
                Image = 4483345998
            })
        end)
    end,
})

MainTab:CreateButton({
    Name = "🔄 Rejoin Server",
    Callback = function()
        pcall(function()
            local TeleportService = game:GetService("TeleportService")
            local player = game.Players.LocalPlayer
            if player and game.PlaceId then
                Rayfield:Notify({
                    Title = "Rejoin",
                    Content = "Reconectando...",
                    Duration = 2,
                    Image = 4483345998
                })
                wait(1)
                TeleportService:Teleport(game.PlaceId, player)
            end
        end)
    end,
})

MainTab:CreateButton({
    Name = "🔍 Debug Info",
    Callback = function()
        print("=== VOX HUB DEBUG INFO ===")
        print("Player:", game.Players.LocalPlayer.Name)
        print("PlaceId:", game.PlaceId)
        print("ReplicatedStorage Events:", game:GetService("ReplicatedStorage"):FindFirstChild("Events"))
        if game:GetService("ReplicatedStorage"):FindFirstChild("Events") then
            for _, event in pairs(game:GetService("ReplicatedStorage").Events:GetChildren()) do
                print("- Event:", event.Name)
            end
        end
        Rayfield:Notify({
            Title = "Debug Info",
            Content = "Informações enviadas para o console!",
            Duration = 3,
            Image = 4483345998
        })
    end,
})

-- Notificação de carregamento
Rayfield:Notify({
    Title = "Vox Hub v1.3",
    Content = "Carregado com sucesso! Desenvolvido por alemao027",
    Duration = 5,
    Image = 4483345998
})

print("🚀 Vox Hub v1.3 carregado com sucesso!")
print("👨‍💻 Desenvolvido por: alemao027")
print("📚 UI Library: Rayfield")
print("🎯 Status: Pronto para uso!")
