📌 Roadmap do Projeto — Sistema de Biblioteca Escolar

Este documento descreve o passo a passo completo do desenvolvimento do sistema.
Ele serve como um mapa para organizar o projeto e acompanhar a evolução.

✅ 1. Planejamento Inicial

✔ Definição do objetivo do sistema

Fornecer acesso digital ao acervo da biblioteca escolar e permitir empréstimos.

✔ Definição dos tipos de usuários

Alunos

Professores

Diretor e Vice-diretor

Bibliotecário

Auxiliar Administrativo

Apoio Administrativo (porteiro, limpeza, cozinha)

✔ Levantamento das funcionalidades

Consulta de livros

Empréstimos

Cadastro de usuários (restrito)

Cadastro de livros (restrito)

Avaliação e comentários

✅ 2. Modelagem e Criação do Banco de Dados
✔ Modelagem do MER

(tabelas, relacionamentos, regras de negócio)

✔ Criação das tabelas no PostgreSQL

usuários

livros

categorias

empréstimos

avaliações

✔ Scripts armazenados na pasta /sql
🔄 3. API (Backend) — Próximo Grande Passo

A API é o “meio-campo” que conecta o banco ao site.

🔧 Tecnologias possíveis

Python + FastAPI

🔥 Endpoints essenciais

/login

/usuarios

/livros

/emprestimos

/avaliacoes

🎯 Objetivo dessa etapa

Criar rotas que permitam o site consultar livros e registrar empréstimos.

🎨 4. Frontend (Site)

Interface para os usuários.

Telas previstas

Tela de Login

Tela de Catálogo de Livros

Detalhes do Livro

Tela de Empréstimo

Histórico do Usuário

Tecnologias possíveis

HTML + CSS + JavaScript

Ou React (mais avançado)

🧪 5. Testes

Testar API (Postman)

Testar site

Testar regras de negócio (ex: limite de 2 livros)

🚀 6. Publicação

Quando o projeto estiver pronto:

Publicar API (Render, Railway ou outro)

Publicar site (Vercel, Netlify)

Documentar tudo no GitHub

📘 7. Melhorias Futuras

Sistema de notificações

Leitura de QRCode nos livros

Estatísticas de empréstimos

Painel administrativo completo
