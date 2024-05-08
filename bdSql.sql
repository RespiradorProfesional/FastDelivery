-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS FasterDeliveryBD;

-- Usar la base de datos
USE FasterDeliveryBD;

-- Tabla de Usuarios
CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Tabla de Niveles
CREATE TABLE IF NOT EXISTS Levels (
    level_id INT AUTO_INCREMENT PRIMARY KEY,
    level_name VARCHAR(255) NOT NULL UNIQUE,
    level_description TEXT
);

-- Tabla de Records
CREATE TABLE IF NOT EXISTS Records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    level_id INT,
    completion_time_seconds INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (level_id) REFERENCES Levels(level_id)
);

-- Tabla de Mensajes
CREATE TABLE IF NOT EXISTS Messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    message_text TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Users (username, password) VALUES
('usuario1', 'contraseña1'),
('usuario2', 'contraseña2'),
('usuario3', 'contraseña3');

-- Insertar niveles
INSERT INTO Levels (level_name, level_description) VALUES
('Nivel 1', 'Descripción del Nivel 1'),
('Nivel 2', 'Descripción del Nivel 2'),
('Nivel 3', 'Descripción del Nivel 3');

-- Insertar records
INSERT INTO Records (user_id, level_id, completion_time_seconds) VALUES
(1, 1, '30'),
(2, 1, '35'),
(3, 2, '400');

-- Insertar mensajes
INSERT INTO Messages (user_id, message_text) VALUES
(1, 'Este es un mensaje del usuario 1'),
(2, 'Este es un mensaje del usuario 2'),
(3, 'Este es un mensaje del usuario 3');

select * from messages;

SELECT Users.username, Records.completion_time_seconds
FROM Users
INNER JOIN Records ON Users.user_id = Records.user_id
WHERE Records.level_id = 1;

SELECT Messages.message_id, Users.username, Messages.message_text
FROM Users
JOIN Messages ON Users.user_id = Messages.user_id;