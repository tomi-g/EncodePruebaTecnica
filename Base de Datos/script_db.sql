USE [master]
GO
/****** Object:  Database [DesafioEncode]    Script Date: 18/10/2022 22:38:40 ******/
CREATE DATABASE [DesafioEncode]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DesafioEncode', FILENAME = N'C:\Users\Windows 10\DesafioEncode.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DesafioEncode_log', FILENAME = N'C:\Users\Windows 10\DesafioEncode_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DesafioEncode] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DesafioEncode].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DesafioEncode] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DesafioEncode] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DesafioEncode] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DesafioEncode] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DesafioEncode] SET ARITHABORT OFF 
GO
ALTER DATABASE [DesafioEncode] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DesafioEncode] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DesafioEncode] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DesafioEncode] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DesafioEncode] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DesafioEncode] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DesafioEncode] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DesafioEncode] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DesafioEncode] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DesafioEncode] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DesafioEncode] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DesafioEncode] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DesafioEncode] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DesafioEncode] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DesafioEncode] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DesafioEncode] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DesafioEncode] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DesafioEncode] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DesafioEncode] SET  MULTI_USER 
GO
ALTER DATABASE [DesafioEncode] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DesafioEncode] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DesafioEncode] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DesafioEncode] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DesafioEncode] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DesafioEncode]
GO
/****** Object:  Table [dbo].[Actividades]    Script Date: 18/10/2022 22:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Actividades](
	[id_actividad] [int] IDENTITY(1,1) NOT NULL,
	[create_date] [date] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[actividad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Actividades] PRIMARY KEY CLUSTERED 
(
	[id_actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 18/10/2022 22:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[correo_electronico] [varchar](50) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[telefono] [varchar](50) NULL,
	[pais] [varchar](50) NOT NULL,
	[contacto] [bit] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Actividades] ON 

INSERT [dbo].[Actividades] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (12, CAST(N'2022-10-18' AS Date), 7, N'Creación de usuario')
INSERT [dbo].[Actividades] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (13, CAST(N'2022-10-18' AS Date), 4, N'Modificación de usuario')
INSERT [dbo].[Actividades] ([id_actividad], [create_date], [id_usuario], [actividad]) VALUES (14, CAST(N'2022-10-18' AS Date), 7, N'Eliminación de usuario')
SET IDENTITY_INSERT [dbo].[Actividades] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [apellido], [correo_electronico], [fecha_nacimiento], [telefono], [pais], [contacto], [activo]) VALUES (1, N'Tomas', N'Garcia', N'tomi@gmail.com', CAST(N'1999-03-19' AS Date), N'3517899516', N'ARG', 1, 1)
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [apellido], [correo_electronico], [fecha_nacimiento], [telefono], [pais], [contacto], [activo]) VALUES (2, N'Lionel', N'Messi', N'messi@gmail.com', CAST(N'1987-06-24' AS Date), N'3512101010', N'ARG', 1, 1)
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [apellido], [correo_electronico], [fecha_nacimiento], [telefono], [pais], [contacto], [activo]) VALUES (4, N'Marcelo', N'Gallardo', N'mgallardo@gmail.com', CAST(N'1976-01-18' AS Date), N'3512091218', N'ARG', 1, 1)
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [apellido], [correo_electronico], [fecha_nacimiento], [telefono], [pais], [contacto], [activo]) VALUES (7, N'Julian', N'Alvarez', N'spider@gmail.com', CAST(N'2001-01-19' AS Date), N'3519999999', N'ARG', 1, 0)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Actividades]  WITH CHECK ADD  CONSTRAINT [FK_Actividades_Usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[Actividades] CHECK CONSTRAINT [FK_Actividades_Usuarios]
GO
USE [master]
GO
ALTER DATABASE [DesafioEncode] SET  READ_WRITE 
GO
