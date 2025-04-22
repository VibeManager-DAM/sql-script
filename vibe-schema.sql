CREATE DATABASE Vibe;
GO

USE Vibe;
GO


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
    seats bit NOT NULL,
    num_rows INT,
    num_columns INT,
    id_organizer INT NOT NULL,
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
    id_user INT NOT NULL,
    id_event INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES USERS(id),
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

