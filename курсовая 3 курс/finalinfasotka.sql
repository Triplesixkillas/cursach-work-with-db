USE [master]
GO
/****** Object:  Database [plswwww]    Script Date: 14.05.2024 17:52:27 ******/
CREATE DATABASE [plswwww]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'plswwww', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\plswwww.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'plswwww_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\plswwww_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [plswwww] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [plswwww].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [plswwww] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [plswwww] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [plswwww] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [plswwww] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [plswwww] SET ARITHABORT OFF 
GO
ALTER DATABASE [plswwww] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [plswwww] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [plswwww] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [plswwww] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [plswwww] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [plswwww] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [plswwww] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [plswwww] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [plswwww] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [plswwww] SET  ENABLE_BROKER 
GO
ALTER DATABASE [plswwww] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [plswwww] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [plswwww] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [plswwww] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [plswwww] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [plswwww] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [plswwww] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [plswwww] SET RECOVERY FULL 
GO
ALTER DATABASE [plswwww] SET  MULTI_USER 
GO
ALTER DATABASE [plswwww] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [plswwww] SET DB_CHAINING OFF 
GO
ALTER DATABASE [plswwww] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [plswwww] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [plswwww] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [plswwww] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'plswwww', N'ON'
GO
ALTER DATABASE [plswwww] SET QUERY_STORE = ON
GO
ALTER DATABASE [plswwww] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [plswwww]
GO
/****** Object:  Table [dbo].[EmployeeDriver]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDriver](
	[employeesDriverID] [int] IDENTITY(1,1) NOT NULL,
	[employeeDriverFIO] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Employee__39F40C22E521ED6C] PRIMARY KEY CLUSTERED 
(
	[employeesDriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Container]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Container](
	[containerID] [int] IDENTITY(1,1) NOT NULL,
	[containerType] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Containe__F10B29B0F8E8D574] PRIMARY KEY CLUSTERED 
(
	[containerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[deliveryID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[employeesDriverID] [int] NOT NULL,
	[transportID] [int] NOT NULL,
	[containerID] [int] NOT NULL,
	[destination] [varchar](150) NOT NULL,
 CONSTRAINT [PK__Delivery__CDDCBC2A2BDD3ECA] PRIMARY KEY CLUSTERED 
(
	[deliveryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transport]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transport](
	[transportID] [int] IDENTITY(1,1) NOT NULL,
	[typeDeliveryID] [int] NOT NULL,
	[transport] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Transpor__59165AC79C19E90D] PRIMARY KEY CLUSTERED 
(
	[transportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[_Доставки]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[_Доставки] as
select deliveryID as "ID", orderID as "ID заказа", employeeDriverFIO as "Водитель",
t.transport as "Транспорт", c.containerType as "Контейнер", destination as "Пункт назначения"
from Delivery d 
Join EmployeeDriver e on d.employeesDriverID = e.employeesDriverID
JOIN Transport t on d.transportID = t.transportID
JOIN Container c on d.containerID = c.containerID
GO
/****** Object:  Table [dbo].[FirmsGoods]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirmsGoods](
	[fgid] [int] IDENTITY(1,1) NOT NULL,
	[fgfirms] [varchar](25) NOT NULL,
 CONSTRAINT [PK__FirmsGoo__37F1A865780B73CC] PRIMARY KEY CLUSTERED 
(
	[fgid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[goodID] [int] IDENTITY(1,1) NOT NULL,
	[firmGoodID] [int] NOT NULL,
	[typeGoodID] [int] NOT NULL,
	[goodModel] [varchar](50) NOT NULL,
	[goodAmount] [int] NOT NULL,
	[goodSize] [float] NOT NULL,
	[warehouseID] [int] NOT NULL,
 CONSTRAINT [PK__Goods__66339DED055BD00A] PRIMARY KEY CLUSTERED 
(
	[goodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[_goodss]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[_goodss] AS
SELECT goodModel as "Наименование", goodSize as "Размер", fgfirms as "Фирма"
FROM Goods g 
JOIN FirmsGoods f
ON g.firmGoodID = f.fgid
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[employeeid] [int] NOT NULL,
	[customerid] [int] NOT NULL,
	[goodid] [int] NOT NULL,
	[orderamount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userFIO] [varchar](50) NULL,
	[roles] [int] NULL,
	[loginRules] [varchar](50) NULL,
	[passwordRules] [varchar](50) NULL,
 CONSTRAINT [PK__Users__CB9A1CDFE6CE9A22] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[_Заказы]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[_Заказы] as
select orderID as "ID", u.userFIO as "Сотрудник", s.userFIO as "Клиент",
goodModel as "Товар", orderamount as "Количество товара"
from Orders o
Join Users u on o.employeeid = u.userID 
Join Users s on o.customerid = s.userID 
JOIN Goods g on o.goodid = g.goodID
GO
/****** Object:  View [dbo].[_Водители]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[_Водители] as 
select employeesDriverID as "ID", employeeDriverFIO as "ФИО" from EmployeeDriver
GO
/****** Object:  View [dbo].[_Фирмы]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[_Фирмы] as 
select fgid as "ID", fgfirms as "Фирма" from FirmsGoods
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RolesID] [int] IDENTITY(1,1) NOT NULL,
	[RolesName] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Employee__C4B278205646A5AA] PRIMARY KEY CLUSTERED 
(
	[RolesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[_Роли]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[_Роли] as 
select RolesID as "ID", RolesName as "Роль" from Roles
GO
/****** Object:  Table [dbo].[TypeGoods]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeGoods](
	[typeGoodsID] [int] IDENTITY(1,1) NOT NULL,
	[typeGood] [varchar](100) NOT NULL,
 CONSTRAINT [PK__TypeGood__E7779FDC002DDD95] PRIMARY KEY CLUSTERED 
(
	[typeGoodsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[_ТипТовара]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[_ТипТовара] as 
select typeGoodsID as "ID", typeGood as "Роль" from TypeGoods
GO
/****** Object:  Table [dbo].[Typeofdelivery]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Typeofdelivery](
	[typeDeliveryID] [int] IDENTITY(1,1) NOT NULL,
	[typeDeliveryVehicle] [varchar](100) NOT NULL,
 CONSTRAINT [PK__Typeofde__CC6F5679DBEE88B1] PRIMARY KEY CLUSTERED 
(
	[typeDeliveryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[_ТипДоставки]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[_ТипДоставки] as 
select typeDeliveryID as "ID", typeDeliveryVehicle as "Тип техники" from Typeofdelivery
GO
/****** Object:  View [dbo].[_Пользователи]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[_Пользователи] as 
select userID as "ID", userFIO as "ФИО", RolesName as "Роль", 
loginRules as "Логин", passwordRules as "Пароль" 
from Users u 
JOIN Roles r on u.roles = r.RolesID
GO
/****** Object:  Table [dbo].[Warehouses]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouses](
	[warehouseID] [int] IDENTITY(1,1) NOT NULL,
	[warehouseAdres] [varchar](250) NOT NULL,
 CONSTRAINT [PK__Warehous__86BA77FA373482E0] PRIMARY KEY CLUSTERED 
(
	[warehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[_Склады]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[_Склады] as 
select warehouseID as "ID", warehouseAdres as "Адрес" from Warehouses
GO
/****** Object:  View [dbo].[_Товары]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[_Товары] as 
select goodID as "ID", fgfirms as "Фирма", typeGood "Тип товара", 
goodModel as "Модель", goodAmount as "Количество", goodSize as "Размер", warehouseAdres as "Адрес хранения"
from Goods g
JOIN FirmsGoods f on g.firmGoodID = f.fgid
JOIN TypeGoods t on g.typeGoodID = t.typeGoodsID
JOIN Warehouses w on g.warehouseID = w.warehouseID
GO
/****** Object:  View [dbo].[_Контейнер]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[_Контейнер] as
select containerID as "ID", containerType as "Тип" from Container
GO
/****** Object:  View [dbo].[_Транспорт]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[_Транспорт] as
select t.transportID as "ID", tofd.typeDeliveryVehicle as "Тип доставки", t.transport as "Транспорт" from Transport t
JOIN Typeofdelivery tofd ON
t.typeDeliveryID = tofd.typeDeliveryID
GO
SET IDENTITY_INSERT [dbo].[Container] ON 

INSERT [dbo].[Container] ([containerID], [containerType]) VALUES (1, N'Малый')
INSERT [dbo].[Container] ([containerID], [containerType]) VALUES (2, N'Средний')
INSERT [dbo].[Container] ([containerID], [containerType]) VALUES (3, N'Большой')
SET IDENTITY_INSERT [dbo].[Container] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([deliveryID], [orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (1, 2, 3, 5, 3, N'Тульская область, город Мытищи, спуск Ломоносова, 63')
INSERT [dbo].[Delivery] ([deliveryID], [orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (2, 3, 2, 6, 3, N'Курская область, город Раменское, бульвар Ленина, 21')
INSERT [dbo].[Delivery] ([deliveryID], [orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (3, 6, 7, 4, 3, N'Московская область, город Павловский Посад, ул. Славы, 61')
INSERT [dbo].[Delivery] ([deliveryID], [orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (4, 7, 5, 3, 3, N'Кемеровская область, город Егорьевск, ул. Бухарестская, 27')
INSERT [dbo].[Delivery] ([deliveryID], [orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (5, 1, 7, 2, 3, N'Орловская область, город Одинцово, въезд Ладыгина, 98')
INSERT [dbo].[Delivery] ([deliveryID], [orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (6, 9, 6, 1, 2, N'Волгоградская область, город Сергиев Посад, ул. Будапештсткая, 89')
INSERT [dbo].[Delivery] ([deliveryID], [orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (7, 8, 3, 7, 3, N'Архангельская область, город Луховицы, бульвар Чехова, 28')
INSERT [dbo].[Delivery] ([deliveryID], [orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (8, 10, 1, 8, 1, N'Владимирская область, город Серпухов, ул. Ленина, 03')
INSERT [dbo].[Delivery] ([deliveryID], [orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (9, 4, 4, 9, 2, N'Свердловская область, город Сергиев Посад, шоссе 1905 года, 03')
INSERT [dbo].[Delivery] ([deliveryID], [orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (10, 5, 3, 10, 3, N'Калининградская область, город Лотошино, наб. Ломоносова, 93')
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeDriver] ON 

INSERT [dbo].[EmployeeDriver] ([employeesDriverID], [employeeDriverFIO]) VALUES (1, N'Хохлов Адам Максович')
INSERT [dbo].[EmployeeDriver] ([employeesDriverID], [employeeDriverFIO]) VALUES (2, N'Рябов Виталий Адольфович')
INSERT [dbo].[EmployeeDriver] ([employeesDriverID], [employeeDriverFIO]) VALUES (3, N'Воронцов Иосиф Игнатьевич')
INSERT [dbo].[EmployeeDriver] ([employeesDriverID], [employeeDriverFIO]) VALUES (4, N'Мышкин Геннадий Давидович')
INSERT [dbo].[EmployeeDriver] ([employeesDriverID], [employeeDriverFIO]) VALUES (5, N'Иванов Руслан Ефимович')
INSERT [dbo].[EmployeeDriver] ([employeesDriverID], [employeeDriverFIO]) VALUES (6, N'Комаров Игорь Михаилович')
INSERT [dbo].[EmployeeDriver] ([employeesDriverID], [employeeDriverFIO]) VALUES (7, N'Мухин Леонтий Иринеевич')
INSERT [dbo].[EmployeeDriver] ([employeesDriverID], [employeeDriverFIO]) VALUES (8, N'Селиверстов Гордий Семёнович')
SET IDENTITY_INSERT [dbo].[EmployeeDriver] OFF
GO
SET IDENTITY_INSERT [dbo].[FirmsGoods] ON 

INSERT [dbo].[FirmsGoods] ([fgid], [fgfirms]) VALUES (1, N'Bosch')
INSERT [dbo].[FirmsGoods] ([fgid], [fgfirms]) VALUES (2, N'Aceline')
INSERT [dbo].[FirmsGoods] ([fgid], [fgfirms]) VALUES (3, N'Zanussi')
INSERT [dbo].[FirmsGoods] ([fgid], [fgfirms]) VALUES (4, N'Samsung ')
INSERT [dbo].[FirmsGoods] ([fgid], [fgfirms]) VALUES (5, N'Сварог')
INSERT [dbo].[FirmsGoods] ([fgid], [fgfirms]) VALUES (6, N'MSI')
INSERT [dbo].[FirmsGoods] ([fgid], [fgfirms]) VALUES (7, N'DEXP')
INSERT [dbo].[FirmsGoods] ([fgid], [fgfirms]) VALUES (8, N'Philips')
INSERT [dbo].[FirmsGoods] ([fgid], [fgfirms]) VALUES (9, N'Xiaom')
INSERT [dbo].[FirmsGoods] ([fgid], [fgfirms]) VALUES (10, N'Marshall')
INSERT [dbo].[FirmsGoods] ([fgid], [fgfirms]) VALUES (11, N'Сокол')
INSERT [dbo].[FirmsGoods] ([fgid], [fgfirms]) VALUES (12, N'Бюрократ ')
INSERT [dbo].[FirmsGoods] ([fgid], [fgfirms]) VALUES (13, N'Edge')
SET IDENTITY_INSERT [dbo].[FirmsGoods] OFF
GO
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (1, 1, 1, N'Холодильник A', 15, 0, 1)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (2, 1, 1, N'Холодильник B', 13, 1, 1)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (3, 3, 3, N'Снегоуборщик электрический', 20, 1, 9)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (4, 3, 1, N'Водонагреватель', 40, 0, 6)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (5, 4, 5, N'Саундбар', 30, 0, 2)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (6, 5, 4, N'Сварочный аппарат', 40, 0, 2)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (7, 6, 6, N'Ноутбук GF76', 10, 0, 5)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (8, 6, 5, N'Проводная гарнитура Immerse', 6, 0, 7)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (9, 8, 2, N'Проектор', 4, 0, 8)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (10, 7, 2, N'Экран для проектора', 7, 0, 4)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (11, 13, 5, N'Автосабвуфер активный', 2, 2, 8)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (12, 8, 1, N'Кофемашина автоматическая', 15, 1, 9)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (13, 4, 6, N'Телевизор LED', 1, 3, 7)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (14, 9, 6, N'Телевизор LED', 40, 1, 3)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (15, 7, 2, N'Стойка с кронштейном', 50, 1, 6)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (16, 10, 5, N'Домашняя аудиосистема', 37, 1, 1)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (17, 2, 5, N'Микрофон', 60, 0, 5)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (18, 7, 2, N'Кресло офисное', 100, 0, 3)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (19, 11, 2, N'Стол компьютерный', 88, 0, 6)
INSERT [dbo].[Goods] ([goodID], [firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (20, 12, 2, N'Кресло офисное', 97, 0, 1)
SET IDENTITY_INSERT [dbo].[Goods] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([orderid], [employeeid], [customerid], [goodid], [orderamount]) VALUES (1, 2, 4, 16, 15)
INSERT [dbo].[Orders] ([orderid], [employeeid], [customerid], [goodid], [orderamount]) VALUES (2, 2, 10, 19, 15)
INSERT [dbo].[Orders] ([orderid], [employeeid], [customerid], [goodid], [orderamount]) VALUES (3, 15, 19, 14, 13)
INSERT [dbo].[Orders] ([orderid], [employeeid], [customerid], [goodid], [orderamount]) VALUES (4, 10, 20, 9, 15)
INSERT [dbo].[Orders] ([orderid], [employeeid], [customerid], [goodid], [orderamount]) VALUES (5, 10, 20, 10, 15)
INSERT [dbo].[Orders] ([orderid], [employeeid], [customerid], [goodid], [orderamount]) VALUES (6, 10, 29, 14, 30)
INSERT [dbo].[Orders] ([orderid], [employeeid], [customerid], [goodid], [orderamount]) VALUES (7, 15, 28, 11, 7)
INSERT [dbo].[Orders] ([orderid], [employeeid], [customerid], [goodid], [orderamount]) VALUES (8, 14, 35, 1, 20)
INSERT [dbo].[Orders] ([orderid], [employeeid], [customerid], [goodid], [orderamount]) VALUES (9, 15, 17, 4, 17)
INSERT [dbo].[Orders] ([orderid], [employeeid], [customerid], [goodid], [orderamount]) VALUES (10, 14, 15, 8, 24)
INSERT [dbo].[Orders] ([orderid], [employeeid], [customerid], [goodid], [orderamount]) VALUES (11, 14, 15, 8, 1)
INSERT [dbo].[Orders] ([orderid], [employeeid], [customerid], [goodid], [orderamount]) VALUES (12, 8, 12, 5, 150)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RolesID], [RolesName]) VALUES (1, N'Руководитель')
INSERT [dbo].[Roles] ([RolesID], [RolesName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Roles] ([RolesID], [RolesName]) VALUES (3, N'Грузчик')
INSERT [dbo].[Roles] ([RolesID], [RolesName]) VALUES (4, N'Уборщик')
INSERT [dbo].[Roles] ([RolesID], [RolesName]) VALUES (5, N'Сисадмин')
INSERT [dbo].[Roles] ([RolesID], [RolesName]) VALUES (6, N'Специалист по охране труда')
INSERT [dbo].[Roles] ([RolesID], [RolesName]) VALUES (7, N'Бухгалтер')
INSERT [dbo].[Roles] ([RolesID], [RolesName]) VALUES (8, N'Заместитель руководителя по работе с сотрудниками')
INSERT [dbo].[Roles] ([RolesID], [RolesName]) VALUES (9, N'Заместитель руководителя по закупкам')
INSERT [dbo].[Roles] ([RolesID], [RolesName]) VALUES (10, N'Пользователь')
INSERT [dbo].[Roles] ([RolesID], [RolesName]) VALUES (12, N'Типчик')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Transport] ON 

INSERT [dbo].[Transport] ([transportID], [typeDeliveryID], [transport]) VALUES (1, 1, N'Ford Transit')
INSERT [dbo].[Transport] ([transportID], [typeDeliveryID], [transport]) VALUES (2, 1, N'Ford Transit')
INSERT [dbo].[Transport] ([transportID], [typeDeliveryID], [transport]) VALUES (3, 1, N'Самолет')
INSERT [dbo].[Transport] ([transportID], [typeDeliveryID], [transport]) VALUES (4, 3, N'Самолет')
INSERT [dbo].[Transport] ([transportID], [typeDeliveryID], [transport]) VALUES (5, 2, N'Корабль')
INSERT [dbo].[Transport] ([transportID], [typeDeliveryID], [transport]) VALUES (6, 2, N'Корабль')
INSERT [dbo].[Transport] ([transportID], [typeDeliveryID], [transport]) VALUES (7, 2, N'Корабль')
INSERT [dbo].[Transport] ([transportID], [typeDeliveryID], [transport]) VALUES (8, 1, N'Fiat')
INSERT [dbo].[Transport] ([transportID], [typeDeliveryID], [transport]) VALUES (9, 1, N'KAMAZ')
INSERT [dbo].[Transport] ([transportID], [typeDeliveryID], [transport]) VALUES (10, 1, N'KAMAZ')
SET IDENTITY_INSERT [dbo].[Transport] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeGoods] ON 

INSERT [dbo].[TypeGoods] ([typeGoodsID], [typeGood]) VALUES (1, N'Бытовая техника')
INSERT [dbo].[TypeGoods] ([typeGoodsID], [typeGood]) VALUES (2, N'В офис')
INSERT [dbo].[TypeGoods] ([typeGoodsID], [typeGood]) VALUES (3, N'К зиме')
INSERT [dbo].[TypeGoods] ([typeGoodsID], [typeGood]) VALUES (4, N'Инструменты')
INSERT [dbo].[TypeGoods] ([typeGoodsID], [typeGood]) VALUES (5, N'Звук')
INSERT [dbo].[TypeGoods] ([typeGoodsID], [typeGood]) VALUES (6, N'Цифровая техника')
INSERT [dbo].[TypeGoods] ([typeGoodsID], [typeGood]) VALUES (7, N'Лето')
SET IDENTITY_INSERT [dbo].[TypeGoods] OFF
GO
SET IDENTITY_INSERT [dbo].[Typeofdelivery] ON 

INSERT [dbo].[Typeofdelivery] ([typeDeliveryID], [typeDeliveryVehicle]) VALUES (1, N'Наземный')
INSERT [dbo].[Typeofdelivery] ([typeDeliveryID], [typeDeliveryVehicle]) VALUES (2, N'Морской')
INSERT [dbo].[Typeofdelivery] ([typeDeliveryID], [typeDeliveryVehicle]) VALUES (3, N'Воздушный')
SET IDENTITY_INSERT [dbo].[Typeofdelivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (1, N'Гуляева Нина Митрофановна', 1, N'TopLogin1', N'TopPassword')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (2, N'Волкова Алика Мэлоровна', 2, N'TopLogin2', N'TopPassword2')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (3, N'Родионова Карина Георгиевна', 3, N'TopLogin3', N'TopPassword3')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (4, N'Лебедева Анжела Васильевна', 4, N'TopLogin4', N'TopPassword4')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (5, N'Симонова Юлия Геласьевна', 5, N'TopLogin5', N'TopPassword5')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (6, N'Павлова Ульяна Матвеевнач', 6, N'TopLogin6', N'TopPassword7')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (7, N'Гаврилова Рая Альвиановна', 7, N'TopLogin7', N'TopPassword7')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (8, N'Тарасов Леонид Олегович', 8, N'TopLogin8', N'TopPassword8')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (9, N'Харитонов Юстин Матвеевич', 9, N'TopLogin9', N'TopPassword9')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (10, N'Зайцев Валерий Наумович', 1, N'TopLogin10', N'TopPassword10')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (11, N'Бобров Архип Владленович', 2, N'TopLogin11', N'TopPassword11')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (12, N'Жуков Пантелей Ильяович', 3, N'TopLogin12', N'TopPassword12')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (13, N'Романов Максим Тимурович', 4, N'TopLogin13', N'TopPassword13')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (14, N'Туров Эльдар Михайлович', 5, N'TopLogin14', N'TopPassword14')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (15, N'Мартынов Герасим Давидович', 6, N'TopLogin15', N'TopPassword15')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (16, N'Потапов Эдуард Робертович', 10, N'TopLogin16', N'TopPassword16')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (17, N'Соболев Олег Артёмович', 10, N'TopLogin17', N'TopPassword17')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (18, N'Бобров Артур Артемович', 10, N'TopLogin18', N'TopPassword18')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (19, N'Никифоров Анатолий Константинович', 10, N'TopLogin19', N'TopPassword19')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (20, N'Макаров Альберт Миронович', 10, N'TopLogin20', N'TopPassword20')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (21, N'Фадеев Мечислав Всеволодович', 10, N'TopLogin21', N'TopPassword21')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (22, N'Рожков Влас Пётрович', 10, N'TopLogin22', N'TopPassword22')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (23, N'Гаврилова Рая Альвиановна', 10, N'TopLogin23', N'TopPassword23')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (24, N'Кузьмин Степан Геннадьевич', 10, N'TopLogin24', N'TopPassword24')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (25, N'Дементьев Мартин Эльдарович', 10, N'TopLogin25', N'TopPassword25')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (26, N'Стрелкова Марина Донатовна', 10, N'TopLogin26', N'TopPassword26')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (27, N'Лукина Лилия Владленовна', 10, N'TopLogin27', N'TopPassword27')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (28, N'Родионов Андрей Валерьянович', 10, N'TopLogin28', N'TopPassword28')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (29, N'Журавлёв Богдан Борисович', 10, N'TopLogin29', N'TopPassword29')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (30, N'Григорьев Игнат Федосеевич', 10, N'TopLogin30', N'TopPassword30')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (31, N'Брагина Божена Егоровна', 10, N'TopLogin31', N'TopPassword31')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (32, N'Селезнёва Дарья Евсеевна', 10, N'TopLogin32', N'TopPassword32')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (33, N'Мухина Эрида Евгеньевна', 10, N'TopLogin33', N'TopPassword33')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (34, N'Брагин Владлен Алексеевич', 10, N'TopLogin34', N'TopPassword34')
INSERT [dbo].[Users] ([userID], [userFIO], [roles], [loginRules], [passwordRules]) VALUES (35, N'Суворов Степан Ефимович', 10, N'TopLogin35', N'TopPassword35')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Warehouses] ON 

INSERT [dbo].[Warehouses] ([warehouseID], [warehouseAdres]) VALUES (1, N'Ростовская область, город Воскресенск, пер. Ломоносова, 15')
INSERT [dbo].[Warehouses] ([warehouseID], [warehouseAdres]) VALUES (2, N'Саратовская область, город Раменское, пр. Ломоносова, 20')
INSERT [dbo].[Warehouses] ([warehouseID], [warehouseAdres]) VALUES (3, N'Липецкая область, город Луховицы, пер. Славы, 5')
INSERT [dbo].[Warehouses] ([warehouseID], [warehouseAdres]) VALUES (4, N'Магаданская область, город Солнечногорск, пер. Домодедовская, 59')
INSERT [dbo].[Warehouses] ([warehouseID], [warehouseAdres]) VALUES (5, N'Тюменская область, город Лотошино, пер. Сталина, 72')
INSERT [dbo].[Warehouses] ([warehouseID], [warehouseAdres]) VALUES (6, N'Оренбургская область, город Дмитров, ул. Гагарина, 31')
INSERT [dbo].[Warehouses] ([warehouseID], [warehouseAdres]) VALUES (7, N'Московская область, город Щёлково, ул. Славы, 40')
INSERT [dbo].[Warehouses] ([warehouseID], [warehouseAdres]) VALUES (8, N'Ивановская область, город Чехов, шоссе Славы, 02')
INSERT [dbo].[Warehouses] ([warehouseID], [warehouseAdres]) VALUES (9, N'Калининградская область, город Клин, пр. Космонавтов, 43')
INSERT [dbo].[Warehouses] ([warehouseID], [warehouseAdres]) VALUES (10, N'Амурская область, город Красногорск, ул. 1905 года, 67')
SET IDENTITY_INSERT [dbo].[Warehouses] OFF
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [Delivery_fk0] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [Delivery_fk0]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [Delivery_fk2] FOREIGN KEY([transportID])
REFERENCES [dbo].[Transport] ([transportID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [Delivery_fk2]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [Delivery_fk3] FOREIGN KEY([containerID])
REFERENCES [dbo].[Container] ([containerID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [Delivery_fk3]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [Goods_fk0] FOREIGN KEY([firmGoodID])
REFERENCES [dbo].[FirmsGoods] ([fgid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [Goods_fk0]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [Goods_fk1] FOREIGN KEY([typeGoodID])
REFERENCES [dbo].[TypeGoods] ([typeGoodsID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [Goods_fk1]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [Goods_fk2] FOREIGN KEY([warehouseID])
REFERENCES [dbo].[Warehouses] ([warehouseID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [Goods_fk2]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Goods] FOREIGN KEY([goodid])
REFERENCES [dbo].[Goods] ([goodID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Goods]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([employeeid])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users1] FOREIGN KEY([customerid])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users1]
GO
ALTER TABLE [dbo].[Transport]  WITH CHECK ADD  CONSTRAINT [Transport_fk0] FOREIGN KEY([typeDeliveryID])
REFERENCES [dbo].[Typeofdelivery] ([typeDeliveryID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Transport] CHECK CONSTRAINT [Transport_fk0]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([roles])
REFERENCES [dbo].[Roles] ([RolesID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[addcustomer]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addcustomer] @nam char(100), @company char(100) as
	declare @nd int
	set @nd = (select max(customerid) from dbo.Customers) + 1
	insert into dbo.Customers(customerid, customerfio, customercompany)
	values (@nd, @nam, @company)
GO
/****** Object:  StoredProcedure [dbo].[addemployee]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addemployee] @nam char(100), @post char(100) as
	declare @nd int
	set @nd = (select max(employeeid) from dbo.Employees) + 1
	insert into dbo.Employees(employeeid, employeefio, employeepost)
	values (@nd, @nam, @post)
GO
/****** Object:  StoredProcedure [dbo].[addfirmgood]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addfirmgood] @firm char(100) as
	declare @nd int
	set @nd = (select max(fgid) from dbo.FirmsGoods) + 1
	insert into dbo.FirmsGoods(fgid, fgfirms)
	values (@nd, @firm)
GO
/****** Object:  StoredProcedure [dbo].[addorder]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addorder] @employee int, @customer int, @goodid int, @amount int as
	declare @nd int
	declare @haves int
	set @nd = (select max(orderid) from dbo.Orders) + 1
	set @haves = (select goodamount from dbo.Goods where goodid = @goodid)
		if (@haves - @amount < 0)
		begin
			return 'Не хватает товара для заказа';
		end
		else
		begin
		declare @minus int
			set @minus = (@haves - @amount)
			update Goods Set goodamount=@minus
			where goodid=@goodid
			insert into dbo.Orders(orderid, employeeid, customerid, goodid, orderamount)
			values (@nd, @employee, @customer, @goodid, @amount)
		end

GO
/****** Object:  StoredProcedure [dbo].[GetOrdersByCustomerID]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrdersByCustomerID]
    @CustomerID INT
AS
BEGIN
    SELECT
        g.Фирма AS 'Фирма',
        g.Модель AS 'Модель',
		o.orderamount as 'Количество'
    FROM
        Orders o
    JOIN
        Users u ON o.customerid = u.userID
    JOIN
        _Товары g ON o.goodid = g.ID
    WHERE
        o.customerid = @CustomerID;
END;
GO
/****** Object:  StoredProcedure [dbo].[showgoods]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[showgoods] as
	select * from Goods
GO
/****** Object:  StoredProcedure [dbo].[updateamountgood]    Script Date: 14.05.2024 17:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateamountgood] @goodid int, @goodamount int as
	UPDATE Goods Set goodamount=@goodamount
	Where goodid = @goodid
GO
USE [master]
GO
ALTER DATABASE [plswwww] SET  READ_WRITE 
GO
