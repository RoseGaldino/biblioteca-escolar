-- Tipo ENUM para os perfis
CREATE TYPE tipo_usuario_enum AS ENUM (
    'aluno',
    'professor',
    'diretor',
    'vice_diretor',
    'bibliotecario',
    'auxiliar',
    'apoio_administrativo'
);
-- Tipo ENUM para status de empréstimo
CREATE TYPE status_emprestimo_enum AS ENUM (
    'ativo',
    'atrasado',
    'devolvido'
);

-- Tabela de usuários
CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    email VARCHAR(200),
    matricula VARCHAR(50) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    tipo_usuario tipo_usuario_enum NOT NULL,
    data_cadastro DATE DEFAULT CURRENT_DATE,

    CONSTRAINT email_format CHECK (
        email IS NULL OR email LIKE '%@%'
    )
);

CREATE INDEX idx_usuarios_tipo ON usuarios(tipo_usuario);
CREATE INDEX idx_usuarios_nome ON usuarios(nome);

-- Tabela de categorias
CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela de livros
CREATE TABLE livros (
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(200),
    ano_publicacao INT,
    sinopse TEXT,
    quantidade_total INT NOT NULL CHECK (quantidade_total >= 0),
    quantidade_disponivel INT NOT NULL CHECK (quantidade_disponivel >= 0),
    data_registro DATE DEFAULT CURRENT_DATE,
    id_categoria INT REFERENCES categorias(id_categoria)
        ON DELETE SET NULL
);

CREATE INDEX idx_livros_titulo ON livros(titulo);
CREATE INDEX idx_livros_autor ON livros(autor);
CREATE INDEX idx_livros_categoria ON livros(id_categoria);

-- Tabela de emprestimos
CREATE TABLE emprestimos (
    id_emprestimo SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL REFERENCES usuarios(id_usuario)
        ON DELETE RESTRICT,
    id_livro INT NOT NULL REFERENCES livros(id_livro)
        ON DELETE RESTRICT,
    data_emprestimo DATE NOT NULL DEFAULT CURRENT_DATE,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    status status_emprestimo_enum NOT NULL,

    CONSTRAINT devolucao_valida CHECK (
        data_devolucao IS NULL OR data_devolucao >= data_emprestimo
    )
);

CREATE INDEX idx_emprestimos_usuario ON emprestimos(id_usuario);
CREATE INDEX idx_emprestimos_livro ON emprestimos(id_livro);
CREATE INDEX idx_emprestimos_status ON emprestimos(status);

-- Tabela de avaliações
CREATE TABLE avaliacoes (
    id_avaliacao SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL REFERENCES usuarios(id_usuario)
        ON DELETE CASCADE,
    id_livro INT NOT NULL REFERENCES livros(id_livro)
        ON DELETE CASCADE,
    nota INT NOT NULL CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    data_avaliacao DATE DEFAULT CURRENT_DATE
);

CREATE INDEX idx_avaliacoes_livro ON avaliacoes(id_livro);
CREATE INDEX idx_avaliacoes_usuario ON avaliacoes(id_usuario);


