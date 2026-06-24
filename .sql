CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cidade VARCHAR(50)
);

CREATE TABLE pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    cliente_id INT,
    -- Definindo a chave estrangeira para relacionar as tabelas
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

INSERT INTO clientes (nome, email, cidade) VALUES
('Guilherme Henrique', 'guilherme@email.com', 'São Paulo'),
('Maria Silva', 'maria@email.com', 'Rio de Janeiro'),
('João Souza', 'joao@email.com', 'Belo Horizonte');

INSERT INTO pedidos (data_pedido, valor_total, cliente_id) VALUES
('2026-06-20', 250.50, 1), -- Pedido do Guilherme
('2026-06-21', 120.00, 2), -- Pedido da Maria
('2026-06-22', 350.00, 1), -- Outro pedido do Guilherme
('2026-06-23', 89.90, NULL); -- Pedido sem cliente cadastrado (para testar os JOINS)

SELECT 
    c.nome, 
    c.email, 
    p.pedido_id, 
    p.data_pedido, 
    p.valor_total
FROM clientes c
INNER JOIN pedidos p ON c.cliente_id = p.cliente_id;

SELECT 
    c.nome, 
    p.pedido_id, 
    p.valor_total
FROM clientes c
LEFT JOIN pedidos p ON c.cliente_id = p.cliente_id;