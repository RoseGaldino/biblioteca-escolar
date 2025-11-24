-- View: livros com suas categorias
CREATE OR REPLACE VIEW vw_livros_categorias AS
SELECT 
    l.id, l.titulo, l.autor, c.nome AS categoria, l.disponivel
FROM livros l
JOIN categorias c ON l.categoria_id = c.id;

-- View: empréstimos detalhados
CREATE OR REPLACE VIEW vw_emprestimos_detalhes AS
SELECT 
    e.id,
    u.nome AS usuario,
    l.titulo AS livro,
    e.data_emprestimo,
    e.data_devolucao,
    e.devolvido
FROM emprestimos e
JOIN usuarios u ON e.usuario_id = u.id
JOIN livros l ON e.livro_id = l.id;
