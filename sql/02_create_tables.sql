-- Criar esquema (opcional)
CREATE SCHEMA IF NOT EXISTS public;

-- Tabela de usuários
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    tipo VARCHAR(50) NOT NULL, -- aluno, professor, bibliotecario, diretor etc.
    email VARCHAR(150) UNIQUE,
    criado_em TIMESTAMP DEFAULT now()
);

-- Tabela de categorias
CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela de livros
CREATE TABLE livros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(200),
    categoria_id INT REFERENCES categorias(id),
    ano_publicacao INT,
    disponivel BOOLEAN DEFAULT true
);

-- Empréstimos
CREATE TABLE emprestimos (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuarios(id),
    livro_id INT REFERENCES livros(id),
    data_emprestimo DATE NOT NULL DEFAULT CURRENT_DATE,
    data_devolucao DATE,
    devolvido BOOLEAN DEFAULT false
);

-- Avaliações dos livros
CREATE TABLE avaliacoes (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuarios(id),
    livro_id INT REFERENCES livros(id),
    nota INT CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    criado_em TIMESTAMP DEFAULT now()
);
