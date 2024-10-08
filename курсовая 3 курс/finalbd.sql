

/****** Object:  Table [dbo].[Container]    Script Date: 21.04.2024 15:12:56 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 21.04.2024 15:12:56 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeDriver]    Script Date: 21.04.2024 15:12:56 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transport]    Script Date: 21.04.2024 15:12:56 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[_Delivery]    Script Date: 21.04.2024 15:12:56 ******/
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
/****** Object:  Table [dbo].[FirmsGoods]    Script Date: 21.04.2024 15:12:56 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 21.04.2024 15:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[goodID] [int] IDENTITY(1,1) NOT NULL,
	[firmGoodID] [int] NOT NULL,
	[typeGoodID] [int] NOT NULL,
	[goodModel] [varchar](50) NOT NULL,
	[goodAmount] [float] NOT NULL,
	[goodSize] [int] NOT NULL,
	[warehouseID] [int] NOT NULL,
 CONSTRAINT [PK__Goods__66339DED055BD00A] PRIMARY KEY CLUSTERED 
(
	[goodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[_goodss]    Script Date: 21.04.2024 15:12:56 ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 21.04.2024 15:12:56 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 21.04.2024 15:12:56 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[_Orders]    Script Date: 21.04.2024 15:12:56 ******/
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
/****** Object:  View [dbo].[_EmployeeDriver]    Script Date: 21.04.2024 15:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[_Водители] as 
select employeesDriverID as "ID", employeeDriverFIO as "ФИО" from EmployeeDriver
GO
/****** Object:  View [dbo].[_FirmsGood]    Script Date: 21.04.2024 15:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[_Фирмы] as 
select fgid as "ID", fgfirms as "Фирма" from FirmsGoods
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 21.04.2024 15:12:56 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[_Roles]    Script Date: 21.04.2024 15:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[_Роли] as 
select RolesID as "ID", RolesName as "Роль" from Roles
GO
/****** Object:  Table [dbo].[TypeGoods]    Script Date: 21.04.2024 15:12:56 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[_TypeGoods]    Script Date: 21.04.2024 15:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[_ТипТовара] as 
select typeGoodsID as "ID", typeGood as "Роль" from TypeGoods
GO
/****** Object:  Table [dbo].[Typeofdelivery]    Script Date: 21.04.2024 15:12:56 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[_Typeofdelivery]    Script Date: 21.04.2024 15:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[_ТипДоставки] as 
select typeDeliveryID as "ID", typeDeliveryVehicle as "Тип техники" from Typeofdelivery
GO
/****** Object:  View [dbo].[_Users]    Script Date: 21.04.2024 15:12:56 ******/
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
/****** Object:  Table [dbo].[Warehouses]    Script Date: 21.04.2024 15:12:56 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[_Warehouses]    Script Date: 21.04.2024 15:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[_Склады] as 
select warehouseID as "ID", warehouseAdres as "Адрес" from Warehouses
GO
/****** Object:  View [dbo].[_Goods]    Script Date: 21.04.2024 15:12:56 ******/
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
/****** Object:  View [dbo].[_Container]    Script Date: 21.04.2024 15:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[_Контейнер] as
select containerID as "ID", containerType as "Тип" from Container
GO

/****** Object:  View [dbo].[_Transport]    Script Date: 21.04.2024 15:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[_Транспорт] as
select t.transportID as "ID", tofd.typeDeliveryVehicle as "Тип доставки", t.transport as "Транспорт" from Transport t
JOIN Typeofdelivery tofd ON
t.typeDeliveryID = tofd.typeDeliveryID
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 21.04.2024 15:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[customerFIO] [varchar](100) NOT NULL,
	[customerCompany] [varchar](100) NOT NULL,
 CONSTRAINT [PK__Customer__B61ED7F5FDE4623D] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 21.04.2024 15:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[employeeID] [int] IDENTITY(1,1) NOT NULL,
	[employeeFIO] [varchar](50) NOT NULL,
	[employeePost] [int] NOT NULL,
	[loginEmployees] [varchar](30) NULL,
	[passwordEmployees] [varchar](30) NULL,
 CONSTRAINT [PK__Employee__C135F5E91E19BFBA] PRIMARY KEY CLUSTERED 
(
	[employeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Container] ([containerType]) VALUES (N'Малый')
INSERT [dbo].[Container] ([containerType]) VALUES (N'Средний')
INSERT [dbo].[Container] ([containerType]) VALUES (N'Большой')
GO

INSERT [dbo].[Delivery] ([orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (2, 3, 5, 3, N'Тульская область, город Мытищи, спуск Ломоносова, 63')
INSERT [dbo].[Delivery] ([orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (3, 2, 6, 3, N'Курская область, город Раменское, бульвар Ленина, 21')
INSERT [dbo].[Delivery] ([orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (6, 7, 4, 3, N'Московская область, город Павловский Посад, ул. Славы, 61')
INSERT [dbo].[Delivery] ([orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (7, 5, 3, 3, N'Кемеровская область, город Егорьевск, ул. Бухарестская, 27')
INSERT [dbo].[Delivery] ([orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (1, 7, 2, 3, N'Орловская область, город Одинцово, въезд Ладыгина, 98')
INSERT [dbo].[Delivery] ([orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (9, 6, 1, 2, N'Волгоградская область, город Сергиев Посад, ул. Будапештсткая, 89')
INSERT [dbo].[Delivery] ([orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (8, 3, 7, 3, N'Архангельская область, город Луховицы, бульвар Чехова, 28')
INSERT [dbo].[Delivery] ([orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (10, 1, 8, 1, N'Владимирская область, город Серпухов, ул. Ленина, 03')
INSERT [dbo].[Delivery] ([orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (4, 4, 9, 2, N'Свердловская область, город Сергиев Посад, шоссе 1905 года, 03')
INSERT [dbo].[Delivery] ([orderID], [employeesDriverID], [transportID], [containerID], [destination]) VALUES (5, 3, 10, 3, N'Калининградская область, город Лотошино, наб. Ломоносова, 93')
GO

INSERT [dbo].[EmployeeDriver] ([employeeDriverFIO]) VALUES (N'Хохлов Адам Максович')
INSERT [dbo].[EmployeeDriver] ([employeeDriverFIO]) VALUES (N'Рябов Виталий Адольфович')
INSERT [dbo].[EmployeeDriver] ([employeeDriverFIO]) VALUES (N'Воронцов Иосиф Игнатьевич')
INSERT [dbo].[EmployeeDriver] ([employeeDriverFIO]) VALUES (N'Мышкин Геннадий Давидович')
INSERT [dbo].[EmployeeDriver] ([employeeDriverFIO]) VALUES (N'Иванов Руслан Ефимович')
INSERT [dbo].[EmployeeDriver] ([employeeDriverFIO]) VALUES (N'Комаров Игорь Михаилович')
INSERT [dbo].[EmployeeDriver] ([employeeDriverFIO]) VALUES (N'Мухин Леонтий Иринеевич')
INSERT [dbo].[EmployeeDriver] ([employeeDriverFIO]) VALUES (N'Селиверстов Гордий Семёнович')
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([employeeFIO], [employeePost], [loginEmployees], [passwordEmployees]) VALUES (N'Гуляева Нина Митрофановна', 1, N'TopLogin1', N'TopPassword1')
INSERT [dbo].[Employees] ([employeeFIO], [employeePost], [loginEmployees], [passwordEmployees]) VALUES (N'Волкова Алика Мэлоровна', 2, N'TopLogin2', N'TopPassword2')
INSERT [dbo].[Employees] ([employeeFIO], [employeePost], [loginEmployees], [passwordEmployees]) VALUES (N'Родионова Карина Георгиевна', 3, N'TopLogin3', N'TopPassword3')
INSERT [dbo].[Employees] ([employeeFIO], [employeePost], [loginEmployees], [passwordEmployees]) VALUES (N'Лебедева Анжела Васильевна', 4, N'TopLogin4', N'TopPassword4')
INSERT [dbo].[Employees] ([employeeFIO], [employeePost], [loginEmployees], [passwordEmployees]) VALUES (N'Симонова Юлия Геласьевна', 5, N'TopLogin5', N'TopPassword5')
INSERT [dbo].[Employees] ([employeeFIO], [employeePost], [loginEmployees], [passwordEmployees]) VALUES (N'Павлова Ульяна Матвеевнач', 6, N'TopLogin6', N'TopPassword6')
INSERT [dbo].[Employees] ([employeeFIO], [employeePost], [loginEmployees], [passwordEmployees]) VALUES (N'Гаврилова Рая Альвиановна', 7, N'TopLogin7', N'TopPassword7')
INSERT [dbo].[Employees] ([employeeFIO], [employeePost], [loginEmployees], [passwordEmployees]) VALUES (N'Тарасов Леонид Олегович', 8, N'TopLogin8', N'TopPassword8')
INSERT [dbo].[Employees] ([employeeFIO], [employeePost], [loginEmployees], [passwordEmployees]) VALUES (N'Харитонов Юстин Матвеевич', 9, N'TopLogin9', N'TopPassword9')
INSERT [dbo].[Employees] ([employeeFIO], [employeePost], [loginEmployees], [passwordEmployees]) VALUES (N'Зайцев Валерий Наумович', 1, N'TopLogin10', N'TopPassword10')
INSERT [dbo].[Employees] ([employeeFIO], [employeePost], [loginEmployees], [passwordEmployees]) VALUES (N'Бобров Архип Владленович', 2, N'TopLogin11', N'TopPassword11')
INSERT [dbo].[Employees] ([employeeFIO], [employeePost], [loginEmployees], [passwordEmployees]) VALUES (N'Жуков Пантелей Ильяович', 3, N'TopLogin12', N'TopPassword12')
INSERT [dbo].[Employees] ([employeeFIO], [employeePost], [loginEmployees], [passwordEmployees]) VALUES (N'Романов Максим Тимурович', 4, N'TopLogin13', N'TopPassword13')
INSERT [dbo].[Employees] ([employeeFIO], [employeePost], [loginEmployees], [passwordEmployees]) VALUES (N'Туров Эльдар Михайлович', 5, N'TopLogin14', N'TopPassword14')
INSERT [dbo].[Employees] ([employeeFIO], [employeePost], [loginEmployees], [passwordEmployees]) VALUES (N'Мартынов Герасим Давидович', 6, N'TopLogin15', N'TopPassword15')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO

INSERT [dbo].[FirmsGoods] ([fgfirms]) VALUES (N'Bosch')
INSERT [dbo].[FirmsGoods] ([fgfirms]) VALUES (N'Aceline')
INSERT [dbo].[FirmsGoods] ([fgfirms]) VALUES (N'Zanussi')
INSERT [dbo].[FirmsGoods] ([fgfirms]) VALUES (N'Samsung ')
INSERT [dbo].[FirmsGoods] ([fgfirms]) VALUES (N'Сварог')
INSERT [dbo].[FirmsGoods] ([fgfirms]) VALUES (N'MSI')
INSERT [dbo].[FirmsGoods] ([fgfirms]) VALUES (N'DEXP')
INSERT [dbo].[FirmsGoods] ([fgfirms]) VALUES (N'Philips')
INSERT [dbo].[FirmsGoods] ([fgfirms]) VALUES (N'Xiaom')
INSERT [dbo].[FirmsGoods] ([fgfirms]) VALUES (N'Marshall')
INSERT [dbo].[FirmsGoods] ([fgfirms]) VALUES (N'Сокол')
INSERT [dbo].[FirmsGoods] ([fgfirms]) VALUES (N'Бюрократ ')
INSERT [dbo].[FirmsGoods] ([fgfirms]) VALUES (N'Edge')
GO
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (1, 1, N'Холодильник A', 15, 0, 1)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (1, 1, N'Холодильник B', 13, 1, 1)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (3, 3, N'Снегоуборщик электрический', 20, 1, 9)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (3, 1, N'Водонагреватель', 40, 0, 6)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (4, 5, N'Саундбар', 30, 0, 2)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (5, 4, N'Сварочный аппарат', 40, 0, 2)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (6, 6, N'Ноутбук GF76', 10, 0, 5)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (6, 5, N'Проводная гарнитура Immerse', 6, 0, 7)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (8, 2, N'Проектор', 4, 0, 8)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (7, 2, N'Экран для проектора', 7, 0, 4)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (13, 5, N'Автосабвуфер активный', 2, 2, 8)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (8, 1, N'Кофемашина автоматическая', 15, 1, 9)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (4, 6, N'Телевизор LED', 1, 3, 7)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (9, 6, N'Телевизор LED', 40, 1, 3)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (7, 2, N'Стойка с кронштейном', 50, 1, 6)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (10, 5, N'Домашняя аудиосистема', 37, 1, 1)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (2, 5, N'Микрофон', 60, 0, 5)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (7, 2, N'Кресло офисное', 100, 0, 3)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (11, 2, N'Стол компьютерный', 88, 0, 6)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (12, 2, N'Кресло офисное', 97, 0, 1)
INSERT [dbo].[Goods] ([firmGoodID], [typeGoodID], [goodModel], [goodAmount], [goodSize], [warehouseID]) VALUES (5, 1, N'1', 1, 1, 1)
GO

INSERT [dbo].[Orders] ([employeeid], [customerid], [goodid], [orderamount]) VALUES (6, 16, 20, 15)
INSERT [dbo].[Orders] ([employeeid], [customerid], [goodid], [orderamount]) VALUES (6, 16, 19, 15)
INSERT [dbo].[Orders] ([employeeid], [customerid], [goodid], [orderamount]) VALUES (15, 19, 14, 13)
INSERT [dbo].[Orders] ([employeeid], [customerid], [goodid], [orderamount]) VALUES (10, 20, 9, 15)
INSERT [dbo].[Orders] ([employeeid], [customerid], [goodid], [orderamount]) VALUES (10, 20, 10, 15)
INSERT [dbo].[Orders] ([employeeid], [customerid], [goodid], [orderamount]) VALUES (10, 29, 14, 30)
INSERT [dbo].[Orders] ([employeeid], [customerid], [goodid], [orderamount]) VALUES (15, 28, 11, 7)
INSERT [dbo].[Orders] ([employeeid], [customerid], [goodid], [orderamount]) VALUES (14, 35, 1, 20)
INSERT [dbo].[Orders] ([employeeid], [customerid], [goodid], [orderamount]) VALUES (15, 17, 4, 17)
INSERT [dbo].[Orders] ([employeeid], [customerid], [goodid], [orderamount]) VALUES (14, 15, 8, 24)
INSERT [dbo].[Orders] ([employeeid], [customerid], [goodid], [orderamount]) VALUES (14, 15, 8, 1)

GO
INSERT [dbo].[Roles] ([RolesName]) VALUES (N'Руководитель')
INSERT [dbo].[Roles] ([RolesName]) VALUES (N'Менеджер')
INSERT [dbo].[Roles] ([RolesName]) VALUES (N'Грузчик')
INSERT [dbo].[Roles] ([RolesName]) VALUES (N'Уборщик')
INSERT [dbo].[Roles] ([RolesName]) VALUES (N'Сисадмин')
INSERT [dbo].[Roles] ([RolesName]) VALUES (N'Специалист по охране труда')
INSERT [dbo].[Roles] ([RolesName]) VALUES (N'Бухгалтер')
INSERT [dbo].[Roles] ([RolesName]) VALUES (N'Заместитель руководителя по работе с сотрудниками')
INSERT [dbo].[Roles] ([RolesName]) VALUES (N'Заместитель руководителя по закупкам')
INSERT [dbo].[Roles] ([RolesName]) VALUES (N'Пользователь')

GO
INSERT [dbo].[Transport] ([typeDeliveryID], [transport]) VALUES (1, N'Ford Transit')
INSERT [dbo].[Transport] ([typeDeliveryID], [transport]) VALUES (1, N'Ford Transit')
INSERT [dbo].[Transport] ([typeDeliveryID], [transport]) VALUES (1, N'Самолет')
INSERT [dbo].[Transport] ([typeDeliveryID], [transport]) VALUES (3, N'Самолет')
INSERT [dbo].[Transport] ([typeDeliveryID], [transport]) VALUES (2, N'Корабль')
INSERT [dbo].[Transport] ([typeDeliveryID], [transport]) VALUES (2, N'Корабль')
INSERT [dbo].[Transport] ([typeDeliveryID], [transport]) VALUES (2, N'Корабль')
INSERT [dbo].[Transport] ([typeDeliveryID], [transport]) VALUES (1, N'Fiat')
INSERT [dbo].[Transport] ([typeDeliveryID], [transport]) VALUES (1, N'KAMAZ')
INSERT [dbo].[Transport] ([typeDeliveryID], [transport]) VALUES (1, N'KAMAZ')

GO
INSERT [dbo].[TypeGoods] ([typeGood]) VALUES (N'Бытовая техника')
INSERT [dbo].[TypeGoods] ([typeGood]) VALUES (N'В офис')
INSERT [dbo].[TypeGoods] ([typeGood]) VALUES (N'К зиме')
INSERT [dbo].[TypeGoods] ([typeGood]) VALUES (N'Инструменты')
INSERT [dbo].[TypeGoods] ([typeGood]) VALUES (N'Звук')
INSERT [dbo].[TypeGoods] ([typeGood]) VALUES (N'Цифровая техника')

GO
INSERT [dbo].[Typeofdelivery] ([typeDeliveryVehicle]) VALUES (N'Наземный')
INSERT [dbo].[Typeofdelivery] ([typeDeliveryVehicle]) VALUES (N'Морской')
INSERT [dbo].[Typeofdelivery] ([typeDeliveryVehicle]) VALUES (N'Воздушный')
GO
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Гуляева Нина Митрофановна', 1, N'TopLogin1', N'TopPassword')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Волкова Алика Мэлоровна', 2, N'TopLogin2', N'TopPassword2')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Родионова Карина Георгиевна', 3, N'TopLogin3', N'TopPassword3')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Лебедева Анжела Васильевна', 4, N'TopLogin4', N'TopPassword4')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Симонова Юлия Геласьевна', 5, N'TopLogin5', N'TopPassword5')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Павлова Ульяна Матвеевнач', 6, N'TopLogin6', N'TopPassword7')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Гаврилова Рая Альвиановна', 7, N'TopLogin7', N'TopPassword7')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Тарасов Леонид Олегович', 8, N'TopLogin8', N'TopPassword8')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Харитонов Юстин Матвеевич', 9, N'TopLogin9', N'TopPassword9')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Зайцев Валерий Наумович', 1, N'TopLogin10', N'TopPassword10')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Бобров Архип Владленович', 2, N'TopLogin11', N'TopPassword11')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Жуков Пантелей Ильяович', 3, N'TopLogin12', N'TopPassword12')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Романов Максим Тимурович', 4, N'TopLogin13', N'TopPassword13')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Туров Эльдар Михайлович', 5, N'TopLogin14', N'TopPassword14')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Мартынов Герасим Давидович', 6, N'TopLogin15', N'TopPassword15')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Потапов Эдуард Робертович', 10, N'TopLogin16', N'TopPassword16')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Соболев Олег Артёмович', 10, N'TopLogin17', N'TopPassword17')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Бобров Артур Артемович', 10, N'TopLogin18', N'TopPassword18')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Никифоров Анатолий Константинович', 10, N'TopLogin19', N'TopPassword19')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Макаров Альберт Миронович', 10, N'TopLogin20', N'TopPassword20')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Фадеев Мечислав Всеволодович', 10, N'TopLogin21', N'TopPassword21')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Рожков Влас Пётрович', 10, N'TopLogin22', N'TopPassword22')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Гаврилова Рая Альвиановна', 10, N'TopLogin23', N'TopPassword23')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Кузьмин Степан Геннадьевич', 10, N'TopLogin24', N'TopPassword24')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Дементьев Мартин Эльдарович', 10, N'TopLogin25', N'TopPassword25')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Стрелкова Марина Донатовна', 10, N'TopLogin26', N'TopPassword26')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Лукина Лилия Владленовна', 10, N'TopLogin27', N'TopPassword27')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Родионов Андрей Валерьянович', 10, N'TopLogin28', N'TopPassword28')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Журавлёв Богдан Борисович', 10, N'TopLogin29', N'TopPassword29')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Григорьев Игнат Федосеевич', 10, N'TopLogin30', N'TopPassword30')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Брагина Божена Егоровна', 10, N'TopLogin31', N'TopPassword31')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Селезнёва Дарья Евсеевна', 10, N'TopLogin32', N'TopPassword32')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Мухина Эрида Евгеньевна', 10, N'TopLogin33', N'TopPassword33')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Брагин Владлен Алексеевич', 10, N'TopLogin34', N'TopPassword34')
INSERT [dbo].[Users] ([userFIO], [roles], [loginRules], [passwordRules]) VALUES (N'Суворов Степан Ефимович', 10, N'TopLogin35', N'TopPassword35')
GO
INSERT [dbo].[Warehouses] ([warehouseAdres]) VALUES (N'Ростовская область, город Воскресенск, пер. Ломоносова, 15')
INSERT [dbo].[Warehouses] ([warehouseAdres]) VALUES (N'Саратовская область, город Раменское, пр. Ломоносова, 20')
INSERT [dbo].[Warehouses] ([warehouseAdres]) VALUES (N'Липецкая область, город Луховицы, пер. Славы, 5')
INSERT [dbo].[Warehouses] ([warehouseAdres]) VALUES (N'Магаданская область, город Солнечногорск, пер. Домодедовская, 59')
INSERT [dbo].[Warehouses] ([warehouseAdres]) VALUES (N'Тюменская область, город Лотошино, пер. Сталина, 72')
INSERT [dbo].[Warehouses] ([warehouseAdres]) VALUES (N'Оренбургская область, город Дмитров, ул. Гагарина, 31')
INSERT [dbo].[Warehouses] ([warehouseAdres]) VALUES (N'Московская область, город Щёлково, ул. Славы, 40')
INSERT [dbo].[Warehouses] ([warehouseAdres]) VALUES (N'Ивановская область, город Чехов, шоссе Славы, 02')
INSERT [dbo].[Warehouses] ([warehouseAdres]) VALUES (N'Калининградская область, город Клин, пр. Космонавтов, 43')
INSERT [dbo].[Warehouses] ([warehouseAdres]) VALUES (N'Амурская область, город Красногорск, ул. 1905 года, 67')
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [Delivery_fk0] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [Delivery_fk0]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [Delivery_fk1] FOREIGN KEY([employeesDriverID])
REFERENCES [dbo].[EmployeeDriver] ([employeesDriverID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [Delivery_fk1]
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
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_EmployeesRoles] FOREIGN KEY([employeePost])
REFERENCES [dbo].[Roles] ([RolesID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_EmployeesRoles]
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
/****** Object:  StoredProcedure [dbo].[addcustomer]    Script Date: 21.04.2024 15:12:56 ******/
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
/****** Object:  StoredProcedure [dbo].[addemployee]    Script Date: 21.04.2024 15:12:56 ******/
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
/****** Object:  StoredProcedure [dbo].[addfirmgood]    Script Date: 21.04.2024 15:12:56 ******/
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
/****** Object:  StoredProcedure [dbo].[addorder]    Script Date: 21.04.2024 15:12:56 ******/
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
/****** Object:  StoredProcedure [dbo].[showgoods]    Script Date: 21.04.2024 15:12:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[showgoods] as
	select * from Goods
GO
/****** Object:  StoredProcedure [dbo].[updateamountgood]    Script Date: 21.04.2024 15:12:56 ******/
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
ALTER DATABASE [Shumihin] SET  READ_WRITE 
GO
