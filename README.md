# ⚔️ Vox Hub v1.4

**Autor:** alemao027  
**UI Library:** Rayfield  
**Status:** ✅ Ativo e Atualizado

Um hub moderno e completo para automatizar suas ações no jogo, construído com a **Rayfield UI Library** para uma experiência visual premium e intuitiva.

## 🚀 Recursos

### ⚡ Funções Automáticas (Toggles)
- **⚔️ Auto Swing** - Executa swing automático a cada 0.1s para treino rápido e eficiente
- **💰 Auto Sell** - Vende força automaticamente a cada 1s com notificações visuais
- **🗡️ Auto Buy Best Weapon** - Compra automaticamente as melhores armas a cada 2s
- **🧬 Auto Buy DNA** - Compra DNA automaticamente a cada 2s para upgrades

### 📊 Sistema de Webhook Premium
- **🔗 URL Personalizada** - Configure sua própria URL do Discord webhook
- **⏱️ Intervalo Personalizável** - Escolha entre 1-30 minutos para relatórios
- **🧪 Teste Integrado** - Botão para testar se o webhook está funcionando
- **💾 Salvamento Automático** - Todas as configurações são salvas automaticamente
- **📈 Relatórios Detalhados** - Coins, Crowns, Diamonds, Elements, EventCoins, Strength

### 🛠️ Utilidades Premium
- **📜 Infinite Yield** - Carrega o popular script de administração com feedback
- **🔄 Rejoin Server** - Reconecta automaticamente ao servidor com notificação
- **🔍 Debug Info** - Mostra informações detalhadas para solução de problemas
- **📋 Changelog** - Histórico completo de atualizações integrado

### ✨ Interface Moderna (Rayfield)
- **🎨 Design Premium** - Interface elegante com tema escuro
- **🔔 Notificações Visuais** - Feedback em tempo real para todas as ações
- **📱 Layout Responsivo** - Organização intuitiva com seções definidas
- **⚡ Performance Otimizada** - Carregamento rápido e operação fluida

## 📋 Como Usar

### 🎯 Instalação Rápida
```lua
loadstring(game:HttpGet('https://raw.githubusercontent.com/NyxDevidk/VoxHub/refs/heads/main/main.lua'))()
```

### 🎮 Operação
1. **Execute o script** no seu executor favorito
2. **Aguarde o loading screen** da Rayfield carregar
3. A interface será exibida automaticamente com **notificação de boas-vindas**
4. **Configure o webhook** (opcional) na seção "📊 Webhook Configuration"
5. **Ajuste o intervalo** dos relatórios usando o slider (1-30 min)
6. Use os **toggles** para ativar/desativar funções automáticas
7. Acesse a aba **📋 Changelog** para ver atualizações

### 📊 Configuração do Webhook (Novo!)
1. **Cole sua URL** do Discord webhook no campo de input
2. **Ajuste o intervalo** dos relatórios (1-30 minutos)
3. **Teste o webhook** usando o botão "🧪 Testar Webhook"
4. **Ative o toggle** "📊 Auto Webhook Stats" para iniciar relatórios
5. **Receba relatórios** automáticos no Discord com todas as suas stats

### 🎯 Sistema de Toggles
- **🟢 Ativado** = Toggle ligado (azul/verde brilhante)
- **🔴 Desativado** = Toggle desligado (cinza)
- **🔔 Notificações** = Feedback visual instantâneo para cada ação
- **⚡ Múltiplos** = Vários toggles podem ficar ativos simultaneamente

### 📱 Navegação
- **🏠 Main** = Funcionalidades principais, configurações e toggles automáticos
- **📋 Changelog** = Histórico completo de atualizações e versões

## ⚙️ Características Técnicas

### 🎨 Interface Rayfield
- **Design Premium** com tema escuro elegante
- **Animações suaves** e transições fluidas  
- **Loading screen** personalizada com branding
- **Sistema de notificações** integrado e responsivo
- **Layout moderno** com seções organizadas

### 🔒 Segurança Avançada
- **Tratamento completo de erros** com `pcall()` em todas as funções
- **Verificação de eventos** antes da execução para evitar crashes
- **Timeouts inteligentes** para evitar travamentos (5s limite)
- **Detecção automática** de instâncias duplicadas com limpeza
- **Sistema anti-conflito** de GUI integrado

