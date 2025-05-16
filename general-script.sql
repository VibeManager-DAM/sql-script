-- ============================================
-- ELIMINAR TABLAS SI EXISTEN (ORDEN CORRECTO)
-- ============================================
USE Vibe;
GO

DROP TABLE IF EXISTS MESSAGES;
DROP TABLE IF EXISTS CHAT;
DROP TABLE IF EXISTS TICKETS;
DROP TABLE IF EXISTS ITEMS;
DROP TABLE IF EXISTS RESERVES;
DROP TABLE IF EXISTS SPACES;
DROP TABLE IF EXISTS EVENTS;
DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS ROL;
GO

-- ======================
-- CREAR TABLAS DESDE 0
-- ======================

CREATE TABLE ROL (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL
);

CREATE TABLE USERS (
    id INT PRIMARY KEY IDENTITY(1,1),
    fullname NVARCHAR(200) NOT NULL,
    email NVARCHAR(200) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL,
    id_rol INT NOT NULL,
    FOREIGN KEY (id_rol) REFERENCES ROL(id)
);

CREATE TABLE EVENTS (
    id INT PRIMARY KEY IDENTITY(1,1),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    date DATE NOT NULL,
    time TIME NOT NULL,
    image VARCHAR(255),
    capacity INT NOT NULL,
    seats BIT NOT NULL,
    num_rows INT,
    num_columns INT,
    id_organizer INT NOT NULL,
    price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (id_organizer) REFERENCES USERS(id)
);

CREATE TABLE SPACES (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) NOT NULL,
    square_meters DECIMAL(10,2) NOT NULL,
    capacity INT NOT NULL,
    address VARCHAR(255) NOT NULL,
    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL
);

CREATE TABLE RESERVES (
    id_event INT NOT NULL,
    id_space INT NOT NULL,
    reservation_date DATE NOT NULL DEFAULT GETDATE(),
    PRIMARY KEY (id_event, id_space),
    FOREIGN KEY (id_event) REFERENCES EVENTS(id),
    FOREIGN KEY (id_space) REFERENCES SPACES(id)
);

CREATE TABLE ITEMS (
    id INT PRIMARY KEY IDENTITY(1,1),
    name_item NVARCHAR(100) NOT NULL,
    amount INT NOT NULL,
    id_space INT NOT NULL,
    FOREIGN KEY (id_space) REFERENCES SPACES(id)
);

CREATE TABLE TICKETS (
    id INT PRIMARY KEY IDENTITY(1,1),
    date DATE NOT NULL,
    time TIME NOT NULL,
    num_col INT,
    num_row INT,
    id_event INT NOT NULL,
    id_user INT NOT NULL,
    FOREIGN KEY (id_event) REFERENCES EVENTS(id),
    FOREIGN KEY (id_user) REFERENCES USERS(id)
);

CREATE TABLE CHAT (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_event INT NOT NULL UNIQUE,
    FOREIGN KEY (id_event) REFERENCES EVENTS(id)
);

CREATE TABLE MESSAGES (
    id INT PRIMARY KEY IDENTITY(1,1),
    context TEXT NOT NULL,
    send_at DATETIME NOT NULL DEFAULT GETDATE(),
    sender_id INT NOT NULL,
    id_chat INT NOT NULL,
    FOREIGN KEY (sender_id) REFERENCES USERS(id),
    FOREIGN KEY (id_chat) REFERENCES CHAT(id)
);

-- ======================
-- INSERTAR DATOS DE PRUEBA
-- ======================

-- Roles
INSERT INTO ROL (name)
VALUES ('Organizador'), ('Normal'), ('Administrador');

-- Usuarios
INSERT INTO USERS (fullname, email, password, id_rol)
VALUES 
('María Ortega', 'maria.ortega@vibe.com', 'hashed_maria123', 1), -- Organizador
('Carlos Ruiz', 'carlos.ruiz@vibe.com', 'hashed_carlos123', 2),  -- Normal
('Elena Díaz', 'elena.diaz@vibe.com', 'hashed_elena123', 2),     -- Normal
('Admin Vibe', 'admin@vibe.com', 'hashed_admin123', 3);          -- Administrador

-- Espacios
INSERT INTO SPACES (name, square_meters, capacity, address, latitude, longitude)
VALUES 
('Centro Cultural Vibe', 800.00, 300, 'Calle Arte 101', 19.432608, -99.133209),
('Sala Moderna', 450.00, 150, 'Calle Tech 202', 19.440000, -99.150000);

-- Eventos (por organizador ID 1)
INSERT INTO EVENTS (title, description, date, time, image, capacity, seats, num_rows, num_columns, id_organizer, price)
VALUES 
('Concierto de Primavera', 'Un concierto con música en vivo.', '2025-06-10', '19:00:00', 'concierto.jpg', 200, 1, 10, 20, 1, 150.00),
('Feria de Tecnología', 'Exposición de innovación y tecnología.', '2025-06-15', '10:00:00', 'tecnologia.jpg', 150, 0, NULL, NULL, 1, 100.00);

-- Reservas de espacio (con fecha actual por defecto)
INSERT INTO RESERVES (id_event, id_space)
VALUES 
(1, 1),
(2, 2);

-- Ítems en espacios
INSERT INTO ITEMS (name_item, amount, id_space)
VALUES 
('Micrófonos', 5, 1),
('Sillas', 150, 2);

-- Tickets (usuarios normales a eventos)
INSERT INTO TICKETS (date, time, num_col, num_row, id_event, id_user)
VALUES 
('2025-06-10', '19:00:00', 5, 3, 1, 2),
('2025-06-15', '10:00:00', NULL, NULL, 2, 3);

INSERT [dbo].[CHAT] ([id], [id_event]) VALUES (1, 2)
INSERT [dbo].[CHAT] ([id], [id_event]) VALUES (2, 3)
INSERT [dbo].[CHAT] ([id], [id_event]) VALUES (3, 4)
INSERT [dbo].[CHAT] ([id], [id_event]) VALUES (4, 5)
INSERT [dbo].[CHAT] ([id], [id_event]) VALUES (5, 7)
