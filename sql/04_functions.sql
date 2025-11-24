-- Função para verificar se um livro está disponível
CREATE OR REPLACE FUNCTION livro_disponivel(livro INTEGER)
RETURNS BOOLEAN AS $$
DECLARE status BOOLEAN;
BEGIN
    SELECT disponivel INTO status FROM livros WHERE id = livro;
    RETURN status;
END;
$$ LANGUAGE plpgsql;
