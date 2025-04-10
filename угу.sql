USE [master]
GO
/****** Object:  Database [ServicesAndOrders]    Script Date: 09.04.2025 15:40:30 ******/
CREATE DATABASE [ServicesAndOrders]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ServicesAndOrders', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ServicesAndOrders.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'ServicesAndOrders_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ServicesAndOrders_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ServicesAndOrders] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ServicesAndOrders].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ServicesAndOrders] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET ARITHABORT OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ServicesAndOrders] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ServicesAndOrders] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ServicesAndOrders] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ServicesAndOrders] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ServicesAndOrders] SET  MULTI_USER 
GO
ALTER DATABASE [ServicesAndOrders] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ServicesAndOrders] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ServicesAndOrders] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ServicesAndOrders] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ServicesAndOrders] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ServicesAndOrders] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ServicesAndOrders] SET QUERY_STORE = OFF
GO
USE [ServicesAndOrders]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 09.04.2025 15:40:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[НомерЗаказа] [int] NOT NULL,
	[ДатаЗаказа] [date] NOT NULL,
	[КодУслуги] [int] NOT NULL,
	[СтоимостьУслуги] [decimal](10, 2) NOT NULL,
	[ФормаОплаты] [varchar](20) NULL,
 CONSTRAINT [PK_Заказы] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 09.04.2025 15:40:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[КодКлиента] [int] NOT NULL,
	[ФамилияКлиента] [varchar](255) NOT NULL,
	[АдресКлиента] [varchar](255) NULL,
	[Телефон] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[КодКлиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[РеестрЗаказов]    Script Date: 09.04.2025 15:40:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[РеестрЗаказов](
	[НомерЗаказа] [int] NOT NULL,
	[КодКлиента] [int] NOT NULL,
	[СтоимостьЗаказа] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[НомерЗаказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СправочникУслуг]    Script Date: 09.04.2025 15:40:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СправочникУслуг](
	[КодУслуги] [int] NOT NULL,
	[Наименование] [varchar](255) NOT NULL,
	[Цена] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[КодУслуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Заказы] ON 

INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (1, 1, CAST(N'2024-01-15' AS Date), 1, CAST(540.00 AS Decimal(10, 2)), N'Безналичный расчет')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (2, 2, CAST(N'2024-01-20' AS Date), 2, CAST(1000.00 AS Decimal(10, 2)), N'Безналичный расчет')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (3, 3, CAST(N'2024-02-01' AS Date), 3, CAST(2500.00 AS Decimal(10, 2)), N'Наличные')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (4, 4, CAST(N'2024-02-10' AS Date), 4, CAST(1500.00 AS Decimal(10, 2)), N'Безналичный расчет')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (5, 5, CAST(N'2024-02-28' AS Date), 5, CAST(2000.00 AS Decimal(10, 2)), N'Наличные')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (6, 6, CAST(N'2024-03-05' AS Date), 1, CAST(500.00 AS Decimal(10, 2)), N'Безналичный расчет')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (7, 7, CAST(N'2024-03-12' AS Date), 2, CAST(1000.00 AS Decimal(10, 2)), N'Наличные')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (8, 8, CAST(N'2024-03-20' AS Date), 3, CAST(2500.00 AS Decimal(10, 2)), N'Безналичный расчет')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (9, 9, CAST(N'2024-04-01' AS Date), 4, CAST(1500.00 AS Decimal(10, 2)), N'Наличные')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (10, 10, CAST(N'2024-04-15' AS Date), 5, CAST(2000.00 AS Decimal(10, 2)), N'Безналичный расчет')
SET IDENTITY_INSERT [dbo].[Заказы] OFF
GO
INSERT [dbo].[Клиенты] ([КодКлиента], [ФамилияКлиента], [АдресКлиента], [Телефон]) VALUES (1, N'Иванов', N'ул. Ленина, 1', N'4912234567')
INSERT [dbo].[Клиенты] ([КодКлиента], [ФамилияКлиента], [АдресКлиента], [Телефон]) VALUES (2, N'Петров', N'пр. Мира, 10', N'8129876543')
INSERT [dbo].[Клиенты] ([КодКлиента], [ФамилияКлиента], [АдресКлиента], [Телефон]) VALUES (3, N'Сидоров', N'ул. Гагарина, 5', N'3832223344')
INSERT [dbo].[Клиенты] ([КодКлиента], [ФамилияКлиента], [АдресКлиента], [Телефон]) VALUES (4, N'Кузнецов', N'ул. Пушкина, 20', N'8435556677')
INSERT [dbo].[Клиенты] ([КодКлиента], [ФамилияКлиента], [АдресКлиента], [Телефон]) VALUES (5, N'Смирнов', N'ул. Лермонтова, 15', N'8637778899')
GO
INSERT [dbo].[РеестрЗаказов] ([НомерЗаказа], [КодКлиента], [СтоимостьЗаказа]) VALUES (1, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[РеестрЗаказов] ([НомерЗаказа], [КодКлиента], [СтоимостьЗаказа]) VALUES (2, 2, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[РеестрЗаказов] ([НомерЗаказа], [КодКлиента], [СтоимостьЗаказа]) VALUES (3, 3, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[РеестрЗаказов] ([НомерЗаказа], [КодКлиента], [СтоимостьЗаказа]) VALUES (4, 4, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[РеестрЗаказов] ([НомерЗаказа], [КодКлиента], [СтоимостьЗаказа]) VALUES (5, 5, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[РеестрЗаказов] ([НомерЗаказа], [КодКлиента], [СтоимостьЗаказа]) VALUES (6, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[РеестрЗаказов] ([НомерЗаказа], [КодКлиента], [СтоимостьЗаказа]) VALUES (7, 2, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[РеестрЗаказов] ([НомерЗаказа], [КодКлиента], [СтоимостьЗаказа]) VALUES (8, 3, CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[РеестрЗаказов] ([НомерЗаказа], [КодКлиента], [СтоимостьЗаказа]) VALUES (9, 4, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[РеестрЗаказов] ([НомерЗаказа], [КодКлиента], [СтоимостьЗаказа]) VALUES (10, 5, CAST(2000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[СправочникУслуг] ([КодУслуги], [Наименование], [Цена]) VALUES (1, N'Консультация', CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[СправочникУслуг] ([КодУслуги], [Наименование], [Цена]) VALUES (2, N'Диагностика', CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[СправочникУслуг] ([КодУслуги], [Наименование], [Цена]) VALUES (3, N'Ремонт', CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[СправочникУслуг] ([КодУслуги], [Наименование], [Цена]) VALUES (4, N'Настройка', CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[СправочникУслуг] ([КодУслуги], [Наименование], [Цена]) VALUES (5, N'Установка', CAST(2000.00 AS Decimal(10, 2)))
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK__Заказы__КодУслуг__276EDEB3] FOREIGN KEY([КодУслуги])
REFERENCES [dbo].[СправочникУслуг] ([КодУслуги])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK__Заказы__КодУслуг__276EDEB3]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_РеестрЗаказов] FOREIGN KEY([НомерЗаказа])
REFERENCES [dbo].[РеестрЗаказов] ([НомерЗаказа])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_РеестрЗаказов]
GO
ALTER TABLE [dbo].[РеестрЗаказов]  WITH CHECK ADD FOREIGN KEY([КодКлиента])
REFERENCES [dbo].[Клиенты] ([КодКлиента])
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [CK__Заказы__ФормаОпл__267ABA7A] CHECK  (([ФормаОплаты]='Безналичный расчет' OR [ФормаОплаты]='Наличные'))
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [CK__Заказы__ФормаОпл__267ABA7A]
GO
ALTER TABLE [dbo].[Клиенты]  WITH CHECK ADD CHECK  (([Телефон] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
USE [master]
GO
ALTER DATABASE [ServicesAndOrders] SET  READ_WRITE 
GO
