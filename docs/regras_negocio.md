# Regras de Negócio — Biblioteca Escolar

## Limites e prazos
- Cada usuário pode ter **no máximo 2 empréstimos ativos** ao mesmo tempo.
- Prazo de devolução sugerido:
  - Alunos: **7 dias**
  - Professores: **14 dias**
  - Apoio administrativo / auxiliares: **7 dias**
- Empréstimo só pode ser feito se `quantidade_disponivel > 0`.

## Atrasos
- Se a data atual > data_prevista_devolucao e data_devolucao is NULL → status = 'atrasado'.
- Usuário com empréstimo em atraso fica bloqueado para novos empréstimos até regularizar.
- Não implementaremos multas no MVP — apenas bloqueio.

## Aprovação de empréstimo
- Opção 1 (MVP): **aprovação automática** ao solicitar (registro direto).
- Opção 2 (versão avançada): solicitação e aprovação manual pelo bibliotecário.
- Recomendo **Opção 1** para agilizar o MVP.

## Avaliações e comentários
- Preferível permitir avaliação apenas para quem já pegou o livro (opcional).
- Implementar filtro básico de palavras ofensivas (lista negra).

## Regras de exclusão/edição
- Livro com empréstimos ativos **não pode ser excluído**.
- Registro de usuário só pode ser removido se sem empréstimos históricos (ou migrar para status 'inativo').

## Auditoria
- Registrar usuário que criou/alterou cadastrado (id do admin + timestamp).
