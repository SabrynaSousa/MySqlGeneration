CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

INSERT INTO tb_categorias (nome_categoria, descricao)
VALUES 
('Desenvolvimento', 'Cursos focados em desenvolvimento de software e programação'),
('Marketing Digital', 'Cursos de estratégias de marketing online e publicidade'),
('Data Science', 'Cursos voltados para análise de dados e ciência de dados'),
('Design Gráfico', 'Cursos para design visual e ferramentas gráficas'),
('Gestão de Projetos', 'Cursos relacionados à gestão de equipes e projetos');

CREATE TABLE tb_cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    descricao VARCHAR(255),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_cursos (nome_curso, preco, descricao, id_categoria)
VALUES 
('Curso de Java Completo', 800.00, 'Curso completo de programação Java para iniciantes', 1),
('Curso de Marketing Digital Avançado', 650.00, 'Curso avançado sobre estratégias de marketing digital', 2),
('Curso de Data Science com Python', 900.00, 'Curso de Data Science utilizando Python', 3),
('Curso de Photoshop para Iniciantes', 350.00, 'Aprenda as técnicas básicas de Photoshop', 4),
('Gestão de Projetos Ágeis', 600.00, 'Curso sobre gestão de projetos utilizando metodologias ágeis', 5),
('Curso de Python para Iniciantes', 500.00, 'Curso de introdução à programação com Python', 1),
('Curso de SEO para Web', 400.00, 'Aprenda técnicas de SEO para otimização de sites', 2),
('Curso de Análise de Dados com R', 700.00, 'Curso de análise de dados utilizando R', 3);

-- SELECT para retornar todos os cursos cujo valor seja maior do que R$ 500,00
SELECT * FROM tb_cursos WHERE preco > 500.00;

-- SELECT para retornar todos os cursos cujo valor esteja no intervalo R$ 600,00 e R$ 1000,00
SELECT * FROM tb_cursos WHERE preco BETWEEN 600.00 AND 1000.00;

-- SELECT utilizando LIKE para buscar todos os cursos que possuam a letra 'J' no atributo nome
SELECT * FROM tb_cursos WHERE nome_curso LIKE '%J%';

-- SELECT utilizando INNER JOIN para unir as tabelas tb_cursos e tb_categorias
SELECT c.nome_curso, c.preco, cat.nome_categoria 
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id_categoria;

-- SELECT utilizando INNER JOIN para unir as tabelas tb_cursos e tb_categorias, com filtro por categoria
SELECT c.nome_curso, c.preco, cat.nome_categoria
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id_categoria
WHERE cat.nome_categoria = 'Desenvolvimento';
