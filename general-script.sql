USE [master]
GO
/****** Object:  Database [Vibe]    Script Date: 16/05/2025 17:56:14 ******/
CREATE DATABASE [Vibe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vibe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Vibe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vibe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Vibe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Vibe] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vibe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vibe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vibe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vibe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vibe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vibe] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vibe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Vibe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vibe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vibe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vibe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vibe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vibe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vibe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vibe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vibe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Vibe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vibe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vibe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vibe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vibe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vibe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vibe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vibe] SET RECOVERY FULL 
GO
ALTER DATABASE [Vibe] SET  MULTI_USER 
GO
ALTER DATABASE [Vibe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vibe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vibe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vibe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Vibe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Vibe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Vibe', N'ON'
GO
ALTER DATABASE [Vibe] SET QUERY_STORE = ON
GO
ALTER DATABASE [Vibe] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Vibe]
GO
/****** Object:  Table [dbo].[CHAT]    Script Date: 16/05/2025 17:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[id_event] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EVENTS]    Script Date: 16/05/2025 17:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EVENTS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[date] [date] NOT NULL,
	[time] [time](7) NOT NULL,
	[image] [varchar](255) NULL,
	[capacity] [int] NOT NULL,
	[seats] [bit] NOT NULL,
	[num_rows] [int] NULL,
	[num_columns] [int] NULL,
	[id_organizer] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ITEMS]    Script Date: 16/05/2025 17:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEMS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name_item] [nvarchar](100) NOT NULL,
	[amount] [int] NOT NULL,
	[id_space] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MESSAGES]    Script Date: 16/05/2025 17:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MESSAGES](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[context] [text] NOT NULL,
	[send_at] [datetime] NOT NULL,
	[sender_id] [int] NOT NULL,
	[id_chat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESERVES]    Script Date: 16/05/2025 17:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESERVES](
	[id_event] [int] NOT NULL,
	[id_space] [int] NOT NULL,
	[reservation_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_event] ASC,
	[id_space] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROL]    Script Date: 16/05/2025 17:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SPACES]    Script Date: 16/05/2025 17:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPACES](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[square_meters] [decimal](10, 2) NOT NULL,
	[capacity] [int] NOT NULL,
	[address] [varchar](255) NOT NULL,
	[latitude] [decimal](10, 8) NOT NULL,
	[longitude] [decimal](11, 8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TICKETS]    Script Date: 16/05/2025 17:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TICKETS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[time] [time](7) NOT NULL,
	[num_col] [int] NULL,
	[num_row] [int] NULL,
	[id_event] [int] NOT NULL,
	[id_user] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 16/05/2025 17:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](200) NOT NULL,
	[email] [nvarchar](200) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[id_rol] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CHAT] ON 

INSERT [dbo].[CHAT] ([id], [id_user], [id_event]) VALUES (3, 2, 2)
SET IDENTITY_INSERT [dbo].[CHAT] OFF
GO
SET IDENTITY_INSERT [dbo].[EVENTS] ON 

INSERT [dbo].[EVENTS] ([id], [title], [description], [date], [time], [image], [capacity], [seats], [num_rows], [num_columns], [id_organizer], [price]) VALUES (2, N'Feria de Tecnología', N'Exposición de innovación y tecnología.', CAST(N'2025-06-15' AS Date), CAST(N'10:00:00' AS Time), N'tecnologia.jpg', 150, 0, NULL, NULL, 1, CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[EVENTS] ([id], [title], [description], [date], [time], [image], [capacity], [seats], [num_rows], [num_columns], [id_organizer], [price]) VALUES (3, N'Festival de Jazz Barcelona', N'Concierto al aire libre con artistas locales e internacionales.', CAST(N'2025-07-05' AS Date), CAST(N'20:30:00' AS Time), N'jazz.jpg', 180, 1, 9, 20, 1, CAST(75.00 AS Decimal(10, 2)))
INSERT [dbo].[EVENTS] ([id], [title], [description], [date], [time], [image], [capacity], [seats], [num_rows], [num_columns], [id_organizer], [price]) VALUES (4, N'Congreso Smart City', N'Conferencia sobre ciudades inteligentes y sostenibles.', CAST(N'2025-07-12' AS Date), CAST(N'09:00:00' AS Time), N'smartcity.jpg', 250, 0, NULL, NULL, 1, CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[EVENTS] ([id], [title], [description], [date], [time], [image], [capacity], [seats], [num_rows], [num_columns], [id_organizer], [price]) VALUES (5, N'Cine al Aire Libre', N'Proyección de películas clásicas en la terraza.', CAST(N'2025-07-18' AS Date), CAST(N'21:00:00' AS Time), N'cine.jpg', 100, 1, 10, 10, 1, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[EVENTS] ([id], [title], [description], [date], [time], [image], [capacity], [seats], [num_rows], [num_columns], [id_organizer], [price]) VALUES (7, N'Marcos', N'Descripcion nueva ', CAST(N'2025-05-16' AS Date), CAST(N'17:00:00' AS Time), NULL, 200, 1, 12, 12, 13, CAST(0.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[EVENTS] OFF
GO
SET IDENTITY_INSERT [dbo].[ITEMS] ON 

INSERT [dbo].[ITEMS] ([id], [name_item], [amount], [id_space]) VALUES (1, N'Micrófonos', 5, 1)
INSERT [dbo].[ITEMS] ([id], [name_item], [amount], [id_space]) VALUES (2, N'Sillas', 150, 2)
INSERT [dbo].[ITEMS] ([id], [name_item], [amount], [id_space]) VALUES (3, N'Proyectores', 2, 5)
INSERT [dbo].[ITEMS] ([id], [name_item], [amount], [id_space]) VALUES (4, N'Parlantes', 4, 3)
INSERT [dbo].[ITEMS] ([id], [name_item], [amount], [id_space]) VALUES (5, N'Mesas Redondas', 10, 4)
SET IDENTITY_INSERT [dbo].[ITEMS] OFF
GO
SET IDENTITY_INSERT [dbo].[MESSAGES] ON 

INSERT [dbo].[MESSAGES] ([id], [context], [send_at], [sender_id], [id_chat]) VALUES (4, N'¿A qué hora abren las puertas?', CAST(N'2025-05-16T17:52:15.783' AS DateTime), 2, 3)
SET IDENTITY_INSERT [dbo].[MESSAGES] OFF
GO
INSERT [dbo].[RESERVES] ([id_event], [id_space], [reservation_date]) VALUES (2, 2, CAST(N'2025-05-06' AS Date))
INSERT [dbo].[RESERVES] ([id_event], [id_space], [reservation_date]) VALUES (3, 3, CAST(N'2025-05-07' AS Date))
INSERT [dbo].[RESERVES] ([id_event], [id_space], [reservation_date]) VALUES (4, 4, CAST(N'2025-05-07' AS Date))
INSERT [dbo].[RESERVES] ([id_event], [id_space], [reservation_date]) VALUES (5, 5, CAST(N'2025-05-07' AS Date))
INSERT [dbo].[RESERVES] ([id_event], [id_space], [reservation_date]) VALUES (7, 4, CAST(N'0001-01-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[ROL] ON 

INSERT [dbo].[ROL] ([id], [name]) VALUES (1, N'Organizador')
INSERT [dbo].[ROL] ([id], [name]) VALUES (2, N'Normal')
INSERT [dbo].[ROL] ([id], [name]) VALUES (3, N'Administrador')
SET IDENTITY_INSERT [dbo].[ROL] OFF
GO
SET IDENTITY_INSERT [dbo].[SPACES] ON 

INSERT [dbo].[SPACES] ([id], [name], [square_meters], [capacity], [address], [latitude], [longitude]) VALUES (1, N'Centro Cultural Vibe', CAST(800.00 AS Decimal(10, 2)), 300, N'Calle Arte 101', CAST(19.43260800 AS Decimal(10, 8)), CAST(-99.13320900 AS Decimal(11, 8)))
INSERT [dbo].[SPACES] ([id], [name], [square_meters], [capacity], [address], [latitude], [longitude]) VALUES (2, N'Sala Moderna', CAST(450.00 AS Decimal(10, 2)), 150, N'Calle Tech 202', CAST(19.44000000 AS Decimal(10, 8)), CAST(-99.15000000 AS Decimal(11, 8)))
INSERT [dbo].[SPACES] ([id], [name], [square_meters], [capacity], [address], [latitude], [longitude]) VALUES (3, N'Auditorio Barcelona Centro', CAST(900.00 AS Decimal(10, 2)), 350, N'Carrer de Mallorca 401', CAST(41.39840000 AS Decimal(10, 8)), CAST(2.16100000 AS Decimal(11, 8)))
INSERT [dbo].[SPACES] ([id], [name], [square_meters], [capacity], [address], [latitude], [longitude]) VALUES (4, N'Sala Gaudí', CAST(500.00 AS Decimal(10, 2)), 200, N'Passeig de Gràcia 55', CAST(41.39170000 AS Decimal(10, 8)), CAST(2.16490000 AS Decimal(11, 8)))
INSERT [dbo].[SPACES] ([id], [name], [square_meters], [capacity], [address], [latitude], [longitude]) VALUES (5, N'Terraza Maremagnum', CAST(300.00 AS Decimal(10, 2)), 120, N'Moll d’Espanya, s/n', CAST(41.37450000 AS Decimal(10, 8)), CAST(2.18330000 AS Decimal(11, 8)))
SET IDENTITY_INSERT [dbo].[SPACES] OFF
GO
SET IDENTITY_INSERT [dbo].[TICKETS] ON 

INSERT [dbo].[TICKETS] ([id], [date], [time], [num_col], [num_row], [id_event], [id_user]) VALUES (2, CAST(N'2025-06-15' AS Date), CAST(N'10:00:00' AS Time), NULL, NULL, 2, 3)
INSERT [dbo].[TICKETS] ([id], [date], [time], [num_col], [num_row], [id_event], [id_user]) VALUES (3, CAST(N'2025-07-05' AS Date), CAST(N'20:30:00' AS Time), 6, 8, 3, 2)
INSERT [dbo].[TICKETS] ([id], [date], [time], [num_col], [num_row], [id_event], [id_user]) VALUES (4, CAST(N'2025-07-12' AS Date), CAST(N'09:00:00' AS Time), NULL, NULL, 4, 3)
INSERT [dbo].[TICKETS] ([id], [date], [time], [num_col], [num_row], [id_event], [id_user]) VALUES (5, CAST(N'2025-07-18' AS Date), CAST(N'21:00:00' AS Time), 3, 4, 5, 2)
INSERT [dbo].[TICKETS] ([id], [date], [time], [num_col], [num_row], [id_event], [id_user]) VALUES (6, CAST(N'2025-06-15' AS Date), CAST(N'10:00:00' AS Time), 0, 0, 2, 11)
INSERT [dbo].[TICKETS] ([id], [date], [time], [num_col], [num_row], [id_event], [id_user]) VALUES (7, CAST(N'2025-07-18' AS Date), CAST(N'21:00:00' AS Time), 0, 0, 5, 11)
INSERT [dbo].[TICKETS] ([id], [date], [time], [num_col], [num_row], [id_event], [id_user]) VALUES (8, CAST(N'2025-06-15' AS Date), CAST(N'10:00:00' AS Time), 0, 0, 2, 11)
INSERT [dbo].[TICKETS] ([id], [date], [time], [num_col], [num_row], [id_event], [id_user]) VALUES (9, CAST(N'2025-07-05' AS Date), CAST(N'20:30:00' AS Time), 0, 0, 3, 11)
INSERT [dbo].[TICKETS] ([id], [date], [time], [num_col], [num_row], [id_event], [id_user]) VALUES (10, CAST(N'2025-07-12' AS Date), CAST(N'09:00:00' AS Time), 0, 0, 4, 11)
INSERT [dbo].[TICKETS] ([id], [date], [time], [num_col], [num_row], [id_event], [id_user]) VALUES (11, CAST(N'2025-06-15' AS Date), CAST(N'10:00:00' AS Time), 0, 0, 2, 11)
INSERT [dbo].[TICKETS] ([id], [date], [time], [num_col], [num_row], [id_event], [id_user]) VALUES (12, CAST(N'2025-06-15' AS Date), CAST(N'10:00:00' AS Time), 0, 0, 2, 12)
INSERT [dbo].[TICKETS] ([id], [date], [time], [num_col], [num_row], [id_event], [id_user]) VALUES (13, CAST(N'2025-06-15' AS Date), CAST(N'10:00:00' AS Time), 0, 0, 2, 11)
SET IDENTITY_INSERT [dbo].[TICKETS] OFF
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 

INSERT [dbo].[USERS] ([id], [fullname], [email], [password], [id_rol]) VALUES (1, N'María Ortega', N'maria.ortega@vibe.com', N'hashed_maria123', 1)
INSERT [dbo].[USERS] ([id], [fullname], [email], [password], [id_rol]) VALUES (2, N'Carlos Ruiz', N'carlos.ruiz@vibe.com', N'1234', 2)
INSERT [dbo].[USERS] ([id], [fullname], [email], [password], [id_rol]) VALUES (3, N'Elena Díaz', N'elena.diaz@vibe.com', N'hashed_elena123', 2)
INSERT [dbo].[USERS] ([id], [fullname], [email], [password], [id_rol]) VALUES (7, N'root', N'root@vibe.com', N'1234', 3)
INSERT [dbo].[USERS] ([id], [fullname], [email], [password], [id_rol]) VALUES (8, N'organizador1', N'organizador@vibe.com', N'1234', 1)
INSERT [dbo].[USERS] ([id], [fullname], [email], [password], [id_rol]) VALUES (9, N'normal', N'normal@prueba.com', N'default', 2)
INSERT [dbo].[USERS] ([id], [fullname], [email], [password], [id_rol]) VALUES (10, N'juan', N'juan@gmail.com', N'1234', 2)
INSERT [dbo].[USERS] ([id], [fullname], [email], [password], [id_rol]) VALUES (11, N'Facuu', N'facu@gmail.com', N'1234', 2)
INSERT [dbo].[USERS] ([id], [fullname], [email], [password], [id_rol]) VALUES (12, N'Sebas Rigoberto Homos Se', N'sebas@gmail.com', N'12345', 2)
INSERT [dbo].[USERS] ([id], [fullname], [email], [password], [id_rol]) VALUES (13, N'Marcos', N'marcos@vibe.com', N'default', 1)
INSERT [dbo].[USERS] ([id], [fullname], [email], [password], [id_rol]) VALUES (14, N'Marcos', N'marcos33@vibe.com', N'1234', 1)
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__USERS__AB6E61641EDD416F]    Script Date: 16/05/2025 17:56:14 ******/
ALTER TABLE [dbo].[USERS] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EVENTS] ADD  DEFAULT ((0.00)) FOR [price]
GO
ALTER TABLE [dbo].[MESSAGES] ADD  DEFAULT (getdate()) FOR [send_at]
GO
ALTER TABLE [dbo].[RESERVES] ADD  DEFAULT (getdate()) FOR [reservation_date]
GO
ALTER TABLE [dbo].[CHAT]  WITH CHECK ADD FOREIGN KEY([id_event])
REFERENCES [dbo].[EVENTS] ([id])
GO
ALTER TABLE [dbo].[CHAT]  WITH CHECK ADD FOREIGN KEY([id_user])
REFERENCES [dbo].[USERS] ([id])
GO
ALTER TABLE [dbo].[EVENTS]  WITH CHECK ADD FOREIGN KEY([id_organizer])
REFERENCES [dbo].[USERS] ([id])
GO
ALTER TABLE [dbo].[ITEMS]  WITH CHECK ADD FOREIGN KEY([id_space])
REFERENCES [dbo].[SPACES] ([id])
GO
ALTER TABLE [dbo].[MESSAGES]  WITH CHECK ADD FOREIGN KEY([id_chat])
REFERENCES [dbo].[CHAT] ([id])
GO
ALTER TABLE [dbo].[MESSAGES]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[USERS] ([id])
GO
ALTER TABLE [dbo].[RESERVES]  WITH CHECK ADD FOREIGN KEY([id_event])
REFERENCES [dbo].[EVENTS] ([id])
GO
ALTER TABLE [dbo].[RESERVES]  WITH CHECK ADD FOREIGN KEY([id_space])
REFERENCES [dbo].[SPACES] ([id])
GO
ALTER TABLE [dbo].[TICKETS]  WITH CHECK ADD FOREIGN KEY([id_event])
REFERENCES [dbo].[EVENTS] ([id])
GO
ALTER TABLE [dbo].[TICKETS]  WITH CHECK ADD FOREIGN KEY([id_user])
REFERENCES [dbo].[USERS] ([id])
GO
ALTER TABLE [dbo].[USERS]  WITH CHECK ADD FOREIGN KEY([id_rol])
REFERENCES [dbo].[ROL] ([id])
GO
USE [master]
GO
ALTER DATABASE [Vibe] SET  READ_WRITE 
GO
