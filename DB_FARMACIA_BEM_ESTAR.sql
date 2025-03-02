CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;


CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

INSERT INTO tb_categorias (nome_categoria, descricao)
VALUES 
('Medicamentos', 'Produtos farmacêuticos para tratamentos'),
('Cosméticos', 'Produtos de beleza e cuidados pessoais'),
('Suplementos', 'Suplementos alimentares e vitamínicos'),
('Higiene', 'Produtos de higiene pessoal e doméstica'),
('Produtos Naturais', 'Produtos naturais e fitoterápicos');

CREATE TABLE tb_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    descricao VARCHAR(255),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_produtos (nome_produto, preco, descricao, id_categoria)
VALUES 
('Paracetamol 500mg', 10.50, 'Medicamento analgésico e antipirético', 1),
('Ibuprofeno 400mg', 15.00, 'Medicamento anti-inflamatório', 1),
('Shampoo de Castanha', 25.00, 'Shampoo hidratante para cabelos secos', 2),
('Creme Anti-idade', 40.00, 'Creme facial para prevenção de rugas', 2),
('Vitamina C 1000mg', 35.00, 'Suplemento vitamínico para o sistema imunológico', 3),
('Multivitamínico', 50.00, 'Suplemento com várias vitaminas e minerais', 3),
('Sabonete Líquido de Glicerina', 8.00, 'Sabonete líquido hidratante para a pele', 4),
('Chá de Camomila', 12.00, 'Produto natural para auxiliar no relaxamento', 5);

-- SELECT para retornar todos os produtos cujo valor seja maior do que R$ 50,00
SELECT * FROM tb_produtos WHERE preco > 50.00;

-- SELECT para retornar todos os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

-- SELECT utilizando LIKE para buscar todos os produtos que possuam a letra 'C' no atributo nome
SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

-- SELECT utilizando INNER JOIN para unir as tabelas tb_produtos e tb_categorias
SELECT p.nome_produto, p.preco, c.nome_categoria 
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

-- SELECT utilizando INNER JOIN para unir as tabelas tb_produtos e tb_categorias, com filtro por categoria
SELECT p.nome_produto, p.preco, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Cosméticos';