### 🎯 Otimização Premium
- **Threads separadas** (`spawn()`) para cada função automática
- **Intervalos otimizados** baseados no tipo de ação
- **Uso eficiente de recursos** sem desperdício de memória
- **Performance aprimorada** com carregamento rápido
- **Sistema de flags** para configurações persistentes

### 🛡️ Compatibilidade Total
- **Sistema anti-conflito** de GUI automático
- **Detecção inteligente** de instâncias duplicadas
- **Carregamento com fallback** em caso de erro de rede
- **Debug integrado** para solução rápida de problemas
- **Suporte multiplataforma** (PC/Mobile otimizado)

## 🔧 Intervalos de Execução

| Função | Intervalo | Motivo | Notificação |
|--------|-----------|--------|-------------|
| ⚔️ Auto Swing | 0.1s | Treino rápido e eficiente | ✅ Visual |
| 💰 Auto Sell | 1.0s | Velocidade balanceada | ✅ Visual |
| 🗡️ Auto Buy Weapon | 2.0s | Evitar spam de compras | ✅ Visual |
| 🧬 Auto Buy DNA | 2.0s | Evitar spam de compras | ✅ Visual |

## 🎨 Novidades da Rayfield v1.3

### ✨ Interface Moderna
- **🎭 Tema Premium** - Design elegante com cores vibrantes
- **🔔 Notificações Inteligentes** - Feedback visual para cada ação
- **📱 Layout Responsivo** - Organização intuitiva e limpa
- **⚡ Loading Personalizado** - Tela de carregamento com branding

### 🚀 Funcionalidades Aprimoradas
- **🎯 Sistema de Flags** - Configurações mais estáveis
- **📋 Changelog Integrado** - Histórico completo na interface
- **🔍 Debug Melhorado** - Informações detalhadas no console
- **🛡️ Segurança Reforçada** - Tratamento robusto de erros

## 🚨 Solução de Problemas

### ❌ Hub não carrega
- **Verificar conexão** com a internet e estabilidade
- **Reexecutar o script** aguardando o loading screen
- **Usar Debug Info** para identificar problemas específicos
- **Verificar executor** se suporta a Rayfield Library

### ⚠️ Funções não funcionam  
- **Verificar eventos** se não mudaram com updates do jogo
- **Usar Debug Info** para listar eventos disponíveis no ReplicatedStorage
- **Confirmar jogo correto** - hub específico para o jogo suportado
- **Checar notificações** para feedback de erro em tempo real

### 🔄 Interface duplicada
- **Detecção automática** - o script remove instâncias anteriores automaticamente
- **Aguardar limpeza** - wait de 1 segundo integrado para estabilidade  
- **Recarregar se persistir** - executar novamente em caso de problema

### 📱 Problemas de performance
- **Desativar toggles** desnecessários para reduzir carga
- **Verificar executor** se está sobrecarregado
- **Usar modo debug** para monitorar uso de recursos

## 📞 Suporte & Informações

- **👨‍💻 Desenvolvedor:** alemao027
- **🎨 UI Library:** Rayfield (Premium)
- **📅 Versão Atual:** 1.3 (26/07/2025)
- **⏱️ Última Atualização:** Migração para Rayfield
- **🔧 Status:** ✅ Desenvolvimento Ativo

## 📜 Histórico de Versões

### 🚀 v1.3 (Atual) 
- **Migração para Rayfield UI Library**
- **Sistema de notificações premium**
- **Interface moderna e responsiva**
- **Performance otimizada**

### 🎯 v1.2
- **Sistema de toggles implementado**
- **Infinite Yield integrado**
- **Melhorias de segurança**

### 🔧 v1.1  
- **Auto Buy systems adicionados**
- **Função Rejoin implementada**
- **Otimizações gerais**

### 🎉 v1.0
- **Lançamento inicial**
- **Auto Sell básico**
- **Base do projeto**

## 📊 Estatísticas

- **📈 Total de Versões:** 4
- **⚡ Funcionalidades Ativas:** 7
- **🕒 Tempo de Desenvolvimento:** 4 dias
- **🎨 UI Library:** Rayfield (Premium)
- **👥 Usuários Ativos:** Em crescimento

## ⚠️ Aviso Legal

Este script é fornecido apenas para fins educacionais. Use por sua própria conta e risco. O autor não se responsabiliza por qualquer consequência do uso deste script.

---

**✨ Desenvolvido com paixão por alemao027**  
**🎨 Powered by Rayfield UI Library**  
**🚀 Experiência Premium Garantida**