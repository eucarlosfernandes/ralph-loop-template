# Imagem base: Node.js 22 LTS sobre Debian Bookworm (estável)
# Node 22 é a versão LTS mais recente, Bookworm garante pacotes atualizados e estáveis
FROM node:22-bookworm

# Instalar ferramentas essenciais:
#   git   - controle de versão (o Ralph Loop faz commits automáticos)
#   curl  - requisições HTTP (útil para instalar ferramentas e testar APIs)
#   wget  - download de arquivos
#   bash  - shell padrão para os scripts do Ralph Loop
#   sudo  - permite o usuário 'node' instalar pacotes sem ser root
RUN apt-get update && apt-get install -y \
    git curl wget bash sudo \
    && rm -rf /var/lib/apt/lists/*

# Instalar Claude Code globalmente para estar disponível em qualquer diretório
RUN npm install -g @anthropic-ai/claude-code

# Permitir que o usuário 'node' use sudo sem senha
# Necessário para instalar pacotes adicionais dentro do container em tempo de execução
RUN echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Trocar para o usuário 'node' (não-root) por segurança
USER node
WORKDIR /workspace
