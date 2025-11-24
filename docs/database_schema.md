**Database Schema – Sistema de Biblioteca Escolar**

Este documento descreve detalhadamente todas as tabelas do banco biblioteca_escolar, seus campos, relacionamentos e regras principais.

**Visão Geral do Banco de Dados**

O sistema é composto por cinco entidades principais:

usuarios
categorias
livros
emprestimos
avaliacoes

Elas representam o fluxo completo do sistema: cadastro → acervo → empréstimo → avaliação.

1. Tabela: usuarios
Campo	Tipo	Obrigatório	Descrição
id	SERIAL PK	✔️	Identificador único do usuário
nome	VARCHAR(150)	✔️	Nome completo
tipo	VARCHAR(30)	✔️	Tipo de usuário (aluno, professor, diretor etc.)
data_cadastro	TIMESTAMP	✔️	Data de criação do cadastro

🌐 Regras importantes:

Os tipos permitidos são: aluno, professor, diretor, vice-diretor, bibliotecario, auxiliar_adm, apoio.

Somente diretor, vice-diretor e bibliotecário podem cadastrar outros usuários.

📚 2. Tabela: categorias
| Campo | Tipo         | Obrigatório | Descrição                                           |
| ----- | ------------ | ----------- | --------------------------------------------------- |
| id    | SERIAL PK    | ✔️          | Identificador da categoria                          |
| nome  | VARCHAR(100) | ✔️          | Nome da categoria (ex: Romance, Aventura, Didático) |

📖 3. Tabela: livros
| Campo                 | Tipo         | Obrigatório | Descrição              |
| --------------------- | ------------ | ----------- | ---------------------- |
| id                    | SERIAL PK    | ✔️          | Identificador do livro |
| titulo                | VARCHAR(200) | ✔️          | Nome da obra           |
| autor                 | VARCHAR(150) | ✔️          | Autor                  |
| ano                   | INT          | ❌           | Ano de publicação      |
| categoria_id          | INT FK       | ✔️          | Categoria do livro     |
| quantidade_total      | INT          | ✔️          | Total de exemplares    |
| quantidade_disponivel | INT          | ✔️          | Exemplares disponíveis |

🔗 Relação:

categoria_id → categorias(id) (N:1)

🧠 Regras:

quantidade_disponivel nunca pode ficar negativa.

Se quantidade_disponivel = 0, o livro não pode ser emprestado.

🔁 4. Tabela: emprestimos

| Campo           | Tipo      | Obrigatório | Descrição                        |
| --------------- | --------- | ----------- | -------------------------------- |
| id              | SERIAL PK | ✔️          | Identificador do empréstimo      |
| usuario_id      | INT FK    | ✔️          | Usuário que pegou o livro        |
| livro_id        | INT FK    | ✔️          | Obra emprestada                  |
| data_emprestimo | DATE      | ✔️          | Data em que o livro foi retirado |
| data_devolucao  | DATE      | ✔️          | Data limite para devolução       |
| data_devolvido  | DATE      | ❌           | Data efetiva da devolução        |

🔗 Relações:

usuario_id → usuarios(id)

livro_id → livros(id)

🧠 Regras:

Um usuário só pode ter até 2 empréstimos simultâneos.

A devolução atualiza quantidade_disponivel na tabela livros.

⭐ 5. Tabela: avaliacoes
| Campo          | Tipo      | Obrigatório | Descrição                     |
| -------------- | --------- | ----------- | ----------------------------- |
| id             | SERIAL PK | ✔️          | Identificador da avaliação    |
| usuario_id     | INT FK    | ✔️          | Usuário que avaliou           |
| livro_id       | INT FK    | ✔️          | Livro que recebeu a avaliação |
| nota           | INT       | ✔️          | Nota entre 1 e 5              |
| comentario     | TEXT      | ❌           | Comentário opcional           |
| data_avaliacao | TIMESTAMP | ✔️          | Data da avaliação             |

🔗 Relações:

usuario_id → usuarios(id)

livro_id → livros(id)

🧠 Regras:

Nota deve ser entre 1 e 5.

Um usuário pode avaliar um livro apenas uma vez por empréstimo.

🔗 Diagrama Lógico (Relacionamentos)

Representação simplificada:
usuarios (1)---(N) emprestimos (N)---(1) livros (N)---(1) categorias
           \                   
            \---(N) avaliacoes

🎯 Resumo das Regras de Negócio Implementadas

🔹 Usuário pode pegar até 2 livros simultaneamente

🔹 Apenas perfis administrativos podem cadastrar usuários e livros

🔹 quantidade_disponivel sempre atualizada nos empréstimos e devoluções

🔹 Avaliações são notas de 1 a 5

🔹 Todos podem pesquisar livros

🔹 Todos podem avaliar
