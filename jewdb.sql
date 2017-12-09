/****** Object:  Database [jewdb]    Script Date: 9/12/2017 9:35:23 a. m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'jewdb')
BEGIN
CREATE DATABASE [jewdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'jewdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\jewdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'jewdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\jewdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [jewdb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [jewdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [jewdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [jewdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [jewdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [jewdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [jewdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [jewdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [jewdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [jewdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [jewdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [jewdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [jewdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [jewdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [jewdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [jewdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [jewdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [jewdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [jewdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [jewdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [jewdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [jewdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [jewdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [jewdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [jewdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [jewdb] SET  MULTI_USER 
GO
ALTER DATABASE [jewdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [jewdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [jewdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [jewdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [jewdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [jewdb] SET QUERY_STORE = OFF
GO
USE [jewdb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
/****** Object:  Table [dbo].[alerta]    Script Date: 9/12/2017 9:35:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[alerta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[alerta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[tipo] [nvarchar](50) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[completado] [tinyint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cliente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo] [int] NOT NULL,
	[id_tipo_docid] [int] NOT NULL,
	[docid] [nvarchar](50) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[direccion] [nvarchar](100) NULL,
	[telefono] [nchar](10) NULL,
	[correo] [nvarchar](50) NULL,
	[nac_dia] [tinyint] NULL,
	[nac_mes] [tinyint] NULL,
	[nac_ano] [int] NULL,
 CONSTRAINT [cliente_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[cliente_tipo]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cliente_tipo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cliente_tipo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NOT NULL,
 CONSTRAINT [cliente_tipo_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[empleado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[empleado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_rol] [int] NOT NULL,
	[id_tipo_docid] [int] NOT NULL,
	[docid] [nvarchar](50) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[telefono] [nchar](10) NULL,
	[correo] [nvarchar](50) NOT NULL,
	[password] [binary](64) NOT NULL,
	[salt] [uniqueidentifier] NOT NULL,
 CONSTRAINT [empleado_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[factura]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[factura]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[factura](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_estado] [int] NOT NULL,
	[descripcion] [nvarchar](255) NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_actualizacion] [datetime] NULL,
	[fecha_despacho] [datetime] NULL,
 CONSTRAINT [factura_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[factura_detalle]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[factura_detalle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[factura_detalle](
	[id_factura] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[id_vehiculo] [int] NULL,
	[id_empleado] [int] NOT NULL,
	[cantidad] [decimal](11, 2) NOT NULL,
	[precio] [decimal](11, 2) NOT NULL,
 CONSTRAINT [factura_detalle_pk] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[factura_estado]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[factura_estado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[factura_estado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [factura_estado_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[inventario]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[inventario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[inventario](
	[id_producto] [int] NOT NULL,
	[cantidad_disponible] [decimal](11, 2) NOT NULL,
	[cantidad_minima] [decimal](11, 2) NOT NULL,
	[precio] [decimal](11, 2) NOT NULL,
 CONSTRAINT [inventario_pk] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[permiso]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[permiso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[permiso](
	[id_rol] [int] NOT NULL,
	[id_tarea] [int] NOT NULL,
	[permitido] [tinyint] NOT NULL,
 CONSTRAINT [permiso_pk] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC,
	[id_tarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[producto]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[producto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[producto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_categoria] [int] NOT NULL,
	[id_medida] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [producto_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[producto_categoria]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[producto_categoria]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[producto_categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [producto_categoria_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[producto_medida]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[producto_medida]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[producto_medida](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [producto_medida_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[rol]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rol]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[rol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [rol_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tarea]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tarea]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tarea](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [tarea_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tipo_docid]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tipo_docid]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tipo_docid](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [tipo_docid_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[vehiculo]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vehiculo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vehiculo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_marca] [int] NOT NULL,
	[id_modelo] [int] NOT NULL,
	[ano] [int] NOT NULL,
	[matricula] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [vehiculo_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[vehiculo_marca]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vehiculo_marca]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vehiculo_marca](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [vehiculo_marca_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[vehiculo_modelo]    Script Date: 9/12/2017 9:35:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vehiculo_modelo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vehiculo_modelo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_marca] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [vehiculo_modelo_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[cliente_tipo] ON 

INSERT [dbo].[cliente_tipo] ([id], [nombre], [descripcion]) VALUES (1, N'Persona', N'Persona física.')
INSERT [dbo].[cliente_tipo] ([id], [nombre], [descripcion]) VALUES (2, N'Empresa', N'Persona jurídica o comercial.')
SET IDENTITY_INSERT [dbo].[cliente_tipo] OFF
SET IDENTITY_INSERT [dbo].[empleado] ON 

INSERT [dbo].[empleado] ([id], [id_rol], [id_tipo_docid], [docid], [nombre], [apellido], [telefono], [correo], [password], [salt]) VALUES (1, 1, 1, N'03100000000', N'Jon', N'Estrella', N'8099843907', N'jestrella04@gmail.com', 0xB27BF25F711F0E6B0E1A46B98E2B264267A4A09BABB560C5AE50E10132E3881FD6BE137738AC6F6A832E3B30885AB3F63ABC93F8B2F822229B8C78DBEC023B6B, N'82c13558-c176-44d7-8023-08dda5caf49e')
SET IDENTITY_INSERT [dbo].[empleado] OFF
SET IDENTITY_INSERT [dbo].[factura_estado] ON 

INSERT [dbo].[factura_estado] ([id], [nombre], [descripcion]) VALUES (1, N'Abierta', N'Factura en proceso.')
INSERT [dbo].[factura_estado] ([id], [nombre], [descripcion]) VALUES (2, N'Cancelado', N'Factura cancelada por el cliente o taller.')
INSERT [dbo].[factura_estado] ([id], [nombre], [descripcion]) VALUES (3, N'Despachado', N'Productos despachados, pago pendiente.')
INSERT [dbo].[factura_estado] ([id], [nombre], [descripcion]) VALUES (4, N'Completado', N'Factura pagada en su totalidad.')
SET IDENTITY_INSERT [dbo].[factura_estado] OFF
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 1, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 2, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 3, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 4, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 5, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 6, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 7, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 8, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 9, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 10, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 11, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 12, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 13, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 14, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 15, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 16, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 17, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (2, 1, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (2, 2, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (2, 3, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (2, 4, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (3, 1, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (3, 2, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (3, 3, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (3, 4, 1)
SET IDENTITY_INSERT [dbo].[producto_categoria] ON 

INSERT [dbo].[producto_categoria] ([id], [nombre], [descripcion]) VALUES (1, N'Servicios', NULL)
INSERT [dbo].[producto_categoria] ([id], [nombre], [descripcion]) VALUES (2, N'Electricidad', NULL)
INSERT [dbo].[producto_categoria] ([id], [nombre], [descripcion]) VALUES (3, N'Herramientas Neumáticas', NULL)
INSERT [dbo].[producto_categoria] ([id], [nombre], [descripcion]) VALUES (4, N'Herramientas para Chapería', NULL)
INSERT [dbo].[producto_categoria] ([id], [nombre], [descripcion]) VALUES (5, N'Herramientas para Frenos', NULL)
INSERT [dbo].[producto_categoria] ([id], [nombre], [descripcion]) VALUES (6, N'Herramientas para Lubricentro', NULL)
INSERT [dbo].[producto_categoria] ([id], [nombre], [descripcion]) VALUES (7, N'Instrumental y Medición', NULL)
SET IDENTITY_INSERT [dbo].[producto_categoria] OFF
SET IDENTITY_INSERT [dbo].[producto_medida] ON 

INSERT [dbo].[producto_medida] ([id], [nombre], [descripcion]) VALUES (1, N'Unidad', NULL)
SET IDENTITY_INSERT [dbo].[producto_medida] OFF
SET IDENTITY_INSERT [dbo].[rol] ON 

INSERT [dbo].[rol] ([id], [nombre], [descripcion]) VALUES (1, N'Administrador', N'Acceso a todas las funciones del sistema.')
INSERT [dbo].[rol] ([id], [nombre], [descripcion]) VALUES (2, N'Recepción', N'Acceso a administrar facturas y clientes.')
INSERT [dbo].[rol] ([id], [nombre], [descripcion]) VALUES (3, N'Mecánico', N'Acceso a admiinistrar facturas.')
INSERT [dbo].[rol] ([id], [nombre], [descripcion]) VALUES (4, N'Intendente', N'Acceso a administrar productos e inventario.')
SET IDENTITY_INSERT [dbo].[rol] OFF
SET IDENTITY_INSERT [dbo].[tarea] ON 

INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (1, N'Ver Factura', N'Ver facturas.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (2, N'Crear Factura', N'Crear facturas.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (3, N'Actualizar Factura', N'Actualizar facturas.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (4, N'Ver Cliente', N'Ver clientes.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (5, N'Crear Cliente', N'Crear clientes.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (6, N'Actualizar Cliente', N'Actualizar clientes.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (7, N'Ver Empleado', N'Ver empleados.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (8, N'Crear Empleado', N'Crear empleados.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (9, N'Actualizar empleado', N'Actualizar empleados.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (10, N'Inventario', N'Administrar inventario de productos')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (11, N'Ver Producto', N'Ver productos.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (12, N'Crear Producto', N'Crear productos.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (13, N'Actualizar Producto', N'Actualizar productos.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (14, N'Ver Rol', N'Ver roles.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (15, N'Crear Rol', N'Crear roles.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (16, N'Actualizar Rol', N'Actualizar roles.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (17, N'Eliminar Rol', N'Eliminar roles.')
SET IDENTITY_INSERT [dbo].[tarea] OFF
SET IDENTITY_INSERT [dbo].[tipo_docid] ON 

INSERT [dbo].[tipo_docid] ([id], [nombre], [descripcion]) VALUES (1, N'Cédula', N'Cédula de identidad.')
INSERT [dbo].[tipo_docid] ([id], [nombre], [descripcion]) VALUES (2, N'RNC', N'RNC.')
INSERT [dbo].[tipo_docid] ([id], [nombre], [descripcion]) VALUES (3, N'Pasaporte', N'Pasaporte.')
SET IDENTITY_INSERT [dbo].[tipo_docid] OFF
SET IDENTITY_INSERT [dbo].[vehiculo_marca] ON 

INSERT [dbo].[vehiculo_marca] ([id], [nombre], [descripcion]) VALUES (1, N'Honda', NULL)
INSERT [dbo].[vehiculo_marca] ([id], [nombre], [descripcion]) VALUES (2, N'Toyota', NULL)
INSERT [dbo].[vehiculo_marca] ([id], [nombre], [descripcion]) VALUES (3, N'Hyundai', NULL)
SET IDENTITY_INSERT [dbo].[vehiculo_marca] OFF
SET IDENTITY_INSERT [dbo].[vehiculo_modelo] ON 

INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (1, 1, N'Civic', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (2, 1, N'Accord', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (3, 1, N'CR-V', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (4, 1, N'Logo', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (5, 2, N'Corolla', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (6, 2, N'Camry', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (7, 2, N'Corona', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (8, 2, N'RAV4', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (9, 3, N'Sonata', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (10, 3, N'Santa Fe', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (11, 3, N'Accent', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (12, 3, N'Elantra', NULL)
SET IDENTITY_INSERT [dbo].[vehiculo_modelo] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [empleado_correo_uq]    Script Date: 9/12/2017 9:35:25 a. m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[empleado]') AND name = N'empleado_correo_uq')
ALTER TABLE [dbo].[empleado] ADD  CONSTRAINT [empleado_correo_uq] UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [vehiculo_maricula_uq]    Script Date: 9/12/2017 9:35:25 a. m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[vehiculo]') AND name = N'vehiculo_maricula_uq')
ALTER TABLE [dbo].[vehiculo] ADD  CONSTRAINT [vehiculo_maricula_uq] UNIQUE NONCLUSTERED 
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_alerta_completado]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[alerta] ADD  CONSTRAINT [DF_alerta_completado]  DEFAULT ((0)) FOR [completado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[df_fecha_creacion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[factura] ADD  CONSTRAINT [df_fecha_creacion]  DEFAULT (getdate()) FOR [fecha_creacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_alerta_cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[alerta]'))
ALTER TABLE [dbo].[alerta]  WITH CHECK ADD  CONSTRAINT [FK_alerta_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_alerta_cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[alerta]'))
ALTER TABLE [dbo].[alerta] CHECK CONSTRAINT [FK_alerta_cliente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_cliente_cliente_tipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[cliente]'))
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_cliente_tipo] FOREIGN KEY([id_tipo])
REFERENCES [dbo].[cliente_tipo] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_cliente_cliente_tipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[cliente]'))
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_cliente_tipo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_cliente_tipo_docid]') AND parent_object_id = OBJECT_ID(N'[dbo].[cliente]'))
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_tipo_docid] FOREIGN KEY([id_tipo_docid])
REFERENCES [dbo].[tipo_docid] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_cliente_tipo_docid]') AND parent_object_id = OBJECT_ID(N'[dbo].[cliente]'))
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_tipo_docid]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_empleado_rol]') AND parent_object_id = OBJECT_ID(N'[dbo].[empleado]'))
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [FK_empleado_rol] FOREIGN KEY([id_rol])
REFERENCES [dbo].[rol] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_empleado_rol]') AND parent_object_id = OBJECT_ID(N'[dbo].[empleado]'))
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [FK_empleado_rol]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_empleado_tipo_docid]') AND parent_object_id = OBJECT_ID(N'[dbo].[empleado]'))
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [FK_empleado_tipo_docid] FOREIGN KEY([id_tipo_docid])
REFERENCES [dbo].[tipo_docid] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_empleado_tipo_docid]') AND parent_object_id = OBJECT_ID(N'[dbo].[empleado]'))
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [FK_empleado_tipo_docid]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_factura_cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[factura]'))
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_factura_cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[factura]'))
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_cliente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_factura_factura_estado]') AND parent_object_id = OBJECT_ID(N'[dbo].[factura]'))
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_factura_estado] FOREIGN KEY([id_estado])
REFERENCES [dbo].[factura_estado] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_factura_factura_estado]') AND parent_object_id = OBJECT_ID(N'[dbo].[factura]'))
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_factura_estado]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_factura_detalle_empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[factura_detalle]'))
ALTER TABLE [dbo].[factura_detalle]  WITH CHECK ADD  CONSTRAINT [FK_factura_detalle_empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[empleado] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_factura_detalle_empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[factura_detalle]'))
ALTER TABLE [dbo].[factura_detalle] CHECK CONSTRAINT [FK_factura_detalle_empleado]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_factura_detalle_factura]') AND parent_object_id = OBJECT_ID(N'[dbo].[factura_detalle]'))
ALTER TABLE [dbo].[factura_detalle]  WITH CHECK ADD  CONSTRAINT [FK_factura_detalle_factura] FOREIGN KEY([id_factura])
REFERENCES [dbo].[factura] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_factura_detalle_factura]') AND parent_object_id = OBJECT_ID(N'[dbo].[factura_detalle]'))
ALTER TABLE [dbo].[factura_detalle] CHECK CONSTRAINT [FK_factura_detalle_factura]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_factura_detalle_producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[factura_detalle]'))
ALTER TABLE [dbo].[factura_detalle]  WITH CHECK ADD  CONSTRAINT [FK_factura_detalle_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[producto] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_factura_detalle_producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[factura_detalle]'))
ALTER TABLE [dbo].[factura_detalle] CHECK CONSTRAINT [FK_factura_detalle_producto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_factura_detalle_vehiculo]') AND parent_object_id = OBJECT_ID(N'[dbo].[factura_detalle]'))
ALTER TABLE [dbo].[factura_detalle]  WITH CHECK ADD  CONSTRAINT [FK_factura_detalle_vehiculo] FOREIGN KEY([id_vehiculo])
REFERENCES [dbo].[vehiculo] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_factura_detalle_vehiculo]') AND parent_object_id = OBJECT_ID(N'[dbo].[factura_detalle]'))
ALTER TABLE [dbo].[factura_detalle] CHECK CONSTRAINT [FK_factura_detalle_vehiculo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_inventario_producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[inventario]'))
ALTER TABLE [dbo].[inventario]  WITH CHECK ADD  CONSTRAINT [FK_inventario_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[producto] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_inventario_producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[inventario]'))
ALTER TABLE [dbo].[inventario] CHECK CONSTRAINT [FK_inventario_producto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_permiso_rol]') AND parent_object_id = OBJECT_ID(N'[dbo].[permiso]'))
ALTER TABLE [dbo].[permiso]  WITH CHECK ADD  CONSTRAINT [FK_permiso_rol] FOREIGN KEY([id_rol])
REFERENCES [dbo].[rol] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_permiso_rol]') AND parent_object_id = OBJECT_ID(N'[dbo].[permiso]'))
ALTER TABLE [dbo].[permiso] CHECK CONSTRAINT [FK_permiso_rol]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_permiso_tarea]') AND parent_object_id = OBJECT_ID(N'[dbo].[permiso]'))
ALTER TABLE [dbo].[permiso]  WITH CHECK ADD  CONSTRAINT [FK_permiso_tarea] FOREIGN KEY([id_tarea])
REFERENCES [dbo].[tarea] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_permiso_tarea]') AND parent_object_id = OBJECT_ID(N'[dbo].[permiso]'))
ALTER TABLE [dbo].[permiso] CHECK CONSTRAINT [FK_permiso_tarea]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_producto_producto_categoria]') AND parent_object_id = OBJECT_ID(N'[dbo].[producto]'))
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_producto_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[producto_categoria] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_producto_producto_categoria]') AND parent_object_id = OBJECT_ID(N'[dbo].[producto]'))
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_producto_producto_categoria]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_producto_producto_medida]') AND parent_object_id = OBJECT_ID(N'[dbo].[producto]'))
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_producto_medida] FOREIGN KEY([id_medida])
REFERENCES [dbo].[producto_medida] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_producto_producto_medida]') AND parent_object_id = OBJECT_ID(N'[dbo].[producto]'))
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_producto_producto_medida]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_vehiculo_cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[vehiculo]'))
ALTER TABLE [dbo].[vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_vehiculo_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_vehiculo_cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[vehiculo]'))
ALTER TABLE [dbo].[vehiculo] CHECK CONSTRAINT [FK_vehiculo_cliente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_vehiculo_vehiculo_marca]') AND parent_object_id = OBJECT_ID(N'[dbo].[vehiculo]'))
ALTER TABLE [dbo].[vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_vehiculo_vehiculo_marca] FOREIGN KEY([id_marca])
REFERENCES [dbo].[vehiculo_marca] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_vehiculo_vehiculo_marca]') AND parent_object_id = OBJECT_ID(N'[dbo].[vehiculo]'))
ALTER TABLE [dbo].[vehiculo] CHECK CONSTRAINT [FK_vehiculo_vehiculo_marca]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_vehiculo_vehiculo_modelo]') AND parent_object_id = OBJECT_ID(N'[dbo].[vehiculo]'))
ALTER TABLE [dbo].[vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_vehiculo_vehiculo_modelo] FOREIGN KEY([id_modelo])
REFERENCES [dbo].[vehiculo_modelo] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_vehiculo_vehiculo_modelo]') AND parent_object_id = OBJECT_ID(N'[dbo].[vehiculo]'))
ALTER TABLE [dbo].[vehiculo] CHECK CONSTRAINT [FK_vehiculo_vehiculo_modelo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_vehiculo_modelo_vehiculo_marca]') AND parent_object_id = OBJECT_ID(N'[dbo].[vehiculo_modelo]'))
ALTER TABLE [dbo].[vehiculo_modelo]  WITH CHECK ADD  CONSTRAINT [FK_vehiculo_modelo_vehiculo_marca] FOREIGN KEY([id_marca])
REFERENCES [dbo].[vehiculo_marca] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_vehiculo_modelo_vehiculo_marca]') AND parent_object_id = OBJECT_ID(N'[dbo].[vehiculo_modelo]'))
ALTER TABLE [dbo].[vehiculo_modelo] CHECK CONSTRAINT [FK_vehiculo_modelo_vehiculo_marca]
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_factura_detalle]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_factura_detalle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_delete_factura_detalle] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_delete_factura_detalle]
	@FacturaId [int],
	@ProductoId [int]
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM
		[dbo].[factura_detalle]
	WHERE 
		[id_factura] = @FacturaId AND [id_producto] = @ProductoId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_cliente]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_insert_cliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_insert_cliente] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_insert_cliente]
	@TipoId [int],
	@TipoDocId [int],
	@DocId [nvarchar](50),
	@NombreCliente [nvarchar](50),
	@ApellidoCliente [nvarchar](50),
	@DireccionCliente [nvarchar](100),
	@TelefonoCliente [nchar](10),
	@CorreoCliente [nvarchar](50),
	@FechaNacDia [tinyint],
	@FechaNacMes [tinyint],
	@FechaNacAno [int]
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO
		[dbo].[cliente]
	(
		[id_tipo],
		[id_tipo_docid],
		[docid],
		[nombre],
		[apellido],
		[direccion],
		[telefono],
		[correo],
		[nac_dia],
		[nac_mes],
		[nac_ano]
	)
	VALUES
	(
		@TipoId,
		@TipoDocId,
		@DocId,
		@NombreCliente,
		@ApellidoCliente,
		@DireccionCliente,
		@TelefonoCliente,
		@CorreoCliente,
		@FechaNacDia,
		@FechaNacMes,
		@FechaNacAno
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_empleado]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_insert_empleado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_insert_empleado] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_insert_empleado]
	@RolId [int],
	@TipoDocId [int],
	@DocId [nvarchar](50),
	@NombreEmpleado [nvarchar](50),
	@ApellidoEmpleado [nvarchar](50),
	@TelefonoEmpleado [nchar](10),
	@CorreoEmpleado [nvarchar](50),
	@PasswordEmpleado [nvarchar](255)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Salt UNIQUEIDENTIFIER = NEWID()

	INSERT INTO
		[dbo].[empleado]
	(
		[id_rol],
		[id_tipo_docid],
		[docid],
		[nombre],
		[apellido],
		[telefono],
		[correo],
		[password],
		[salt]
	)
	VALUES
	(
		@RolId,
		@TipoDocId,
		@DocId,
		@NombreEmpleado,
		@ApellidoEmpleado,
		@TelefonoEmpleado,
		@CorreoEmpleado,
		HASHBYTES('SHA2_512', @PasswordEmpleado + CAST(@Salt AS nvarchar(36))),
		@Salt
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_factura]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_insert_factura]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_insert_factura] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_insert_factura]
	@ClienteId [int],
	@EstadoId [int],
	@DescrFactura [nvarchar](255),
	@InsertedFacturaId [int] = NULL OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO
		[dbo].[factura]
	(
		[id_cliente],
		[id_estado],
		[descripcion]
	)
	VALUES
	(
		@ClienteId,
		@EstadoId,
		@DescrFactura
	)

	SET @InsertedFacturaId = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_factura_detalle]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_insert_factura_detalle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_insert_factura_detalle] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_insert_factura_detalle]
	@FacturaId [int],
	@ProductoId [int],
	@VehiculoId [int],
	@EmpleadoId [int],
	@Cantidad [decimal](11,2),
	@Precio [decimal](11,2)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO
		[dbo].[factura_detalle]
	(
		[id_factura],
		[id_producto],
		[id_vehiculo],
		[id_empleado],
		[cantidad],
		[precio]
	)
	VALUES
	(
		@FacturaId,
		@ProductoId,
		@VehiculoId,
		@EmpleadoId,
		@Cantidad,
		@Precio
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_producto_inventario]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_insert_producto_inventario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_insert_producto_inventario] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_insert_producto_inventario]
	@ProductoId[int] = NULL,
	@CantidadDisponible[decimal](11,2),
	@CantidadMinima[decimal](11,2),
	@Precio[decimal](11,2)
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT [id_producto] FROM [dbo].[inventario] WHERE [id_producto] = @ProductoId)
	BEGIN
		UPDATE
			[dbo].[inventario]
		SET
			[cantidad_disponible] = @CantidadDisponible,
			[cantidad_minima] = @CantidadMinima,
			[precio] = @Precio
		WHERE
			[id_producto] = @ProductoId
	END

	ELSE
	BEGIN
		INSERT INTO
			[dbo].[inventario]
		(
			[id_producto],
			[cantidad_disponible],
			[cantidad_minima],
			[precio]
		)
		VALUES
		(
			@ProductoId,
			@CantidadDisponible,
			@CantidadMinima,
			@Precio
		)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_vehiculo]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_insert_vehiculo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_insert_vehiculo] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_insert_vehiculo]
	@ClienteId [int],
	@MarcaId [int],
	@ModeloId[int],
	@AnoVehiculo [int],
	@MatriculaVehiculo [nvarchar](50),
	@DescrVehiculo [nvarchar](255)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO
		[dbo].[vehiculo]
	(
		[id_cliente],
		[id_marca],
		[id_modelo],
		[ano],
		[matricula],
		[descripcion]
	)
	VALUES
	(
		@ClienteId,
		@MarcaId,
		@ModeloId,
		@AnoVehiculo,
		@MatriculaVehiculo,
		@DescrVehiculo
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_cliente]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_cliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_cliente] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_cliente]
	@ClienteId[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[id_tipo],
		(SELECT [nombre] FROM [dbo].[cliente_tipo] WHERE [cliente_tipo].[id] = [cliente].[id_tipo]) AS nombre_tipo,
		[id_tipo_docid],
		(SELECT [nombre] FROM [dbo].[tipo_docid] WHERE [tipo_docid].[id] = [cliente].[id_tipo_docid]) AS nombre_docid,
		[docid],
		[nombre],
		[apellido],
		[direccion],
		[telefono],
		[correo],
		[nac_dia],
		[nac_mes],
		[nac_ano]
	FROM
		[dbo].[cliente]
	WHERE
	(
		@ClienteId is NULL OR [id] = @ClienteId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_cliente_tipo]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_cliente_tipo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_cliente_tipo] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_cliente_tipo]
	@ClienteId[int] = NULL
AS
BEGIN  
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[cliente_tipo]
	WHERE
	(
		@ClienteId is NULL OR [id] = @ClienteId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_empleado]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_empleado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_empleado] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_empleado]
	@EmpleadoId[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[id_rol],
		(SELECT [nombre] FROM [dbo].[rol] WHERE [rol].[id] = [empleado].[id_rol]) AS nombre_rol,
		[id_tipo_docid],
		(SELECT [nombre] FROM [dbo].[tipo_docid] WHERE [tipo_docid].[id] = [empleado].[id_tipo_docid]) AS nombre_docid,
		[docid],
		[nombre],
		[apellido],
		CONCAT_WS(' ', [nombre], [apellido]) AS nombre_completo,
		[telefono],
		[correo],
		[password]
	FROM
		[dbo].[empleado]
	WHERE
	(
		@EmpleadoId is NULL OR [id] = @EmpleadoId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_factura]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_factura]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_factura] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_factura]
	@FacturaId[int] = NULL
	--@FechaIni [datetime],
	--@FechaFin [datetime]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[id_cliente],
		(SELECT CONCAT_WS( ' ', [nombre], [apellido]) FROM [dbo].[cliente] WHERE [cliente].[id] = [factura].[id_cliente]) AS nombre_cliente,
		[id_estado],
		(SELECT [nombre] FROM [dbo].[cliente_tipo] WHERE [cliente_tipo].[id] = [factura].[id_estado]) AS nombre_estado,
		[descripcion],
		[fecha_creacion],
		[fecha_actualizacion],
		[fecha_despacho]
	FROM
		[dbo].[factura]
	WHERE
	(
		--[factura].[fecha_creacion] >= @FechaIni AND [factura].[fecha_creacion] <= @FechaFin
		@FacturaId is NULL OR [id] = @FacturaId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_factura_detalle]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_factura_detalle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_factura_detalle] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_factura_detalle]
	@FacturaId [int]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id_factura],
		[id_producto],
		(SELECT [nombre] FROM [dbo].[producto] WHERE [producto].[id] = [factura_detalle].[id_producto]) AS nombre_producto,
		[id_vehiculo],
		[id_empleado],
		[cantidad],
		[precio]
	FROM
		[dbo].[factura_detalle]
	WHERE
		[id_factura] = @FacturaId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_factura_estado]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_factura_estado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_factura_estado] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_factura_estado]
	@EstadoId[int] = NULL
AS
BEGIN  
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[factura_estado]
	WHERE
	(
		@EstadoId is NULL OR [id] = @EstadoId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_inventario]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_inventario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_inventario] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_inventario]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id_producto],
		(SELECT [nombre] FROM [dbo].[producto] WHERE [producto].[id] = [inventario].[id_producto]) AS nombre_producto,
		[cantidad_disponible],
		[cantidad_minima],
		[precio]
	FROM [dbo].[inventario]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_permiso]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_permiso]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_permiso] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_permiso]
	@UsuarioId [int]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id_tarea],
		(SELECT [nombre] FROM [dbo].[tarea] WHERE [tarea].[id] = [permiso].[id_tarea]) AS nombre_tarea
    FROM
		[dbo].[permiso]
    WHERE
		[id_rol] = (SELECT [id_rol] FROM [dbo].[empleado] WHERE [id] = @UsuarioId)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_producto]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_producto]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_producto] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_producto]
	@ProductoId[int] = NULL
AS
BEGIN  
	SET NOCOUNT ON;
	SELECT
		[id],
		[id_categoria],
		(SELECT [nombre] FROM [dbo].[producto_categoria] WHERE [producto_categoria].[id] = [producto].[id_categoria]) AS nombre_categoria,
		[id_medida],
		(SELECT [nombre] FROM [dbo].[producto_medida] WHERE [producto_medida].[id] = [producto].[id_medida]) AS nombre_medida,
		[nombre],
		[descripcion]
	FROM
		[dbo].[producto]
	WHERE
	(
		@ProductoId is NULL OR [id] = @ProductoId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_producto_categoria]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_producto_categoria]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_producto_categoria] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_producto_categoria]
	@CategoriaId[int] = NULL
AS
BEGIN  
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[producto_categoria]
	WHERE
	(
		@CategoriaId is NULL OR [id] = @CategoriaId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_producto_medida]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_producto_medida]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_producto_medida] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_producto_medida]
	@MedidaId[int] = NULL
AS
BEGIN  
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[producto_medida]
	WHERE
	(
		@MedidaId is NULL OR [id] = @MedidaId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_rol]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_rol]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_rol] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_rol]
	@RolId[int] = NULL
AS
BEGIN  
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[rol]
	WHERE
	(
		@RolId is NULL OR [id] = @RolId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_tarea]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_tarea]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_tarea] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_tarea]
	@TareaId[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[tarea]
	WHERE
	(
		@TareaId is NULL OR [id] = @TareaId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_tipo_docid]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_tipo_docid]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_tipo_docid] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_tipo_docid]
	@DocId[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[tipo_docid]
	WHERE
	(
		@DocId is NULL OR [id] = @DocId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_vehiculo]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_vehiculo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_vehiculo] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_vehiculo]
	@VehiculoId[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[id_cliente],
		(SELECT CONCAT_WS( ' ', [nombre], [apellido]) FROM [dbo].[cliente] WHERE [cliente].[id] = [vehiculo].[id_cliente]) AS nombre_cliente,
		[id_marca],
		(SELECT [nombre] FROM [dbo].[vehiculo_marca] WHERE [vehiculo_marca].[id] = [vehiculo].[id_marca]) AS nombre_marca,
		[id_modelo],
		(SELECT [nombre] FROM [dbo].[vehiculo_modelo] WHERE [vehiculo_modelo].[id] = [vehiculo].[id_modelo]) AS nombre_modelo,
		[ano],
		[matricula],
		[descripcion]
	FROM
		[dbo].[vehiculo]
	WHERE
	(
		@VehiculoId is NULL OR [id] = @VehiculoId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_vehiculo_marca]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_vehiculo_marca]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_vehiculo_marca] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_vehiculo_marca]
	@MarcaId[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[vehiculo_marca]
	WHERE
	(
		@MarcaId is NULL OR [id] = @MarcaId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_vehiculo_modelo]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_select_vehiculo_modelo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_select_vehiculo_modelo] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_select_vehiculo_modelo]
	@ModeloId[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[vehiculo_modelo]
	WHERE
	(
		@ModeloId is NULL OR [id] = @ModeloId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_verify_empleado_login]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_verify_empleado_login]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_verify_empleado_login] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_verify_empleado_login] 
	@LoginEmail nvarchar(50),
	@LoginPassword nvarchar(50),
	@ResponseMessage NVARCHAR(255) = '' OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @userId int

    IF EXISTS (SELECT TOP 1 [id] FROM [dbo].[empleado] WHERE [correo] = @LoginEmail)
    BEGIN
		SET @userId = (SELECT id FROM [dbo].[empleado] WHERE [correo] = @LoginEmail AND [password] = HASHBYTES('SHA2_512', @LoginPassword + CAST([salt] AS nvarchar(36))))

		IF(@userId IS NULL)
			SET @ResponseMessage = 'La contraseña es inválida.'
		ELSE 
			SET @ResponseMessage = 'Credenciales válidas.'
	END
	ELSE
		SET @ResponseMessage = 'Credenciales incorrectas.'
END
GO
/****** Object:  Trigger [dbo].[trg_after_update_factura]    Script Date: 9/12/2017 9:35:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_after_update_factura]'))
EXEC dbo.sp_executesql @statement = N'
CREATE TRIGGER [dbo].[trg_after_update_factura]
ON [dbo].[factura]
AFTER UPDATE
AS
BEGIN
	UPDATE [dbo].[factura]
	SET [fecha_actualizacion] = GETDATE()
	FROM inserted
	WHERE [factura].[id] = inserted.id;
END
' 
GO
ALTER TABLE [dbo].[factura] ENABLE TRIGGER [trg_after_update_factura]
GO
ALTER DATABASE [jewdb] SET  READ_WRITE 
GO
