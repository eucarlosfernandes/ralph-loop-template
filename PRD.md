# PRD - [Nome do Projeto]

## 1. Visão Geral
<!-- Descreva em 2-3 frases o que é o projeto e qual problema ele resolve -->
Criar um [tipo de aplicação] para [público alvo].
O usuário pode [ações principais].

## 2. Stack Tecnológica
<!-- Liste as tecnologias que devem ser usadas -->
- Frontend: [ex: React + TypeScript + Vite]
- Backend: [ex: Node.js + Express + TypeScript]
- Banco de dados: [ex: SQLite / PostgreSQL / MongoDB]
- ORM: [ex: Prisma / TypeORM / Mongoose]
- Estilo: [ex: Tailwind CSS / CSS Modules / styled-components]
- Outros: [ex: Docker, Redis, etc.]

## 3. Funcionalidades e Tarefas

<!--
DICAS PARA ESCREVER BOAS TAREFAS:
- Seja específico: "Criar endpoint GET /api/users que retorna lista paginada"
  é melhor que "Criar API de usuários"
- Uma tarefa = uma unidade de trabalho que pode ser completada e testada
- Ordene as tarefas na sequência lógica de implementação
- Inclua detalhes como campos, validações, comportamentos esperados
-->

### Funcionalidade 1: Setup do Projeto
- Tarefa 1.1: [Inicializar projeto com ferramentas X e Y]
- Tarefa 1.2: [Configurar banco de dados]
- Tarefa 1.3: [Configurar estilização]
- Tarefa 1.4: [Criar script para rodar o projeto com um comando]

### Funcionalidade 2: [Nome da Funcionalidade]
- Tarefa 2.1: [Descrição detalhada]
  - [Detalhes: campos, tipos, validações]
- Tarefa 2.2: [Descrição detalhada]
  - [Detalhes: endpoints, parâmetros, respostas]
- Tarefa 2.3: [Testes desta funcionalidade]

### Funcionalidade 3: [Nome da Funcionalidade]
- Tarefa 3.1: [Descrição detalhada]
- Tarefa 3.2: [Descrição detalhada]
- Tarefa 3.3: [Descrição detalhada]

### Funcionalidade 4: Polimento
- Tarefa 4.1: Design responsivo
- Tarefa 4.2: Tratamento de erros e loading states
- Tarefa 4.3: README.md com instruções de setup e uso

## 4. Requisitos Não-Funcionais
<!-- Liste restrições e qualidades esperadas -->
- Rodar localmente sem serviços externos
- Setup com um único comando
- Código limpo e tipado
- [Outros requisitos: performance, acessibilidade, etc.]

## 5. Estrutura de Arquivos Esperada
<!--
Defina a organização de pastas que o agente deve seguir.
Isso evita que ele crie estruturas confusas.
-->
projeto/
  frontend/    [App frontend]
  backend/     [API backend]
  package.json [Scripts root para rodar tudo]
