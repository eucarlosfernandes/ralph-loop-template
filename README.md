# Ralph Loop Template

Template para criar projetos de software com um agente autônomo (Claude Code) que executa tarefas a partir de um PRD.

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
