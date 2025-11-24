# Requisitos do Sistema — Biblioteca Escolar

## Visão geral
Sistema web para gestão do acervo da biblioteca escolar: consulta de livros, solicitações de empréstimo, cadastro de obras e usuários, avaliações e histórico.

## Perfis de usuário
- Aluno
- Professor
- Diretor
- Vice-diretor
- Bibliotecário
- Auxiliar administrativo
- Apoio administrativo (porteiro, limpeza, cozinha)

## Requisitos funcionais (mínimos — MVP)
1. Autenticação: login por matrícula/email + senha.
2. Consulta de catálogo: busca por título, autor, categoria, ano.
3. Visualizar disponibilidade do livro.
4. Solicitar empréstimo (usuário) — criar registro de empréstimo.
5. Registrar devolução (admin / bibliotecário) ou via usuário com confirmação.
6. Cadastro de livros (admin: diretor, vice-diretor, bibliotecário).
7. Cadastro de usuários (admin).
8. Avaliar e comentar livros (usuários).
9. Histórico de empréstimos por usuário.
10. Bloqueio automático de novos empréstimos se:
    - usuário possui 2 empréstimos ativos, ou
    - possui empréstimo em atraso.
11. Relatórios simples (admin): livros mais emprestados, usuários com atrasos.

## Requisitos não-funcionais
- Banco de dados: PostgreSQL
- API REST (segura) para integração com frontend
- Interface responsiva (desktop + mobile)
- Documentação básica no repositório
- Logs de ações administrativas (quem cadastrou/alterou)
