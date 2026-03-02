# Ralph Loop Template

Template pronto para criar projetos de software com um agente autônomo. Você descreve o que quer construir em um PRD, roda um script e o agente implementa tarefa por tarefa, sozinho.

## O que é

Um ambiente pré-configurado que combina:

- **Claude Code + Opus 4.6** — agente de codificação autônomo que lê o PRD, executa as tarefas, faz commits e rastreia o progresso
- **Dev Container** — ambiente Docker reproduzível com tudo instalado (Node.js, Git, Claude Code), sem poluir sua máquina
- **PRD de exemplo** — modelo de documento de requisitos estruturado para o agente entender e executar suas tarefas em ordem
- **Ralph Loop** — script que orquestra o ciclo: lê PRD → executa tarefa → atualiza progresso → reseta contexto → repete

## Como funciona

1. Você escreve o que quer construir no `PRD.md` (funcionalidades, tarefas, stack)
2. O script `ralph.sh` inicia o loop autônomo
3. A cada iteração, o Claude Code lê o PRD e o `progress.txt`, completa a próxima tarefa pendente, faz commit e atualiza o progresso
4. O contexto é resetado entre iterações (o `progress.txt` serve como memória)
5. Quando todas as tarefas estão concluídas, o agente cria um `DONE.md` e encerra

## Pré-requisitos

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) instalado e rodando
- [VS Code](https://code.visualstudio.com/) com a extensão [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- Conta na [Anthropic](https://console.anthropic.com/) (plano Max recomendado)

## Quick Start

1. Clone o repositório:
   ```bash
   git clone https://github.com/eucarlosfernandes/ralph-loop-template.git meu-projeto
   cd meu-projeto
   ```

2. Abra no VS Code:
   ```bash
   code .
   ```

3. Reabra no Dev Container (`Ctrl+Shift+P` → `Dev Containers: Reopen in Container`)

4. No terminal do container, faça login no Claude Code:
   ```bash
   claude
   ```

5. Edite o `PRD.md` com o que quer construir e rode o loop:
   ```bash
   nano PRD.md
   ./scripts/ralph/ralph.sh
   ```

## Estrutura

```
├── PRD.md                  # Seu documento de requisitos (edite este arquivo)
├── CLAUDE.md               # Instruções que o agente segue a cada iteração
├── scripts/ralph/ralph.sh  # Script que orquestra o loop autônomo
└── .devcontainer/          # Configuração do ambiente Docker
```

## Configuração

O número de iterações pode ser ajustado via variável de ambiente:

```bash
MAX_ITERATIONS=20 ./scripts/ralph/ralph.sh
```

O padrão é 10 iterações.
