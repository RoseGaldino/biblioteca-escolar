-- Inserir categorias
INSERT INTO categorias (nome) VALUES
('Romance'),
('Ficção'),
('Aventura'),
('Didáticos'),
('Biografias');

-- Inserir usuários
INSERT INTO usuarios (nome, tipo, email) VALUES
('Ana Silva', 'aluno', 'ana.silva@escola.com'),
('Carlos Souza', 'professor', 'carlos.souza@escola.com'),
('Marina Ramos', 'bibliotecario', 'marina.ramos@escola.com');

-- Inserir livros
INSERT INTO livros (titulo, autor, categoria_id, ano_publicacao) VALUES
('Dom Casmurro', 'Machado de Assis', 1, 1899),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 3, 1943),
('Capitães da Areia', 'Jorge Amado', 1, 1937),
('A volta ao mundo em 80 dias', 'Júlio Verne', 3, 1873);

-- Inserir empréstimos (exemplo)
INSERT INTO emprestimos (usuario_id, livro_id) VALUES
(1, 2),
(2, 1);
