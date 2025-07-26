-- Verificar se o hub já está rodando
if game.CoreGui:FindFirstChild("Rayfield") then
    warn("Hub já está em execução! Fechando instância anterior...")
    game.CoreGui:FindFirstChild("Rayfield"):Destroy()
    wait(1) -- Aguardar limpeza
end

-- Carregar Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Criar janela principal
local Window = Rayfield:CreateWindow({
    Name = "Vox Hub",
    LoadingTitle = "Vox Hub v1.4",
    LoadingSubtitle = "by alemao027",
    ConfigurationSaving = {
        Enabled = true,
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

-- ========================
-- ABA PRINCIPAL
-- ========================

local MainTab = Window:CreateTab("🏠 Main", 4483345998)

-- ========================
-- CONFIGURAÇÕES WEBHOOK
-- ========================

MainTab:CreateSection("📊 Webhook Configuration")

-- Input para URL do Webhook
local WebhookInput = MainTab:CreateInput({
    Name = "🔗 Discord Webhook URL",
    PlaceholderText = "Cole sua URL do webhook Discord aqui...",
    RemoveTextAfterFocusLost = false,
    Flag = "WebhookURL",
    Callback = function(Text)
        webhookUrl = Text
        if Text ~= "" then
            Rayfield:Notify({
                Title = "Webhook Configurado",
                Content = "URL salva com sucesso!",
                Duration = 3,
                Image = 4483345998
            })
        end
    end,
})

-- Botão para testar webhook
MainTab:CreateButton({
    Name = "🧪 Testar Webhook",
    Callback = function()
        if webhookUrl == "" then
            Rayfield:Notify({
                Title = "Erro",
                Content = "Configure a URL do webhook primeiro!",
                Duration = 3,
                Image = 4483345998
            })
            return
        end
        
        pcall(function()
            local testEmbed = {
                ["embeds"] = {{
                    ["title"] = "✅ Teste do Webhook",
                    ["description"] = "Webhook configurado com sucesso!",
                    ["fields"] = {
                        {["name"] = "👤 Player", ["value"] = game.Players.LocalPlayer.Name, ["inline"] = true},
                        {["name"] = "🎮 Jogo", ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, ["inline"] = true},
                        {["name"] = "⏰ Teste", ["value"] = os.date("%H:%M:%S"), ["inline"] = true}
                    },
                    ["footer"] = {["text"] = "Vox Hub v1.4 - by alemao027"},
                    ["color"] = 65280
                }}
            }
            
            local HttpService = game:GetService("HttpService")
            local httpRequest = http_request or request or syn.request
            
            if httpRequest then
                httpRequest({
                    Url = webhookUrl,
                    Method = "POST",
                    Headers = {["Content-Type"] = "application/json"},
                    Body = HttpService:JSONEncode(testEmbed)
                })
                
                Rayfield:Notify({
                    Title = "Teste Enviado",
                    Content = "Verifique seu Discord!",
                    Duration = 3,
                    Image = 4483345998
                })
            else
                Rayfield:Notify({
                    Title = "Erro",
                    Content = "Executor não suporta HTTP requests!",
                    Duration = 3,
                    Image = 4483345998
                })
            end
        end)
    end,
})

-- Slider para intervalo do webhook
local WebhookIntervalSlider = MainTab:CreateSlider({
    Name = "⏱️ Intervalo dos Relatórios",
    Range = {1, 30},
    Increment = 1,
    Suffix = " min",
    CurrentValue = 5,
    Flag = "WebhookInterval",
    Callback = function(Value)
        webhookInterval = Value * 60 -- Converter minutos para segundos
        Rayfield:Notify({
            Title = "Intervalo Atualizado",
            Content = "Relatórios a cada " .. Value .. " minuto(s)",
            Duration = 2,
            Image = 4483345998
        })
    end,
})

MainTab:CreateSection("⚡ Auto Functions")

-- Auto Swing Toggle
local AutoSwingToggle = MainTab:CreateToggle({
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
local AutoSellToggle = MainTab:CreateToggle({
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
local AutoBuyWeaponToggle = MainTab:CreateToggle({
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
local AutoBuyDNAToggle = MainTab:CreateToggle({
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

-- Seção de botões
MainTab:CreateSection("🛠️ Utilities")

-- Infinite Yield Button
local InfiniteYieldButton = MainTab:CreateButton({
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

-- Rejoin Button
local RejoinButton = MainTab:CreateButton({
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
            else
                warn("Erro ao tentar rejoin!")
            end
        end)
    end,
})

-- Debug Button
local DebugButton = MainTab:CreateButton({
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
        print("=== END DEBUG INFO ===")
        
        Rayfield:Notify({
            Title = "Debug Info",
            Content = "Informações enviadas para o console!",
            Duration = 3,
            Image = 4483345998
        })
    end,
})

-- ========================
-- ABA CHANGELOG
-- ========================

local ChangelogTab = Window:CreateTab("📋 Changelog", 7733964370)

-- v1.3 - Versão Atual
ChangelogTab:CreateSection("🚀 Versão 1.3 - 26/07/2025")
ChangelogTab:CreateParagraph({
    Title = "✨ Novas Funcionalidades",
    Content = "• Migração para Rayfield UI Library\n• Interface moderna e responsiva\n• Sistema de notificações aprimorado\n• Melhor experiência visual"
})
ChangelogTab:CreateParagraph({
    Title = "🔧 Melhorias",
    Content = "• Auto Swing otimizado (0.1s)\n• Notificações em tempo real\n• Performance aprimorada\n• Design mais elegante"
})
ChangelogTab:CreateParagraph({
    Title = "🐛 Correções",
    Content = "• Corrigida estabilidade da UI\n• Melhorado sistema anti-crash\n• Fixados conflitos de interface"
})

ChangelogTab:CreateSection("🎯 Versão 1.2 - 25/07/2025")
ChangelogTab:CreateParagraph({
    Title = "⚡ Funcionalidades",
    Content = "• Sistema de Toggle implementado\n• Infinite Yield integrado\n• Debug Info adicionado\n• Loops automáticos otimizados"
})
ChangelogTab:CreateParagraph({
    Title = "🛡️ Segurança",
    Content = "• Sistema anti-crash com pcall()\n• Timeouts em WaitForChild\n• Detecção melhorada de eventos\n• Tratamento robusto de erros"
})

ChangelogTab:CreateSection("🔧 Versão 1.1 - 24/07/2025")
ChangelogTab:CreateParagraph({
    Title = "🆕 Adições",
    Content = "• Auto Buy DNA System\n• Auto Buy Weapons System\n• Função Rejoin automática\n• Melhor organização da interface"
})
ChangelogTab:CreateParagraph({
    Title = "📈 Otimizações",
    Content = "• Velocidade de carregamento\n• Uso otimizado de memória\n• Estabilidade geral melhorada\n• Performance dos loops"
})

ChangelogTab:CreateSection("🎉 Versão 1.0 - 23/07/2025")
ChangelogTab:CreateParagraph({
    Title = "🚀 Lançamento Inicial",
    Content = "• Primeira versão do Vox Hub\n• Sistema básico de Auto Sell\n• Base sólida para desenvolvimento\n• Criado por alemao027"
})

-- Estatísticas
ChangelogTab:CreateSection("📊 Estatísticas do Hub")
ChangelogTab:CreateParagraph({
    Title = "📈 Informações Gerais",
    Content = "• Total de Versões: 4\n• Funcionalidades Ativas: 7\n• Tempo de Desenvolvimento: 4 dias\n• UI Library: Rayfield"
})
ChangelogTab:CreateParagraph({
    Title = "👤 Desenvolvedor",
    Content = "• Nome: alemao027\n• Especialidade: Automation Scripts\n• Status: Desenvolvimento Ativo\n• Versão Atual: 1.3"
})

-- ========================
-- FINALIZAÇÃO
-- ========================

-- Notificação de carregamento
Rayfield:Notify({
    Title = "Vox Hub v1.4",
    Content = "Carregado com sucesso! Desenvolvido por alemao027",
    Duration = 5,
    Image = 4483345998
})

print("🚀 Vox Hub v1.4 carregado com sucesso!")
print("👨‍💻 Desenvolvido por: alemao027")
print("📚 UI Library: Rayfield")
print("🎯 Status: Pronto para uso!")