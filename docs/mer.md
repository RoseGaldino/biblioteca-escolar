# Modelo Entidade-Relacionamento (MER)

Abaixo o MER textual e um diagrama em Mermaid que você pode visualizar em renderizadores que suportam Mermaid (ex.: GitHub preview).

## Entidades (resumo)
- usuarios (id_usuario, nome, email, matricula, tipo_usuario, ...)
- categorias (id_categoria, nome_categoria)
- livros (id_livro, titulo, autor, ano_publicacao, quantidade_total, quantidade_disponivel, id_categoria)
- emprestimos (id_emprestimo, id_usuario, id_livro, data_emprestimo, data_prevista_devolucao, data_devolucao, status)
- avaliacoes (id_avaliacao, id_usuario, id_livro, nota, comentario, data_avaliacao)

## Diagrama em Mermaid
```mermaid
erDiagram
    USUARIOS {
        int id_usuario PK
        string nome
        string email
        string matricula
        string senha_hash
        string tipo_usuario
        date data_cadastro
    }

    CATEGORIAS {
        int id_categoria PK
        string nome_categoria
    }

    LIVROS {
        int id_livro PK
        string titulo
        string autor
        int ano_publicacao
        text sinopse
        int quantidade_total
        int quantidade_disponivel
        date data_registro
        int id_categoria FK
    }

    EMPRESTIMOS {
        int id_emprestimo PK
        int id_usuario FK
        int id_livro FK
        date data_emprestimo
        date data_prevista_devolucao
        date data_devolucao
        string status
    }

    AVALIACOES {
        int id_avaliacao PK
        int id_usuario FK
        int id_livro FK
        int nota
        text comentario
        date data_avaliacao
    }

    USUARIOS ||--o{ EMPRESTIMOS : faz
    LIVROS ||--o{ EMPRESTIMOS : recebe
    USUARIOS ||--o{ AVALIACOES : escreve
    LIVROS ||--o{ AVALIACOES : tem
    CATEGORIAS ||--o{ LIVROS : classifica
