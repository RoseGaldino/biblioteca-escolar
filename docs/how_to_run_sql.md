**Como Executar os Scripts SQL**

Guia passo a passo para rodar os arquivos SQL do projeto Biblioteca Escolar

Este documento explica como executar cada um dos scripts que estão dentro da pasta sql/ do repositório.
Ele serve tanto para iniciantes quanto para quem quiser reproduzir o projeto no próprio computador.

**1. Pré-requisitos**

Antes de rodar os scripts, você precisa ter:

✔️ PostgreSQL instalado

Baixe gratuitamente em: https://www.postgresql.org/download/

✔️ PgAdmin 4 instalado

Ele normalmente já vem com o PostgreSQL.

**2. Estrutura da pasta SQL**

A pasta sql/ contém estes arquivos:

| Arquivo                  | Função                                                    |
| ------------------------ | --------------------------------------------------------- |
| `01_create_database.sql` | Cria o banco de dados `biblioteca_escolar`                |
| `02_create_tables.sql`   | Cria todas as tabelas do sistema                          |
| `03_insert_data.sql`     | Insere dados iniciais (usuários, categorias, livros etc.) |
| `04_functions.sql`       | Armazena funções PostgreSQL (opcional para o futuro)      |
| `05_views.sql`           | Cria views úteis para análise e relatórios                |

**3. Como executar os scripts no PgAdmin (passo a passo)**

1️⃣ Abra o PgAdmin

Clique no ícone e aguarde carregar.

2️⃣ Conecte ao servidor PostgreSQL

Normalmente aparece como: PostgreSQL 15 (ou 16) → Servers → PostgreSQL

3️⃣ Abra o Query Tool

Clique com o botão direito em Databases → Query Tool.

**4. Ordem correta para rodar os scripts**

1. Rodar o arquivo de criação do banco

Abra o arquivo 01_create_database.sql e clique em ▶️ Execute.

Depois disso, no canto esquerdo, atualize a lista de bancos de dados:

Clique direito em Databases → Refresh

2. Selecionar o banco de dados criado

Clique em: 
Databases → biblioteca_escolar
Abra um Query Tool dentro dele:

Botão direito → Query Tool

3. Rodar o arquivo de criação das tabelas

Abra 02_create_tables.sql → Execute.

4. Rodar o arquivo de inserts

Abra 03_insert_data.sql → Execute.

5. Rodar functions

04_functions.sql → Execute.

6. Rodar views

05_views.sql → Execute.

**5. Como verificar se funcionou**

✔️ Ver tabelas

No menu esquerdo: biblioteca_escolar → Schemas → public → Tables
Você deverá ver:

alunos

professores

livros

categorias

emprestimos

avaliações

usuários

✔️ Testar dados inseridos

Execute:
SELECT * FROM livros;
Ou qualquer outra tabela.

Se aparecerem resultados, tudo está funcionando!
