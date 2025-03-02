CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
descricao TEXT NOT NULL
);

INSERT INTO tb_classes (nome, descricao) VALUES
('Guerreiro', 'Especialista em combate corpo a corpo com alta resistência.'),
('Mago', 'Usa magias poderosas para atacar à distância.'),
('Arqueiro', 'Habilidoso em ataques de longa distância com arco e flecha.'),
('Defensor', 'Equilíbrio entre ataque e defesa, com habilidades sagradas.'),
('Assassino', 'Ataques rápidos e furtivos, causando grande dano crítico.');

CREATE TABLE tb_personagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    nivel INT NOT NULL,
    classe_id INT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, classe_id) VALUES
('Thorn', 2500, 1800, 20, 1),
('Ezren', 3000, 1000, 25, 2),
('Lyria', 2200, 1500, 18, 3),
('Drakar', 1800, 2000, 22, 4),
('Caius', 2700, 1200, 21, 5),
('Selene', 1600, 1400, 17, 3),
('Gorak', 2100, 1100, 19, 1),
('Cassian', 1900, 1600, 20, 4);

-- SELECT - Personagens com poder de ataque maior que 2000
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- SELECT - Personagens com poder de defesa entre 1000 e 2000
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- SELECT - Personagens cujo nome contém a letra "C"
SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

-- SELECT - INNER JOIN para unir tb_personagens com tb_classes
SELECT p.id, p.nome, p.poder_ataque, p.poder_defesa, p.nivel, c.nome AS classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id;

-- SELECT - INNER JOIN para listar apenas personagens da classe "Arqueiro"
SELECT p.id, p.nome, p.poder_ataque, p.poder_defesa, p.nivel, c.nome AS classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE c.nome = 'Arqueiro';