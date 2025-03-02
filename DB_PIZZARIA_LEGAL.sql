CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;


CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

INSERT INTO tb_categorias (nome_categoria, descricao)
VALUES 
('Tradicional', 'Pizzas tradicionais, com sabor clássico'),
('Especial', 'Pizzas com combinações diferenciadas'),
('Vegana', 'Pizzas para dietas veganas'),
('Doce', 'Pizzas com sabores doces'),
('Sem Glúten', 'Pizzas para intolerantes ao glúten');

CREATE TABLE tb_pizzas (
    id_pizza INT AUTO_INCREMENT PRIMARY KEY,
    nome_pizza VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    descricao VARCHAR(255),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_pizzas (nome_pizza, preco, descricao, id_categoria)
VALUES 
('Margarita', 35.00, 'Molho de tomate, queijo e manjericão', 1),
('Calabresa', 40.00, 'Molho de tomate, calabresa, cebola e queijo', 1),
('Portuguesa', 45.00, 'Molho de tomate, presunto, ovo, cebola e queijo', 1),
('Margherita Especial', 55.00, 'Molho de tomate, queijo, manjericão e azeite de oliva', 2),
('Frango com Catupiry', 50.00, 'Frango desfiado com Catupiry e milho', 2),
('Pizza Doce de Nutella', 60.00, 'Pizza doce com Nutella e morango', 4),
('Pizza de Banana com Canela', 55.00, 'Pizza doce de banana, canela e açúcar', 4),
('Pizza Sem Glúten de Queijo', 70.00, 'Pizza sem glúten com queijo mussarela e molho de tomate', 5);

-- SELECT para retornar todas as pizzas cujo valor seja maior do que R$ 45,00
SELECT * FROM tb_pizzas WHERE preco > 45.00;

-- SELECT para retornar todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

-- SELECT utilizando LIKE para buscar todas as pizzas que possuam a letra 'M' no atributo nome
SELECT * FROM tb_pizzas WHERE nome_pizza LIKE '%M%';

-- SELECT utilizando INNER JOIN para unir as tabelas tb_pizzas e tb_categorias
SELECT p.nome_pizza, p.preco, c.nome_categoria 
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

-- SELECT utilizando INNER JOIN para unir as tabelas tb_pizzas e tb_categorias, com filtro por categoria
SELECT p.nome_pizza, p.preco, c.nome_categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Doce';
