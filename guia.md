# Guia de Uso - Ralph Loop

## Pré-requisitos
- Dev Container rodando (VS Code > "Reopen in Container")
- Login feito no Claude Code dentro do container

---

## Como Usar

### 1. Escreva seu PRD
Edite o arquivo `PRD.md` na raiz do projeto com o que você quer construir.
Use o template que já está lá como base.

Você também pode gerar um PRD interativamente:
```bash
claude
# Dentro do Claude, digite:
# /prd Descrição do que você quer construir...
# O Claude vai fazer perguntas e gerar o PRD.md
# Saia com Ctrl+C após salvar
```

### 2. Rode o Ralph Loop
```bash
./scripts/ralph/ralph.sh
```

### 3. Parâmetros opcionais
```bash
# Mudar número máximo de iterações (padrão: 10)
MAX_ITERATIONS=20 ./scripts/ralph/ralph.sh

# Rodar em segundo plano (ideal para projetos longos)
MAX_ITERATIONS=50 nohup ./scripts/ralph/ralph.sh > ralph.log 2>&1 &

# Acompanhar o log em tempo real
tail -f ralph.log
```

---

## Como Funciona

```
┌─────────────────────────────────────────┐
│           RALPH LOOP                    │
│                                         │
│  Iteração 1:                            │
│    Claude lê PRD.md + progress.txt      │
│    → Executa a próxima tarefa           │
│    → Atualiza progress.txt              │
│    → Faz commit                         │
│    → Contexto é resetado                │
│                                         │
│  Iteração 2:                            │
│    Claude lê PRD.md + progress.txt      │
│    → Executa a próxima tarefa           │
│    → (repete até concluir tudo)         │
│                                         │
│  Quando tudo estiver pronto:            │
│    → Cria DONE.md e encerra             │
└─────────────────────────────────────────┘
```

- **PRD.md** → O que fazer (fonte da verdade)
- **progress.txt** → O que já foi feito (criado automaticamente)
- **DONE.md** → Sinal de que o projeto está concluído

---

## Acompanhando o Progresso

```bash
# Ver o que já foi feito
cat progress.txt

# Verificar se o projeto terminou
ls DONE.md 2>/dev/null && echo "Concluído!" || echo "Ainda em andamento..."
```

---

## Antes de Rodar um Novo Projeto

```bash
# Limpar arquivos do projeto anterior
rm -f progress.txt DONE.md

# Editar o PRD.md com o novo projeto
nano PRD.md

# Rodar novamente
./scripts/ralph/ralph.sh
```

---

## Dicas

- **PRD bem escrito = resultado melhor.** Seja específico nas tarefas.
- **Comece com poucas iterações** (5-10) para validar, depois aumente.
- **Revise o progress.txt** entre execuções para ver se está no caminho certo.
- **Se o resultado ficou ruim**, refine o PRD e rode novamente.
- **Projetos grandes** podem levar horas. Use `nohup` e vá fazer outra coisa.

---

## Resolução de Problemas

| Problema | Solução |
|---|---|
| `claude: command not found` | Rode `npm install -g @anthropic-ai/claude-code` no container |
| Login falha no container | Copie o código do terminal e cole manualmente no browser |
| Loop alucina / faz coisas erradas | Refine o PRD com mais detalhes e menos ambiguidade |
| Limite de tokens estourou | Verifique se está no plano Max da Anthropic |
| `progress.txt` com erros | Edite manualmente e rode o loop novamente |
