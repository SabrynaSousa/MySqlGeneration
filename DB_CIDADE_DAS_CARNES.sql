CREATE DATABASE db_cidade_das_carnes; 

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

INSERT INTO tb_categorias (nome_categoria, descricao)
VALUES 
('Carnes', 'Produtos cárneos, como carnes bovinas, suínas, aves e mais'),
('Aves', 'Produtos derivados de aves, como frango e codorna'),
('Hortifruti', 'Produtos frescos de hortifrúti como frutas e vegetais'),
('Bovinos', 'Carnes de origem bovina, como cortes nobres e de segunda'),
('Suínos', 'Carnes de origem suína, como lombo, pernil e costela');

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
('Alcatra Bovina', 80.00, 'Corte de carne bovina macia e suculenta', 4),
('Picanha Bovina', 120.00, 'Corte nobre da carne bovina', 4),
('Coxa de Frango', 15.00, 'Parte da perna do frango, ideal para assar', 2),
('Peito de Frango', 20.00, 'Parte do peito do frango, ideal para grelhar', 2),
('Lombo Suíno', 50.00, 'Corte de carne suína, ideal para grelhar', 5),
('Costela Suína', 60.00, 'Costela suína saborosa para churrasco', 5),
('Maçã Gala', 5.00, 'Fruta fresca e doce, excelente para consumo in natura', 3),
('Tomate Italiano', 8.00, 'Tomate de boa qualidade, excelente para saladas', 3);

-- SELECT para retornar todos os produtos cujo valor seja maior do que R$ 50,00
SELECT * FROM tb_produtos WHERE preco > 50.00;

-- SELECT para retornar todos os produtos cujo valor esteja no intervalo R$ 50,00 e R$ 150,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 50.00 AND 150.00;

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
WHERE c.nome_categoria IN ('Aves', 'Hortifruti');
