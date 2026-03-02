#!/bin/bash

# ===========================================
# Ralph Loop - Script Principal
# Orquestra o loop autônomo do Claude Code
#
# Funcionamento:
#   1. O Claude lê o PRD.md e o progress.txt
#   2. Executa a próxima tarefa pendente
#   3. Atualiza o progress.txt e faz commit
#   4. O contexto é resetado (nova iteração)
#   5. Repete até criar o arquivo DONE.md
# ===========================================

# Número máximo de iterações (pode ser alterado via variável de ambiente)
# Exemplo: MAX_ITERATIONS=20 ./scripts/ralph/ralph.sh
MAX_ITERATIONS=${MAX_ITERATIONS:-10}
MODEL="claude-opus-4-6"

# Criar progress.txt se não existir
# Este arquivo é a "memória" entre iterações - o Claude lê ele
# para saber o que já foi feito e o que falta fazer
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

  # Executar Claude Code com as seguintes flags:
  #   --dangerously-skip-permissions  Pula confirmações interativas (necessário para automação)
  #   --model                         Modelo a ser usado (Opus para melhor qualidade)
  #   --print                         Modo não-interativo: executa o prompt e sai (sem chat)
  #   --max-turns 30                  Limite de turnos por iteração (evita loops infinitos)
  claude --dangerously-skip-permissions \
    --model $MODEL \
    --print \
    --max-turns 30 \
    "$PROMPT"

  # Checar se o projeto foi concluído
  # O Claude cria DONE.md quando todas as tarefas do PRD estão completas
  if [ -f DONE.md ]; then
    echo ""
    echo "========================================="
    echo " PROJETO CONCLUÍDO na iteração $i"
    echo "========================================="
    exit 0
  fi

  echo "--- Iteração $i concluída. Resetando contexto... ---"

  # Pequena pausa entre iterações para evitar rate limiting da API
  # e garantir que processos de I/O (git, filesystem) finalizem
  sleep 2
done

echo ""
echo "Limite de $MAX_ITERATIONS iterações atingido."
echo "Verifique progress.txt para o status atual."
