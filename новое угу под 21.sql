USE [master]
GO
/****** Object:  Database [ServicesAndOrders]    Script Date: 14.04.2025 10:56:30 ******/
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
/****** Object:  Table [dbo].[Заказы]    Script Date: 14.04.2025 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[НомерЗаказа] [int] NOT NULL,
	[ДатаЗаказа] [datetime] NOT NULL,
	[КодУслуги] [int] NOT NULL,
	[СтоимостьУслуги] [decimal](10, 2) NOT NULL,
	[ФормаОплаты] [nvarchar](50) NULL,
 CONSTRAINT [PK_Заказы] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[21 работа запрос 2]    Script Date: 14.04.2025 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[21 работа запрос 2]
AS
SELECT        TOP (100) PERCENT MONTH(ДатаЗаказа) AS [Номер месяца], SUM(СтоимостьУслуги) AS Стоимость
FROM            dbo.Заказы
WHERE        (MONTH(ДатаЗаказа) IN (12, 1, 2))
GROUP BY MONTH(ДатаЗаказа)
ORDER BY [Номер месяца]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 14.04.2025 10:56:30 ******/
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
/****** Object:  Table [dbo].[РеестрЗаказов]    Script Date: 14.04.2025 10:56:30 ******/
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
/****** Object:  View [dbo].[21 работа запрос 5]    Script Date: 14.04.2025 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[21 работа запрос 5] AS
SELECT 
    К.[ФамилияКлиента]
FROM 
    [dbo].[Клиенты] К
JOIN 
    [dbo].[РеестрЗаказов] Р ON К.[КодКлиента] = Р.[КодКлиента]
GROUP BY 
    К.[ФамилияКлиента]
HAVING 
    AVG(Р.[СтоимостьЗаказа]) < (SELECT AVG([СтоимостьЗаказа]) FROM [dbo].[РеестрЗаказов]);
GO
/****** Object:  Table [dbo].[СправочникУслуг]    Script Date: 14.04.2025 10:56:30 ******/
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
/****** Object:  View [dbo].[21 работа запрос 3]    Script Date: 14.04.2025 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[21 работа запрос 3]
AS
SELECT        КодУслуги, Наименование, Цена * 1.0015 AS НоваяЦена
FROM            dbo.СправочникУслуг
GO
/****** Object:  View [dbo].[21 работа запрос 1]    Script Date: 14.04.2025 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[21 работа запрос 1]
AS
SELECT        TOP (100) PERCENT ФормаОплаты, COUNT(*) AS Expr1
FROM            dbo.Заказы
GROUP BY ФормаОплаты, ДатаЗаказа
GO
/****** Object:  View [dbo].[запрос 2 для 20 работы]    Script Date: 14.04.2025 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[запрос 2 для 20 работы]
AS
SELECT        k.ФамилияКлиента AS Фамилия_клиента, SUM(r.СтоимостьЗаказа) AS Стоимость_заказа
FROM            dbo.Клиенты AS k INNER JOIN
                         dbo.РеестрЗаказов AS r ON k.КодКлиента = r.КодКлиента
GROUP BY k.ФамилияКлиента
GO
/****** Object:  View [dbo].[запрос 3 для 20 работы]    Script Date: 14.04.2025 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[запрос 3 для 20 работы]
AS
SELECT        dbo.Клиенты.*, Телефон AS Expr1
FROM            dbo.Клиенты
WHERE        (Телефон LIKE '4912%')
GO
/****** Object:  View [dbo].[Количество_заказов_по_оплате_1квартал]    Script Date: 14.04.2025 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Количество_заказов_по_оплате_1квартал]
AS
SELECT 
    [ФормаОплаты] AS [Форма оплаты],
    COUNT(*) AS [Количество заказов]
FROM 
    [dbo].[Заказы]
WHERE 
    [ДатаЗаказа] BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY 
    [ФормаОплаты]
GO
SET IDENTITY_INSERT [dbo].[Заказы] ON 

INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (1, 1, CAST(N'2024-01-15T00:00:00.000' AS DateTime), 1, CAST(540.00 AS Decimal(10, 2)), N'Безналичный расчет')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (2, 2, CAST(N'2024-01-20T00:00:00.000' AS DateTime), 2, CAST(1000.00 AS Decimal(10, 2)), N'Безналичный расчет')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (3, 3, CAST(N'2024-02-01T00:00:00.000' AS DateTime), 3, CAST(2500.00 AS Decimal(10, 2)), N'Наличные')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (4, 4, CAST(N'2024-02-10T00:00:00.000' AS DateTime), 4, CAST(1500.00 AS Decimal(10, 2)), N'Безналичный расчет')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (5, 5, CAST(N'2024-02-28T00:00:00.000' AS DateTime), 5, CAST(2000.00 AS Decimal(10, 2)), N'Наличные')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (6, 6, CAST(N'2024-03-05T00:00:00.000' AS DateTime), 1, CAST(500.00 AS Decimal(10, 2)), N'Безналичный расчет')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (7, 7, CAST(N'2024-03-12T00:00:00.000' AS DateTime), 2, CAST(1000.00 AS Decimal(10, 2)), N'Наличные')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (8, 8, CAST(N'2024-03-20T00:00:00.000' AS DateTime), 3, CAST(2500.00 AS Decimal(10, 2)), N'Безналичный расчет')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (9, 9, CAST(N'2024-04-01T00:00:00.000' AS DateTime), 4, CAST(1500.00 AS Decimal(10, 2)), N'Наличные')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (10, 10, CAST(N'2024-04-15T00:00:00.000' AS DateTime), 5, CAST(2000.00 AS Decimal(10, 2)), N'Наличные')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (11, 1, CAST(N'2025-04-09T15:56:00.993' AS DateTime), 1, CAST(1000.00 AS Decimal(10, 2)), N'Безналичный расчет')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (12, 2, CAST(N'2025-04-10T12:37:28.637' AS DateTime), 3, CAST(5000.00 AS Decimal(10, 2)), N'Безналичный расчет')
INSERT [dbo].[Заказы] ([Код], [НомерЗаказа], [ДатаЗаказа], [КодУслуги], [СтоимостьУслуги], [ФормаОплаты]) VALUES (13, 1, CAST(N'2025-04-14T10:12:31.883' AS DateTime), 1, CAST(500.00 AS Decimal(10, 2)), N'Безналичный расчет')
SET IDENTITY_INSERT [dbo].[Заказы] OFF
GO
INSERT [dbo].[Клиенты] ([КодКлиента], [ФамилияКлиента], [АдресКлиента], [Телефон]) VALUES (1, N'Иванов', N'ул. Ленина, 1', N'4912234567')
INSERT [dbo].[Клиенты] ([КодКлиента], [ФамилияКлиента], [АдресКлиента], [Телефон]) VALUES (2, N'Петров', N'пр. Мира, 10', N'8129876543')
INSERT [dbo].[Клиенты] ([КодКлиента], [ФамилияКлиента], [АдресКлиента], [Телефон]) VALUES (3, N'Сидоров', N'ул. Гагарина, 5', N'4912223344')
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Заказы"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'21 работа запрос 1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'21 работа запрос 1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Заказы"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'21 работа запрос 2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'21 работа запрос 2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "СправочникУслуг"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'21 работа запрос 3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'21 работа запрос 3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "k"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 261
               Bottom = 119
               Right = 446
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2640
         Width = 2610
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'запрос 2 для 20 работы'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'запрос 2 для 20 работы'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Клиенты"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'запрос 3 для 20 работы'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'запрос 3 для 20 работы'
GO
USE [master]
GO
ALTER DATABASE [ServicesAndOrders] SET  READ_WRITE 
GO
