#!/bin/bash

# ===========================================
# Ralph Loop - Script Principal
# Orquestra o loop autônomo do Claude Code
# ===========================================

MAX_ITERATIONS=${MAX_ITERATIONS:-10}
MODEL="claude-opus-4-6"

# Criar progress.txt se não existir
if [ ! -f progress.txt ]; then
  echo "# Rastreador de Progresso" > progress.txt
  echo "" >> progress.txt
  echo "## Status: EM ANDAMENTO" >> progress.txt
  echo "" >> progress.txt
  echo "Nenhuma tarefa concluída ainda." >> progress.txt
fi

echo "========================================="
echo " Ralph Loop - Iniciando"
echo " Iterações máximas: $MAX_ITERATIONS"
echo " Modelo: $MODEL"
echo "========================================="

for i in $(seq 1 $MAX_ITERATIONS); do
  echo ""
  echo "--- Iteração Ralph $i de $MAX_ITERATIONS ---"
  echo ""

  # Prompt que o Claude recebe a cada iteração
  PROMPT="Leia PRD.md e progress.txt. \
Complete a próxima tarefa incompleta. \
Atualize progress.txt quando terminar. \
Se todas as tarefas estiverem completas, crie um arquivo \
chamado DONE.md e encerre."

  # Executar Claude Code (mata e reinicia a cada vez)
  claude --dangerously-skip-permissions \
    --model $MODEL \
    --print \
    --max-turns 30 \
    "$PROMPT"

  # Checar se o projeto foi concluído
  if [ -f DONE.md ]; then
    echo ""
    echo "========================================="
    echo " PROJETO CONCLUÍDO na iteração $i"
    echo "========================================="
    exit 0
  fi

  echo "--- Iteração $i concluída. Resetando contexto... ---"
  sleep 2
done

echo ""
echo "Limite de $MAX_ITERATIONS iterações atingido."
echo "Verifique progress.txt para o status atual."
