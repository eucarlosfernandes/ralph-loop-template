#!/bin/bash

# ===========================================
# Cria um novo projeto a partir do template
# Ralph Loop
# ===========================================

set -e

# Cores para output
VERDE='\033[0;32m'
AMARELO='\033[1;33m'
VERMELHO='\033[0;31m'
AZUL='\033[0;34m'
NC='\033[0m' # Sem cor

DESTINO_BASE="$HOME/projetos"
TEMPLATE_DIR="$(cd "$(dirname "$0")" && pwd)"

# Verificar se o nome do projeto foi passado
if [ -z "$1" ]; then
  echo -e "${VERMELHO}Erro: Informe o nome do projeto.${NC}"
  echo ""
  echo "Uso: ./novo-projeto.sh <nome-do-projeto>"
  echo ""
  echo "Exemplo: ./novo-projeto.sh meu-app-incrivel"
  exit 1
fi

NOME_PROJETO="$1"
DESTINO="$DESTINO_BASE/$NOME_PROJETO"

# Verificar se o destino já existe
if [ -d "$DESTINO" ]; then
  echo -e "${VERMELHO}Erro: O diretório '$DESTINO' já existe.${NC}"
  echo "Escolha outro nome ou remova o diretório existente."
  exit 1
fi

echo -e "${AZUL}=========================================${NC}"
echo -e "${AZUL} Ralph Loop - Criando novo projeto${NC}"
echo -e "${AZUL}=========================================${NC}"
echo ""
echo -e "Projeto: ${VERDE}$NOME_PROJETO${NC}"
echo -e "Destino: ${VERDE}$DESTINO${NC}"
echo ""

# Criar diretório do projeto
mkdir -p "$DESTINO"

# Copiar arquivos do template
echo -e "${AMARELO}Copiando template...${NC}"

# Copiar estrutura (excluindo o próprio script e .git se existir)
cp -r "$TEMPLATE_DIR/.devcontainer" "$DESTINO/"
cp -r "$TEMPLATE_DIR/.claude" "$DESTINO/"
cp -r "$TEMPLATE_DIR/scripts" "$DESTINO/"
cp "$TEMPLATE_DIR/CLAUDE.md" "$DESTINO/"
cp "$TEMPLATE_DIR/PRD.md" "$DESTINO/"
cp "$TEMPLATE_DIR/guia.md" "$DESTINO/"
cp "$TEMPLATE_DIR/.gitignore" "$DESTINO/"

# Dar permissão de execução ao ralph.sh
chmod +x "$DESTINO/scripts/ralph/ralph.sh"

# Inicializar git
echo -e "${AMARELO}Inicializando repositório git...${NC}"
cd "$DESTINO"
git init -q
git add .
git commit -q -m "feat: setup inicial do projeto com Ralph Loop template"

echo ""
echo -e "${VERDE}=========================================${NC}"
echo -e "${VERDE} Projeto criado com sucesso!${NC}"
echo -e "${VERDE}=========================================${NC}"
echo ""
echo -e "Próximos passos:"
echo ""
echo -e "  1. Abra o projeto no VS Code:"
echo -e "     ${AZUL}code $DESTINO${NC}"
echo ""
echo -e "  2. Reabra no Dev Container:"
echo -e "     ${AZUL}Ctrl+Shift+P > 'Reopen in Container'${NC}"
echo ""
echo -e "  3. Faça login no Claude Code dentro do container:"
echo -e "     ${AZUL}claude${NC}"
echo ""
echo -e "  4. Edite o PRD.md com o que você quer construir"
echo ""
echo -e "  5. Rode o Ralph Loop:"
echo -e "     ${AZUL}./scripts/ralph/ralph.sh${NC}"
echo ""
echo -e "Consulte o ${AMARELO}guia.md${NC} para mais detalhes."
