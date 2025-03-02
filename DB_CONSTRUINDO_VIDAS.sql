CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

INSERT INTO tb_categorias (nome_categoria, descricao)
VALUES 
('Elétricos', 'Produtos relacionados à parte elétrica, como fios, cabos, interruptores'),
('Hidráulica', 'Produtos relacionados à parte hidráulica, como tubos e conexões'),
('Ferragens', 'Itens de metal para construção, como pregos, parafusos, e fechaduras'),
('Tintas', 'Produtos para pintura, como tintas, pincéis e acessórios'),
('Materiais de Construção', 'Produtos gerais para construção civil, como cimento e areia');

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
('Cimento', 25.00, 'Cimento de alta qualidade para construção civil', 5),
('Areia Média', 15.00, 'Areia para uso em obras de construção civil', 5),
('Prego 100 UN', 8.00, 'Prego de aço para fixação em madeira e metal', 3),
('Fio Elétrico 1,5mm', 5.00, 'Fio elétrico para instalação residencial', 1),
('Tinta Acrílica Branca', 45.00, 'Tinta acrílica para pintura de paredes internas', 4),
('Placa PVC', 12.00, 'Conexão de PVC para tubulação hidráulica', 2),
('Interruptor Simples', 10.00, 'Interruptor de luz simples, modelo padrão', 1),
('Parafuso 50 UN', 3.00, 'Parafuso de aço galvanizado para fixação em madeira', 3);

-- SELECT para retornar todos os produtos cujo valor seja maior do que R$ 100,00
SELECT * FROM tb_produtos WHERE preco > 100.00;

-- SELECT para retornar todos os produtos cujo valor esteja no intervalo R$ 70,00 e R$ 150,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 70.00 AND 150.00;

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
WHERE c.nome_categoria = 'Hidráulica';
