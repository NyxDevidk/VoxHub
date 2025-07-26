# 🗡️ Vox Hub

**Autor:** alemao027

Um hub completo e otimizado para automatizar suas ações no jogo, construído com a Orion UI Library para uma experiência visual limpa e intuitiva.

## 🚀 Recursos

### ⚡ Funções Automáticas (Toggles)
- **Auto Swing** - Executa swing automático a cada 0.1s para treino rápido
- **Auto Sell** - Vende força automaticamente a cada 1s
- **Auto Buy Best Weapon** - Compra automaticamente as melhores armas a cada 2s
- **Auto Buy DNA** - Compra DNA automaticamente a cada 2s

### 🛠️ Utilidades
- **Infinite Yield** - Carrega o popular script de administração
- **Rejoin** - Reconecta automaticamente ao servidor
- **Debug Info** - Mostra informações úteis para solução de problemas
- **Fechar UI** - Fecha a interface do hub adequadamente

## 📋 Como Usar

### Instalação
```lua
loadstring(game:HttpGet('https://raw.githubusercontent.com/[SEU_REPO]/vox-hub/main/script.lua'))()
```

### Operação
1. Execute o script no seu executor favorito
2. A interface será carregada automaticamente
3. Use os **toggles** para ativar/desativar funções automáticas
4. Use os **botões** para executar ações únicas

### Toggles
- **Verde/Azul** = Ativado
- **Cinza** = Desativado
- Você pode ter múltiplos toggles ativos simultaneamente

## ⚙️ Características Técnicas

### 🔒 Segurança
- Tratamento completo de erros com `pcall()`
- Verificação de eventos antes da execução
- Timeouts para evitar travamentos
- Limpeza adequada de instâncias anteriores

### 🎯 Otimização
- Threads separadas para cada função automática
- Intervalos otimizados para cada tipo de ação
- Uso eficiente de recursos
- Interface responsiva sem lag

### 🛡️ Compatibilidade
- Sistema anti-conflito de GUI
- Detecção automática de instâncias duplicadas
- Carregamento com fallback em caso de erro
- Suporte a debug integrado

## 🔧 Intervalos de Execução

| Função | Intervalo | Motivo |
|--------|-----------|--------|
| Auto Swing | 0.1s | Treino rápido e eficiente |
| Auto Sell | 1.0s | Velocidade balanceada |
| Auto Buy Weapon | 2.0s | Evitar spam de compras |
| Auto Buy DNA | 2.0s | Evitar spam de compras |

## 🚨 Solução de Problemas

### Hub não carrega
- Verifique sua conexão com a internet
- Execute novamente o script
- Use o botão "Debug Info" para identificar problemas

### Funções não funcionam
- Verifique se os eventos do jogo não mudaram
- Use o "Debug Info" para ver eventos disponíveis
- Certifique-se de estar no jogo correto

### Interface duplicada
- O script detecta e remove automaticamente instâncias anteriores
- Se persistir, use "Fechar UI" e execute novamente

## 📞 Suporte

- **Autor:** alemao027
- **Versão:** 1.0
- **Última Atualização:** 2025

## 📜 Notas

- Este hub foi desenvolvido com foco na estabilidade e facilidade de uso
- Todas as funções possuem tratamento de erro para evitar crashes
- A interface é construída com a confiável Orion UI Library
- O código é otimizado para performance e compatibilidade

## ⚠️ Aviso Legal

Este script é fornecido apenas para fins educacionais. Use por sua própria conta e risco. O autor não se responsabiliza por qualquer consequência do uso deste script.

---

**Desenvolvido com ❤️ por alemao027**
