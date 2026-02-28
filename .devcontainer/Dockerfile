FROM node:22-bookworm

RUN apt-get update && apt-get install -y \
    git curl wget bash sudo \
    && rm -rf /var/lib/apt/lists/*

# Instalar Claude Code globalmente
RUN npm install -g @anthropic-ai/claude-code

# Dar permissoes ao usuario node
RUN echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER node
WORKDIR /workspace
