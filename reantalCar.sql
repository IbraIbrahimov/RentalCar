USE [ReantAcarDb]
GO
/****** Object:  Table [dbo].[Fuel]    Script Date: 10/14/2019 1:37:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fuel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NULL,
 CONSTRAINT [PK_Fuel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gearbox]    Script Date: 10/14/2019 1:37:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gearbox](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NULL,
 CONSTRAINT [PK_Transmission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/14/2019 1:37:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 10/14/2019 1:37:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModelsOfBrands]    Script Date: 10/14/2019 1:37:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModelsOfBrands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BrandId] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ModelsOfBrands] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 10/14/2019 1:37:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ModelId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[FuelId] [int] NOT NULL,
	[GearboxId] [int] NOT NULL,
	[Color] [varchar](20) NOT NULL,
	[FirstRegistrationDate] [date] NOT NULL,
	[CubikCapacity] [decimal](4, 3) NOT NULL,
	[PriceForDay] [decimal](4, 0) NOT NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwVehicles]    Script Date: 10/14/2019 1:37:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VwVehicles] as
SELECT  V.[id]
      --,[ModelId]
	  ,Brands.[Name]+' '+m.[Name] VehicleName
      --,[CategoryId]
	  ,Category.[Name] Category
      --,[FuelId]
	  ,Fuel.[Name] Fuel
      --,[GearboxId]
	  ,Gearbox.[Name] Gearbox
      ,[Color]
      ,year([FirstRegistrationDate]) [Year]
      ,[CubikCapacity]
      ,[PriceForDay]
  FROM [ReantAcarDb].[dbo].[Vehicles] V
  join ModelsOfBrands m on m.id=v.ModelId
  join Brands on Brands.id=m.BrandId
  join Category on Category.id=v.CategoryId
  join Fuel on Fuel.id=v.FuelId
  join Gearbox on Gearbox.id=V.GearboxId
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 10/14/2019 1:37:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[EmailAddres] [varchar](50) NOT NULL,
	[PhoneNumber] [char](13) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Renter]    Script Date: 10/14/2019 1:37:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Renter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirtsName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[EmailAddress] [varchar](20) NOT NULL,
	[PhoneNumber] [char](13) NOT NULL,
 CONSTRAINT [PK_Rental] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 10/14/2019 1:37:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[RenterId] [int] NOT NULL,
	[VehicleId] [int] NOT NULL,
	[TotalPrice] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwReservation]    Script Date: 10/14/2019 1:37:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[VwReservation] as
SELECT  R.[id]
      ,[StartDate]
      ,[EndDate]
	  ,Customers.[FirstName]+' '+Customers.[LastName] Customer
      --,[RenterId]
	  ,Renter.[FirtsName]+' '+Renter.[LastName] [Renter]
      --,[VehicleId]
	  ,VwVehicles.VehicleName [Vehicle Name]
	  ,year(VwVehicles.FirstRegistrationDate) [Year]
	  ,VwVehicles.[PriceForDay] [Price for Day]
      
      ,[TotalPrice]
  FROM [ReantAcarDb].[dbo].[Reservation] R
  join Renter on Renter.id=R.RenterId
  join VwVehicles on VwVehicles.id=r.VehicleId
  join Customers on Customers.id=r.CustomerId
GO
/****** Object:  Table [dbo].[PersonType]    Script Date: 10/14/2019 1:37:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](20) NOT NULL,
 CONSTRAINT [PK_PersonType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 
GO
INSERT [dbo].[Brands] ([id], [Name]) VALUES (1, N'Mercedes-Benz')
GO
INSERT [dbo].[Brands] ([id], [Name]) VALUES (2, N'BMW')
GO
INSERT [dbo].[Brands] ([id], [Name]) VALUES (3, N'Audi')
GO
INSERT [dbo].[Brands] ([id], [Name]) VALUES (4, N'Toyota')
GO
INSERT [dbo].[Brands] ([id], [Name]) VALUES (5, N'Volkswagen')
GO
INSERT [dbo].[Brands] ([id], [Name]) VALUES (6, N'Mazda')
GO
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([id], [Name]) VALUES (1, N'Sedan')
GO
INSERT [dbo].[Category] ([id], [Name]) VALUES (2, N'Suv')
GO
INSERT [dbo].[Category] ([id], [Name]) VALUES (3, N'Hatchback')
GO
INSERT [dbo].[Category] ([id], [Name]) VALUES (4, N'Minivan')
GO
INSERT [dbo].[Category] ([id], [Name]) VALUES (5, N'Coupe')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([id], [FirstName], [LastName], [EmailAddres], [PhoneNumber]) VALUES (1, N'Ibrahim', N'Ibrahimli', N'ibra@gmail.com', N'055-670-00-08')
GO
INSERT [dbo].[Customers] ([id], [FirstName], [LastName], [EmailAddres], [PhoneNumber]) VALUES (2, N'Qasim', N'Shirinli', N'Sh@gmail.com', N'055-455-09-09')
GO
INSERT [dbo].[Customers] ([id], [FirstName], [LastName], [EmailAddres], [PhoneNumber]) VALUES (3, N'Fiikret', N'Agayev', N'fa@yahoo.com', N'050-444-09-08')
GO
INSERT [dbo].[Customers] ([id], [FirstName], [LastName], [EmailAddres], [PhoneNumber]) VALUES (4, N'Salah', N'Nurullayev', N'snuru@mail.ru', N'070-544-09-12')
GO
INSERT [dbo].[Customers] ([id], [FirstName], [LastName], [EmailAddres], [PhoneNumber]) VALUES (5, N'Orxan', N'Aslanov', N'oraslan@gmail.com', N'050-444-55-50')
GO
INSERT [dbo].[Customers] ([id], [FirstName], [LastName], [EmailAddres], [PhoneNumber]) VALUES (6, N'Vusal', N'Babayev', N'vus@yahoo.com', N'055-500-90-90')
GO
INSERT [dbo].[Customers] ([id], [FirstName], [LastName], [EmailAddres], [PhoneNumber]) VALUES (7, N'Qadir', N'Camalov', N'qadir@gmail.com', N'055-330-05-30')
GO
INSERT [dbo].[Customers] ([id], [FirstName], [LastName], [EmailAddres], [PhoneNumber]) VALUES (8, N'Cavid ', N'Qurbanov', N'cvb@gmail.com', N'077-344-22-19')
GO
INSERT [dbo].[Customers] ([id], [FirstName], [LastName], [EmailAddres], [PhoneNumber]) VALUES (9, N'Narmin', N'Mammadova', N'narmii@gmail.com', N'077-455-26-27')
GO
INSERT [dbo].[Customers] ([id], [FirstName], [LastName], [EmailAddres], [PhoneNumber]) VALUES (11, N'Farhad', N'Huseynov', N'frh@yahoo.com', N'055-550-42-22')
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Fuel] ON 
GO
INSERT [dbo].[Fuel] ([id], [Name]) VALUES (1, N'Benzin')
GO
INSERT [dbo].[Fuel] ([id], [Name]) VALUES (2, N'Diesel')
GO
INSERT [dbo].[Fuel] ([id], [Name]) VALUES (3, N'Gas')
GO
SET IDENTITY_INSERT [dbo].[Fuel] OFF
GO
SET IDENTITY_INSERT [dbo].[Gearbox] ON 
GO
INSERT [dbo].[Gearbox] ([id], [Name]) VALUES (1, N'Manual')
GO
INSERT [dbo].[Gearbox] ([id], [Name]) VALUES (2, N'Automatic')
GO
SET IDENTITY_INSERT [dbo].[Gearbox] OFF
GO
SET IDENTITY_INSERT [dbo].[ModelsOfBrands] ON 
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (1, 1, N'C-200')
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (2, 1, N'E-250')
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (3, 1, N'S-300')
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (4, 2, N'525')
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (5, 2, N'750Li')
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (6, 2, N'X5')
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (7, 3, N'A4')
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (8, 3, N'A6')
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (9, 3, N'Q7')
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (10, 4, N'Corolla')
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (11, 4, N'Prado')
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (12, 4, N'Rav-4')
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (13, 5, N'Tuareg')
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (14, 5, N'Jetta')
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (15, 6, N'6')
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (16, 6, N'CX-9')
GO
INSERT [dbo].[ModelsOfBrands] ([id], [BrandId], [Name]) VALUES (17, 1, N'V-220')
GO
SET IDENTITY_INSERT [dbo].[ModelsOfBrands] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonType] ON 
GO
INSERT [dbo].[PersonType] ([id], [Type]) VALUES (1, N'Customer')
GO
INSERT [dbo].[PersonType] ([id], [Type]) VALUES (2, N'Seller')
GO
SET IDENTITY_INSERT [dbo].[PersonType] OFF
GO
SET IDENTITY_INSERT [dbo].[Renter] ON 
GO
INSERT [dbo].[Renter] ([id], [FirtsName], [LastName], [EmailAddress], [PhoneNumber]) VALUES (1, N'Bayram', N'Quliyev', N'Bayram@mail.ru', N'055-660-90-90')
GO
INSERT [dbo].[Renter] ([id], [FirtsName], [LastName], [EmailAddress], [PhoneNumber]) VALUES (2, N'Elvin', N'Qarayev', N'qara@yahoo.com', N'050-322-23-45')
GO
INSERT [dbo].[Renter] ([id], [FirtsName], [LastName], [EmailAddress], [PhoneNumber]) VALUES (3, N'Ramin', N'Agalarov', N'ragalar@gmail.com', N'055-220-10-11')
GO
INSERT [dbo].[Renter] ([id], [FirtsName], [LastName], [EmailAddress], [PhoneNumber]) VALUES (4, N'Tahir', N'Aliyev', N'taliyev@yahoo.com', N'077-233-21-45')
GO
SET IDENTITY_INSERT [dbo].[Renter] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservation] ON 
GO
INSERT [dbo].[Reservation] ([id], [StartDate], [EndDate], [CustomerId], [RenterId], [VehicleId], [TotalPrice]) VALUES (1, CAST(N'2019-10-10T00:00:00' AS SmallDateTime), CAST(N'2019-10-12T00:00:00' AS SmallDateTime), 1, 1, 1, CAST(100.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Reservation] ([id], [StartDate], [EndDate], [CustomerId], [RenterId], [VehicleId], [TotalPrice]) VALUES (12, CAST(N'2019-10-11T00:00:00' AS SmallDateTime), CAST(N'2019-10-14T00:00:00' AS SmallDateTime), 2, 2, 2, CAST(210.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Reservation] ([id], [StartDate], [EndDate], [CustomerId], [RenterId], [VehicleId], [TotalPrice]) VALUES (13, CAST(N'2019-10-12T00:00:00' AS SmallDateTime), CAST(N'2019-10-14T00:00:00' AS SmallDateTime), 3, 2, 3, CAST(160.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Reservation] ([id], [StartDate], [EndDate], [CustomerId], [RenterId], [VehicleId], [TotalPrice]) VALUES (14, CAST(N'2019-10-13T00:00:00' AS SmallDateTime), CAST(N'2019-10-16T00:00:00' AS SmallDateTime), 4, 1, 4, CAST(600.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Reservation] ([id], [StartDate], [EndDate], [CustomerId], [RenterId], [VehicleId], [TotalPrice]) VALUES (15, CAST(N'2019-10-10T00:00:00' AS SmallDateTime), CAST(N'2019-10-16T00:00:00' AS SmallDateTime), 5, 1, 5, CAST(720.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Reservation] ([id], [StartDate], [EndDate], [CustomerId], [RenterId], [VehicleId], [TotalPrice]) VALUES (16, CAST(N'2019-10-10T00:00:00' AS SmallDateTime), CAST(N'2019-10-14T00:00:00' AS SmallDateTime), 6, 1, 2, CAST(280.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Reservation] ([id], [StartDate], [EndDate], [CustomerId], [RenterId], [VehicleId], [TotalPrice]) VALUES (17, CAST(N'2019-10-15T00:00:00' AS SmallDateTime), CAST(N'2019-10-18T00:00:00' AS SmallDateTime), 7, 1, 7, CAST(510.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Reservation] ([id], [StartDate], [EndDate], [CustomerId], [RenterId], [VehicleId], [TotalPrice]) VALUES (18, CAST(N'2019-10-15T00:00:00' AS SmallDateTime), CAST(N'2019-10-18T00:00:00' AS SmallDateTime), 1, 1, 1, CAST(150.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Reservation] ([id], [StartDate], [EndDate], [CustomerId], [RenterId], [VehicleId], [TotalPrice]) VALUES (19, CAST(N'2019-10-15T00:00:00' AS SmallDateTime), CAST(N'2019-10-18T00:00:00' AS SmallDateTime), 3, 2, 10, CAST(270.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Reservation] ([id], [StartDate], [EndDate], [CustomerId], [RenterId], [VehicleId], [TotalPrice]) VALUES (20, CAST(N'2019-10-01T00:00:00' AS SmallDateTime), CAST(N'2019-10-03T00:00:00' AS SmallDateTime), 4, 1, 5, CAST(240.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Reservation] ([id], [StartDate], [EndDate], [CustomerId], [RenterId], [VehicleId], [TotalPrice]) VALUES (21, CAST(N'2019-10-15T00:00:00' AS SmallDateTime), CAST(N'2019-10-22T00:00:00' AS SmallDateTime), 7, 3, 17, CAST(980.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Reservation] ([id], [StartDate], [EndDate], [CustomerId], [RenterId], [VehicleId], [TotalPrice]) VALUES (22, CAST(N'2019-10-20T00:00:00' AS SmallDateTime), CAST(N'2019-10-23T00:00:00' AS SmallDateTime), 8, 4, 17, CAST(420.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Reservation] ([id], [StartDate], [EndDate], [CustomerId], [RenterId], [VehicleId], [TotalPrice]) VALUES (23, CAST(N'2019-10-28T00:00:00' AS SmallDateTime), CAST(N'2019-11-02T00:00:00' AS SmallDateTime), 9, 4, 16, CAST(625.00 AS Decimal(8, 2)))
GO
SET IDENTITY_INSERT [dbo].[Reservation] OFF
GO
SET IDENTITY_INSERT [dbo].[Vehicles] ON 
GO
INSERT [dbo].[Vehicles] ([id], [ModelId], [CategoryId], [FuelId], [GearboxId], [Color], [FirstRegistrationDate], [CubikCapacity], [PriceForDay]) VALUES (1, 1, 1, 1, 2, N'White', CAST(N'1999-10-04' AS Date), CAST(1.800 AS Decimal(4, 3)), CAST(50 AS Decimal(4, 0)))
GO
INSERT [dbo].[Vehicles] ([id], [ModelId], [CategoryId], [FuelId], [GearboxId], [Color], [FirstRegistrationDate], [CubikCapacity], [PriceForDay]) VALUES (2, 2, 1, 2, 2, N'Black', CAST(N'2010-07-10' AS Date), CAST(2.500 AS Decimal(4, 3)), CAST(70 AS Decimal(4, 0)))
GO
INSERT [dbo].[Vehicles] ([id], [ModelId], [CategoryId], [FuelId], [GearboxId], [Color], [FirstRegistrationDate], [CubikCapacity], [PriceForDay]) VALUES (3, 1, 1, 1, 1, N'Blue', CAST(N'2011-10-04' AS Date), CAST(1.800 AS Decimal(4, 3)), CAST(80 AS Decimal(4, 0)))
GO
INSERT [dbo].[Vehicles] ([id], [ModelId], [CategoryId], [FuelId], [GearboxId], [Color], [FirstRegistrationDate], [CubikCapacity], [PriceForDay]) VALUES (4, 3, 1, 1, 2, N'Black', CAST(N'2015-11-01' AS Date), CAST(3.000 AS Decimal(4, 3)), CAST(200 AS Decimal(4, 0)))
GO
INSERT [dbo].[Vehicles] ([id], [ModelId], [CategoryId], [FuelId], [GearboxId], [Color], [FirstRegistrationDate], [CubikCapacity], [PriceForDay]) VALUES (5, 4, 1, 2, 2, N'Red', CAST(N'2014-10-10' AS Date), CAST(2.540 AS Decimal(4, 3)), CAST(120 AS Decimal(4, 0)))
GO
INSERT [dbo].[Vehicles] ([id], [ModelId], [CategoryId], [FuelId], [GearboxId], [Color], [FirstRegistrationDate], [CubikCapacity], [PriceForDay]) VALUES (6, 5, 1, 2, 2, N'White', CAST(N'2016-03-01' AS Date), CAST(4.400 AS Decimal(4, 3)), CAST(150 AS Decimal(4, 0)))
GO
INSERT [dbo].[Vehicles] ([id], [ModelId], [CategoryId], [FuelId], [GearboxId], [Color], [FirstRegistrationDate], [CubikCapacity], [PriceForDay]) VALUES (7, 6, 2, 1, 2, N'Black', CAST(N'2014-08-19' AS Date), CAST(4.400 AS Decimal(4, 3)), CAST(170 AS Decimal(4, 0)))
GO
INSERT [dbo].[Vehicles] ([id], [ModelId], [CategoryId], [FuelId], [GearboxId], [Color], [FirstRegistrationDate], [CubikCapacity], [PriceForDay]) VALUES (8, 9, 2, 2, 2, N'White', CAST(N'2012-10-04' AS Date), CAST(3.000 AS Decimal(4, 3)), CAST(130 AS Decimal(4, 0)))
GO
INSERT [dbo].[Vehicles] ([id], [ModelId], [CategoryId], [FuelId], [GearboxId], [Color], [FirstRegistrationDate], [CubikCapacity], [PriceForDay]) VALUES (9, 10, 1, 1, 1, N'Gray', CAST(N'2010-09-10' AS Date), CAST(1.800 AS Decimal(4, 3)), CAST(80 AS Decimal(4, 0)))
GO
INSERT [dbo].[Vehicles] ([id], [ModelId], [CategoryId], [FuelId], [GearboxId], [Color], [FirstRegistrationDate], [CubikCapacity], [PriceForDay]) VALUES (10, 11, 2, 1, 2, N'White', CAST(N'2008-12-09' AS Date), CAST(2.700 AS Decimal(4, 3)), CAST(90 AS Decimal(4, 0)))
GO
INSERT [dbo].[Vehicles] ([id], [ModelId], [CategoryId], [FuelId], [GearboxId], [Color], [FirstRegistrationDate], [CubikCapacity], [PriceForDay]) VALUES (12, 14, 1, 1, 2, N'Black', CAST(N'2014-08-12' AS Date), CAST(1.800 AS Decimal(4, 3)), CAST(110 AS Decimal(4, 0)))
GO
INSERT [dbo].[Vehicles] ([id], [ModelId], [CategoryId], [FuelId], [GearboxId], [Color], [FirstRegistrationDate], [CubikCapacity], [PriceForDay]) VALUES (13, 15, 1, 2, 2, N'White', CAST(N'2013-05-10' AS Date), CAST(2.500 AS Decimal(4, 3)), CAST(95 AS Decimal(4, 0)))
GO
INSERT [dbo].[Vehicles] ([id], [ModelId], [CategoryId], [FuelId], [GearboxId], [Color], [FirstRegistrationDate], [CubikCapacity], [PriceForDay]) VALUES (14, 16, 2, 2, 2, N'Gray', CAST(N'2011-10-10' AS Date), CAST(3.000 AS Decimal(4, 3)), CAST(135 AS Decimal(4, 0)))
GO
INSERT [dbo].[Vehicles] ([id], [ModelId], [CategoryId], [FuelId], [GearboxId], [Color], [FirstRegistrationDate], [CubikCapacity], [PriceForDay]) VALUES (15, 8, 1, 2, 1, N'Black', CAST(N'2012-10-11' AS Date), CAST(2.000 AS Decimal(4, 3)), CAST(110 AS Decimal(4, 0)))
GO
INSERT [dbo].[Vehicles] ([id], [ModelId], [CategoryId], [FuelId], [GearboxId], [Color], [FirstRegistrationDate], [CubikCapacity], [PriceForDay]) VALUES (16, 17, 4, 2, 1, N'Black', CAST(N'2014-11-16' AS Date), CAST(2.200 AS Decimal(4, 3)), CAST(125 AS Decimal(4, 0)))
GO
INSERT [dbo].[Vehicles] ([id], [ModelId], [CategoryId], [FuelId], [GearboxId], [Color], [FirstRegistrationDate], [CubikCapacity], [PriceForDay]) VALUES (17, 17, 4, 2, 2, N'White', CAST(N'2015-06-16' AS Date), CAST(2.200 AS Decimal(4, 3)), CAST(140 AS Decimal(4, 0)))
GO
SET IDENTITY_INSERT [dbo].[Vehicles] OFF
GO
ALTER TABLE [dbo].[ModelsOfBrands]  WITH CHECK ADD  CONSTRAINT [FK_ModelsOfBrands_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([id])
GO
ALTER TABLE [dbo].[ModelsOfBrands] CHECK CONSTRAINT [FK_ModelsOfBrands_Brands]
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Vehicles] CHECK CONSTRAINT [FK_Cars_Category]
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Fuel] FOREIGN KEY([FuelId])
REFERENCES [dbo].[Fuel] ([id])
GO
ALTER TABLE [dbo].[Vehicles] CHECK CONSTRAINT [FK_Cars_Fuel]
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Gearbox] FOREIGN KEY([GearboxId])
REFERENCES [dbo].[Gearbox] ([id])
GO
ALTER TABLE [dbo].[Vehicles] CHECK CONSTRAINT [FK_Cars_Gearbox]
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Cars_ModelsOfBrands] FOREIGN KEY([ModelId])
REFERENCES [dbo].[ModelsOfBrands] ([id])
GO
ALTER TABLE [dbo].[Vehicles] CHECK CONSTRAINT [FK_Cars_ModelsOfBrands]
GO
/****** Object:  StoredProcedure [dbo].[spReservationss]    Script Date: 10/14/2019 1:37:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ibrahim Ibrahimli
-- Create date: 2019-10-12
-- Description:	Add info in Reservation table
-- =============================================
CREATE PROCEDURE [dbo].[spReservationss]
	@startday date,@enddate date,@customer int,@renter int ,@vehicle int
AS

BEGIN

	SET NOCOUNT ON;
declare @dateforrent int=datediff(day,@startday,@enddate );
declare @priceforday decimal(4,0)=(select [PriceforDay] from Vehicles where @vehicle=Vehicles.id);
declare @totalprice decimal(4,0);
set @totalprice=@priceforday*@dateforrent;

	
    insert into Reservation([StartDate],[EndDate],[CustomerId],[RenterId],[VehicleId],[TotalPrice])
	values(@startday,@enddate,@customer,@renter,@vehicle,@totalprice)
END
GO
