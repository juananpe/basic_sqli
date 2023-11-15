CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `users` (username, password, email, created_at, updated_at) VALUES 
('john', 'fishfw98rwksdjf', 'user1@example.com', '2023-11-12 20:59:47', '2023-11-12 20:59:47'),
('ane', '12345678ertyuivghjoqiw', 'user2@example.com', '2023-11-12 21:00:09', '2023-11-12 21:00:09');

GRANT ALL PRIVILEGES ON users.* TO 'juanan'@'%' IDENTIFIED BY 'pasahitza2023';
FLUSH PRIVILEGES;

