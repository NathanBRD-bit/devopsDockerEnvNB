CREATE TABLE IF NOT EXISTS products (
                                        id SERIAL PRIMARY KEY,
                                        name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
INSERT INTO products (name, price) VALUES
                                       ('Laptop', 999.99),
                                       ('Mouse', 29.99),
                                       ('Keyboard', 79.99);