-- ======================
-- DATOS DE PRUEBA
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

-- Reservas de espacio
INSERT INTO RESERVES (id_event, id_space)
VALUES (1, 1), (2, 2);

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

-- Chat y mensajes
INSERT INTO CHAT (id_user, id_event)
VALUES (2, 1);

INSERT INTO MESSAGES (context, sender_id, id_chat)
VALUES ('¿A qué hora abren las puertas?', 2, 1);