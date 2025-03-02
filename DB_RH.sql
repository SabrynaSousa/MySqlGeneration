CREATE DATABASE rh_empresa;
USE rh_empresa;

CREATE TABLE colaboradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    departamento VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_admissao DATE NOT NULL
);

INSERT INTO colaboradores (nome, cargo, departamento, salario, data_admissao) VALUES
('Analu Sousa', 'Analista de RH', 'Recursos Humanos', 2500.00, '2022-06-15'),
('Carmelio Silva', 'Desenvolvedor', 'TI', 5000.00, '2021-03-10'),
('Marilu Chagas', 'Assistente Administrativo', 'Administrativo', 1800.00, '2023-01-20'),
('Silveiro Alves', 'Gerente de Projetos', 'TI', 5000.00, '2019-09-05'),
('Filipa Costa', 'Atendente', 'Atendimento', 1700.00, '2024-02-01');

-- maior que 2000
SELECT * FROM colaboradores WHERE salario > 2000;

-- menor que 2000
SELECT * FROM colaboradores WHERE salario < 2000;

-- Atualizando o salário
UPDATE colaboradores SET salario = 7000 WHERE nome = 'Carmelio Silva';
SET SQL_SAFE_UPDATES = 1;

-- Verificando a atualização
SELECT * FROM colaboradores WHERE nome = 'Marilu Chagas';
